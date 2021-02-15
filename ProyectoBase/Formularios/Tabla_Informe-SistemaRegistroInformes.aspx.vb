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
Imports System.Reflection



Public Class Tabla_Informes
    Inherits System.Web.UI.Page

    Dim dt As New DataTable
    Dim strConnString As String = ConfigurationManager _
             .ConnectionStrings("bda_SIREGE_Connection").ConnectionString

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


    Protected Sub btnEditar_Click(sender As Object, e As EventArgs)
        Dim Id As Integer = (TryCast(sender, Button)).CommandArgument
        Response.Redirect("Modificar_Informes-SistemaRegistroGestiones.aspx?intIdInforme=" & Id)
    End Sub


    'Boton dirige a la inserción de formularios
    Protected Sub btnAgregar_Click(sender As Object, e As EventArgs) Handles btnAgregar.Click
        Response.Redirect("Formulario_Insertar_Informes-SistemaRegistroGestiones.aspx")
    End Sub


    'Toda la informacion detro de este buton funcionan para la exportacion de datos a Excel
    Protected Sub btnExportar_Click(sender As Object, e As EventArgs) Handles btnExportar.Click
        ExportarInformesExcel("Informes_Tabla")
    End Sub


    'Toda la informacion detro de este buton funcionan para la exportacion de datos a Word
    Protected Sub btnBitacora_Click(sender As Object, e As EventArgs) Handles btnBitacora.Click
        ExportarBitacora("Bitacora_Informes")
    End Sub


    'Boton dirige al espacio de búsqueda por informe
    Protected Sub btnBuscador_Click(sender As Object, e As EventArgs) Handles btnBuscador.Click
        Response.Redirect("Buscador_Informes-SistemaRegistroGestiones.aspx")
    End Sub

    
    'Boton dirige devuelta al Menú
    Protected Sub btnVolver_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        Response.Redirect("Menu_Principal-SistemaRegistroGestiones.aspx")
    End Sub



#Region "Exportar a Word"
    'EFECTO: Función que se útiliza para exportar la información presente a un report para exportar a archivo de tipo Word
    'RECIBE: Recibe como parametros una de las filas seleccionada con un check en el gridview.
    'DEVUELVE: Devuelve un archivo .docx de Microsoft Word con la información del modal para su trabajo.
    Private Sub ExportarBitacora(ByVal fileName As String)
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("bda_SIREGE_Connection").ToString())
        Dim ds As New dstInformes()

        For Each gvrow As GridViewRow In gvwInforme.Rows
            If TryCast(gvrow.FindControl("chkSeleccionar"), CheckBox).Checked Then
                Dim intIdInforme As Integer = gvrow.Cells(3).Text
                Dim vchTituloInforme As String = Page.Server.HtmlDecode(gvrow.Cells(4).Text)
                Dim vchNombreFuncionario As String = Page.Server.HtmlDecode(gvrow.Cells(5).Text)
                Dim vchTipoInforme As String = Page.Server.HtmlDecode(gvrow.Cells(6).Text)
                Dim vchNumeroOficio As String = Page.Server.HtmlDecode(gvrow.Cells(7).Text)


                ' Dim dtiFechaAprobacion As DateTime = Page.Server.HtmlDecode(gvrow.Cells(8).Text)
                Dim dtiFechaAprobacion As DateTime
                If gvrow.Cells(8).Text = "&nbsp;" Then
                    dtiFechaAprobacion = Nothing
                Else
                    dtiFechaAprobacion = Page.Server.HtmlDecode(gvrow.Cells(8).Text)
                End If

                ' Dim dtiFechaCulminacion As DateTime = Page.Server.HtmlDecode(gvrow.Cells(9).Text)
                Dim dtiFechaCulminacion As DateTime
                If gvrow.Cells(9).Text = "&nbsp;" Then
                    dtiFechaCulminacion = Nothing
                Else
                    dtiFechaCulminacion = Page.Server.HtmlDecode(gvrow.Cells(9).Text)
                End If

                ' Dim dtiFechaTraslado As DateTime = Page.Server.HtmlDecode(gvrow.Cells(10).Text)
                Dim dtiFechaTraslado As DateTime
                If gvrow.Cells(10).Text = "&nbsp;" Then
                    dtiFechaTraslado = Nothing
                Else
                    dtiFechaTraslado = Page.Server.HtmlDecode(gvrow.Cells(10).Text)
                End If

                Dim vchAvanceInforme As String = Page.Server.HtmlDecode(gvrow.Cells(11).Text)
                Dim vchRemitido As String = Page.Server.HtmlDecode(gvrow.Cells(12).Text)
                Dim vchHallazgo As String = Page.Server.HtmlDecode(gvrow.Cells(13).Text)
                Dim vchRecomendaciones As String = Page.Server.HtmlDecode(gvrow.Cells(14).Text)
                Dim vchObservaciones As String = Page.Server.HtmlDecode(gvrow.Cells(15).Text)

                ds.Tables(0).Rows.Add(gvrow.Cells(3).Text, Page.Server.HtmlDecode(gvrow.Cells(4).Text), Page.Server.HtmlDecode(gvrow.Cells(5).Text), Page.Server.HtmlDecode(gvrow.Cells(6).Text), Page.Server.HtmlDecode(gvrow.Cells(7).Text), Page.Server.HtmlDecode(dtiFechaAprobacion).Replace("0:00:00", ""), Page.Server.HtmlDecode(dtiFechaCulminacion).Replace("0:00:00", ""), Page.Server.HtmlDecode(dtiFechaTraslado).Replace("0:00:00", ""), Page.Server.HtmlDecode(gvrow.Cells(11).Text), Page.Server.HtmlDecode(gvrow.Cells(12).Text), Page.Server.HtmlDecode(gvrow.Cells(13).Text), Page.Server.HtmlDecode(gvrow.Cells(14).Text), Page.Server.HtmlDecode(gvrow.Cells(15).Text))

            End If
        Next

        Dim warnings As Warning()
        Dim streams As String()
        Dim MIMETYPE As String = String.Empty
        Dim encoding As String = String.Empty
        Dim extension As String = String.Empty


        Dim rptviewer As New ReportViewer()
        rptviewer.ProcessingMode = ProcessingMode.Local
        rptviewer.LocalReport.ReportPath = "C:\Users\Usuario01\Documents\Visual Studio 2012\Projects\SistemaRegistroGestiones\ProyectoBase\Formularios\Bitacora_Informe.rdlc"

        Dim datasource As New ReportDataSource("DataSet_Bitacora_Informe", ds.Tables(0))

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
    'EFECTO: Función que ejecuta un escaneo del gridview y lo exporta por medio de un reporte al tipo de archivo Excel
    'RECIBE: Recibe como parametros todas las filas seleccionadas con un check en el gridview
    'DEVUELVE: Un archivo .xls el cual contiene todas las filas del gridview seleccionadas
    Private Sub ExportarInformesExcel(ByVal fileName As String)
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("bda_SIREGE_Connection").ToString())
        Dim ds As New dstInformes()
        For Each gvrow As GridViewRow In gvwInforme.Rows
            If TryCast(gvrow.FindControl("chkSeleccionar"), CheckBox).Checked Then
                Dim intIdInforme As Integer = gvrow.Cells(3).Text
                Dim vchTituloInforme As String = Page.Server.HtmlDecode(gvrow.Cells(4).Text)
                Dim vchNombreFuncionario As String = Page.Server.HtmlDecode(gvrow.Cells(5).Text)
                Dim vchTipoInforme As String = Page.Server.HtmlDecode(gvrow.Cells(6).Text)
                Dim vchNumeroOficio As String = Page.Server.HtmlDecode(gvrow.Cells(7).Text)
                

                ' Dim dtiFechaAprobacion As DateTime = Page.Server.HtmlDecode(gvrow.Cells(8).Text)
                Dim dtiFechaAprobacion As DateTime
                If gvrow.Cells(8).Text = "&nbsp;" Then
                    dtiFechaAprobacion = Nothing
                Else
                    dtiFechaAprobacion = Page.Server.HtmlDecode(gvrow.Cells(8).Text)
                End If

                ' Dim dtiFechaCulminacion As DateTime = Page.Server.HtmlDecode(gvrow.Cells(9).Text)
                Dim dtiFechaCulminacion As DateTime
                If gvrow.Cells(9).Text = "&nbsp;" Then
                    dtiFechaCulminacion = Nothing
                Else
                    dtiFechaCulminacion = Page.Server.HtmlDecode(gvrow.Cells(9).Text)
                End If

                ' Dim dtiFechaTraslado As DateTime = Page.Server.HtmlDecode(gvrow.Cells(10).Text)
                Dim dtiFechaTraslado As DateTime
                If gvrow.Cells(10).Text = "&nbsp;" Then
                    dtiFechaTraslado = Nothing
                Else
                    dtiFechaTraslado = Page.Server.HtmlDecode(gvrow.Cells(10).Text)
                End If

                Dim vchAvanceInforme As String = Page.Server.HtmlDecode(gvrow.Cells(11).Text)
                Dim vchRemitido As String = Page.Server.HtmlDecode(gvrow.Cells(12).Text)
                Dim vchHallazgo As String = Page.Server.HtmlDecode(gvrow.Cells(13).Text)
                Dim vchRecomendaciones As String = Page.Server.HtmlDecode(gvrow.Cells(14).Text)
                Dim vchObservaciones As String = Page.Server.HtmlDecode(gvrow.Cells(15).Text)

                ds.Tables(0).Rows.Add(gvrow.Cells(3).Text, Page.Server.HtmlDecode(gvrow.Cells(4).Text), Page.Server.HtmlDecode(gvrow.Cells(5).Text), Page.Server.HtmlDecode(gvrow.Cells(6).Text), Page.Server.HtmlDecode(gvrow.Cells(7).Text), Page.Server.HtmlDecode(dtiFechaAprobacion).Replace("0:00:00", ""), Page.Server.HtmlDecode(dtiFechaCulminacion).Replace("0:00:00", ""), Page.Server.HtmlDecode(dtiFechaTraslado).Replace("0:00:00", ""), Page.Server.HtmlDecode(gvrow.Cells(11).Text), Page.Server.HtmlDecode(gvrow.Cells(12).Text), Page.Server.HtmlDecode(gvrow.Cells(13).Text), Page.Server.HtmlDecode(gvrow.Cells(14).Text), Page.Server.HtmlDecode(gvrow.Cells(15).Text))

            End If
        Next

        Dim warnings As Warning()
        Dim streams As String()
        Dim MIMETYPE As String = String.Empty
        Dim encoding As String = String.Empty
        Dim extension As String = String.Empty


        Dim rptviewer As New ReportViewer()
        rptviewer.ProcessingMode = ProcessingMode.Local
        rptviewer.LocalReport.ReportPath = "C:\Users\Usuario01\Documents\Visual Studio 2012\Projects\SistemaRegistroGestiones\ProyectoBase\Formularios\Reporte_Informes.rdlc"

        Dim datasource As New ReportDataSource("DataSet_Informe", ds.Tables(0))

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
                Dim func As New Datos_Informe
                Dim dts As New Entidad_Informe
                For Each gvrow As GridViewRow In gvwInforme.Rows
                    Dim chkborrar As CheckBox = DirectCast(gvrow.FindControl("chkSeleccionar"), CheckBox)
                    If chkborrar.Checked Then
                        Dim gesid As Integer = Convert.ToInt32(gvwInforme.DataKeys(gvrow.RowIndex).Value)
                        dts._idInforme = gesid
                        If func.borrarInforme(dts) Then
                            ' Response.Write("<script language=javascript>alert('El elemento ha sido eliminado de forma exitosa')</script>")
                            'MsgBox("El elemento ha sido eliminado de forma exitosa")
                        Else
                            'Response.Write("<script language=javascript>alert('No se ha eliminado el elemento.')</script>")
                            'MsgBox("No se ha eliminado el elemento.")
                        End If
                    End If
                Next
                MostrarTabla()
                Response.Redirect("Tabla_Informe-SistemaRegistroInformes.aspx")
            Catch ex As Exception
                ModalPopupExtender_Error.Show()
                ' Response.Write("<script language=javascript>alert('Hubo un problema en eliminar el elemento')</script>")
                ' MsgBox("Hubo un problema en eliminar el elmento: " + ex.Message)
            End Try
        Else
            ModalPopupExtender_Borrar_No_Permiso.Show()
            'Response.Write("<script language=javascript>alert('El usuario no posee permiso para seleccionar el botón de borrar')</script>")
        End If
    End Sub
#End Region


#Region "Seleccionar Filas Popup Detalle"
    'EFECTO: Función que selecciona las filas para poder mapear el reporte para su creación.
    'RECIBE: Cada fila dentro de GridViewCasos.
    'DEVUELVE: Información de cada fila detallada en un panel.
    Protected Sub gvwInforme_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvwInforme.SelectedIndexChanged
        txtPop_Id_Informe.Text = gvwInforme.SelectedRow.Cells(3).Text
        txtPop_Titulo_Informe.Text = Page.Server.HtmlDecode(gvwInforme.SelectedRow.Cells(4).Text)
        txtPop_Empleado_Informe.Text = Page.Server.HtmlDecode(gvwInforme.SelectedRow.Cells(5).Text)
        txtPop_Tipo_Informe.Text = Page.Server.HtmlDecode(gvwInforme.SelectedRow.Cells(6).Text)
        txtPop_Num_Oficio_Informe.Text = Page.Server.HtmlDecode(gvwInforme.SelectedRow.Cells(7).Text)
        txtPop_Fecha_Aprobacion.Text = Page.Server.HtmlDecode(gvwInforme.SelectedRow.Cells(8).Text)
        txtPop_Fecha_Culminacion.Text = Page.Server.HtmlDecode(gvwInforme.SelectedRow.Cells(9).Text)
        txtPop_Fecha_Traslado.Text = Page.Server.HtmlDecode(gvwInforme.SelectedRow.Cells(10).Text)
        txtPop_Avance_Informe.Text = Page.Server.HtmlDecode(gvwInforme.SelectedRow.Cells(11).Text)
        txtPop_Remitido.Text = Page.Server.HtmlDecode(gvwInforme.SelectedRow.Cells(12).Text)
        txtPop_Hallazgo_Informe.Text = Page.Server.HtmlDecode(gvwInforme.SelectedRow.Cells(13).Text)
        txtPop_Recomendaciones.Text = Page.Server.HtmlDecode(gvwInforme.SelectedRow.Cells(14).Text)
        txtPop_Observaciones_Generales.Text = Page.Server.HtmlDecode(gvwInforme.SelectedRow.Cells(15).Text)
        mpeDetalles.Show()
    End Sub
#End Region


End Class