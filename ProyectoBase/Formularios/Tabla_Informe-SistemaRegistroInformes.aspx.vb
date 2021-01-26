﻿Imports CapAccesoDatosSiReGe
Imports CapEntidadesSiReGe
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Text
Imports System.IO
Imports System.Reflection



Public Class Tabla_Informes
    Inherits System.Web.UI.Page

    Dim dt As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            MostrarTabla()
        End If
    End Sub

#Region "Mostrar Tabla"
    'EFECTO: Esta función es la que ayuda para llenar los datos del gridview tomados de la tabla de tblInformes de la base de datos.
    'RECIBE: No depende de un parametro. Y se guarda la función en func para luego ir llenando fila por fila el gridview. 
    'DEVUELVE:Gridview con los datos de tblInformes.
    Sub MostrarTabla()
        Try
            Dim func As New Datos_Informe
            dt = func.mostrarInforme
            If dt.Rows.Count <> 0 Then
                gvwInforme.DataSource = dt
                gvwInforme.DataBind()
            Else
                gvwInforme.DataSource = Nothing
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
#End Region

    'Boton dirige a la inserción de formularios
    Protected Sub btnAgregar_Click(sender As Object, e As EventArgs) Handles btnAgregar.Click
        Response.Redirect("Formulario_Insertar_Informes-SistemaRegistroGestiones.aspx")
    End Sub

    'Toda la informacion detro de este buton funcionan para la exportacion de datos
    Protected Sub btnExportar_Click(sender As Object, e As EventArgs) Handles btnExportar.Click
        PrepararGridView_Export(gvwInforme)
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
        Response.AddHeader("Content-Disposition", "attachment;filename=Informe.doc")
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
    Private Sub ExportarGridView()
        Dim attachment As String = "attachment; filename=Informes.xls"
        Response.ClearContent()
        Response.AddHeader("content-disposition", attachment)
        Response.ContentType = "application/ms-excel"
        Dim sw As StringWriter = New StringWriter()
        Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
        Dim frm As HtmlForm = New HtmlForm()
        gvwInforme.Parent.Controls.Add(frm)
        frm.Attributes("runat") = "server"
        frm.Controls.Add(gvwInforme)
        frm.RenderControl(htw)
        Response.Write(sw.ToString())
        Response.[End]()
    End Sub

    'La unica funcion de este es evitar un error que se crea al querer exportar'
    'NO DEVUELVE'
    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)
    End Sub

    'Si la opción dentro de la tabla es distinto a un checkbox, dropdownlist o linkbutton este sera preparado para tambien ser exportado'
    'NO DEVUELVE'
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
        If Session("Perfil") = "AD" Then
            Try
                Dim func As New Datos_Informe
                Dim dts As New Entidad_Informe
                For Each gvrow As GridViewRow In gvwInforme.Rows
                    Dim chkborrar As CheckBox = DirectCast(gvrow.FindControl("chkSeleccionar"), CheckBox)
                    If chkborrar.Checked Then
                        Dim gesid As Integer = Convert.ToInt32(gvwInforme.DataKeys(gvrow.RowIndex).Value)
                        dts._idInforme = gesid
                        If func.borrarInforme(dts) Then
                            Response.Write("<script language=javascript>alert('El elemento ha sido eliminado de forma exitosa')</script>")
                            gvwInforme.DataBind()
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
                MsgBox("Hubo un problema en eliminar el elmento" + ex.Message)
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
    Protected Sub gvwInforme_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvwInforme.SelectedIndexChanged
        txtPop_Id_Informe.Text = gvwInforme.SelectedRow.Cells(3).Text
        txtPop_Titulo_Informe.Text = gvwInforme.SelectedRow.Cells(4).Text
        txtPop_Empleado_Informe.Text = gvwInforme.SelectedRow.Cells(5).Text
        txtPop_Tipo_Informe.Text = gvwInforme.SelectedRow.Cells(6).Text
        txtPop_Num_Oficio_Informe.Text = gvwInforme.SelectedRow.Cells(7).Text
        txtPop_Fecha_Aprobacion.Text = gvwInforme.SelectedRow.Cells(8).Text
        txtPop_Fecha_Culminacion.Text = gvwInforme.SelectedRow.Cells(9).Text
        txtPop_Fecha_Traslado.Text = gvwInforme.SelectedRow.Cells(10).Text
        txtPop_Avance_Informe.Text = Page.Server.HtmlDecode(gvwInforme.SelectedRow.Cells(11).Text)
        txtPop_Remitido.Text = gvwInforme.SelectedRow.Cells(12).Text
        txtPop_Hallazgo_Informe.Text = Page.Server.HtmlDecode(gvwInforme.SelectedRow.Cells(13).Text)
        txtPop_Recomendaciones.Text = Page.Server.HtmlDecode(gvwInforme.SelectedRow.Cells(14).Text)
        txtPop_Observaciones_Generales.Text = Page.Server.HtmlDecode(gvwInforme.SelectedRow.Cells(15).Text)
        mpeDetalles.Show()
    End Sub
#End Region

    Protected Sub btnBuscador_Click(sender As Object, e As EventArgs) Handles btnBuscador.Click
        Response.Redirect("Buscador_Informes-SistemaRegistroGestiones.aspx")



    End Sub

End Class