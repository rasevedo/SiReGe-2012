Imports CapAccesoDatosSiReGe
Imports CapEntidadesSiReGe
Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration

Public Class Formulario_Insertar_Gestiones
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

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

#Region "btnAgregar datos a la tabla tblGestiones"
    'EFECTO: La función de este botón se encarga revisar que todos los textboxes y dropdownlists esten llenos para insertar en la base de datos. 
    'RECIBE: La llamada de Datos_Gestiones y Entidad_Gestiones para la inserción a la base de datos
    'DEVUELVE: Inserta los datos a la base de datos en la tabla tblGestiones
    Protected Sub btnAgregar_Click(sender As Object, e As EventArgs) Handles btnAgregar.Click
        Dim dts As New Entidad_Gestiones
        Dim func As New Datos_Gestiones
        If intIdEmpleados.Text <> "" Then
            Try
                dts._tipoGestiones = rblTipo_Gestion.Text
                dts._cedulaUsuario = txtCedula_Usuario.Text
                dts._nombreUsuario = txtNombre_Usuario.Text
                dts._fechaIngreso = Convert.ToDateTime(txtFecha_Ingreso.Text)
                dts._idEmpleados = intIdEmpleados.Text
                dts._confidencialidadGestiones = ddlConfidencialidad.Text
                dts._fuenteGeneradora = ddlFuente_Generadora.Text
                dts._tipoServicio = ddlTipo_Servicio.Text
                dts._direccionRegional = ddlDireccion_Regional_Educacion.Text
                dts._supervicionGestiones = ddlSupervision.Text
                dts._nombreCentroEducativo = txtNombre_CE.Text
                dts._idUnidad = ddlDescripcion_Unidad.Text
                dts._numeroOficio = txtNumero_Oficio.Text
                dts._idDimension = ddlLetra_Dimension.Text
                dts._tipoUsuario = ddlTipo_Usuario.Text
                dts._categoriaGestiones = ddlCategoria.Text
                dts._detalleGestiones = txtAsunto.Text
                dts._respuestaGestiones = txtRespuesta.Text
                If func.insertarGestiones(dts) Then
                    ModalPopupExtender_Exito.Show()
                    'Response.Write("<script language=javascript>alert('El elemento se ha agregado')</script>")
                    GestionLimpiar()
                Else
                    ModalPopupExtender_Incompleto.Show()
                    'Response.Write("<script language=javascript>alert('Faltan espacios para rellenar')</script>")
                    ' MsgBox("Faltan espacios que rellenar")
                End If
            Catch ex As Exception
                ModalPopupExtender_Error.Show()
                ' Response.Write("<script language=javascript>alert('Hubo un problema en agregar el elemento')</script>")
                ' MsgBox("Hubo un problema en agregar el elemento" + ex.Message)
            End Try
        Else
            ModalPopupExtender_Incompleto.Show()
            ' Response.Write("<script language=javascript>alert('Faltan elementos que agregar')</script>")
            'MsgBox("Faltan datos que agregar")
        End If
    End Sub
#End Region

    Protected Sub btnVolver_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        Response.Redirect("Tabla_Gestiones-SistemaRegistroGestiones.aspx")
    End Sub

#Region "Limpiar Formulario"
    'EFECTO: Función que se utiliza para limpiar todos los textboxes de la pagina
    'RECIBE: No recibe parametros
    'DEVUELVE: Hace vacio todos los textboxes
    Sub GestionLimpiar()
        txtCedula_Usuario.Text = String.Empty
        txtNombre_Usuario.Text = String.Empty
        txtFecha_Ingreso.Text = String.Empty
        ddlConfidencialidad.Text = String.Empty
        ddlFuente_Generadora.Text = String.Empty
        ddlTipo_Servicio.Text = String.Empty
        ddlDireccion_Regional_Educacion.Text = String.Empty
        ddlSupervision.Text = String.Empty
        txtNombre_CE.Text = String.Empty
        txtNumero_Oficio.Text = String.Empty
        ddlTipo_Usuario.Text = String.Empty
        ddlCategoria.Text = String.Empty
        txtAsunto.Text = String.Empty
        txtRespuesta.Text = String.Empty
    End Sub
#End Region





End Class