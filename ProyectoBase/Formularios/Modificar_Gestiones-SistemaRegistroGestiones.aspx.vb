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
            txtNombre_Funcionario.Text = Session("NombreUsuario")
            Me.TomarGestion()

        End If
    End Sub

#Region "Seleccionar Unidad"
    'EFECTO: Función que se utiliza para la elección de Unidad con dropdownlist de cascada con 3 textboxes ya que lo único que se requiere es solo intIdUnidad por lo tanto se utiliza el espacio de Unidad como el responsable del ingreso de datos en la base de datos
    'RECIBE: El campo de Unidad de tblUnidades
    'DEVUELVE: El intIdUnidad a insertar en la tabla de tblGestiones
    Protected Sub ddlDescripcion_Unidad_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        Dim strConnString As String = ConfigurationManager _
             .ConnectionStrings("bda_SIREGE_Connection").ConnectionString
        Dim strQuery As String = "palSeleccionarUnidades"
        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()
        cmd.Parameters.AddWithValue("@intIdUnidad", ddlDescripcion_Unidad.SelectedItem.Value)
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
    Protected Sub ddlLetra_Dimension_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        Dim strConnString As String = ConfigurationManager _
             .ConnectionStrings("bda_SIREGE_Connection").ConnectionString
        Dim strQuery As String = "palSeleccionarDimensiones"
        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()
        cmd.Parameters.AddWithValue("@intIdDimension", ddlLetra_Dimension.SelectedItem.Value)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = strQuery
        cmd.Connection = con
        Try
            con.Open()
            Dim sdr As SqlDataReader = cmd.ExecuteReader()
            While sdr.Read()
                txtTipo_Detalle_Letra_Dimension.Text = sdr(0).ToString
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
        Response.Redirect("Tabla_Gestiones-SistemaRegistroGestiones.aspx")
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
            dts._idGestiones = txtId_Gestiones.Text
            dts._nombreFuncionario = txtNombre_Funcionario.Text
            dts._tipoGestiones = rblTipo_Gestion.Text

            If Not String.IsNullOrEmpty(txtCedula_Usuario.Text) Then
                dts._cedulaUsuario = Integer.Parse(txtCedula_Usuario.Text)
            End If

            dts._nombreUsuario = txtNombre_Usuario.Text
            dts._tipoUsuario = ddlTipo_Usuario.Text
            dts._fechaIngreso = Convert.ToDateTime(txtFecha_Ingreso.Text)
            dts._confidencialidadGestiones = ddlConfidencialidad.Text
            dts._fuenteGeneradora = ddlFuente_Generadora.Text
            dts._tipoServicio = ddlTipo_Servicio.Text
            dts._direccionRegional = ddl_Direccion_Regional_Educacion.Text
            dts._supervicionGestiones = ddlSupervision.Text
            dts._nombreCentroEducativo = txtNombre_CE.Text

            dts._idUnidad = ddlDescripcion_Unidad.Text

            dts._numeroOficio = txtNumero_Oficio.Text

            If ddlLetra_Dimension.Text = "" Then
                dts._idDimension = 1
            Else
                dts._idDimension = ddlLetra_Dimension.Text
            End If

            dts._detalleGestiones = txtAsunto.Text
            dts._respuestaGestiones = txtRespuesta.Text
            If func.modificarGestiones(dts) Then
                ModalPopupExtender_Exito.Show()
                ' Response.Write("<script language=javascript>alert('El elemento se ha modificado exitosamente')</script>")
                '  MsgBox("Exito")
                Response.Redirect(Request.Url.AbsoluteUri, False)
                Response.Redirect("~/Formularios/Tabla_Gestiones-SistemaRegistroGestiones.aspx")
            Else
                ModalPopupExtender_Incompleto.Show()
                'Response.Write("<script language=javascript>alert('Se ha modificado un elemento erroneamente')</script>")
                ' MsgBox("Fracaso")
            End If
        Catch ex As Exception
            ModalPopupExtender_Error.Show()
            'Response.Write("<script language=javascript>alert('Hubo un problema en modificar el elemento. Porfavor revisar formulario. Porfavor rellenar de nuevo los espacios de fechas y dimensiones')</script>")
            'MsgBox(ex.Message)
        End Try
    End Sub
#End Region

#Region "Agarrar la Gestión"
    'EFECTO: Esta función lee los datos de la fila del gridview y los toma para insertarlos en sus respectivos espacios en el formulario de modificación 
    'RECIBE: Solo requiere de la llamada del procedimiento almacenado
    'DEVUELVE: Muestra el formulario de modificación con todos sus espacios escritos con la información actual presente en la fila del gridview
    Private Sub TomarGestion()

        Dim strQuery As String = "palAgarrarGestiones"
        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()

        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = strQuery
        cmd.Connection = con

        cmd.Parameters.AddWithValue("@intIdGestiones", id)
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim dt As DataTable = New DataTable()


        da.Fill(dt)

        For Each dr As DataRow In dt.Rows
            Me.txtId_Gestiones.Text = dr("intIdGestiones").ToString()
            Me.txtNombre_Funcionario.Text = dr("vchNombreFuncionario").ToString()
            Me.rblTipo_Gestion.Text = dr("vchTipoGestiones").ToString()
            Me.txtCedula_Usuario.Text = dr("intCedulaUsuario").ToString()
            Me.txtNombre_Usuario.Text = dr("vchNombreUsuario").ToString()
            Me.ddlTipo_Usuario.Text = dr("vchTipoUsuario").ToString()
            Me.txtFecha_Ingreso.Text = Convert.ToDateTime(dr("dtiFechaIngreso").ToString())
            Me.ddlConfidencialidad.Text = dr("vchConfidencialidadGestiones").ToString()
            Me.ddlFuente_Generadora.Text = dr("vchFuenteGeneradora").ToString()
            Me.ddlTipo_Servicio.Text = dr("vchTipoServicio").ToString()
            Me.ddl_Direccion_Regional_Educacion.Text = dr("vchDireccionRegional").ToString()
            Me.ddlSupervision.Text = dr("vchSupervicionGestiones").ToString()
            Me.txtNombre_CE.Text = dr("vchNombreCentroEducativo").ToString()

            ' Me.ddlDescripcion_Unidad.SelectedValue = ddlDescripcion_Unidad.Items.FindByText(dr("vchDescripcionUnidad")).Value

            Me.txtDespacho.Text = dr("vchDescripcionDespacho").ToString()
            Me.txtDireccion.Text = dr("vchDescripcionDireccion").ToString()
            Me.txtDepartamento.Text = dr("vchdescripcionDepartamento").ToString()
            Me.txtNumero_Oficio.Text = dr("vchNumeroOficio").ToString()

            Me.ddlTipo_Dimension.Text = dr("vchTipoDimension").ToString()

            '  Me.ddlLetra_Dimension.Text = dr("vchLetraDimension").ToString()

            Me.txtTipo_Detalle_Letra_Dimension.Text = dr("vchDescripcionLetraDimension").ToString()

            Me.txtAsunto.Text = dr("vchDetalleGestiones").ToString()
            Me.txtRespuesta.Text = dr("vchRespuestaGestiones").ToString()
        Next
    End Sub
#End Region


End Class