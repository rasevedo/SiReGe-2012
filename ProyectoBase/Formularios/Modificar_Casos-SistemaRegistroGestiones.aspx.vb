Imports CapAccesoDatosSiReGe
Imports CapEntidadesSiReGe
Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration

Public Class Modificar_Casos
    Inherits System.Web.UI.Page

    Dim strConnString As String = ConfigurationManager _
             .ConnectionStrings("bda_SIREGE_Connection").ConnectionString

    Private dt As DataTable = New DataTable()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.TomarCaso()
            AvancePanel.Visible = False
            Me.MostrarAvanceGridview()
            Me.FiltrarPorCaso()
        End If
    End Sub

#Region "Seleccionar Unidad"
    'EFECTO: Función que se utiliza para la elección de Unidad con dropdownlist de cascada con 3 textboxes ya que lo único que se requiere es solo intIdUnidad por lo tanto se utiliza el espacio de Unidad como el responsable del ingreso de datos en la base de datos
    'RECIBE: El campo de Unidad de tblUnidades
    'DEVUELVE: El intIdUnidad a insertar en la tabla de tblCasos
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
    'DEVUELVE: El intIdDimension a insertar en la tabla de tblCasos
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



    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnUpdate.Click
        Me.ModificarCaso()
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnCancelar.Click
        Response.Redirect("Tabla_Casos-SistemaRegistroGestiones.aspx")
    End Sub

    Private ReadOnly Property id As Integer
        Get
            Return If(Not String.IsNullOrEmpty(Request.QueryString("intIdCasos")), Integer.Parse(Request.QueryString("intIdCasos")), 0)
        End Get
    End Property

#Region "Modificar el Caso"
    'EFECTO: Esta función se encarga revisar que todos los textboxes y dropdownlists esten llenos para realizar la modificación de datos. 
    'RECIBE: La llamada de Datos_Casos y Entidad_Casos para la modificación a la base de datos
    'DEVUELVE: Modifica los datos a la base de datos en la tabla tblCasos
    Private Sub ModificarCaso()
        Try
            Dim dts As New Entidad_Casos 'instanciamos a la clase atributos de la tabla trabajador
            Dim func As New Datos_Casos 'instanciamos a la clase funciones de la tabla trabajador
            dts._idCasos = txtId_Casos.Text
            dts._numeroCasos = txtNumero_Caso.Text
            dts._estadoCasos = ddlEstado_Caso.Text
            dts._fechaCasos = txtFecha_Caso.Text
            dts._cedulaDenuncianteCasos = txtCedula_Usuario.Text
            dts._nombreDenuncianteCasos = txtNombre_Usuario.Text
            dts._idEmpleados = intIdEmpleados.Text
            dts._nombreCentroEducativo = txtNombre_CE.Text
            dts._idUnidad = ddlDescripcion_Unidad.Text
            dts._numeroOficio = txtNumero_Oficio.Text
            dts._fechaOficio = txtFecha_Oficio.Text
            dts._idDimension = ddlLetra_Dimension.Text
            dts._condicionCasos = ddlCondicion_Caso.Text
            dts._detalleInconformidadCasos = txtAsunto.Text
            dts._respuestaCasos = txtRespuesta.Text
            dts._valoracionAdmisibilidad = ddlValoracion_Admisibilidad.Text
            dts._veredictoValoracionIngreso = ddlVeredicto_Valoracion.Text
            dts._trazabilidadCasos = ddlTrazabilidad_Casos.Text
            dts._fechaRespuestaCasos = txtFecha_Respuesta_Casos.Text
            dts._fechaCerradoCasos = txtFecha_Cerrado_Casos.Text
            If func.modificarCasos(dts) Then
                ModalPopupExtender_Exito.Show()
                'Response.Write("<script language=javascript>alert('El elemento se ha agregado')</script>")
                'MsgBox("Exito")
                Response.Redirect(Request.Url.AbsoluteUri, False)
                Response.Redirect("~/Tabla_Casos-SistemaRegistroGestiones.aspx")
            Else
                ModalPopupExtender_Incompleto.Show()
                'Response.Write("<script language=javascript>alert('Faltan espacio para rellenar')</script>")
                ' MsgBox("Fracaso")
            End If
        Catch ex As Exception
            ModalPopupExtender_Error.Show()
            ' Response.Write("<script language=javascript>alert('Hubo un problema en agregar el elemento. Porfavor rellenar de nuevo los espacios de fechas y dimensiones')</script>")
            'MsgBox(ex.Message)
        End Try
    End Sub
#End Region


#Region "Agarrar el Caso"
    'EFECTO: Esta función lee los datos de la fila del gridview y los toma para insertarlos en sus respectivos espacios en el formulario de modificación 
    'RECIBE: Solo requiere de la llamada del procedimiento almacenado
    'DEVUELVE: Muestra el formulario de modificación con todos sus espacios escritos con la información actual presente en la fila del gridview
    Private Sub TomarCaso()
        Dim strQuery As String = "palAgarrarCasos"
        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()
        cmd.Parameters.AddWithValue("@intIdCasos", id)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = strQuery
        cmd.Connection = con
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim dt As DataTable = New DataTable()
        da.Fill(dt)
        For Each dr As DataRow In dt.Rows
            Me.txtId_Casos.Text = dr("intIdCasos").ToString()
            Me.txtNumero_Caso.Text = dr("vchNumeroCasos").ToString()
            Me.ddlEstado_Caso.Text = dr("vchEstadoCasos").ToString()
            Me.txtFecha_Caso.Text = dr("dtiFechaCasos").ToString()
            Me.txtCedula_Usuario.Text = dr("intCedulaDenuncianteCasos").ToString()
            Me.txtNombre_Usuario.Text = dr("vchNombreDenucianteCasos").ToString()
            ' Me.intIdEmpleados.Text = dr("intIdEmpleados").ToString()
            Me.txtNombre_CE.Text = dr("vchNombreCentroEducativo").ToString()
            ' Me.ddlDescripcion_Unidad.Text = dr("intIdUnidad").ToString()
            Me.txtNumero_Oficio.Text = dr("vchNumeroOficio").ToString()
            Me.txtFecha_Oficio.Text = dr("dtiFechaOficio").ToString()
            ' Me.ddlLetra_Dimension.Text = dr("intIdDimension").ToString()
            Me.ddlCondicion_Caso.Text = dr("vchCondicionCasos").ToString()
            Me.txtAsunto.Text = dr("vchDetalleInconformidadCasos").ToString()
            Me.txtRespuesta.Text = dr("vchRespuestaCasos").ToString()
            Me.ddlValoracion_Admisibilidad.Text = dr("vchValoracionAdmisibilidad").ToString()
            Me.ddlVeredicto_Valoracion.Text = dr("vchVeredictoValoracionIngreso").ToString()
            Me.ddlTrazabilidad_Casos.Text = dr("vchTrazabilidadCasos").ToString()
            Me.txtFecha_Respuesta_Casos.Text = dr("dtiFechaRespuestaCasos").ToString()
            Me.txtFecha_Cerrado_Casos.Text = dr("dtiFechaCerradoCasos").ToString()
        Next
    End Sub
#End Region

    Protected Sub btnAgregarAvance_Click(sender As Object, e As EventArgs) Handles btnAgregarAvance.Click
        AvancePanel.Visible = True

    End Sub

#Region "btnInsertarAvance Insertar el Avance/Seguimiento del Caso respectivo"
    'EFECTO: La función de este botón es para realizar la inserción de datos del avance la cual se insertará en su propio gridview
    'RECIBE: Requiere del llamado de su entidad y datos.
    'DEVUELVE: Guarda los datos en la tabla tblCasoAvances
    Protected Sub btnInsertar_Avance_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnInsertar_Avance.Click
        Dim dts As New Entidad_AvanceCasos
        Dim func As New Datos_AvanceCasos
        Try
            dts._idCasos = txtId_Casos.Text
            dts._detalleAvance = txtDetalle_Avance.Text
            dts._fechaAvance = txtFecha_Avance.Text
            If func.insertarAvancesCasos(dts) Then
                ModalPopupExtender_AvanceExito.Show()
                ' MsgBox("Exito")
            Else
                ModalPopupExtender_AvanceError.Show()
                'MsgBox("Fracaso")
            End If
        Catch ex As Exception
            ModalPopupExtender_AvanceError.Show()
            ' MsgBox(ex.Message)
        End Try
    End Sub
#End Region

#Region "Mostrar el Gridview del Avance de los Casos"
    'EFECTO: Leer los datos de la tabla tblCasoAvances para imprimirlos en el gridview
    'RECIBE: Solo recibe los datos para su escaneo
    'DEVUELVE: La tabla gridview con todos los datos de la tabla tblCasoAvances
    Sub MostrarAvanceGridview()
        Try
            Dim func As New Datos_AvanceCasos
            dt = func.mostrarAvanceCasos
            If dt.Rows.Count <> 0 Then
                Dim dView As DataView = New DataView(dt)
                gvwAvance.DataSource = dt
                gvwAvance.DataBind()
            Else
                gvwAvance.DataSource = Nothing
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
#End Region

#Region "Filtrar Avances por id del Caso"
    'EFECTO: Filtrar la tabla GridviewAvance por el caso correspondiente de la fila del GridviewCaso
    'RECIBE: El intIdCasos actual de la fila
    'DEVUELVE: La tabla GridviewAvance filtrada para que solo muestre los avances relacionados a dicho id del Caso
    Sub FiltrarPorCaso()
        Dim strQuery As String = "palFiltrarCasoAvances"
        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = strQuery
        cmd.Parameters.AddWithValue("@intIdCasos", SqlDbType.VarChar).Value = txtId_Casos.Text.Trim()
        cmd.Connection = con
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        gvwAvance.DataSource = ds
        gvwAvance.DataBind()
    End Sub
#End Region


End Class