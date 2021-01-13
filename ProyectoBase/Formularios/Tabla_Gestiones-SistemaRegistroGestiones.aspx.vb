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

Public Class Tabla_Gestiones
    Inherits System.Web.UI.Page

    Dim dt As New DataTable
    Dim strQuery As String = ConfigurationManager _
             .ConnectionStrings("bda_SIREGE_Connection").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            MostrarTabla()
        End If
    End Sub

#Region "Mostrar Tabla"
    'EFECTO: Esta función es la que ayuda para llenar los datos del gridview tomados de la tabla de tblGestiones de la base de datos.
    'RECIBE: No depende de un parametro. Y se guarda la función en func para luego ir llenando fila por fila el gridview. 
    'DEVUELVE:Gridview con los datos de tblGestiones.
    Sub MostrarTabla()
        Try
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

    'Boton dirige a la inserción de formularios
    Protected Sub btnAgregar_Click(sender As Object, e As EventArgs) Handles btnAgregar.Click
        Response.Redirect("Formulario_Insertar_Gestiones-SistemaRegistroGestiones.aspx")
    End Sub

    'Toda la informacion detro de este buton funcionan para la exportacion de datos
    Protected Sub btnExportar_Click(sender As Object, e As EventArgs) Handles btnExportar.Click
        PrepararGridView_Export(gvwGestiones)
        ExportarGridView()
    End Sub

    Protected Sub btnExportar_Word_Click(sender As Object, e As EventArgs) Handles btnExportar_Word.Click
        ExportarWord()
    End Sub

#Region "Exportar Panel a Word"
    'EFECTO: Función que se útiliza para exportar la información presente a word. Durante este build se utilizará este metodo se espera en el siguiente prototipo resolverlo por medio de ReportViewer 11
    'RECIBE: El único parámetro que recibe es el panel pnlPopup para obtener la información que debe exportar
    'DEVUELVE: Devuelve un archivo .doc de Microsoft Word con la información del modal para su trabajo.
    Protected Sub ExportarWord()
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
        For Each row As GridViewRow In gvwGestiones.Rows
            If TryCast(row.FindControl("chkSeleccionar"), CheckBox).Checked Then
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
            End If
        Next
    End Sub
#End Region


#Region "Exportar a Excel"
    'EFECTO: Función que se útiliza para exportar la información presente a word. Durante este build se utilizará este metodo se espera en el siguiente prototipo resolverlo por medio de ReportViewer 11
    'RECIBE: Recibe como parametros todas las filas seleccionadas con un check en el gridview
    'DEVUELVE: Un archivo .xls el cual contiene todas las filas del gridview seleccionadas
    Private Sub ExportarGridView()
        Dim attachment As String = "attachment; filename=Gestiones.xls"
        Response.ClearContent()
        Response.AddHeader("content-disposition", attachment)
        Response.ContentType = "application/ms-excel"
        Dim sw As StringWriter = New StringWriter()
        Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
        Dim frm As HtmlForm = New HtmlForm()
        gvwGestiones.Parent.Controls.Add(frm)
        frm.Attributes("runat") = "server"
        frm.Controls.Add(gvwGestiones)
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
    Private Sub PrepararGridView_Export(ByVal gv As Control)
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
                PrepararGridView_Export(gv.Controls(i))
            End If
        Next
    End Sub
#End Region


#Region "btnBorrar la fila seleccionada"
    'EFECTO:La función dentro del botón revisa antes de borrar cuales filas estan marcadas con un check
    'RECIBE:Todas las filas del gridview marcadas con un check
    'DEVUELVE:El borrado de la fila y la tabla del gridview actualizada
    Protected Sub btnBorrar_Click(sender As Object, e As EventArgs) Handles btnBorrar.Click
        If Session("Perfil") = "Administrador" Then
            Try
                Dim func As New Datos_Gestiones
                Dim dts As New Entidad_Gestiones
                For Each gvrow As GridViewRow In gvwGestiones.Rows
                    Dim chkborrar As CheckBox = DirectCast(gvrow.FindControl("chkSeleccionar"), CheckBox)
                    If chkborrar.Checked Then
                        Dim gesid As Integer = Convert.ToInt32(gvwGestiones.DataKeys(gvrow.RowIndex).Value)
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
                MostrarTabla()
            Catch ex As Exception
                Response.Write("<script language=javascript>alert('Hubo un problema en eliminar el elemento')</script>")
                'MsgBox("Hubo un problema en eliminar el elmento" + ex.Message)
            End Try
        Else
            Response.Write("<script language=javascript>alert('El usuario no posee permiso para seleccionar el botón de borrar')</script>")
        End If
    End Sub
#End Region

    Protected Sub btnVolver_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        Response.Redirect("Menu_Principal-SistemaRegistroGestiones.aspx")
    End Sub


#Region "Seleccionar Filas"
    'EFECTO: Función que selecciona las filas para poder mapear el reporte para su creación.
    'RECIBE: Cada fila dentro de GridViewCasos
    'DEVUELVE: NO DEVUELVE
    Protected Sub GridViewGestiones_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvwGestiones.SelectedIndexChanged
        txtPop_Id_Gestiones.Text = gvwGestiones.SelectedRow.Cells(3).Text
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
        lblPop_Detalle_Dimension.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(22).Text)
        txtPop_Tipo_Usuario.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(23).Text)
        lblPop_Detalle_Gestion.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(24).Text)
        lblPop_Respuesta_Gestion.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(25).Text)
        txtPop_Categoria_Gestion.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(26).Text)
        mpeDetalles.Show()
    End Sub
#End Region


#Region "btnBuscar_TipoGestion Buscador para filtrar Gestiones"
    'EFECTO: Botón con la función de filtrar datos en la tabla gridview por medio de vchTipoGestion seleccionado en el dropdownlist'
    'RECIBE: El valor de vchTipoGestion seleccionado del dropdownlist
    'DEVUELVE: Gridview filtrado
    Protected Sub btnBuscar_TipoGestion_Click(sender As Object, e As EventArgs) Handles btnBuscar_TipoGestion.Click
        Dim strQuery As String = "palFiltrarTipoGestiones"
        Dim con As New SqlConnection(strQuery)
        Dim cmd As New SqlCommand()
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = strQuery
        cmd.Parameters.AddWithValue("@vchTipoGestiones", SqlDbType.VarChar).Value = ddlFiltro_Buscador.Text.Trim()
        cmd.Connection = con
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        gvwGestiones.DataSource = ds
        gvwGestiones.DataBind()
    End Sub
#End Region

End Class