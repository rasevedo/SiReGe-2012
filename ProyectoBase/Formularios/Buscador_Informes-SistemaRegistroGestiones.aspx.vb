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

    Protected Sub btnBuscar_Informe_Click(sender As Object, e As EventArgs) Handles btnBuscar_Informe.Click
        MostrarTablaFiltro()
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


    Private Sub MostrarTablaFiltro()
        lblmsg.Visible = False
        ' Dim func As New Datos_Gestiones
        ' Dim ds As DataSet = New DataSet()
        ' Dim strConnString As String = ConfigurationManager.ConnectionStrings("bda_SIREGE_Connection").ConnectionString
        'Dim con As SqlConnection = New SqlConnection(strConnString)
        'Dim sda As SqlDataAdapter = New SqlDataAdapter()
        ' Dim cmd As SqlCommand = New SqlCommand("palBuscadorGestiones")
        ' cmd.CommandType = CommandType.StoredProcedure

        Dim strConnString As String = ConfigurationManager _
             .ConnectionStrings("bda_SIREGE_Connection").ConnectionString

        ' Dim Conx.ConnectionString = strQuery
        Dim Query As String = "palBuscadorInformes"
        Dim conx As New SqlConnection()
        conx.ConnectionString = strConnString
        Dim cmd As New SqlCommand()
        cmd = New SqlCommand("palBuscadorInformes")
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = Query

        If txtNombre_Funcionario.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchNombreFuncionario", SqlDbType.VarChar).Value = txtNombre_Funcionario.Text.Trim()
        End If

        If txtTitulo_Informe.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchTituloInforme", SqlDbType.VarChar).Value = txtTitulo_Informe.Text.Trim()
        End If

        If ddlTipo_Informe.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchTipoInforme", SqlDbType.VarChar).Value = ddlTipo_Informe.Text.Trim()
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

    Protected Sub btnVolver_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        Response.Redirect("Tabla_Informe-SistemaRegistroInformes.aspx")
    End Sub



End Class