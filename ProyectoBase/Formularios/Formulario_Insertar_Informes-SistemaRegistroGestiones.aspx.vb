Imports CapAccesoDatosSiReGe
Imports CapEntidadesSiReGe
Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration

Public Class Formulario_Insertar_Informes
    Inherits System.Web.UI.Page

    Dim strConnString As String = ConfigurationManager _
             .ConnectionStrings("bda_SIREGE_Connection").ConnectionString


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtNombre_Funcionario.Text = Session("NombreUsuario")
            For i As Integer = 0 To ddlAvance_Informe.Items.Count - 1
                ddlAvance_Informe.Items(i).Attributes.Add("onclick", "OnlyOneCheckList(this)")
            Next
        End If
    End Sub

#Region "btnAgregar datos a la tabla tblInformes"
    'EFECTO: La función de este botón se encarga revisar que todos los textboxes y dropdownlists esten llenos para insertar en la base de datos. 
    'RECIBE: La llamada de Datos_Informe y Entidad_Informe para la inserción a la base de datos
    'DEVUELVE: Inserta los datos a la base de datos en la tabla tblInformes
    Protected Sub btnAgregar_Click(sender As Object, e As EventArgs) Handles btnAgregar.Click
        Dim dts As New Entidad_Informe
        Dim func As New Datos_Informe




        If txtTitulo_Informe.Text <> "" And txtNombre_Funcionario.Text <> "" And ddlTipo_Informe.Text <> "" Then
            Try

                Dim dt As DateTime? = Nothing

                dts._tituloInforme = txtTitulo_Informe.Text
                dts._nombreFuncionario = txtNombre_Funcionario.Text
                dts._numeroOficio = txtNumero_Oficio.Text
                dts._tipoInforme = ddlTipo_Informe.Text

                If txtFecha_Aprobacion.Text = "" Then
                    dts._fechaAprobacion = ("01/01/2000 00:00:00")
                Else
                    dts._fechaAprobacion = txtFecha_Aprobacion.Text
                End If
                'dts._fechaAprobacion = txtFecha_Aprobacion.Text

                If txtFecha_Culminacion.Text = "" Then
                    dts._fechaCulminacion = ("01/01/2000 00:00:00")
                Else
                    dts._fechaCulminacion = txtFecha_Culminacion.Text
                End If
                'dts._fechaCulminacion = txtFecha_Culminacion.Text

                If txtFecha_Traslado.Text = "" Then
                    dts._fechaTraslado = ("01/01/2000 00:00:00")
                Else
                    dts._fechaTraslado = txtFecha_Traslado.Text
                End If
                'dts._fechaTraslado = txtFecha_Traslado.Text

                dts._avanceInforme = ddlAvance_Informe.Text
                dts._remitido = txtRemitido.Text
                dts._hallazgo = txtHallazgo.Text
                dts._recomendaciones = txtRecomendaciones.Text
                dts._observaciones = txtObservaciones.Text

                If func.insertarInforme(dts) Then
                    ModalPopupExtender_Exito.Show()
                    ' Insert_checklist()
                    'Response.Write("<script language=javascript>alert('El elemento se ha agregado exitosamente')</script>")
                    GestionLimpiar()
                    ddlAvance_Informe.ClearSelection()
                Else
                    ModalPopupExtender_Incompleto.Show()
                    'Response.Write("<script language=javascript>alert('Faltan elementos que agregar en el formulario')</script>")
                    'MsgBox("Fracaso")
                End If
            Catch ex As Exception
                ModalPopupExtender_Error.Show()
                ' Response.Write("<script language=javascript>alert('Hubo un problema en agregar el elemento. Porfavor revisar formulario.')</script>")
                MsgBox(ex.Message)
            End Try
        Else
            ModalPopupExtender_Incompleto.Show()
            'Response.Write("<script language=javascript>alert('Faltan elementos que agregar en el formulario')</script>")
            'MsgBox("Falta datos")
        End If
    End Sub
#End Region

    Protected Sub btnVolver_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        Response.Redirect("Tabla_Informe-SistemaRegistroInformes.aspx")
    End Sub

#Region "Limpiar Formulario"
    'EFECTO: Función que se utiliza para limpiar todos los textboxes de la pagina
    'RECIBE: No recibe parametros
    'DEVUELVE: Hace vacio todos los textboxes
    Sub GestionLimpiar()
        txtTitulo_Informe.Text = String.Empty
        ddlTipo_Informe.SelectedIndex = -1
        txtNumero_Oficio.Text = String.Empty
        txtFecha_Aprobacion.Text = String.Empty
        txtFecha_Culminacion.Text = String.Empty
        txtFecha_Traslado.Text = String.Empty
        txtRemitido.Text = String.Empty
        txtHallazgo.Text = String.Empty
        txtRecomendaciones.Text = String.Empty
        txtObservaciones.Text = String.Empty
        ddlAvance_Informe.SelectedIndex = -1
    End Sub
#End Region

#Region "Insertar Avance"
    'EFECTO: Función que revisa cuales avances estan chekeados y los inserta a la base de datos en la tabla tblInformes
    'RECIBE: No recibe parametros
    'DEVUELVE: Inserta a la tabla tblInformes el valor con check
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


End Class