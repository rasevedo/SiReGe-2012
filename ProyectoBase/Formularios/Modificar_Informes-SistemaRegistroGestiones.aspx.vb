Imports CapAccesoDatosSiReGe
Imports CapEntidadesSiReGe
Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration
Imports System.IO


Public Class Modificar_Informe
    Inherits System.Web.UI.Page

    Dim strConnString As String = ConfigurationManager _
             .ConnectionStrings("bda_SIREGE_Connection").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.TomarInforme()
        End If
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As EventArgs)
        Me.ModificarInforme()
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("Tabla_Informe-SistemaRegistroInformes.aspx")
    End Sub

    Private ReadOnly Property id As Integer
        Get
            Return If(Not String.IsNullOrEmpty(Request.QueryString("intIdInforme")), Integer.Parse(Request.QueryString("intIdInforme")), 0)
        End Get
    End Property

#Region "Modificar el Informe"
    'EFECTO: Esta función se encarga revisar que todos los textboxes y dropdownlists esten llenos para realizar la modificación de datos. 
    'RECIBE: La llamada de Datos_Informe y Entidad_Informe para la modificación a la base de datos
    'DEVUELVE: Modifica los datos a la base de datos en la tabla tblInformes
    Private Sub ModificarInforme()
        Try
            Dim dts As New Entidad_Informe
            Dim func As New Datos_Informe
            dts._idInforme = txtId_Informe.Text
            dts._tituloInforme = txtTitulo_Informe.Text
            dts._idEmpleados = intIdEmpleados.Text
            dts._tituloInforme = txtTitulo_Informe.Text
            dts._numeroOficio = txtNumero_Oficio.Text
            dts._tipoInforme = ddlTipo_Informe.Text
            dts._fechaAprobacion = txtFecha_Aprobacion.Text
            dts._fechaCulminacion = txtFecha_Culminacion.Text
            dts._fechaTraslado = txtFecha_Traslado.Text
            dts._avanceInforme = ddlAvance_Informe.Text
            If func.modificarInforme(dts) Then
                ModalPopupExtender_Exito.Show()
                'Response.Write("<script language=javascript>alert('El elemento se ha agregado')</script>")
                ' MsgBox("Exito")
                Response.Redirect(Request.Url.AbsoluteUri, False)
                Response.Redirect("~/Tabla_Informe-SistemaRegistroInformes.aspx")
            Else
                ModalPopupExtender_Incompleto.Show()
                'Response.Write("<script language=javascript>alert('Faltan espacio para rellenar')</script>")
                ' MsgBox("Fracaso")
            End If
        Catch ex As Exception
            ModalPopupExtender_Error.Show()
            'Response.Write("<script language=javascript>alert('Hubo un problema en agregar el elemento. Porfavor rellenar de nuevo los espacios de fechas y dimensiones')</script>")
            'MsgBox(ex.Message)
        End Try
    End Sub
#End Region


#Region "Insertar del Checklist"
    'EFECTO: Esta función inserta en la tabla los multiples valores marcados con check
    'RECIBE: No requiere de parámetros
    'DEVUELVE: Inserta en la tabla tblInformes todos los valores con check
    Public Sub Insert_checklist()
        Dim strQuery As String = "palInsertarChecklistInformes"
        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = strQuery
        Dim str As String = ""
        For i As Integer = 0 To ddlAvance_Informe.Items.Count - 1
            If ddlAvance_Informe.Items(i).Selected Then
                If str = "" Then
                    str = ddlAvance_Informe.Items(i).Text
                Else
                    str += "," & ddlAvance_Informe.Items(i).Text
                End If
            End If
        Next
        cmd.Parameters.AddWithValue("@vchAvanceInforme", SqlDbType.VarChar).Value = str.Trim()
        cmd.Connection = con
    End Sub
#End Region


#Region "Agarrar el Informe"
    'EFECTO: Esta función lee los datos de la fila del gridview y los toma para insertarlos en sus respectivos espacios en el formulario de modificación 
    'RECIBE: Solo requiere de la llamada del procedimiento almacenado
    'DEVUELVE: Muestra el formulario de modificación con todos sus espacios escritos con la información actual presente en la fila del gridview
    Private Sub TomarInforme()
        Dim strQuery As String = "palAgarrarInformes"
        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()
        cmd.Parameters.AddWithValue("@intIdInforme", id)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = strQuery
        cmd.Connection = con
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim dt As DataTable = New DataTable()
        da.Fill(dt)
        For Each dr As DataRow In dt.Rows
            Me.txtId_Informe.Text = dr("intIdInforme").ToString()
            Me.txtTitulo_Informe.Text = dr("vchTituloInforme").ToString()
            '' Me.intIdEmpleados.Text = dr("intIdEmpleados").ToString()
            Me.txtTitulo_Informe.Text = dr("vchTipoInforme").ToString()
            Me.txtNumero_Oficio.Text = dr("vchNumeroOficio").ToString()
            Me.txtTitulo_Informe.Text = dr("vchTipoInforme").ToString()
            Me.txtFecha_Aprobacion.Text = dr("dtiFechaAprobacion").ToString()
            Me.txtFecha_Culminacion.Text = dr("dtiFechaCulminacion").ToString()
            Me.txtFecha_Traslado.Text = dr("dtiFechaTraslado").ToString()
            Me.ddlAvance_Informe.Text = dr("vchAvanceInforme").ToString()
        Next
    End Sub
#End Region



End Class