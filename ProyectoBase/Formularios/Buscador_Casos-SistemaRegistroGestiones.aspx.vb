Imports CapAccesoDatosSiReGe
Imports CapEntidadesSiReGe
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports Microsoft.Reporting.WebForms
Imports System.Collections
Imports AjaxControlToolkit
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Text
Imports System.IO

Public Class Buscador_Casos_SistemaRegistroGestiones
    Inherits System.Web.UI.Page

    Dim dt As New DataTable

    Dim strQuery As String = ConfigurationManager _
                 .ConnectionStrings("bda_SIREGE_Connection").ConnectionString
    Dim con As SqlConnection = Nothing
    Dim cmd As SqlCommand = Nothing

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            MostrarTabla()
        End If
    End Sub


    'Button que ejecuta la función de filtrar las tablas del gridview
    Protected Sub btnBuscar_Casos_Click(sender As Object, e As EventArgs) Handles btnBuscar_Casos.Click
        MostrarTablaFiltro()
    End Sub


    'Toda la informacion detro de este button funcionan para la exportacion de datos a Word
    Protected Sub btnBitacora_Click(sender As Object, e As EventArgs) Handles btnBitacora.Click
        ExportarBitacora("Bitacora_Casos")
    End Sub


    'Toda la informacion detro de este button funcionan para la exportacion de datos a Excel
    Protected Sub btnExportar_Click(sender As Object, e As EventArgs) Handles btnExportar.Click
        ExportarCasosExcel("Casos_Tabla")
    End Sub


    'Button que regresá de vuelta a la tabla de gestiones principal
    Protected Sub btnVolver_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        Response.Redirect("Tabla_Casos-SistemaRegistroGestiones.aspx")
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
            End While
        Catch ex As Exception
            Throw ex
        Finally
            con.Close()
            con.Dispose()
        End Try
    End Sub
#End Region


#Region "Mostrar Tabla"
    'EFECTO: Esta función es la que ayuda para llenar los datos del gridview tomados de la tabla de tblGestiones de la base de datos.
    'RECIBE: No depende de un parametro. Y se guarda la función en func para luego ir llenando fila por fila el gridview. 
    'DEVUELVE:Gridview con los datos de tblGestiones.
    Sub MostrarTabla()
        Try
            Dim dt As New DataTable
            Dim func As New Datos_Casos
            dt = func.mostrarCasos
            If dt.Rows.Count <> 0 Then
                gvwCasos.DataSource = dt
                gvwCasos.DataBind()
            Else
                gvwCasos.DataSource = Nothing
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
#End Region


#Region "Filtrar Tabla"
    'EFECTO: Esta función causa la ejecución de filtros al gridview para que se actualize con los datos seleccionados
    'RECIBE: Cualquiera de los parametros mostrados en la interfaz para que filtre el gridview
    'DEVUELVE:Gridview actualizado con los datos filtrados
    Private Sub MostrarTablaFiltro()
        lblmsg.Visible = False

        Dim strConnString As String = ConfigurationManager _
             .ConnectionStrings("bda_SIREGE_Connection").ConnectionString

        ' Dim Conx.ConnectionString = strQuery
        Dim Query As String = "palBuscadorCasos"
        Dim conx As New SqlConnection()
        conx.ConnectionString = strConnString
        Dim cmd As New SqlCommand()
        cmd = New SqlCommand("palBuscadorCasos")
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = Query

        If txtNumero_Caso.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchNumeroCasos", txtNumero_Caso.Text.Trim())
        End If

        If txtNombre_Funcionario.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchNombreFuncionario", txtNombre_Funcionario.Text.Trim())
        End If

        If ddlEstado_Caso.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchEstadoCasos", ddlEstado_Caso.Text.Trim())
        End If

        If ddlCondicion_Caso.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchCondicionCasos", ddlCondicion_Caso.Text.Trim())
        End If

        If txtNombre_Denunciante.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchNombreDenucianteCasos", txtNombre_Denunciante.Text.Trim())
        End If

        If ddlDescripcion_Unidad.SelectedValue = "1" Then
            cmd.Parameters.AddWithValue("@intIdUnidad", Nothing)
        Else
            cmd.Parameters.AddWithValue("@intIdUnidad", ddlDescripcion_Unidad.SelectedValue)
        End If

        cmd.Connection = conx
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        gvwCasos.DataSource = ds
        gvwCasos.DataBind()

        If gvwCasos.Rows.Count = 0 Then
            lblmsg.Text = "No se encontraron resultados"
            lblmsg.Visible = True
        End If
    End Sub
#End Region


#Region "Seleccionar Filas Popup Detalle"
    'EFECTO: Función que selecciona las filas para poder mapear el reporte para su creación.
    'RECIBE: Cada fila dentro de GridViewCasos.
    'DEVUELVE: Información de cada fila detallada en un panel.
    Protected Sub GridViewCasos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvwCasos.SelectedIndexChanged
        'txtPop_Id_Caso.Text = gvwCasos.SelectedRow.Cells(3).Text
        txtPop_Num_Caso.Text = gvwCasos.SelectedRow.Cells(4).Text
        txtPop_Estado_Caso.Text = gvwCasos.SelectedRow.Cells(5).Text
        txtPop_Fecha_Caso.Text = gvwCasos.SelectedRow.Cells(6).Text
        txtPop_Cedula_Usuario.Text = gvwCasos.SelectedRow.Cells(7).Text
        txtPop_Nombre_Usuario.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(8).Text)
        txtPop_Empleado.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(9).Text)
        txtPop_CE.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(10).Text)
        txtPop_Unidad.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(11).Text)
        txtPop_Despacho.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(12).Text)
        txtPop_Direccion.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(13).Text)
        txtPop_Departamento.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(14).Text)
        txtPop_Num_Oficio.Text = gvwCasos.SelectedRow.Cells(15).Text
        txtPop_Fecha_Oficio.Text = gvwCasos.SelectedRow.Cells(16).Text
        txtPop_Dimension.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(17).Text)
        txtPop_Letra_Dimension.Text = gvwCasos.SelectedRow.Cells(18).Text
        txtPop_Detalle_Dimension.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(19).Text)
        txtPop_Condicion_Caso.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(20).Text)
        txtPop_Detalle_Inconformidad.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(21).Text)
        txtPop_Respuesta_Caso.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(22).Text)
        txtPop_Valoracion_Admisibilidad.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(23).Text)
        txtPop_Veredicto.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(24).Text)
        txtPop_Trazabilidad.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(25).Text)
        txtPop_Fecha_Respuesta.Text = gvwCasos.SelectedRow.Cells(26).Text
        txtPop_Fecha_Cerrado.Text = gvwCasos.SelectedRow.Cells(27).Text
        txtPop_Fecha_Avance1.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(28).Text)
        txtPop_Detalle_Avance1.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(29).Text)
        txtPop_Fecha_Avance2.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(30).Text)
        txtPop_Detalle_Avance2.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(31).Text)
        txtPop_Fecha_Avance3.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(32).Text)
        txtPop_Detalle_Avance3.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(33).Text)
        txtPop_Fecha_Avance4.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(34).Text)
        txtPop_Detalle_Avance4.Text = Page.Server.HtmlDecode(gvwCasos.SelectedRow.Cells(35).Text)
        mpeDetalles.Show()
    End Sub
#End Region


#Region "Exportar a Word"
    'EFECTO: Función que se útiliza para exportar la información presente a un report para exportar a archivo de tipo Word
    'RECIBE: Recibe como parametros una de las filas seleccionada con un check en el gridview.
    'DEVUELVE: Devuelve un archivo .docx de Microsoft Word con la información del modal para su trabajo.
    Private Sub ExportarBitacora(ByVal fileName As String)
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("bda_SIREGE_Connection").ToString())
        Dim ds As New dstCasos()
        For Each gvrow As GridViewRow In gvwCasos.Rows
            If TryCast(gvrow.FindControl("chkSeleccionar"), CheckBox).Checked Then
                Dim intIdCasos As String = Page.Server.HtmlDecode(gvrow.Cells(3).Text)
                Dim vchNumeroCasos As String = Page.Server.HtmlDecode(gvrow.Cells(4).Text)
                Dim vchEstadoCasos As String = Page.Server.HtmlDecode(gvrow.Cells(5).Text)

                'Dim dtiFechaCasos As DateTime = Page.Server.HtmlDecode(gvrow.Cells(6).Text)
                Dim dtiFechaCasos As DateTime
                If gvrow.Cells(6).Text = "&nbsp;" Then
                    dtiFechaCasos = Nothing
                Else
                    dtiFechaCasos = Page.Server.HtmlDecode(gvrow.Cells(6).Text)
                End If

                Dim intCedulaDenuncianteCasos As Integer = gvrow.Cells(7).Text
                Dim vchNombreDenucianteCasos As String = Page.Server.HtmlDecode(gvrow.Cells(8).Text)
                Dim vchNombreFuncionario As String = Page.Server.HtmlDecode(gvrow.Cells(9).Text)
                Dim vchNombreCentroEducativo As String = Page.Server.HtmlDecode(gvrow.Cells(10).Text)
                Dim vchDescripcionUnidad As String = Page.Server.HtmlDecode(gvrow.Cells(11).Text)
                Dim vchDescripcionDespacho As String = Page.Server.HtmlDecode(gvrow.Cells(12).Text)
                Dim vchDescripcionDireccion As String = Page.Server.HtmlDecode(gvrow.Cells(13).Text)
                Dim vchDescripcionDepartamento As String = Page.Server.HtmlDecode(gvrow.Cells(14).Text)
                Dim vchNumeroOficio As String = Page.Server.HtmlDecode(gvrow.Cells(15).Text)

                'Dim dtiFechaOficio As DateTime = Page.Server.HtmlDecode(gvrow.Cells(16).Text)
                Dim dtiFechaOficio As DateTime
                If gvrow.Cells(16).Text = "&nbsp;" Then
                    dtiFechaOficio = Nothing
                Else
                    dtiFechaOficio = Page.Server.HtmlDecode(gvrow.Cells(16).Text)
                End If

                Dim vchTipoDimension As String = Page.Server.HtmlDecode(gvrow.Cells(17).Text)
                Dim vchLetraDimension As String = gvrow.Cells(18).Text
                Dim vchDescripcionLetraDimension As String = Page.Server.HtmlDecode(gvrow.Cells(19).Text)
                Dim vchCondicionCasos As String = Page.Server.HtmlDecode(gvrow.Cells(20).Text)
                Dim vchDetalleInconformidadCasos As String = Page.Server.HtmlDecode(gvrow.Cells(21).Text)
                Dim vchRespuestaCasos As String = Page.Server.HtmlDecode(gvrow.Cells(22).Text)
                Dim vchValoracionAdmisibilidad As String = Page.Server.HtmlDecode(gvrow.Cells(23).Text)
                Dim vchVeredictoValoracionIngreso As String = Page.Server.HtmlDecode(gvrow.Cells(24).Text)
                Dim vchTrazabilidadCasos As String = Page.Server.HtmlDecode(gvrow.Cells(25).Text)

                'Dim dtiFechaRespuestaCasos As DateTime = Page.Server.HtmlDecode(gvrow.Cells(26).Text)
                Dim dtiFechaRespuestaCasos As DateTime
                If gvrow.Cells(26).Text = "&nbsp;" Then
                    dtiFechaRespuestaCasos = Nothing
                Else
                    dtiFechaRespuestaCasos = Page.Server.HtmlDecode(gvrow.Cells(26).Text)
                End If

                'Dim dtiFechaCerradoCasos As DateTime = Page.Server.HtmlDecode(gvrow.Cells(27).Text)
                Dim dtiFechaCerradoCasos As DateTime
                If gvrow.Cells(27).Text = "&nbsp;" Then
                    dtiFechaCerradoCasos = Nothing
                Else
                    dtiFechaCerradoCasos = Page.Server.HtmlDecode(gvrow.Cells(27).Text)
                End If

                'Dim dtiCasoAvanceFecha1 As DateTime = Page.Server.HtmlDecode(gvrow.Cells(28).Text)
                Dim dtiCasoAvanceFecha1 As DateTime
                If gvrow.Cells(28).Text = "&nbsp;" Then
                    dtiCasoAvanceFecha1 = Nothing
                Else
                    dtiCasoAvanceFecha1 = Page.Server.HtmlDecode(gvrow.Cells(28).Text)
                End If

                Dim vchCasoAvance1 As String = Page.Server.HtmlDecode(gvrow.Cells(29).Text)

                'Dim dtiCasoAvanceFecha2 As DateTime = Page.Server.HtmlDecode(gvrow.Cells(30).Text)
                Dim dtiCasoAvanceFecha2 As DateTime
                If gvrow.Cells(30).Text = "&nbsp;" Then
                    dtiCasoAvanceFecha2 = Nothing
                Else
                    dtiCasoAvanceFecha2 = Page.Server.HtmlDecode(gvrow.Cells(30).Text)
                End If

                Dim vchCasoAvance2 As String = Page.Server.HtmlDecode(gvrow.Cells(31).Text)

                'Dim dtiCasoAvanceFecha3 As DateTime = Page.Server.HtmlDecode(gvrow.Cells(32).Text)
                Dim dtiCasoAvanceFecha3 As DateTime
                If gvrow.Cells(32).Text = "&nbsp;" Then
                    dtiCasoAvanceFecha3 = Nothing
                Else
                    dtiCasoAvanceFecha3 = Page.Server.HtmlDecode(gvrow.Cells(32).Text)
                End If

                Dim vchCasoAvance3 As String = Page.Server.HtmlDecode(gvrow.Cells(33).Text)

                'Dim dtiCasoAvanceFecha4 As DateTime = Page.Server.HtmlDecode(gvrow.Cells(34).Text)
                Dim dtiCasoAvanceFecha4 As DateTime
                If gvrow.Cells(34).Text = "&nbsp;" Then
                    dtiCasoAvanceFecha4 = Nothing
                Else
                    dtiCasoAvanceFecha4 = Page.Server.HtmlDecode(gvrow.Cells(34).Text)
                End If

                Dim vchCasoAvance4 As String = Page.Server.HtmlDecode(gvrow.Cells(35).Text)

                ds.Tables(0).Rows.Add(Page.Server.HtmlDecode(gvrow.Cells(3).Text), Page.Server.HtmlDecode(gvrow.Cells(4).Text), Page.Server.HtmlDecode(gvrow.Cells(5).Text), Page.Server.HtmlDecode(gvrow.Cells(6).Text), Page.Server.HtmlDecode(gvrow.Cells(7).Text), Page.Server.HtmlDecode(gvrow.Cells(8).Text), Page.Server.HtmlDecode(gvrow.Cells(9).Text), Page.Server.HtmlDecode(gvrow.Cells(10).Text), Page.Server.HtmlDecode(gvrow.Cells(11).Text), Page.Server.HtmlDecode(gvrow.Cells(12).Text), Page.Server.HtmlDecode(gvrow.Cells(13).Text), Page.Server.HtmlDecode(gvrow.Cells(14).Text), Page.Server.HtmlDecode(gvrow.Cells(15).Text), Page.Server.HtmlDecode(dtiFechaOficio).Replace("0:00:00", ""), Page.Server.HtmlDecode(gvrow.Cells(17).Text), Page.Server.HtmlDecode(gvrow.Cells(18).Text), Page.Server.HtmlDecode(gvrow.Cells(19).Text), Page.Server.HtmlDecode(gvrow.Cells(20).Text), Page.Server.HtmlDecode(gvrow.Cells(21).Text), Page.Server.HtmlDecode(gvrow.Cells(22).Text), Page.Server.HtmlDecode(gvrow.Cells(23).Text), Page.Server.HtmlDecode(gvrow.Cells(24).Text), Page.Server.HtmlDecode(gvrow.Cells(25).Text), Page.Server.HtmlDecode(gvrow.Cells(26).Text), Page.Server.HtmlDecode(gvrow.Cells(27).Text), Page.Server.HtmlDecode(gvrow.Cells(28).Text), Page.Server.HtmlDecode(gvrow.Cells(29).Text), Page.Server.HtmlDecode(gvrow.Cells(30).Text), Page.Server.HtmlDecode(gvrow.Cells(31).Text), Page.Server.HtmlDecode(gvrow.Cells(32).Text), Page.Server.HtmlDecode(gvrow.Cells(33).Text), Page.Server.HtmlDecode(gvrow.Cells(34).Text), Page.Server.HtmlDecode(gvrow.Cells(35).Text))

            End If
        Next

        Dim warnings As Warning()
        Dim streams As String()
        Dim MIMETYPE As String = String.Empty
        Dim encoding As String = String.Empty
        Dim extension As String = String.Empty


        Dim rptviewer As New ReportViewer()
        rptviewer.ProcessingMode = ProcessingMode.Local
        rptviewer.LocalReport.ReportPath = "C:\Users\Usuario01\Documents\Visual Studio 2012\Projects\SistemaRegistroGestiones\ProyectoBase\Formularios\Bitacora_Casos.rdlc"

        Dim datasource As New ReportDataSource("DataSet_Bitacora_Caso", ds.Tables(0))

        rptviewer.LocalReport.DataSources.Clear()
        rptviewer.LocalReport.DataSources.Add(datasource)
        Dim bytes As Byte() = rptviewer.LocalReport.Render("Word", Nothing, MIMETYPE, encoding, extension, streams, warnings)
        Response.Buffer = True
        Response.Clear()
        Response.ContentType = MIMETYPE
        Response.AddHeader("content-disposition", "attachment; filename=" & fileName & "." & extension)
        Response.BinaryWrite(bytes)
        Response.Flush()

    End Sub
#End Region


#Region "Exportar a Excel"
    'EFECTO: Función que se útiliza para exportar la información presente a un report para exportar a archivo de tipo Excel
    'RECIBE: Recibe como parametros todas las filas seleccionadas con un check en el gridview
    'DEVUELVE: Un archivo .xls el cual contiene todas las filas del gridview seleccionadas
    Private Sub ExportarCasosExcel(ByVal fileName As String)
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("bda_SIREGE_Connection").ToString())
        Dim ds As New dstCasos()
        For Each gvrow As GridViewRow In gvwCasos.Rows
            If TryCast(gvrow.FindControl("chkSeleccionar"), CheckBox).Checked Then
                Dim intIdCasos As String = Page.Server.HtmlDecode(gvrow.Cells(3).Text)
                Dim vchNumeroCasos As String = Page.Server.HtmlDecode(gvrow.Cells(4).Text)
                Dim vchEstadoCasos As String = Page.Server.HtmlDecode(gvrow.Cells(5).Text)

                'Dim dtiFechaCasos As DateTime = Page.Server.HtmlDecode(gvrow.Cells(6).Text)
                Dim dtiFechaCasos As DateTime
                If gvrow.Cells(6).Text = "&nbsp;" Then
                    dtiFechaCasos = Nothing
                Else
                    dtiFechaCasos = Page.Server.HtmlDecode(gvrow.Cells(6).Text)
                End If

                Dim intCedulaDenuncianteCasos As Integer = gvrow.Cells(7).Text
                Dim vchNombreDenucianteCasos As String = Page.Server.HtmlDecode(gvrow.Cells(8).Text)
                Dim vchNombreFuncionario As String = Page.Server.HtmlDecode(gvrow.Cells(9).Text)
                Dim vchNombreCentroEducativo As String = Page.Server.HtmlDecode(gvrow.Cells(10).Text)
                Dim vchDescripcionUnidad As String = Page.Server.HtmlDecode(gvrow.Cells(11).Text)
                Dim vchDescripcionDespacho As String = Page.Server.HtmlDecode(gvrow.Cells(12).Text)
                Dim vchDescripcionDireccion As String = Page.Server.HtmlDecode(gvrow.Cells(13).Text)
                Dim vchDescripcionDepartamento As String = Page.Server.HtmlDecode(gvrow.Cells(14).Text)
                Dim vchNumeroOficio As String = Page.Server.HtmlDecode(gvrow.Cells(15).Text)

                'Dim dtiFechaOficio As DateTime = Page.Server.HtmlDecode(gvrow.Cells(16).Text)
                Dim dtiFechaOficio As DateTime
                If gvrow.Cells(16).Text = "&nbsp;" Then
                    dtiFechaOficio = Nothing
                Else
                    dtiFechaOficio = Page.Server.HtmlDecode(gvrow.Cells(16).Text)
                End If

                Dim vchTipoDimension As String = Page.Server.HtmlDecode(gvrow.Cells(17).Text)
                Dim vchLetraDimension As String = gvrow.Cells(18).Text
                Dim vchDescripcionLetraDimension As String = Page.Server.HtmlDecode(gvrow.Cells(19).Text)
                Dim vchCondicionCasos As String = Page.Server.HtmlDecode(gvrow.Cells(20).Text)
                Dim vchDetalleInconformidadCasos As String = Page.Server.HtmlDecode(gvrow.Cells(21).Text)
                Dim vchRespuestaCasos As String = Page.Server.HtmlDecode(gvrow.Cells(22).Text)
                Dim vchValoracionAdmisibilidad As String = Page.Server.HtmlDecode(gvrow.Cells(23).Text)
                Dim vchVeredictoValoracionIngreso As String = Page.Server.HtmlDecode(gvrow.Cells(24).Text)
                Dim vchTrazabilidadCasos As String = Page.Server.HtmlDecode(gvrow.Cells(25).Text)

                'Dim dtiFechaRespuestaCasos As DateTime = Page.Server.HtmlDecode(gvrow.Cells(26).Text)
                Dim dtiFechaRespuestaCasos As DateTime
                If gvrow.Cells(26).Text = "&nbsp;" Then
                    dtiFechaRespuestaCasos = Nothing
                Else
                    dtiFechaRespuestaCasos = Page.Server.HtmlDecode(gvrow.Cells(26).Text)
                End If

                'Dim dtiFechaCerradoCasos As DateTime = Page.Server.HtmlDecode(gvrow.Cells(27).Text)
                Dim dtiFechaCerradoCasos As DateTime
                If gvrow.Cells(27).Text = "&nbsp;" Then
                    dtiFechaCerradoCasos = Nothing
                Else
                    dtiFechaCerradoCasos = Page.Server.HtmlDecode(gvrow.Cells(27).Text)
                End If

                'Dim dtiCasoAvanceFecha1 As DateTime = Page.Server.HtmlDecode(gvrow.Cells(28).Text)
                Dim dtiCasoAvanceFecha1 As DateTime
                If gvrow.Cells(28).Text = "&nbsp;" Then
                    dtiCasoAvanceFecha1 = Nothing
                Else
                    dtiCasoAvanceFecha1 = Page.Server.HtmlDecode(gvrow.Cells(28).Text)
                End If

                Dim vchCasoAvance1 As String = Page.Server.HtmlDecode(gvrow.Cells(29).Text)

                'Dim dtiCasoAvanceFecha2 As DateTime = Page.Server.HtmlDecode(gvrow.Cells(30).Text)
                Dim dtiCasoAvanceFecha2 As DateTime
                If gvrow.Cells(30).Text = "&nbsp;" Then
                    dtiCasoAvanceFecha2 = Nothing
                Else
                    dtiCasoAvanceFecha2 = Page.Server.HtmlDecode(gvrow.Cells(30).Text)
                End If

                Dim vchCasoAvance2 As String = Page.Server.HtmlDecode(gvrow.Cells(31).Text)

                'Dim dtiCasoAvanceFecha3 As DateTime = Page.Server.HtmlDecode(gvrow.Cells(32).Text)
                Dim dtiCasoAvanceFecha3 As DateTime
                If gvrow.Cells(32).Text = "&nbsp;" Then
                    dtiCasoAvanceFecha3 = Nothing
                Else
                    dtiCasoAvanceFecha3 = Page.Server.HtmlDecode(gvrow.Cells(32).Text)
                End If

                Dim vchCasoAvance3 As String = Page.Server.HtmlDecode(gvrow.Cells(33).Text)

                'Dim dtiCasoAvanceFecha4 As DateTime = Page.Server.HtmlDecode(gvrow.Cells(34).Text)
                Dim dtiCasoAvanceFecha4 As DateTime
                If gvrow.Cells(34).Text = "&nbsp;" Then
                    dtiCasoAvanceFecha4 = Nothing
                Else
                    dtiCasoAvanceFecha4 = Page.Server.HtmlDecode(gvrow.Cells(34).Text)
                End If

                Dim vchCasoAvance4 As String = Page.Server.HtmlDecode(gvrow.Cells(35).Text)

                ds.Tables(0).Rows.Add(Page.Server.HtmlDecode(gvrow.Cells(3).Text), Page.Server.HtmlDecode(gvrow.Cells(4).Text), Page.Server.HtmlDecode(gvrow.Cells(5).Text), Page.Server.HtmlDecode(gvrow.Cells(6).Text), Page.Server.HtmlDecode(gvrow.Cells(7).Text), Page.Server.HtmlDecode(gvrow.Cells(8).Text), Page.Server.HtmlDecode(gvrow.Cells(9).Text), Page.Server.HtmlDecode(gvrow.Cells(10).Text), Page.Server.HtmlDecode(gvrow.Cells(11).Text), Page.Server.HtmlDecode(gvrow.Cells(12).Text), Page.Server.HtmlDecode(gvrow.Cells(13).Text), Page.Server.HtmlDecode(gvrow.Cells(14).Text), Page.Server.HtmlDecode(gvrow.Cells(15).Text), Page.Server.HtmlDecode(dtiFechaOficio).Replace("0:00:00", ""), Page.Server.HtmlDecode(gvrow.Cells(17).Text), Page.Server.HtmlDecode(gvrow.Cells(18).Text), Page.Server.HtmlDecode(gvrow.Cells(19).Text), Page.Server.HtmlDecode(gvrow.Cells(20).Text), Page.Server.HtmlDecode(gvrow.Cells(21).Text), Page.Server.HtmlDecode(gvrow.Cells(22).Text), Page.Server.HtmlDecode(gvrow.Cells(23).Text), Page.Server.HtmlDecode(gvrow.Cells(24).Text), Page.Server.HtmlDecode(gvrow.Cells(25).Text), Page.Server.HtmlDecode(gvrow.Cells(26).Text), Page.Server.HtmlDecode(gvrow.Cells(27).Text), Page.Server.HtmlDecode(gvrow.Cells(28).Text), Page.Server.HtmlDecode(gvrow.Cells(29).Text), Page.Server.HtmlDecode(gvrow.Cells(30).Text), Page.Server.HtmlDecode(gvrow.Cells(31).Text), Page.Server.HtmlDecode(gvrow.Cells(32).Text), Page.Server.HtmlDecode(gvrow.Cells(33).Text), Page.Server.HtmlDecode(gvrow.Cells(34).Text), Page.Server.HtmlDecode(gvrow.Cells(35).Text))

            End If
        Next

        Dim warnings As Warning()
        Dim streams As String()
        Dim MIMETYPE As String = String.Empty
        Dim encoding As String = String.Empty
        Dim extension As String = String.Empty


        Dim rptviewer As New ReportViewer()
        rptviewer.ProcessingMode = ProcessingMode.Local
        rptviewer.LocalReport.ReportPath = "C:\Users\Usuario01\Documents\Visual Studio 2012\Projects\SistemaRegistroGestiones\ProyectoBase\Formularios\Reporte_Casos.rdlc"

        Dim datasource As New ReportDataSource("DataSet_Casos", ds.Tables(0))

        rptviewer.LocalReport.DataSources.Clear()
        rptviewer.LocalReport.DataSources.Add(datasource)
        Dim bytes As Byte() = rptviewer.LocalReport.Render("Excel", Nothing, MIMETYPE, encoding, extension, streams, warnings)
        Response.Buffer = True
        Response.Clear()
        Response.ContentType = MIMETYPE
        Response.AddHeader("content-disposition", "attachment; filename=" & fileName & "." & extension)
        Response.BinaryWrite(bytes)
        Response.Flush()

    End Sub
#End Region


#Region "btnBorrar la fila seleccionada"
    'EFECTO:La función dentro del botón revisa antes de borrar cuales filas estan marcadas con un check
    'RECIBE:Todas las filas del gridview marcadas con un check
    'DEVUELVE:El borrado de la fila y la tabla del gridview actualizada
    Protected Sub btnBorrar_Click(sender As Object, e As EventArgs) Handles btnBorrar.Click
        If Session("Perfil") = "AD" Then
            Try
                Dim func As New Datos_Casos
                Dim dts As New Entidad_Casos
                For Each gvrow As GridViewRow In gvwCasos.Rows
                    Dim chkborrar As CheckBox = DirectCast(gvrow.FindControl("chkSeleccionar"), CheckBox)
                    If chkborrar.Checked Then
                        Dim gesid As Integer = Convert.ToInt32(gvwCasos.DataKeys(gvrow.RowIndex).Value)
                        dts._idCasos = gesid
                        If func.borrarCasos(dts) Then
                            ' Response.Write("<script language=javascript>alert('El elemento ha sido eliminado de forma exitosa')</script>")                          
                            'MsgBox("El elemento ha sido eliminado de forma exitosa")
                        Else
                            'Response.Write("<script language=javascript>alert('No se ha eliminado el elemento.')</script>")
                            'MsgBox("No se ha eliminado el elemento.")
                        End If
                    End If
                Next
                MostrarTabla()
                Response.Redirect("Tabla_Casos-SistemaRegistroGestiones.aspx")
            Catch ex As Exception
                ModalPopupExtender_Error.Show()
                ' Response.Write("<script language=javascript>alert('Hubo un problema en eliminar el elemento')</script>")
                ' MsgBox("Hubo un problema en eliminar el elmento" + ex.Message)
            End Try
        Else
            ModalPopupExtender_Borrar_No_Permiso.Show()
            ' Response.Write("<script language=javascript>alert('El usuario no posee permiso para seleccionar el botón de borrar')</script>")
        End If
    End Sub
#End Region


    









End Class