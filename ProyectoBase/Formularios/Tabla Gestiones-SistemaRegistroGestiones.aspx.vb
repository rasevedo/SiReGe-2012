Imports CapAccesoDatosSiReGe
Imports CapEntidadesSiReGe
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
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

Public Class Gestiones
    Inherits System.Web.UI.Page

    Dim dt As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Mostrar()
        End If
    End Sub

#Region "Mostrar Tabla"
    'EFECTO: Esta función es la que ayuda para llenar los datos del gridview tomados de la tabla de tblGestiones de la base de datos.
    'RECIBE: No depende de un parametro. Y se guarda la función en func para luego ir llenando fila por fila el gridview. 
    'DEVUELVE:Gridview con los datos de tblGestiones.
    Sub Mostrar()
        Try
            Dim func As New Datos_Gestiones
            dt = func.mostrarGestiones
            If dt.Rows.Count <> 0 Then
                GridViewGestiones.DataSource = dt
                GridViewGestiones.DataBind()
            Else
                GridViewGestiones.DataSource = Nothing
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
#End Region

    'Boton dirige a la inserción de formularios
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles btnAgregar.Click
        Response.Redirect("Formulario Insertar Gestiones-SistemaRegistroGestiones.aspx")
    End Sub

    'Toda la informacion detro de este buton funcionan para la exportacion de datos
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles btnExportar.Click
        PrepareGridViewForExport(GridViewGestiones)
        ExportGridView()
    End Sub

    Protected Sub ExportarWord_Click(sender As Object, e As EventArgs) Handles btnExportarWord.Click
        ExportaWord()
    End Sub

#Region "Exportar Panel a Word"
    'EFECTO: Función que se útiliza para exportar la información presente a word. Durante este build se utilizará este metodo se espera en el siguiente prototipo resolverlo por medio de ReportViewer 11
    'RECIBE: El único parámetro que recibe es el panel pnlPopup para obtener la información que debe exportar
    'DEVUELVE: Devuelve un archivo .doc de Microsoft Word con la información del modal para su trabajo.
    Protected Sub ExportaWord()
        Response.Clear()
        Response.Buffer = True
        Response.ContentType = "application/vnd.word"
        Response.ContentEncoding = System.Text.Encoding.UTF8
        Response.AddHeader("Content-Disposition", "attachment;filename=Gestion.doc")
        Response.Charset = ""
        EnableViewState = False
        Dim table As New Table()
        Dim row As New TableRow()
        row.Cells.Add(New TableCell())
        row.Cells(0).Controls.Add(pnlPopup)
        table.Rows.Add(row)
        Dim oStringWriter As New System.IO.StringWriter()
        Dim oHtmlTextWriter As New System.Web.UI.HtmlTextWriter(oStringWriter)
        table.RenderControl(oHtmlTextWriter)
        Response.Write(oStringWriter.ToString())
        Response.[End]()
    End Sub
#End Region

#Region "Reporte"
    Sub Reporte()
        'Dim dsGestiones As New GestionesReport()
        For Each row As GridViewRow In GridViewGestiones.Rows
            If TryCast(row.FindControl("chkSelect"), CheckBox).Checked Then
                Dim idGestiones As String = row.Cells(1).Text
                Dim tipoGestiones As String = row.Cells(2).Text
                Dim cedulaUsuario As String = row.Cells(3).Text
                Dim nombreUsuario As String = row.Cells(4).Text
                Dim fechaIngreso As String = row.Cells(5).Text
                Dim confidencialidadGestiones As String = row.Cells(6).Text
                Dim fuenteGeneradora As String = row.Cells(7).Text
                Dim tipoServicio As String = row.Cells(8).Text
                Dim nombreEmpleados As String = row.Cells(9).Text
                Dim direccionRegional As String = row.Cells(10).Text
                Dim supervicionGestiones As String = row.Cells(11).Text
                Dim nombreCentroEducativo As String = row.Cells(12).Text
                Dim descripcionUnidad As String = row.Cells(13).Text
                Dim descripcionDespacho As String = row.Cells(14).Text
                Dim descripcionDireccion As String = row.Cells(15).Text
                Dim descripcionDepartamento As String = row.Cells(16).Text
                Dim numeroOficio As String = row.Cells(17).Text
                Dim tipoDimension As String = row.Cells(18).Text
                Dim letraDimension As String = row.Cells(19).Text
                Dim descripcionTipoDimension As String = row.Cells(20).Text
                Dim tipoUsuario As String = row.Cells(21).Text
                Dim detalleGestiones As String = row.Cells(22).Text
                Dim respuestaGestiones As String = row.Cells(23).Text
                Dim categoriaGestiones As String = row.Cells(24).Text
                '   dsGestiones.Tables(0).Rows.Add(row.Cells(1).Text, row.Cells(2).Text, row.Cells(3).Text, row.Cells(4).Text, row.Cells(5).Text, row.Cells(6).Text, row.Cells(7).Text, row.Cells(8).Text, row.Cells(9).Text, row.Cells(10).Text, row.Cells(11).Text, row.Cells(12).Text, row.Cells(13).Text, row.Cells(14).Text, row.Cells(15).Text, row.Cells(16).Text, row.Cells(17).Text, row.Cells(18).Text, row.Cells(19).Text, row.Cells(20).Text, row.Cells(21).Text, row.Cells(22).Text, row.Cells(23).Text, row.Cells(24).Text)
            End If
        Next
    End Sub
#End Region

    
#Region "Exportar a Excel"
    'EFECTO: Función que se útiliza para exportar la información presente a word. Durante este build se utilizará este metodo se espera en el siguiente prototipo resolverlo por medio de ReportViewer 11
    'RECIBE: Recibe como parametros todas las filas seleccionadas con un check en el gridview
    'DEVUELVE: Un archivo .xls el cual contiene todas las filas del gridview seleccionadas
    Private Sub ExportGridView()
        Dim attachment As String = "attachment; filename=Gestiones.xls"
        Response.ClearContent()
        Response.AddHeader("content-disposition", attachment)
        Response.ContentType = "application/ms-excel"
        Dim sw As StringWriter = New StringWriter()
        Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
        Dim frm As HtmlForm = New HtmlForm()
        GridViewGestiones.Parent.Controls.Add(frm)
        frm.Attributes("runat") = "server"
        frm.Controls.Add(GridViewGestiones)
        frm.RenderControl(htw)
        Response.Write(sw.ToString())
        Response.[End]()
    End Sub

    'EFECTO: Función que se utilizá para controlar un error que poseé ExportGridView()
    'RECIBE: NO RECIBE NADA
    'DEVUELVE: NO DEVUELVE
    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)
    End Sub

    'EFECTO: Si la opción dentro de la tabla es distinto a un checkbox, dropdownlist o linkbutton este sera preparado para tambien ser exportado
    'RECIBE: El gridview presente GridViewCasos
    'DEVUELVE: NO DEVUELVE
    Private Sub PrepareGridViewForExport(ByVal gv As Control)
        Dim lb As LinkButton = New LinkButton()
        Dim l As Literal = New Literal()
        Dim name As String = String.Empty
        For i As Integer = 0 To gv.Controls.Count - 1
            If gv.Controls(i).[GetType]() = GetType(LinkButton) Then
                l.Text = (TryCast(gv.Controls(i), LinkButton)).Text
                gv.Controls.Remove(gv.Controls(i))
                gv.Controls.AddAt(i, l)
            ElseIf gv.Controls(i).[GetType]() = GetType(DropDownList) Then
                l.Text = (TryCast(gv.Controls(i), DropDownList)).SelectedItem.Text
                gv.Controls.Remove(gv.Controls(i))
                gv.Controls.AddAt(i, l)
            ElseIf gv.Controls(i).[GetType]() = GetType(CheckBox) Then
                l.Text = If((TryCast(gv.Controls(i), CheckBox)).Checked, "True", "False")
                gv.Controls.Remove(gv.Controls(i))
                gv.Controls.AddAt(i, l)
            End If
            If gv.Controls(i).HasControls() Then
                PrepareGridViewForExport(gv.Controls(i))
            End If
        Next
    End Sub
#End Region


#Region "btnBorrar la fila seleccionada"
    'EFECTO:La función dentro del botón revisa antes de borrar cuales filas estan marcadas con un check
    'RECIBE:Todas las filas del gridview marcadas con un check
    'DEVUELVE:El borrado de la fila y la tabla del gridview actualizada
    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles btnBorrar.Click
        If Session("Perfil") = "Administrador" Then
            Try
                Dim func As New Datos_Gestiones
                Dim dts As New Entidad_Gestiones
                For Each gvrow As GridViewRow In GridViewGestiones.Rows
                    Dim chkdelete As CheckBox = DirectCast(gvrow.FindControl("chkSelect"), CheckBox)
                    If chkdelete.Checked Then
                        Dim gesid As Integer = Convert.ToInt32(GridViewGestiones.DataKeys(gvrow.RowIndex).Value)
                        dts._idGestiones = gesid
                        If func.borrarGestiones(dts) Then
                            Response.Write("<script language=javascript>alert('El elemento ha sido eliminado de forma exitosa')</script>")
                            'MsgBox("El elemento ha sido eliminado de forma exitosa")
                        Else
                            Response.Write("<script language=javascript>alert('No se ha eliminado el elemento.')</script>")
                            'MsgBox("No se ha eliminado el elemento.")
                        End If
                    End If
                Next
                Mostrar()
            Catch ex As Exception
                Response.Write("<script language=javascript>alert('Hubo un problema en eliminar el elemento')</script>")
                'MsgBox("Hubo un problema en eliminar el elmento" + ex.Message)
            End Try
        Else
            Response.Write("<script language=javascript>alert('El usuario no posee permiso para seleccionar el botón de borrar')</script>")
        End If
    End Sub
#End Region

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        Response.Redirect("Menu Principal-SistemaRegistroGestiones.aspx")
    End Sub


#Region "Seleccionar Filas"
    'EFECTO: Función que selecciona las filas para poder mapear el reporte para su creación.
    'RECIBE: Cada fila dentro de GridViewCasos
    'DEVUELVE: NO DEVUELVE
    Protected Sub GridViewGestiones_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewGestiones.SelectedIndexChanged
        txtId_Gestiones.Text = GridViewGestiones.SelectedRow.Cells(3).Text
        txtTipo_Gestiones.Text = Page.Server.HtmlDecode(GridViewGestiones.SelectedRow.Cells(4).Text)
        txtCedulaUsuario.Text = GridViewGestiones.SelectedRow.Cells(5).Text
        txtNombreUsuario.Text = GridViewGestiones.SelectedRow.Cells(6).Text
        txtFechaIngreso.Text = GridViewGestiones.SelectedRow.Cells(7).Text
        txtConfidencialida.Text = Page.Server.HtmlDecode(GridViewGestiones.SelectedRow.Cells(8).Text)
        txtFuenteGeneradora.Text = Page.Server.HtmlDecode(GridViewGestiones.SelectedRow.Cells(9).Text)
        txtTipoServicio.Text = Page.Server.HtmlDecode(GridViewGestiones.SelectedRow.Cells(10).Text)
        txtempleado.Text = Page.Server.HtmlDecode(GridViewGestiones.SelectedRow.Cells(11).Text)
        txtRegional.Text = Page.Server.HtmlDecode(GridViewGestiones.SelectedRow.Cells(12).Text)
        txtSupervision.Text = Page.Server.HtmlDecode(GridViewGestiones.SelectedRow.Cells(13).Text)
        txtCE.Text = Page.Server.HtmlDecode(GridViewGestiones.SelectedRow.Cells(14).Text)
        txtUnidad.Text = Page.Server.HtmlDecode(GridViewGestiones.SelectedRow.Cells(15).Text)
        txtDespacho.Text = Page.Server.HtmlDecode(GridViewGestiones.SelectedRow.Cells(16).Text)
        txtDireccion.Text = Page.Server.HtmlDecode(GridViewGestiones.SelectedRow.Cells(17).Text)
        txtDepartamento.Text = Page.Server.HtmlDecode(GridViewGestiones.SelectedRow.Cells(18).Text)
        txtNumOficio.Text = Page.Server.HtmlDecode(GridViewGestiones.SelectedRow.Cells(19).Text)
        txtDimension.Text = Page.Server.HtmlDecode(GridViewGestiones.SelectedRow.Cells(20).Text)
        txtLetraDim.Text = GridViewGestiones.SelectedRow.Cells(21).Text
        lblDetalleDim.Text = Page.Server.HtmlDecode(GridViewGestiones.SelectedRow.Cells(22).Text)
        txtTipoUsuario.Text = Page.Server.HtmlDecode(GridViewGestiones.SelectedRow.Cells(23).Text)
        lblDetalleGestion.Text = Page.Server.HtmlDecode(GridViewGestiones.SelectedRow.Cells(24).Text)
        lblRespuesta_Gestion.Text = Page.Server.HtmlDecode(GridViewGestiones.SelectedRow.Cells(25).Text)
        txtCategoria_Gestion.Text = Page.Server.HtmlDecode(GridViewGestiones.SelectedRow.Cells(26).Text)
        mpe.Show()
    End Sub
#End Region


#Region "btnSearch Buscador para filtrar Gestiones"
    'EFECTO: Botón con la función de filtrar datos en la tabla gridview por medio de vchTipoGestion seleccionado en el dropdownlist'
    'RECIBE: El valor de vchTipoGestion seleccionado del dropdownlist
    'DEVUELVE: Gridview filtrado
    Protected Sub btnsearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Dim strConnString As String = ConfigurationManager _
             .ConnectionStrings("bda_SIREGE_Connection").ConnectionString

        Dim con As New SqlConnection(strConnString)
        con.Open()
        Dim cmd As SqlCommand = New SqlCommand("SELECT G.intIdGestiones, G.vchTipoGestiones, G.intCedulaUsuario, G.vchNombreUsuario, G.dtiFechaIngreso, G.vchConfidencialidadGestiones, G.vchFuenteGeneradora ,G.vchTipoServicio, E.vchNombreEmpleados,G.vchDireccionRegional, G.vchSupervicionGestiones, G.vchNombreCentroEducativo, U.vchDescripcionUnidad, U.vchDescripcionDespacho, U.vchDescripcionDireccion, U.vchDescripcionDepartamento,G.vchNumeroOficio, D.vchTipoDimension, D.vchLetraDimension, D.descripcionTipoDimension, G.vchTipoUsuario, G.vchDetalleGestiones, G.vchRespuestaGestiones, G.vchCategoriaGestiones FROM tblGestiones G join tblEmpleados as E on G.intIdEmpleados = E.intIdEmpleados join tblUnidades as U on G.intIdUnidad = U.intIdUnidad join tblDimensiones as D on G.intIdDimension = D.intIdDimension  WHERE vchTipoGestiones='" & Search.Text & "'", con)

        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        con.Close()
        GridViewGestiones.DataSource = ds
        GridViewGestiones.DataBind()
    End Sub
#End Region

End Class