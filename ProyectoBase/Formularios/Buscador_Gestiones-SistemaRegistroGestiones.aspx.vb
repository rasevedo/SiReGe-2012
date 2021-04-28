Imports CapAccesoDatosSiReGe
Imports CapEntidadesSiReGe
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Collections
Imports Microsoft.Reporting.WebForms
Imports AjaxControlToolkit
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Text
Imports System.IO

Public Class Buscador_Gestiones_SistemaRegistroGestiones
    Inherits System.Web.UI.Page

    Dim strConnString As String = ConfigurationManager _
             .ConnectionStrings("bda_SIREGE_Connection").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            MostrarTabla()
        End If
    End Sub


    Protected Sub btnEditar_Click(sender As Object, e As EventArgs)
        Dim Id As Integer = (TryCast(sender, Button)).CommandArgument
        Response.Redirect("Modificar_Gestiones-SistemaRegistroGestiones.aspx?intIdGestiones=" & Id)
    End Sub


    'Button que ejecuta la función de filtrar las tablas del gridview
    Protected Sub btnBuscar_Gestion_Click(sender As Object, e As EventArgs) Handles btnBuscar_Gestion.Click
        MostrarTablaFiltro()
    End Sub


    'Toda la informacion detro de este button funcionan para la exportacion de datos a Word
    Protected Sub btnBitacora_Click(sender As Object, e As EventArgs) Handles btnBitacora.Click
        ExportarBitacora("Bitacora_Gestiones")
    End Sub


    'Toda la informacion detro de este button funcionan para la exportacion de datos a Excel
    Protected Sub btnExportar_Click(sender As Object, e As EventArgs) Handles btnExportar.Click
        ExportarGestionesExcel("Gestiones_Tabla")
    End Sub


    'Button que regresá de vuelta a la tabla de gestiones principal
    Protected Sub btnVolver_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        Response.Redirect("Tabla_Gestiones-SistemaRegistroGestiones.aspx")
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
            ' con.Dispose()
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
            Dim func As New Datos_Gestiones
            dt = func.mostrarGestiones
            If dt.Rows.Count <> 0 Then
                gvwGestiones.DataSource = dt
                gvwGestiones.DataBind()
            Else
                gvwGestiones.DataSource = Nothing
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
        Dim Query As String = "palBuscadorGestiones"
        Dim conx As New SqlConnection()
        conx.ConnectionString = strConnString
        Dim cmd As New SqlCommand
        cmd = New SqlCommand("palBuscadorGestiones")
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = Query

        If txtNombre_Funcionario.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchNombreFuncionario", txtNombre_Funcionario.Text.Trim())
        End If

        If ddlTipo_Gestiones.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchTipoGestiones", ddlTipo_Gestiones.Text.Trim())
        End If

        If ddlFuente_Generadora.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchFuenteGeneradora", ddlFuente_Generadora.Text.Trim())
        End If

        If ddlConfidencialidad.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchConfidencialidadGestiones", ddlConfidencialidad.Text.Trim())
        End If

        If ddlDireccion_Regional_Educacion.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchDireccionRegional", ddlDireccion_Regional_Educacion.Text.Trim())
        End If

        If txtNombre_Usuario.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchNombreUsuario", txtNombre_Usuario.Text.Trim())
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
        gvwGestiones.DataSource = ds
        gvwGestiones.DataBind()

        If gvwGestiones.Rows.Count = 0 Then
            lblmsg.Text = "No se encontraron resultados"
            lblmsg.Visible = True
        End If
    End Sub
#End Region


#Region "Exportar Panel a Word"
    'EFECTO: Función que se útiliza para exportar la información presente a un report para exportar a archivo de tipo Word
    'RECIBE: El único parámetro que recibe es el panel pnlPopup para obtener la información que debe exportar
    'DEVUELVE: Devuelve un archivo .docx de Microsoft Word con la información del modal para su trabajo.
    Private Sub ExportarBitacora(ByVal fileName As String)
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("bda_SIREGE_Connection").ToString())
        Dim ds As New dstBitacora_Gestiones()
        For Each gvrow As GridViewRow In gvwGestiones.Rows
            If TryCast(gvrow.FindControl("chkSeleccionar"), CheckBox).Checked Then
                Dim intIdGestiones As Integer = gvrow.Cells(3).Text
                Dim vchTipoGestiones As String = Page.Server.HtmlDecode(gvrow.Cells(4).Text)
                Dim intCedulaUsuario As Integer = gvrow.Cells(5).Text
                Dim vchNombreUsuario As String = Page.Server.HtmlDecode(gvrow.Cells(6).Text)
                Dim dtiFechaIngreso As DateTime = Page.Server.HtmlDecode(gvrow.Cells(7).Text)
                Dim vchConfidencialidadGestiones As String = Page.Server.HtmlDecode(gvrow.Cells(8).Text)
                Dim vchFuenteGeneradora As String = Page.Server.HtmlDecode(gvrow.Cells(9).Text)
                Dim vchTipoServicio As String = Page.Server.HtmlDecode(gvrow.Cells(10).Text)
                Dim vchNombreFuncionario As String = Page.Server.HtmlDecode(gvrow.Cells(11).Text)
                Dim vchDireccionRegional As String = Page.Server.HtmlDecode(gvrow.Cells(12).Text)
                Dim vchSupervicionGestiones As String = Page.Server.HtmlDecode(gvrow.Cells(13).Text)
                Dim vchNombreCentroEducativo As String = Page.Server.HtmlDecode(gvrow.Cells(14).Text)
                Dim vchDescripcionUnidad As String = Page.Server.HtmlDecode(gvrow.Cells(15).Text)
                Dim vchDescripcionDespacho As String = Page.Server.HtmlDecode(gvrow.Cells(16).Text)
                Dim vchDescripcionDireccion As String = Page.Server.HtmlDecode(gvrow.Cells(17).Text)
                Dim vchdescripcionDepartamento As String = Page.Server.HtmlDecode(gvrow.Cells(18).Text)
                Dim vchNumeroOficio As String = Page.Server.HtmlDecode(gvrow.Cells(19).Text)
                Dim vchTipoDimension As String = Page.Server.HtmlDecode(gvrow.Cells(20).Text)
                Dim vchLetraDimension As String = Page.Server.HtmlDecode(gvrow.Cells(21).Text)
                Dim vchDescripcionLetraDimension As String = Page.Server.HtmlDecode(gvrow.Cells(22).Text)
                Dim vchTipoUsuario As String = Page.Server.HtmlDecode(gvrow.Cells(23).Text)
                Dim vchDetalleGestiones As String = Page.Server.HtmlDecode(gvrow.Cells(24).Text)
                Dim vchRespuestaGestiones As String = Page.Server.HtmlDecode(gvrow.Cells(25).Text)

                ds.Tables(0).Rows.Add(gvrow.Cells(3).Text, Page.Server.HtmlDecode(gvrow.Cells(4).Text), Page.Server.HtmlDecode(gvrow.Cells(5).Text), Page.Server.HtmlDecode(gvrow.Cells(6).Text), Page.Server.HtmlDecode(gvrow.Cells(7).Text), Page.Server.HtmlDecode(gvrow.Cells(8).Text), Page.Server.HtmlDecode(gvrow.Cells(9).Text), Page.Server.HtmlDecode(gvrow.Cells(10).Text), Page.Server.HtmlDecode(gvrow.Cells(11).Text), Page.Server.HtmlDecode(gvrow.Cells(12).Text), Page.Server.HtmlDecode(gvrow.Cells(13).Text), Page.Server.HtmlDecode(gvrow.Cells(14).Text), Page.Server.HtmlDecode(gvrow.Cells(15).Text), Page.Server.HtmlDecode(gvrow.Cells(16).Text), Page.Server.HtmlDecode(gvrow.Cells(17).Text), Page.Server.HtmlDecode(gvrow.Cells(18).Text), Page.Server.HtmlDecode(gvrow.Cells(19).Text), Page.Server.HtmlDecode(gvrow.Cells(20).Text), Page.Server.HtmlDecode(gvrow.Cells(21).Text), Page.Server.HtmlDecode(gvrow.Cells(22).Text), Page.Server.HtmlDecode(gvrow.Cells(23).Text), Page.Server.HtmlDecode(gvrow.Cells(24).Text), Page.Server.HtmlDecode(gvrow.Cells(25).Text))

            End If
        Next

        Dim warnings As Warning()
        Dim streams As String()
        Dim MIMETYPE As String = String.Empty
        Dim encoding As String = String.Empty
        Dim extension As String = String.Empty


        Dim rptviewer As New ReportViewer()
        rptviewer.ProcessingMode = ProcessingMode.Local
        rptviewer.LocalReport.ReportPath = "C:\Users\Usuario01\Documents\Visual Studio 2012\Projects\SistemaRegistroGestiones\ProyectoBase\Formularios\Bitacora_Gestiones.rdlc"

        Dim datasource As New ReportDataSource("DataSet_Bitacora_Gestion", ds.Tables(0))

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
    Private Sub ExportarGestionesExcel(ByVal fileName As String)
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("bda_SIREGE_Connection").ToString())
        Dim ds As New dstGestiones()
        For Each gvrow As GridViewRow In gvwGestiones.Rows
            If TryCast(gvrow.FindControl("chkSeleccionar"), CheckBox).Checked Then
                Dim intIdGestiones As Integer = gvrow.Cells(3).Text
                Dim vchTipoGestiones As String = Page.Server.HtmlDecode(gvrow.Cells(4).Text)
                Dim intCedulaUsuario As Integer = gvrow.Cells(5).Text
                Dim vchNombreUsuario As String = Page.Server.HtmlDecode(gvrow.Cells(6).Text)
                Dim dtiFechaIngreso As DateTime = Page.Server.HtmlDecode(gvrow.Cells(7).Text)
                Dim vchConfidencialidadGestiones As String = Page.Server.HtmlDecode(gvrow.Cells(8).Text)
                Dim vchFuenteGeneradora As String = Page.Server.HtmlDecode(gvrow.Cells(9).Text)
                Dim vchTipoServicio As String = Page.Server.HtmlDecode(gvrow.Cells(10).Text)
                Dim vchNombreFuncionario As String = Page.Server.HtmlDecode(gvrow.Cells(11).Text)
                Dim vchDireccionRegional As String = Page.Server.HtmlDecode(gvrow.Cells(12).Text)
                Dim vchSupervicionGestiones As String = Page.Server.HtmlDecode(gvrow.Cells(13).Text)
                Dim vchNombreCentroEducativo As String = Page.Server.HtmlDecode(gvrow.Cells(14).Text)
                Dim vchDescripcionUnidad As String = Page.Server.HtmlDecode(gvrow.Cells(15).Text)
                Dim vchDescripcionDespacho As String = Page.Server.HtmlDecode(gvrow.Cells(16).Text)
                Dim vchDescripcionDireccion As String = Page.Server.HtmlDecode(gvrow.Cells(17).Text)
                Dim vchdescripcionDepartamento As String = Page.Server.HtmlDecode(gvrow.Cells(18).Text)
                Dim vchNumeroOficio As String = Page.Server.HtmlDecode(gvrow.Cells(19).Text)
                Dim vchTipoDimension As String = Page.Server.HtmlDecode(gvrow.Cells(20).Text)
                Dim vchLetraDimension As String = Page.Server.HtmlDecode(gvrow.Cells(21).Text)
                Dim vchDescripcionLetraDimension As String = Page.Server.HtmlDecode(gvrow.Cells(22).Text)
                Dim vchTipoUsuario As String = Page.Server.HtmlDecode(gvrow.Cells(23).Text)
                Dim vchDetalleGestiones As String = Page.Server.HtmlDecode(gvrow.Cells(24).Text)
                Dim vchRespuestaGestiones As String = Page.Server.HtmlDecode(gvrow.Cells(25).Text)

                ds.Tables(0).Rows.Add(gvrow.Cells(3).Text, Page.Server.HtmlDecode(gvrow.Cells(4).Text), Page.Server.HtmlDecode(gvrow.Cells(5).Text), Page.Server.HtmlDecode(gvrow.Cells(6).Text), Page.Server.HtmlDecode(gvrow.Cells(7).Text), Page.Server.HtmlDecode(gvrow.Cells(8).Text), Page.Server.HtmlDecode(gvrow.Cells(9).Text), Page.Server.HtmlDecode(gvrow.Cells(10).Text), Page.Server.HtmlDecode(gvrow.Cells(11).Text), Page.Server.HtmlDecode(gvrow.Cells(12).Text), Page.Server.HtmlDecode(gvrow.Cells(13).Text), Page.Server.HtmlDecode(gvrow.Cells(14).Text), Page.Server.HtmlDecode(gvrow.Cells(15).Text), Page.Server.HtmlDecode(gvrow.Cells(16).Text), Page.Server.HtmlDecode(gvrow.Cells(17).Text), Page.Server.HtmlDecode(gvrow.Cells(18).Text), Page.Server.HtmlDecode(gvrow.Cells(19).Text), Page.Server.HtmlDecode(gvrow.Cells(20).Text), Page.Server.HtmlDecode(gvrow.Cells(21).Text), Page.Server.HtmlDecode(gvrow.Cells(22).Text), Page.Server.HtmlDecode(gvrow.Cells(23).Text), Page.Server.HtmlDecode(gvrow.Cells(24).Text), Page.Server.HtmlDecode(gvrow.Cells(25).Text))

            End If
        Next

        Dim warnings As Warning()
        Dim streams As String()
        Dim MIMETYPE As String = String.Empty
        Dim encoding As String = String.Empty
        Dim extension As String = String.Empty


        Dim rptviewer As New ReportViewer()
        rptviewer.ProcessingMode = ProcessingMode.Local
        rptviewer.LocalReport.ReportPath = "C:\Users\Usuario01\Documents\Visual Studio 2012\Projects\SistemaRegistroGestiones\ProyectoBase\Formularios\Reporte_Gestiones.rdlc"

        Dim datasource As New ReportDataSource("DataSet_Gestiones", ds.Tables(0))

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


#Region "Seleccionar Filas Popup Detalle"
    'EFECTO: Función que selecciona las filas para poder mapear el reporte para su creación.
    'RECIBE: Cada fila dentro de GridViewCasos
    'DEVUELVE: Información de cada fila detallada en un panel.
    Protected Sub GridViewGestiones_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvwGestiones.SelectedIndexChanged
        txtSPop_Id_Gestiones.Text = gvwGestiones.SelectedRow.Cells(3).Text
        txtPop_Tipo_Gestiones.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(4).Text)
        txtPop_Cedula_Usuario.Text = gvwGestiones.SelectedRow.Cells(5).Text
        txtPop_Nombre_Usuario.Text = gvwGestiones.SelectedRow.Cells(6).Text
        txtPop_Fecha_Ingreso.Text = gvwGestiones.SelectedRow.Cells(7).Text
        txtPop_Confidencialida.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(8).Text)
        txtPop_Fuente_Generadora.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(9).Text)
        txtPop_Tipo_Servicio.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(10).Text)
        txtPop_Empleado.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(11).Text)
        txtPop_Regional.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(12).Text)
        txtPop_Supervision.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(13).Text)
        txtPop_CE.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(14).Text)
        txtPop_Unidad.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(15).Text)
        txtPop_Despacho.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(16).Text)
        txtPop_Direccion.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(17).Text)
        txtPop_Departamento.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(18).Text)
        txtPop_Num_Oficio.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(19).Text)
        txtPop_Dimension.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(20).Text)
        txtPop_Letra_Dimension.Text = gvwGestiones.SelectedRow.Cells(21).Text
        txtPop_Detalle_Dimension.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(22).Text)
        txtPop_Tipo_Usuario.Text = gvwGestiones.SelectedRow.Cells(23).Text
        txtPop_Detalle_Gestion.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(24).Text)
        txtPop_Respuesta_Gestion.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(25).Text)
        mpeDetalles.Show()
    End Sub
#End Region


#Region "btnBorrar la fila seleccionada"
    'EFECTO:La función dentro del botón revisa antes de borrar cuales filas estan marcadas con un check
    'RECIBE:Todas las filas del gridview marcadas con un check
    'DEVUELVE:El borrado de la fila y la tabla del gridview actualizada
    Protected Sub btnBorrar_Click(sender As Object, e As EventArgs) Handles btnBorrar.Click
        If Session("Perfil") = "A" Then
            Try
                Dim func As New Datos_Gestiones
                Dim dts As New Entidad_Gestiones
                For Each gvrow As GridViewRow In gvwGestiones.Rows
                    Dim chkdelete As CheckBox = DirectCast(gvrow.FindControl("chkSeleccionar"), CheckBox)
                    If chkdelete.Checked Then
                        Dim gesid As Integer = Convert.ToInt32(gvwGestiones.DataKeys(gvrow.RowIndex).Value)
                        dts._idGestiones = gesid
                        If func.borrarGestiones(dts) Then
                            ' Response.Write("<script language=javascript>alert('El elemento ha sido eliminado de forma exitosa')</script>")
                            'MsgBox("El elemento ha sido eliminado de forma exitosa") 
                        Else
                            ' Response.Write("<script language=javascript>alert('No se ha eliminado el elemento.')</script>")
                            ' MsgBox("No se ha eliminado el elemento.")
                        End If
                    End If
                Next
                MostrarTabla()
                Response.Redirect("Buscador_Gestiones-SistemaRegistroGestiones.aspx")
            Catch ex As Exception
                ModalPopupExtender_Error.Show()
                'Response.Write("<script language=javascript>alert('Hubo un problema en eliminar el elemento')</script>")
                ' MsgBox("Hubo un problema en eliminar el elmento" + ex.Message)
            End Try
        Else
            ModalPopupExtender_Borrar_No_Permiso.Show()
            'Response.Write("<script language=javascript>alert('El usuario no posee permiso para seleccionar el botón de borrar')</script>")
        End If
    End Sub
#End Region

End Class