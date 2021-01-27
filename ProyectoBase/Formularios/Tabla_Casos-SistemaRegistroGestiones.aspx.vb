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

Public Class Tabla_Casos
    Inherits System.Web.UI.Page

    Dim dt As New DataTable

    Dim strQuery As String = ConfigurationManager _
                 .ConnectionStrings("bda_SIREGE_Connection").ConnectionString
    Dim con As SqlConnection = Nothing
    Dim cmd As SqlCommand = Nothing

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            MostrarTabla()
        End If
    End Sub

#Region "Mostrar Tabla"
    'EFECTO: Esta función es la que ayuda para llenar los datos del gridview tomados de la tabla de tblCasos de la base de datos.
    'RECIBE: No depende de un parametro. Y se guarda la función en func para luego ir llenando fila por fila el gridview. 
    'DEVUELVE:Gridview con los datos de tblCasos.
    Sub MostrarTabla()
        Try
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

    'Boton dirige a la inserción de formularios
    Protected Sub btnAgregar_Click(sender As Object, e As EventArgs) Handles btnAgregar.Click
        Response.Redirect("Formulario_Insertar_Casos-SistemaRegistroGestiones.aspx")
    End Sub

    'Toda la informacion detro de este buton funcionan para la exportacion de datos
    Protected Sub btnExportar_Click(sender As Object, e As EventArgs) Handles btnExportar.Click       
        ExportarCasosExcel("Casos_Tabla")
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
        Response.AddHeader("Content-Disposition", "attachment;filename=Casos.doc")
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

#Region "Exportar a Excel"
    'EFECTO: Función que se útiliza para exportar la información presente a word. Durante este build se utilizará este metodo se espera en el siguiente prototipo resolverlo por medio de ReportViewer 11
    'RECIBE: Recibe como parametros todas las filas seleccionadas con un check en el gridview
    'DEVUELVE: Un archivo .xls el cual contiene todas las filas del gridview seleccionadas
    Private Sub ExportarCasosExcel(ByVal fileName As String)
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("bda_SIREGE_Connection").ToString())
        Try
            Dim adp As New SqlDataAdapter("palMostrarCasos", con)
            Dim ds As New dstCasos()
            adp.Fill(ds, "palMostrarCasos")
            Dim datasource As New ReportDataSource("DataSet_Casos", ds.Tables(0))

            Dim warnings As Warning()
            Dim streams As String()
            Dim MIMETYPE As String = String.Empty
            Dim encoding As String = String.Empty
            Dim extension As String = String.Empty

            Dim rptviewer As New ReportViewer()
            rptviewer.ProcessingMode = ProcessingMode.Local
            rptviewer.LocalReport.ReportPath = "C:\Users\Usuario01\Documents\Visual Studio 2012\Projects\SistemaRegistroGestiones\ProyectoBase\Formularios\Report_Caso.rdlc"
            rptviewer.LocalReport.DataSources.Add(datasource)
            Dim bytes As Byte() = rptviewer.LocalReport.Render("Excel", Nothing, MIMETYPE, encoding, extension, streams, warnings)
            Response.Buffer = True
            Response.Clear()
            Response.ContentType = MIMETYPE
            Response.AddHeader("content-disposition", "attachment; filename=" & fileName & "." & extension)
            Response.BinaryWrite(bytes)
            Response.Flush()
        Catch ex As Exception
        End Try
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
                            Response.Write("<script language=javascript>alert('El elemento ha sido eliminado de forma exitosa')</script>")
                            gvwCasos.DataBind()
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
                ' MsgBox("Hubo un problema en eliminar el elmento" + ex.Message)
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
    Protected Sub GridViewCasos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvwCasos.SelectedIndexChanged
        txtPop_Id_Caso.Text = gvwCasos.SelectedRow.Cells(3).Text
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
        mpeDetalles.Show()
    End Sub
#End Region


    Protected Sub btnBuscador_Click(sender As Object, e As EventArgs) Handles btnBuscador.Click
        Response.Redirect("Buscador_Casos-SistemaRegistroGestiones.aspx")
    End Sub


End Class