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

Public Class Buscador_Informes_SistemaRegistroGestiones
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

    

#Region "Mostrar Tabla"
    'EFECTO: Esta función es la que ayuda para llenar los datos del gridview tomados de la tabla de tblGestiones de la base de datos.
    'RECIBE: No depende de un parametro. Y se guarda la función en func para luego ir llenando fila por fila el gridview. 
    'DEVUELVE:Gridview con los datos de tblGestiones.
    Sub MostrarTabla()
        Try
            Dim dt As New DataTable
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


    'Button que ejecuta la función de filtrar las tablas del gridview
    Protected Sub btnBuscar_Informe_Click(sender As Object, e As EventArgs) Handles btnBuscar_Informe.Click
        MostrarTablaFiltro()
    End Sub


    'Toda la informacion detro de este buton funcionan para la exportacion de datos a Word
    Protected Sub btnBitacora_Click(sender As Object, e As EventArgs) Handles btnBitacora.Click
        ExportarBitacora("Bitacora_Informes")
    End Sub


    'Toda la informacion detro de este buton funcionan para la exportacion de datos a Excel
    Protected Sub btnExportar_Click(sender As Object, e As EventArgs) Handles btnExportar.Click
        ExportarInformesExcel("Informes_Tabla")
    End Sub


    'Boton dirige devuelta al Menú
    Protected Sub btnVolver_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        Response.Redirect("Tabla_Informe-SistemaRegistroInformes.aspx")
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
    'EFECTO: Función que se útiliza para exportar la información presente a word. Durante este build se utilizará este metodo se espera en el siguiente prototipo resolverlo por medio de ReportViewer 11
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


#Region "Filtrar Tabla"
    'EFECTO: Esta función causa la ejecución de filtros al gridview para que se actualize con los datos seleccionados
    'RECIBE: Cualquiera de los parametros mostrados en la interfaz para que filtre el gridview
    'DEVUELVE:Gridview actualizado con los datos filtrados
    Private Sub MostrarTablaFiltro()
        lblmsg.Visible = False
        Dim strConnString As String = ConfigurationManager _
             .ConnectionStrings("bda_SIREGE_Connection").ConnectionString
        Dim Query As String = "palBuscadorInformes"
        Dim conx As New SqlConnection()
        conx.ConnectionString = strConnString
        Dim cmd As New SqlCommand()
        cmd = New SqlCommand("palBuscadorInformes")
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = Query

        If txtNombre_Funcionario.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchNombreFuncionario", txtNombre_Funcionario.Text.Trim())
        End If

        If txtTitulo_Informe.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchTituloInforme", txtTitulo_Informe.Text.Trim())
        End If

        If ddlTipo_Informe.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchTipoInforme", ddlTipo_Informe.Text.Trim())
        End If

        cmd.Connection = conx
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        gvwInforme.DataSource = ds
        gvwInforme.DataBind()

        If gvwInforme.Rows.Count = 0 Then
            lblmsg.Text = "No se encontraron resultados"
            lblmsg.Visible = True
        End If
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
                Response.Redirect("Buscador_Informes-SistemaRegistroInformes.aspx")
            Catch ex As Exception
                ModalPopupExtender_Error.Show()
                'Response.Write("<script language=javascript>alert('Hubo un problema en eliminar el elemento')</script>")
                ' MsgBox("Hubo un problema en eliminar el elmento: " + ex.Message)
            End Try
        Else
            ModalPopupExtender_Borrar_No_Permiso.Show()
            'Response.Write("<script language=javascript>alert('El usuario no posee permiso para seleccionar el botón de borrar')</script>")
        End If
    End Sub
#End Region

End Class