Imports CapAccesoDatosSiReGe
Imports CapEntidadesSiReGe
Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration

Public Class Modificar_Gestiones
    Inherits System.Web.UI.Page



    Dim strConnString As String = ConfigurationManager _
             .ConnectionStrings("bda_SIREGE_Connection").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.GetGestion()

        End If
    End Sub

#Region "Seleccionar Unidad"
    'EFECTO: Función que se utiliza para la elección de Unidad con dropdownlist de cascada con 3 textboxes ya que lo único que se requiere es solo intIdUnidad por lo tanto se utiliza el espacio de Unidad como el responsable del ingreso de datos en la base de datos
    'RECIBE: El campo de Unidad de tblUnidades
    'DEVUELVE: El intIdUnidad a insertar en la tabla de tblGestiones
    Protected Sub DD1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        Dim strConnString As String = ConfigurationManager _
             .ConnectionStrings("bda_SIREGE_Connection").ConnectionString
        Dim strQuery As String = "palSeleccionarUnidades"
        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()
        cmd.Parameters.AddWithValue("@intIdUnidad", DD1.SelectedItem.Value)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = strQuery
        cmd.Connection = con
        Try
            con.Open()
            Dim sdr As SqlDataReader = cmd.ExecuteReader()
            While sdr.Read()
                txtDespacho.Text = sdr(0).ToString()
                txtDireccion.Text = sdr(1).ToString()
                txtDepartamento.Text = sdr(2).ToString()
            End While
        Catch ex As Exception
            Throw ex
        Finally
            con.Close()
            con.Dispose()
        End Try
    End Sub
#End Region

#Region "Seleccionar Letra de Dimensión"
    'EFECTO: Función que se utiliza para la elección de tblDimensiones con dropdownlist de cascada con 1 textboxes ya que lo único que se requiere es solo intIdDimension por lo tanto se útiliza el espacio de vchLetraDimension como el responsable ya que es elegido por vchTipoDimension
    'RECIBE: La selección del usuario con el campo de Tipo de Dimensión
    'DEVUELVE: El intIdDimension a insertar en la tabla de tblGestiones
    Protected Sub DDL_Dimension2_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        Dim strConnString As String = ConfigurationManager _
             .ConnectionStrings("bda_SIREGE_Connection").ConnectionString
        Dim strQuery As String = "palSeleccionarDimensiones"
        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()
        cmd.Parameters.AddWithValue("@intIdDimension", DDL_Dimension2.SelectedItem.Value)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = strQuery
        cmd.Connection = con
        Try
            con.Open()
            Dim sdr As SqlDataReader = cmd.ExecuteReader()
            While sdr.Read()
                txtTipoDetalleLetraDimension.Text = sdr(0).ToString
            End While
        Catch ex As Exception
            Throw ex
        Finally
            con.Close()
            con.Dispose()
        End Try
    End Sub
#End Region


    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As EventArgs)
        Me.ModificarGestion()
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("Tabla Gestiones-SistemaRegistroGestiones.aspx")
    End Sub

    Private ReadOnly Property id As Integer
        Get
            Return If(Not String.IsNullOrEmpty(Request.QueryString("intIdGestiones")), Integer.Parse(Request.QueryString("intIdGestiones")), 0)
        End Get
    End Property


#Region "Modificar la Gestión"
    'EFECTO: Esta función se encarga revisar que todos los textboxes y dropdownlists esten llenos para realizar la modificación de datos. 
    'RECIBE: La llamada de Datos_Gestiones y Entidad_Gestiones para la modificación a la base de datos
    'DEVUELVE: Modifica los datos a la base de datos en la tabla tblGestiones
    Private Sub ModificarGestion()
        Try
            Dim dts As New Entidad_Gestiones
            Dim func As New Datos_Gestiones
            dts._idGestiones = txtidGestiones.Text
            dts._idEmpleados = idEmpleados.Text
            dts._tipoGestiones = RadioButtonList1.Text
            dts._cedulaUsuario = txtcedulaUsuario.Text
            dts._nombreUsuario = txtnombreUsuario.Text
            dts._tipoUsuario = txtTipoUsuario.Text
            dts._fechaIngreso = txtfechaIngreso.Text
            dts._confidencialidadGestiones = txtConfidencialidad.Text
            dts._fuenteGeneradora = txtfuenteGeneradora.Text
            dts._tipoServicio = txttipoServicio.Text
            dts._direccionRegional = txtdireccionRegionalEducacion.Text
            dts._supervicionGestiones = txtSupervision.Text
            dts._nombreCentroEducativo = txtnombreCE.Text
            dts._idUnidad = DD1.Text
            dts._numeroOficio = txtnumeroOficio.Text
            dts._idDimension = DDL_Dimension2.Text
            dts._tipoUsuario = txtTipoUsuario.Text
            dts._categoriaGestiones = txtCategoria.Text
            dts._detalleGestiones = txtasunto.Text
            dts._respuestaGestiones = txtrespuesta.Text
            If func.modificarGestiones(dts) Then
                ModalPopupExtender_Exito.Show()
                'Response.Write("<script language=javascript>alert('El elemento se ha agregado')</script>")
                '  MsgBox("Exito")
                Response.Redirect(Request.Url.AbsoluteUri, False)
                Response.Redirect("~/Tabla Gestiones-SistemaRegistroGestiones.aspx")
            Else
                ModalPopupExtender_Incompleto.Show()
                'Response.Write("<script language=javascript>alert('Faltan espacio para rellenar')</script>")
                ' MsgBox("Fracaso")
            End If
        Catch ex As Exception
            ModalPopupExtender_Error.Show()
            'Response.Write("<script language=javascript>alert('Hubo un problema en agregar el elemento. Porfavor rellenar de nuevo los espacios de fechas y dimensiones')</script>")
            'MsgBox(ex.Message)
        End Try
    End Sub
#End Region

#Region "Agarrar la Gestión"
    'EFECTO: Esta función lee los datos de la fila del gridview y los toma para insertarlos en sus respectivos espacios en el formulario de modificación 
    'RECIBE: Solo requiere de la llamada del procedimiento almacenado
    'DEVUELVE: Muestra el formulario de modificación con todos sus espacios escritos con la información actual presente en la fila del gridview
    Private Sub GetGestion()
        Dim strQuery As String = "palAgarrarGestiones"
        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()
        cmd.Parameters.AddWithValue("@intIdGestiones", id)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = strQuery
        cmd.Connection = con
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim dt As DataTable = New DataTable()
        da.Fill(dt)
        For Each dr As DataRow In dt.Rows
            Me.txtidGestiones.Text = dr("intIdGestiones").ToString()
            'Me.idEmpleados.Text = dr("idEmpleados").ToString()
            Me.RadioButtonList1.Text = dr("vchTipoGestiones").ToString()
            Me.txtcedulaUsuario.Text = dr("intCedulaUsuario").ToString()
            Me.txtnombreUsuario.Text = dr("vchNombreUsuario").ToString()
            Me.txtTipoUsuario.Text = dr("vchTipoUsuario").ToString()
            Me.txtfechaIngreso.Text = dr("dtiFechaIngreso").ToString()
            Me.txtConfidencialidad.Text = dr("vchConfidencialidadGestiones").ToString()
            Me.txtfuenteGeneradora.Text = dr("vchFuenteGeneradora").ToString()
            Me.txttipoServicio.Text = dr("vchTipoServicio").ToString()
            Me.txtdireccionRegionalEducacion.Text = dr("vchDireccionRegional").ToString()
            Me.txtSupervision.Text = dr("vchSupervicionGestiones").ToString()
            Me.txtnombreCE.Text = dr("vchNombreCentroEducativo").ToString()
            ' Me.DD1.Text = dr("idUnidad").ToString()
            Me.txtnumeroOficio.Text = dr("vchNumeroOficio").ToString()
            ' Me.DDL_Dimension3.Text = dr("idDimension").ToString()
            Me.txtCategoria.Text = dr("vchCategoriaGestiones").ToString()
            Me.txtasunto.Text = dr("vchDetalleGestiones").ToString()
            Me.txtrespuesta.Text = dr("vchRespuestaGestiones").ToString()
        Next
    End Sub
#End Region


End Class