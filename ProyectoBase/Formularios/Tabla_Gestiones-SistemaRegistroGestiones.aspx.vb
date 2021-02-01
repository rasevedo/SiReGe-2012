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

Public Class Tabla_Gestiones
    Inherits System.Web.UI.Page

    Dim dt As New DataTable
    Dim strConnString As String = ConfigurationManager _
             .ConnectionStrings("bda_SIREGE_Connection").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Me.MostrarTabla()
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

        Dim isSelected As Boolean = False
        For Each gvrow As GridViewRow In gvwGestiones.Rows
            Dim chkRevisar As CheckBox = DirectCast(gvrow.FindControl("chkSelect"), CheckBox)

            If chkRevisar IsNot Nothing AndAlso chkRevisar.Checked Then
                isSelected = True
                Exit For
            End If
        Next

        If isSelected Then
            Dim gvExport As GridView = gvwGestiones
            gvExport.Columns(0).Visible = False

            For Each i As GridViewRow In gvwGestiones.Rows
                gvExport.Rows(i.RowIndex).Visible = False
                Dim cb As CheckBox = CType(i.FindControl("chkSelect"), CheckBox)

                If cb IsNot Nothing AndAlso cb.Checked Then
                    gvExport.Rows(i.RowIndex).Visible = True
                End If
                ExportarGestionesExcel("Gestiones_Tabla")
            Next

            
        End If


        


    End Sub

    Protected Sub btnExportar_Word_Click(sender As Object, e As EventArgs) Handles btnExportar_Word.Click

        ExportarWord("Bitacora")

        ' Response.Redirect("WebForm1.aspx")
        

    End Sub

#Region "Exportar Panel a Word"
    'EFECTO: Función que se útiliza para exportar la información presente a word. Durante este build se utilizará este metodo se espera en el siguiente prototipo resolverlo por medio de ReportViewer 11
    'RECIBE: El único parámetro que recibe es el panel pnlPopup para obtener la información que debe exportar
    'DEVUELVE: Devuelve un archivo .doc de Microsoft Word con la información del modal para su trabajo.
    Protected Sub ExportarWord(ByVal fileName As String)
Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("bda_SIREGE_Connection").ToString())
        Try
            Dim adp As New SqlDataAdapter("palMostrarGestiones", con)
            Dim ds As New dstGestiones()
            adp.Fill(ds, "palMostrarGestiones")
            Dim datasource As New ReportDataSource("DataSet_Gestiones", ds.Tables(0))

            Dim warnings As Warning()
            Dim streams As String()
            Dim MIMETYPE As String = String.Empty
            Dim encoding As String = String.Empty
            Dim extension As String = String.Empty

            Dim rptviewer As New ReportViewer()
            rptviewer.ProcessingMode = ProcessingMode.Local
            rptviewer.LocalReport.ReportPath = "C:\Users\Usuario01\Documents\Visual Studio 2012\Projects\SistemaRegistroGestiones\ProyectoBase\Formularios\Bitacora_Gestion.rdlc"
            rptviewer.LocalReport.DataSources.Add(datasource)
            Dim bytes As Byte() = rptviewer.LocalReport.Render("Word", Nothing, MIMETYPE, encoding, extension, streams, warnings)
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
    Private Sub ExportarGestionesExcel(ByVal fileName As String)
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("bda_SIREGE_Connection").ToString())
        Try
            Dim adp As New SqlDataAdapter("palMostrarGestiones", con)
            Dim ds As New dstGestiones()
            adp.Fill(ds, "palMostrarGestiones")
            Dim datasource As New ReportDataSource("DataSet_Gestiones", ds.Tables(0))

            Dim warnings As Warning()
            Dim streams As String()
            Dim MIMETYPE As String = String.Empty
            Dim encoding As String = String.Empty
            Dim extension As String = String.Empty

            Dim rptviewer As New ReportViewer()
            rptviewer.ProcessingMode = ProcessingMode.Local
            rptviewer.LocalReport.ReportPath = "C:\Users\Usuario01\Documents\Visual Studio 2012\Projects\SistemaRegistroGestiones\ProyectoBase\Formularios\Reporte_Gestiones.rdlc"
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
                Dim func As New Datos_Gestiones
                Dim dts As New Entidad_Gestiones
                For Each gvrow As GridViewRow In gvwGestiones.Rows
                    Dim chkdelete As CheckBox = DirectCast(gvrow.FindControl("chkSelect"), CheckBox)
                    If chkdelete.Checked Then
                        Dim gesid As Integer = Convert.ToInt32(gvwGestiones.DataKeys(gvrow.RowIndex).Value)
                        Try
                            dts._idGestiones = gesid
                            If func.borrarGestiones(dts) Then
                                'Response.Write("<script language=javascript>alert('El elemento ha sido eliminado de forma exitosa')</script>")
                                MsgBox("El elemento ha sido eliminado de forma exitosa")
                                ' Me.MostrarTabla()
                                'gvwGestiones.DataBind()
                            Else
                                ' Response.Write("<script language=javascript>alert('No se ha eliminado el elemento.')</script>")
                                ' MsgBox("No se ha eliminado el elemento.")
                                '  gvwGestiones.DataBind()
                            End If

                            MostrarTabla()
                        Catch ex As Exception
                            MsgBox("Hubo un problema en eliminar el elmento: " + ex.Message)
                        End Try
                        MostrarTabla()
                        'gvwGestiones.DataBind()
                    End If
                Next

                MostrarTabla()
                ' gvwGestiones.DataBind()
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
        Else
            Response.Write("<script language=javascript>alert('El usuario no posee permiso para seleccionar el botón de borrar')</script>")
        End If
    End Sub
#End Region


    Protected Sub btnVolver_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        Response.Redirect("Menu_Principal-SistemaRegistroGestiones.aspx")
    End Sub


#Region "Seleccionar Filas Popup Detalle"
    'EFECTO: Función que selecciona las filas para poder mapear el reporte para su creación.
    'RECIBE: Cada fila dentro de GridViewCasos
    'DEVUELVE: NO DEVUELVE
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

#Region "btnBuscar_TipoGestion Buscador para filtrar Gestiones"
    Protected Sub btnBuscar_TipoGestion_Click(sender As Object, e As EventArgs) Handles btnBuscar_TipoGestion.Click
        Response.Redirect("Buscador_Gestiones-SistemaRegistroGestiones.aspx")

    End Sub
#End Region

End Class