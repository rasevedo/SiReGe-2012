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

Public Class Buscador_Gestiones_SistemaRegistroGestiones
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            MostrarTabla()
        End If
    End Sub

    Protected Sub btnBuscar_Gestion_Click(sender As Object, e As EventArgs) Handles btnBuscar_Gestion.Click
        MostrarTablaFiltro()
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
        Dim Query As String = "palBuscadorGestiones"
        Dim conx As New SqlConnection()
        conx.ConnectionString = strConnString
        Dim cmd As New SqlCommand
        cmd = New SqlCommand("palBuscadorGestiones")
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = Query

        If txtNombre_Funcionario.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchNombreFuncionario", SqlDbType.VarChar).Value = txtNombre_Funcionario.Text.Trim()
        End If

        If ddlTipo_Gestiones.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchTipoGestiones", SqlDbType.VarChar).Value = ddlTipo_Gestiones.Text.Trim()
        End If

        If ddlFuente_Generadora.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchFuenteGeneradora", SqlDbType.VarChar).Value = ddlFuente_Generadora.Text.Trim()
        End If

        If ddlConfidencialidad.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchConfidencialidadGestiones", SqlDbType.VarChar).Value = ddlConfidencialidad.Text.Trim()
        End If

        If ddlDireccion_Regional_Educacion.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchDireccionRegional", SqlDbType.VarChar).Value = ddlDireccion_Regional_Educacion.Text.Trim()
        End If

        If txtNombre_Usuario.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@vchNombreUsuario", SqlDbType.VarChar).Value = txtNombre_Usuario.Text.Trim()
        End If

        If ddlDescripcion_Unidad.Text.Trim() <> "" Then
            cmd.Parameters.AddWithValue("@intIdUnidad", ddlDescripcion_Unidad.Text.Trim())
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
        txtPop_Detalle_Dimension.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(22).Text)
        txtPop_Tipo_Usuario.Text = gvwGestiones.SelectedRow.Cells(23).Text
        txtPop_Detalle_Gestion.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(24).Text)
        txtPop_Respuesta_Gestion.Text = Page.Server.HtmlDecode(gvwGestiones.SelectedRow.Cells(25).Text)
        mpeDetalles.Show()
    End Sub
#End Region

    
    Protected Sub btnVolver_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        Response.Redirect("Tabla_Gestiones-SistemaRegistroGestiones.aspx")
    End Sub
End Class