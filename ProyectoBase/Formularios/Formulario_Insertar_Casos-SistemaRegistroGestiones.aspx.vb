Imports CapAccesoDatosSiReGe
Imports CapEntidadesSiReGe
Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration

Public Class Formulario_Insertar_Casos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

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


#Region "btnAgregar datos a la tabla tblCasos"
    'EFECTO: La función de este botón se encarga revisar que todos los textboxes y dropdownlists esten llenos para insertar en la base de datos. Aunque solo fuerza 3 textboxes como obligados para insertar
    'RECIBE: La llamada de Datos_Casos y Entidad_Casos para la inserción a la base de datos
    'DEVUELVE: Inserta los datos a la base de datos en la tabla tblCasos
    Protected Sub btnAgregar_Click(sender As Object, e As EventArgs) Handles btnAgregar.Click
        Dim dts As New Entidad_Casos
        Dim func As New Datos_Casos
        If txtNumero_Caso.Text <> "" And ddlEstado_Caso.Text <> "" And txtNombre_Usuario.Text <> "" Then
            Try
                dts._numeroCasos = txtNumero_Caso.Text
                dts._estadoCasos = ddlEstado_Caso.Text
                dts._fechaCasos = txtFecha_Caso.Text
                dts._cedulaDenuncianteCasos = txtCedula_Usuario.Text
                dts._nombreDenuncianteCasos = txtNombre_Usuario.Text
                dts._idEmpleados = intIdEmpleados.Text
                dts._nombreCentroEducativo = txtNombre_CE.Text
                dts._numeroOficio = txtNumero_Oficio.Text
                dts._fechaOficio = txtFecha_Caso.Text
                dts._condicionCasos = ddlCondicion_Caso.Text
                dts._idUnidad = ddlDescripcion_Unidad.Text
                dts._idDimension = ddlLetra_Dimension.Text
                dts._valoracionAdmisibilidad = ddlValoracion_Admisibilidad.Text
                dts._veredictoValoracionIngreso = ddlVeredicto_Valoracion.Text
                dts._trazabilidadCasos = ddlTrazabilidad_Casos.Text
                dts._detalleInconformidadCasos = txtAsunto.Text
                dts._respuestaCasos = txtRespuesta.Text
                dts._fechaRespuestaCasos = txtFecha_Respuesta_Casos.Text
                dts._fechaCerradoCasos = txtFecha_Cerrado_Casos.Text
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

    Protected Sub btnVolver_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        Response.Redirect("Tabla_Casos-SistemaRegistroGestiones.aspx")
    End Sub

#Region "Limpiar Formulario"
    'EFECTO: Función que se utiliza para limpiar todos los textboxes de la pagina
    'RECIBE: No recibe parametros
    'DEVUELVE: Hace vacio todos los textboxes
    Sub GestionLimpiar()
        txtNumero_Caso.Text = String.Empty
        txtFecha_Caso.Text = String.Empty
        txtCedula_Usuario.Text = String.Empty
        txtNombre_Usuario.Text = String.Empty
        txtNombre_CE.Text = String.Empty
        txtNumero_Oficio.Text = String.Empty
        txtFecha_Oficio.Text = String.Empty
        ddlVeredicto_Valoracion.Text = String.Empty
        txtAsunto.Text = String.Empty
        txtRespuesta.Text = String.Empty
        txtFecha_Respuesta_Casos.Text = String.Empty
        txtFecha_Cerrado_Casos.Text = String.Empty
    End Sub
#End Region

End Class