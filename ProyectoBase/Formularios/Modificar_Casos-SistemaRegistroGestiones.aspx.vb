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
            Me.MostrarTablaAvances()

            txtNombre_Funcionario.Text = Session("NombreUsuario")
            Me.TomarCaso()
            Me.MostrarTablaFiltrada()
            AvancePanel1.Visible = False
            AvancePanel2.Visible = False
            AvancePanel3.Visible = False
            AvancePanel4.Visible = False
            ' Me.MostrarAvanceGridview()
            ' Me.FiltrarPorCaso()
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
        'cmd.Parameters.AddWithValue("@intIdUnidad", ddlDescripcion_Unidad.SelectedItem.Value)
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
        ' cmd.Parameters.AddWithValue("@intIdDimension", ddlLetra_Dimension.SelectedItem.Value)
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
            If Not String.IsNullOrEmpty(txtCedula_Usuario.Text) Then
                dts._cedulaDenuncianteCasos = Integer.Parse(txtCedula_Usuario.Text)
            End If
            dts._nombreDenuncianteCasos = txtNombre_Usuario.Text
            dts._nombreFuncionario = txtNombre_Funcionario.Text
            dts._nombreCentroEducativo = txtNombre_CE.Text
            ' dts._idUnidad = ddlDescripcion_Unidad.Text
            dts._numeroOficio = txtNumero_Oficio.Text

            If txtFecha_Oficio.Text = "" Then
                dts._fechaOficio = Nothing
            Else
                dts._fechaOficio = txtFecha_Oficio.Text
            End If

            ' dts._idDimension = ddlLetra_Dimension.Text
            dts._condicionCasos = ddlCondicion_Caso.Text
            dts._detalleInconformidadCasos = txtAsunto.Text
            dts._respuestaCasos = txtRespuesta.Text
            dts._valoracionAdmisibilidad = ddlValoracion_Admisibilidad.Text
            dts._veredictoValoracionIngreso = ddlVeredicto_Valoracion.Text
            dts._trazabilidadCasos = ddlTrazabilidad_Casos.Text

            If txtFecha_Respuesta_Casos.Text = "" Then
                dts._fechaRespuestaCasos = Nothing
            Else
                dts._fechaRespuestaCasos = txtFecha_Respuesta_Casos.Text
            End If

            If txtFecha_Cerrado_Casos.Text = "" Then
                dts._fechaCerradoCasos = Nothing
            Else
                dts._fechaCerradoCasos = txtFecha_Cerrado_Casos.Text
            End If
            '-----------------------------------------------------------------------------------'
            dts._detalleCasoAvance1 = txtDetalle_Avance1.Text
            If txtFecha_Avance1.Text = "" Then
                dts._fechaCasoAvance1 = Nothing
            Else
                dts._fechaCasoAvance1 = txtFecha_Avance1.Text
            End If

            dts._detalleCasoAvance2 = txtDetalle_Avance2.Text
            If txtFecha_Avance2.Text = "" Then
                dts._fechaCasoAvance2 = Nothing
            Else
                dts._fechaCasoAvance2 = txtFecha_Avance2.Text
            End If

            dts._detalleCasoAvance3 = txtDetalle_Avance3.Text
            If txtFecha_Avance3.Text = "" Then
                dts._fechaCasoAvance3 = Nothing
            Else
                dts._fechaCasoAvance3 = txtFecha_Avance3.Text
            End If

            dts._detalleCasoAvance4 = txtDetalle_Avance4.Text
            If txtFecha_Avance4.Text = "" Then
                dts._fechaCasoAvance4 = Nothing
            Else
                dts._fechaCasoAvance4 = txtFecha_Avance4.Text
            End If


            If func.modificarCasos(dts) Then
                ModalPopupExtender_Exito.Show()
                'Response.Write("<script language=javascript>alert('El elemento se ha modificado exitosamente')</script>")
                'MsgBox("Exito")
                'Response.Redirect(Request.Url.AbsoluteUri, False)

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
            'Me.txtNombre_Funcionario.Text = dr("vchNombreFuncionario").ToString()
            ' Me.intIdEmpleados.Text = dr("intIdEmpleados").ToString()
            Me.txtNombre_CE.Text = dr("vchNombreCentroEducativo").ToString()
            Me.txtDescripcion_Unidad.Text = dr("vchDescripcionUnidad").ToString()
            Me.txtDespacho.Text = dr("vchDescripcionDespacho").ToString()
            Me.txtDireccion.Text = dr("vchDescripcionDireccion").ToString()
            Me.txtDepartamento.Text = dr("vchdescripcionDepartamento").ToString()
            Me.txtNumero_Oficio.Text = dr("vchNumeroOficio").ToString()
            Me.txtFecha_Oficio.Text = dr("dtiFechaOficio").ToString()
            Me.txtTipo_Dimension.Text = dr("vchTipoDimension").ToString()
            Me.txtLetra_Dimension.Text = dr("vchLetraDimension").ToString()
            Me.txtTipo_Detalle_Letra_Dimension.Text = dr("vchDescripcionTipoDimension").ToString()
            Me.ddlCondicion_Caso.Text = dr("vchCondicionCasos").ToString()
            Me.txtAsunto.Text = dr("vchDetalleInconformidadCasos").ToString()
            Me.txtRespuesta.Text = dr("vchRespuestaCasos").ToString()
            Me.ddlValoracion_Admisibilidad.Text = dr("vchValoracionAdmisibilidad").ToString()
            Me.ddlVeredicto_Valoracion.Text = dr("vchVeredictoValoracionIngreso").ToString()
            Me.ddlTrazabilidad_Casos.Text = dr("vchTrazabilidadCasos").ToString()
            Me.txtFecha_Respuesta_Casos.Text = dr("dtiFechaRespuestaCasos").ToString()
            Me.txtFecha_Cerrado_Casos.Text = dr("dtiFechaCerradoCasos").ToString()
            Me.txtFecha_Avance1.Text = dr("dtiCasoAvanceFecha1").ToString()
            Me.txtDetalle_Avance1.Text = dr("vchCasoAvance1").ToString()
            Me.txtFecha_Avance2.Text = dr("dtiCasoAvanceFecha2").ToString()
            Me.txtDetalle_Avance2.Text = dr("vchCasoAvance2").ToString()
            Me.txtFecha_Avance3.Text = dr("dtiCasoAvanceFecha3").ToString()
            Me.txtDetalle_Avance3.Text = dr("vchCasoAvance3").ToString()
            Me.txtFecha_Avance4.Text = dr("dtiCasoAvanceFecha4").ToString()
            Me.txtDetalle_Avance4.Text = dr("vchCasoAvance4").ToString()
        Next
    End Sub
#End Region

    Protected Sub btnAgregarAvance1_Click(sender As Object, e As EventArgs) Handles btnAgregarAvance1.Click
        AvancePanel1.Visible = True
        btnAgregarAvance1.Enabled = False
    End Sub

    Protected Sub btnAgregarAvance2_Click(sender As Object, e As EventArgs) Handles btnAgregarAvance2.Click
        AvancePanel2.Visible = True
        btnAgregarAvance2.Enabled = False
    End Sub

    Protected Sub btnAgregarAvance3_Click(sender As Object, e As EventArgs) Handles btnAgregarAvance3.Click
        AvancePanel3.Visible = True
        btnAgregarAvance3.Enabled = False
    End Sub

    Protected Sub btnAgregarAvance4_Click(sender As Object, e As EventArgs) Handles btnAgregarAvance4.Click
        AvancePanel4.Visible = True
        btnAgregarAvance4.Enabled = False
    End Sub

#Region "btnInsertarAvance Insertar el Avance/Seguimiento1 del Caso respectivo"
    'EFECTO: La función de este botón es para realizar la inserción de datos del avance1 la cual se insertará en su propio gridview
    'RECIBE: Requiere del llamado de su entidad y datos.
    'DEVUELVE: Guarda los datos en su propio campo
    Protected Sub btnInsertar_Avance1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnInsertar_Avance1.Click
        Try
            Dim dts As New Entidad_Casos 'instanciamos a la clase atributos de la tabla trabajador
            Dim func As New Datos_Casos 'instanciamos a la clase funciones de la tabla trabajador
            dts._idCasos = txtId_Casos.Text
            dts._numeroCasos = txtNumero_Caso.Text
            dts._estadoCasos = ddlEstado_Caso.Text
            dts._fechaCasos = txtFecha_Caso.Text
            If Not String.IsNullOrEmpty(txtCedula_Usuario.Text) Then
                dts._cedulaDenuncianteCasos = Integer.Parse(txtCedula_Usuario.Text)
            End If
            dts._nombreDenuncianteCasos = txtNombre_Usuario.Text
            dts._nombreFuncionario = txtNombre_Funcionario.Text
            dts._nombreCentroEducativo = txtNombre_CE.Text           
            dts._numeroOficio = txtNumero_Oficio.Text
            If txtFecha_Oficio.Text = "" Then
                dts._fechaOficio = Nothing
            Else
                dts._fechaOficio = txtFecha_Oficio.Text
            End If
            dts._condicionCasos = ddlCondicion_Caso.Text
            dts._detalleInconformidadCasos = txtAsunto.Text
            dts._respuestaCasos = txtRespuesta.Text
            dts._valoracionAdmisibilidad = ddlValoracion_Admisibilidad.Text
            dts._veredictoValoracionIngreso = ddlVeredicto_Valoracion.Text
            dts._trazabilidadCasos = ddlTrazabilidad_Casos.Text
            If txtFecha_Respuesta_Casos.Text = "" Then
                dts._fechaRespuestaCasos = Nothing
            Else
                dts._fechaRespuestaCasos = txtFecha_Respuesta_Casos.Text
            End If
            If txtFecha_Cerrado_Casos.Text = "" Then
                dts._fechaCerradoCasos = Nothing
            Else
                dts._fechaCerradoCasos = txtFecha_Cerrado_Casos.Text
            End If
            '-----------------------------------------------------------------------------------'
            dts._detalleCasoAvance1 = txtDetalle_Avance1.Text
            If txtFecha_Avance1.Text = "" Then
                dts._fechaCasoAvance1 = Nothing
            Else
                dts._fechaCasoAvance1 = txtFecha_Avance1.Text
            End If
            '-----------------------------------------------------------------------------------'
            dts._detalleCasoAvance2 = txtDetalle_Avance2.Text
            If txtFecha_Avance2.Text = "" Then
                dts._fechaCasoAvance2 = Nothing
            Else
                dts._fechaCasoAvance2 = txtFecha_Avance2.Text
            End If
            dts._detalleCasoAvance3 = txtDetalle_Avance3.Text
            If txtFecha_Avance3.Text = "" Then
                dts._fechaCasoAvance3 = Nothing
            Else
                dts._fechaCasoAvance3 = txtFecha_Avance3.Text
            End If
            dts._detalleCasoAvance4 = txtDetalle_Avance4.Text
            If txtFecha_Avance4.Text = "" Then
                dts._fechaCasoAvance4 = Nothing
            Else
                dts._fechaCasoAvance4 = txtFecha_Avance4.Text
            End If
            If func.modificarCasos(dts) Then
                ModalPopupExtender_AvanceExito.Show()
                AvancePanel1.Visible = False
                btnAgregarAvance1.Enabled = True
                Me.MostrarTablaAvances()
                Me.MostrarTablaFiltrada()
                'Response.Write("<script language=javascript>alert('El elemento se ha modificado exitosamente')</script>")
                'MsgBox("Exito")
            Else
                ModalPopupExtender_AvanceError.Show()
                'Response.Write("<script language=javascript>alert('Se ha modificado un elemento erroneamente')</script>")
                ' MsgBox("Fracaso")
            End If
        Catch ex As Exception
            ModalPopupExtender_AvanceError.Show()
            'Response.Write("<script language=javascript>alert('Hubo un problema en modificar el elemento. Porfavor revisar formulario. Porfavor rellenar de nuevo los espacios de fechas y dimensiones')</script>")
            'MsgBox(ex.Message)
        End Try
    End Sub
#End Region


#Region "btnInsertarAvance Insertar el Avance/Seguimiento2 del Caso respectivo"
    'EFECTO: La función de este botón es para realizar la inserción de datos del avance2 la cual se insertará en su propio gridview
    'RECIBE: Requiere del llamado de su entidad y datos.
    'DEVUELVE: Guarda los datos en su propio campo.
    Protected Sub btnInsertar_Avance2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnInsertar_Avance2.Click
        Try
            Dim dts As New Entidad_Casos 'instanciamos a la clase atributos de la tabla trabajador
            Dim func As New Datos_Casos 'instanciamos a la clase funciones de la tabla trabajador
            dts._idCasos = txtId_Casos.Text
            dts._numeroCasos = txtNumero_Caso.Text
            dts._estadoCasos = ddlEstado_Caso.Text
            dts._fechaCasos = txtFecha_Caso.Text
            If Not String.IsNullOrEmpty(txtCedula_Usuario.Text) Then
                dts._cedulaDenuncianteCasos = Integer.Parse(txtCedula_Usuario.Text)
            End If
            dts._nombreDenuncianteCasos = txtNombre_Usuario.Text
            dts._nombreFuncionario = txtNombre_Funcionario.Text
            dts._nombreCentroEducativo = txtNombre_CE.Text
            dts._numeroOficio = txtNumero_Oficio.Text
            If txtFecha_Oficio.Text = "" Then
                dts._fechaOficio = Nothing
            Else
                dts._fechaOficio = txtFecha_Oficio.Text
            End If
            dts._condicionCasos = ddlCondicion_Caso.Text
            dts._detalleInconformidadCasos = txtAsunto.Text
            dts._respuestaCasos = txtRespuesta.Text
            dts._valoracionAdmisibilidad = ddlValoracion_Admisibilidad.Text
            dts._veredictoValoracionIngreso = ddlVeredicto_Valoracion.Text
            dts._trazabilidadCasos = ddlTrazabilidad_Casos.Text
            If txtFecha_Respuesta_Casos.Text = "" Then
                dts._fechaRespuestaCasos = Nothing
            Else
                dts._fechaRespuestaCasos = txtFecha_Respuesta_Casos.Text
            End If
            If txtFecha_Cerrado_Casos.Text = "" Then
                dts._fechaCerradoCasos = Nothing
            Else
                dts._fechaCerradoCasos = txtFecha_Cerrado_Casos.Text
            End If            
            dts._detalleCasoAvance1 = txtDetalle_Avance1.Text
            If txtFecha_Avance1.Text = "" Then
                dts._fechaCasoAvance1 = Nothing
            Else
                dts._fechaCasoAvance1 = txtFecha_Avance1.Text
            End If
            '-----------------------------------------------------------------------------------'
            dts._detalleCasoAvance2 = txtDetalle_Avance2.Text
            If txtFecha_Avance2.Text = "" Then
                dts._fechaCasoAvance2 = Nothing
            Else
                dts._fechaCasoAvance2 = txtFecha_Avance2.Text
            End If
            '-----------------------------------------------------------------------------------'
            dts._detalleCasoAvance3 = txtDetalle_Avance3.Text
            If txtFecha_Avance3.Text = "" Then
                dts._fechaCasoAvance3 = Nothing
            Else
                dts._fechaCasoAvance3 = txtFecha_Avance3.Text
            End If
            dts._detalleCasoAvance4 = txtDetalle_Avance4.Text
            If txtFecha_Avance4.Text = "" Then
                dts._fechaCasoAvance4 = Nothing
            Else
                dts._fechaCasoAvance4 = txtFecha_Avance4.Text
            End If
            If func.modificarCasos(dts) Then
                ModalPopupExtender_AvanceExito.Show()
                AvancePanel1.Visible = False
                btnAgregarAvance1.Enabled = True
                Me.MostrarTablaAvances()
                Me.MostrarTablaFiltrada()
                'Response.Write("<script language=javascript>alert('El elemento se ha modificado exitosamente')</script>")
                'MsgBox("Exito")
            Else
                ModalPopupExtender_AvanceError.Show()
                'Response.Write("<script language=javascript>alert('Se ha modificado un elemento erroneamente')</script>")
                ' MsgBox("Fracaso")
            End If
        Catch ex As Exception
            ModalPopupExtender_AvanceError.Show()
            'Response.Write("<script language=javascript>alert('Hubo un problema en modificar el elemento. Porfavor revisar formulario. Porfavor rellenar de nuevo los espacios de fechas y dimensiones')</script>")
            'MsgBox(ex.Message)
        End Try
    End Sub
#End Region


#Region "btnInsertarAvance Insertar el Avance/Seguimiento3 del Caso respectivo"
    'EFECTO: La función de este botón es para realizar la inserción de datos del avance 3 la cual se insertará en su propio gridview
    'RECIBE: Requiere del llamado de su entidad y datos.
    'DEVUELVE: Guarda los datos en su propio campo
    Protected Sub btnInsertar_Avance3_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnInsertar_Avance3.Click
        Try
            Dim dts As New Entidad_Casos 'instanciamos a la clase atributos de la tabla trabajador
            Dim func As New Datos_Casos 'instanciamos a la clase funciones de la tabla trabajador
            dts._idCasos = txtId_Casos.Text
            dts._numeroCasos = txtNumero_Caso.Text
            dts._estadoCasos = ddlEstado_Caso.Text
            dts._fechaCasos = txtFecha_Caso.Text
            If Not String.IsNullOrEmpty(txtCedula_Usuario.Text) Then
                dts._cedulaDenuncianteCasos = Integer.Parse(txtCedula_Usuario.Text)
            End If
            dts._nombreDenuncianteCasos = txtNombre_Usuario.Text
            dts._nombreFuncionario = txtNombre_Funcionario.Text
            dts._nombreCentroEducativo = txtNombre_CE.Text
            dts._numeroOficio = txtNumero_Oficio.Text
            If txtFecha_Oficio.Text = "" Then
                dts._fechaOficio = Nothing
            Else
                dts._fechaOficio = txtFecha_Oficio.Text
            End If
            dts._condicionCasos = ddlCondicion_Caso.Text
            dts._detalleInconformidadCasos = txtAsunto.Text
            dts._respuestaCasos = txtRespuesta.Text
            dts._valoracionAdmisibilidad = ddlValoracion_Admisibilidad.Text
            dts._veredictoValoracionIngreso = ddlVeredicto_Valoracion.Text
            dts._trazabilidadCasos = ddlTrazabilidad_Casos.Text
            If txtFecha_Respuesta_Casos.Text = "" Then
                dts._fechaRespuestaCasos = Nothing
            Else
                dts._fechaRespuestaCasos = txtFecha_Respuesta_Casos.Text
            End If
            If txtFecha_Cerrado_Casos.Text = "" Then
                dts._fechaCerradoCasos = Nothing
            Else
                dts._fechaCerradoCasos = txtFecha_Cerrado_Casos.Text
            End If
            dts._detalleCasoAvance1 = txtDetalle_Avance1.Text
            If txtFecha_Avance1.Text = "" Then
                dts._fechaCasoAvance1 = Nothing
            Else
                dts._fechaCasoAvance1 = txtFecha_Avance1.Text
            End If

            dts._detalleCasoAvance2 = txtDetalle_Avance2.Text
            If txtFecha_Avance2.Text = "" Then
                dts._fechaCasoAvance2 = Nothing
            Else
                dts._fechaCasoAvance2 = txtFecha_Avance2.Text
            End If
            '-----------------------------------------------------------------------------------'
            dts._detalleCasoAvance3 = txtDetalle_Avance3.Text
            If txtFecha_Avance3.Text = "" Then
                dts._fechaCasoAvance3 = Nothing
            Else
                dts._fechaCasoAvance3 = txtFecha_Avance3.Text
            End If
            '-----------------------------------------------------------------------------------'
            dts._detalleCasoAvance4 = txtDetalle_Avance4.Text
            If txtFecha_Avance4.Text = "" Then
                dts._fechaCasoAvance4 = Nothing
            Else
                dts._fechaCasoAvance4 = txtFecha_Avance4.Text
            End If
            If func.modificarCasos(dts) Then
                ModalPopupExtender_AvanceExito.Show()
                AvancePanel1.Visible = False
                btnAgregarAvance1.Enabled = True
                Me.MostrarTablaAvances()
                Me.MostrarTablaFiltrada()
                'Response.Write("<script language=javascript>alert('El elemento se ha modificado exitosamente')</script>")
                'MsgBox("Exito")
            Else
                ModalPopupExtender_AvanceError.Show()
                'Response.Write("<script language=javascript>alert('Se ha modificado un elemento erroneamente')</script>")
                ' MsgBox("Fracaso")
            End If
        Catch ex As Exception
            ModalPopupExtender_AvanceError.Show()
            'Response.Write("<script language=javascript>alert('Hubo un problema en modificar el elemento. Porfavor revisar formulario. Porfavor rellenar de nuevo los espacios de fechas y dimensiones')</script>")
            'MsgBox(ex.Message)
        End Try
    End Sub
#End Region


#Region "btnInsertarAvance Insertar el Avance/Seguimiento4 del Caso respectivo"
    'EFECTO: La función de este botón es para realizar la inserción de datos del avance la cual se insertará en su propio gridview
    'RECIBE: Requiere del llamado de su entidad y datos.
    'DEVUELVE: Guarda los datos en la tabla tblCasoAvances
    Protected Sub btnInsertar_Avance4_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnInsertar_Avance4.Click
        Try
            Dim dts As New Entidad_Casos 'instanciamos a la clase atributos de la tabla trabajador
            Dim func As New Datos_Casos 'instanciamos a la clase funciones de la tabla trabajador
            dts._idCasos = txtId_Casos.Text
            dts._numeroCasos = txtNumero_Caso.Text
            dts._estadoCasos = ddlEstado_Caso.Text
            dts._fechaCasos = txtFecha_Caso.Text
            If Not String.IsNullOrEmpty(txtCedula_Usuario.Text) Then
                dts._cedulaDenuncianteCasos = Integer.Parse(txtCedula_Usuario.Text)
            End If
            dts._nombreDenuncianteCasos = txtNombre_Usuario.Text
            dts._nombreFuncionario = txtNombre_Funcionario.Text
            dts._nombreCentroEducativo = txtNombre_CE.Text
            dts._numeroOficio = txtNumero_Oficio.Text
            If txtFecha_Oficio.Text = "" Then
                dts._fechaOficio = Nothing
            Else
                dts._fechaOficio = txtFecha_Oficio.Text
            End If
            dts._condicionCasos = ddlCondicion_Caso.Text
            dts._detalleInconformidadCasos = txtAsunto.Text
            dts._respuestaCasos = txtRespuesta.Text
            dts._valoracionAdmisibilidad = ddlValoracion_Admisibilidad.Text
            dts._veredictoValoracionIngreso = ddlVeredicto_Valoracion.Text
            dts._trazabilidadCasos = ddlTrazabilidad_Casos.Text
            If txtFecha_Respuesta_Casos.Text = "" Then
                dts._fechaRespuestaCasos = Nothing
            Else
                dts._fechaRespuestaCasos = txtFecha_Respuesta_Casos.Text
            End If
            If txtFecha_Cerrado_Casos.Text = "" Then
                dts._fechaCerradoCasos = Nothing
            Else
                dts._fechaCerradoCasos = txtFecha_Cerrado_Casos.Text
            End If
            dts._detalleCasoAvance1 = txtDetalle_Avance1.Text
            If txtFecha_Avance1.Text = "" Then
                dts._fechaCasoAvance1 = Nothing
            Else
                dts._fechaCasoAvance1 = txtFecha_Avance1.Text
            End If

            dts._detalleCasoAvance2 = txtDetalle_Avance2.Text
            If txtFecha_Avance2.Text = "" Then
                dts._fechaCasoAvance2 = Nothing
            Else
                dts._fechaCasoAvance2 = txtFecha_Avance2.Text
            End If

            dts._detalleCasoAvance3 = txtDetalle_Avance3.Text
            If txtFecha_Avance3.Text = "" Then
                dts._fechaCasoAvance3 = Nothing
            Else
                dts._fechaCasoAvance3 = txtFecha_Avance3.Text
            End If
            '-----------------------------------------------------------------------------------'
            dts._detalleCasoAvance4 = txtDetalle_Avance4.Text
            If txtFecha_Avance4.Text = "" Then
                dts._fechaCasoAvance4 = Nothing
            Else
                dts._fechaCasoAvance4 = txtFecha_Avance4.Text
            End If
            '-----------------------------------------------------------------------------------'
            If func.modificarCasos(dts) Then
                ModalPopupExtender_AvanceExito.Show()
                AvancePanel1.Visible = False
                btnAgregarAvance1.Enabled = True
                Me.MostrarTablaAvances()
                Me.MostrarTablaFiltrada()
                'Response.Write("<script language=javascript>alert('El elemento se ha modificado exitosamente')</script>")
                'MsgBox("Exito")
            Else
                ModalPopupExtender_AvanceError.Show()
                'Response.Write("<script language=javascript>alert('Se ha modificado un elemento erroneamente')</script>")
                ' MsgBox("Fracaso")
            End If
        Catch ex As Exception
            ModalPopupExtender_AvanceError.Show()
            'Response.Write("<script language=javascript>alert('Hubo un problema en modificar el elemento. Porfavor revisar formulario. Porfavor rellenar de nuevo los espacios de fechas y dimensiones')</script>")
            'MsgBox(ex.Message)
        End Try
    End Sub
#End Region




#Region "Mostrar Tabla de los Avances"
    'EFECTO: Esta función es la que ayuda para llenar los datos del gridview tomados de la tabla de tblCasos de la base de datos.
    'RECIBE: No depende de un parametro. Y se guarda la función en func para luego ir llenando fila por fila el gridview. 
    'DEVUELVE:Gridview con los datos de tblCasos.
    Sub MostrarTablaAvances()
        Try
            Dim func As New Datos_Casos
            dt = func.mostrarAvancesCaso
            If dt.Rows.Count <> 0 Then
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


#Region "Filtrar Tabla Avance"
    'EFECTO: Esta función causa la ejecución de filtros al gridview para que se actualize con los datos seleccionados
    'RECIBE: Cualquiera de los parametros mostrados en la interfaz para que filtre el gridview
    'DEVUELVE:Gridview actualizado con los datos filtrados
    Private Sub MostrarTablaFiltrada()
        Dim strConnString As String = ConfigurationManager _
             .ConnectionStrings("bda_SIREGE_Connection").ConnectionString
        ' Dim Conx.ConnectionString = strQuery
        Dim Query As String = "palFiltrarAvanceCasos"
        Dim conx As New SqlConnection()
        conx.ConnectionString = strConnString
        Dim cmd As New SqlCommand
        cmd = New SqlCommand("palFiltrarAvanceCasos")
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = Query

        If Me.txtId_Casos.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@intIdCasos", SqlDbType.VarChar).Value = txtId_Casos.Text.Trim()
        End If

        cmd.Connection = conx
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        gvwAvance.DataSource = ds
        gvwAvance.DataBind()

    End Sub
#End Region






End Class