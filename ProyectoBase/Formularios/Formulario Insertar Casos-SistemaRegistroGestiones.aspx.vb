Imports CapAccesoDatosSiReGe
Imports CapEntidadesSiReGe
Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration

Public Class Form_Insertar_Casos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

        End If
    End Sub


#Region "Seleccionar Unidad"
    'EFECTO: Función que se utiliza para la elección de Unidad con dropdownlist de cascada con 3 textboxes ya que lo único que se requiere es solo intIdUnidad por lo tanto se utiliza el espacio de Unidad como el responsable del ingreso de datos en la base de datos
    'RECIBE: El campo de Unidad de tblUnidades
    'DEVUELVE: El intIdUnidad a insertar en la tabla de tblCasos
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
    'DEVUELVE: El intIdDimension a insertar en la tabla de tblCasos
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


#Region "btnAgregar datos a la tabla tblCasos"
    'EFECTO: La función de este botón se encarga revisar que todos los textboxes y dropdownlists esten llenos para insertar en la base de datos. Aunque solo fuerza 3 textboxes como obligados para insertar
    'RECIBE: La llamada de Datos_Casos y Entidad_Casos para la inserción a la base de datos
    'DEVUELVE: Inserta los datos a la base de datos en la tabla tblCasos
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles btnAgregar.Click
        Dim dts As New Entidad_Casos
        Dim func As New Datos_Casos
        If txtnumeroCaso.Text <> "" And txtestadoCaso.Text <> "" And txtnombreUsuario.Text <> "" Then
            Try
                dts._numeroCasos = txtnumeroCaso.Text
                dts._estadoCasos = txtestadoCaso.Text
                dts._fechaCasos = txtfechaCaso.Text
                dts._cedulaDenuncianteCasos = txtcedulaUsuario.Text
                dts._nombreDenuncianteCasos = txtnombreUsuario.Text
                dts._idEmpleados = idEmpleados.Text
                dts._nombreCentroEducativo = txtnombreCE.Text
                dts._numeroOficio = txtnumeroOficio.Text
                dts._fechaOficio = txtfechaOficio.Text
                dts._condicionCasos = txtcondicionCaso.Text
                dts._idUnidad = DD1.Text
                dts._idDimension = DDL_Dimension2.Text
                dts._valoracionAdmisibilidad = txtvaloracionAdmisibilidad.Text
                dts._veredictoValoracionIngreso = txtveredictoValoracion.Text
                dts._trazabilidadCasos = txttrazabilidadCasos.Text
                dts._detalleInconformidadCasos = txtasunto.Text
                dts._respuestaCasos = txtrespuesta.Text
                dts._fechaRespuestaCasos = txtfechaRespuestaCasos.Text
                dts._fechaCerradoCasos = txtfechaCerradoCasos.Text
                If func.insertarCasos(dts) Then
                    ModalPopupExtender_Exito.Show()
                    'Response.Write("<script language=javascript>alert('El elemento se ha agregado')</script>")
                    ' MsgBox("Exito")
                    GestionLimpiar()
                Else
                    ModalPopupExtender_Incompleto.Show()
                    ' Response.Write("<script language=javascript>alert('Faltan espacio para rellenar')</script>")
                    ' MsgBox("Fracaso")
                End If
            Catch ex As Exception
                ModalPopupExtender_Error.Show()
                'Response.Write("<script language=javascript>alert('Hubo un problema en agregar el elemento')</script>")
                ' MsgBox(ex.Message)
            End Try
        Else
            ModalPopupExtender_Incompleto.Show()
            'Response.Write("<script language=javascript>alert('Faltan elementos que agregar')</script>")
            ' MsgBox("Falta datos")
        End If
    End Sub
#End Region

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        Response.Redirect("Tabla Casos-SistemaRegistroGestiones.aspx")
    End Sub

#Region "Limpiar Formulario"
    'EFECTO: Función que se utiliza para limpiar todos los textboxes de la pagina
    'RECIBE: No recibe parametros
    'DEVUELVE: Hace vacio todos los textboxes
    Sub GestionLimpiar()
        txtnumeroCaso.Text = String.Empty
        txtfechaCaso.Text = String.Empty
        txtcedulaUsuario.Text = String.Empty
        txtnombreUsuario.Text = String.Empty
        txtnombreCE.Text = String.Empty
        txtnumeroOficio.Text = String.Empty
        txtfechaOficio.Text = String.Empty
        txtveredictoValoracion.Text = String.Empty
        txtnombreCE.Text = String.Empty
        txtnumeroOficio.Text = String.Empty
        txtasunto.Text = String.Empty
        txtrespuesta.Text = String.Empty
        txtfechaRespuestaCasos.Text = String.Empty
        txtfechaCerradoCasos.Text = String.Empty
    End Sub
#End Region

End Class