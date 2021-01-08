Imports CapAccesoDatosSiReGe
Imports CapEntidadesSiReGe
Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration

Public Class Form_Insertar_Gestiones
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

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

#Region "btnAgregar datos a la tabla tblGestiones"
    'EFECTO: La función de este botón se encarga revisar que todos los textboxes y dropdownlists esten llenos para insertar en la base de datos. 
    'RECIBE: La llamada de Datos_Gestiones y Entidad_Gestiones para la inserción a la base de datos
    'DEVUELVE: Inserta los datos a la base de datos en la tabla tblGestiones
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles btnAgregar.Click
        Dim dts As New Entidad_Gestiones
        Dim func As New Datos_Gestiones
        If idEmpleados.Text <> "" Then
            Try
                dts._tipoGestiones = RadioButtonList1.Text
                dts._cedulaUsuario = txtcedulaUsuario.Text
                dts._nombreUsuario = txtnombreUsuario.Text
                dts._fechaIngreso = Convert.ToDateTime(txtfechaIngreso.Text)
                dts._idEmpleados = idEmpleados.Text
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

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        Response.Redirect("Tabla Gestiones-SistemaRegistroGestiones.aspx")
    End Sub

#Region "Limpiar Formulario"
    'EFECTO: Función que se utiliza para limpiar todos los textboxes de la pagina
    'RECIBE: No recibe parametros
    'DEVUELVE: Hace vacio todos los textboxes
    Sub GestionLimpiar()
        txtcedulaUsuario.Text = String.Empty
        txtnombreUsuario.Text = String.Empty
        txtfechaIngreso.Text = String.Empty
        txtConfidencialidad.Text = String.Empty
        txtfuenteGeneradora.Text = String.Empty
        txttipoServicio.Text = String.Empty
        txtdireccionRegionalEducacion.Text = String.Empty
        txtSupervision.Text = String.Empty
        txtnombreCE.Text = String.Empty
        txtnumeroOficio.Text = String.Empty
        txtTipoUsuario.Text = String.Empty
        txtCategoria.Text = String.Empty
        txtasunto.Text = String.Empty
        txtrespuesta.Text = String.Empty
    End Sub
#End Region





End Class