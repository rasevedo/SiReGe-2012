Imports CapAccesoDatosSiReGe
Imports CapEntidadesSiReGe
Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration

Public Class Form_Insertar_Informe
    Inherits System.Web.UI.Page

    Dim strConnString As String = ConfigurationManager _
             .ConnectionStrings("bda_SIREGE_Connection").ConnectionString


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            For i As Integer = 0 To txtavanceInforme.Items.Count - 1
                txtavanceInforme.Items(i).Attributes.Add("onclick", "OnlyOneCheckList(this)")
            Next
        End If
    End Sub

#Region "btnAgregar datos a la tabla tblInformes"
    'EFECTO: La función de este botón se encarga revisar que todos los textboxes y dropdownlists esten llenos para insertar en la base de datos. 
    'RECIBE: La llamada de Datos_Informe y Entidad_Informe para la inserción a la base de datos
    'DEVUELVE: Inserta los datos a la base de datos en la tabla tblInformes
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles btnAgregar.Click
        Dim dts As New Entidad_Informe
        Dim func As New Datos_Informe
        If txttituloInforme.Text <> "" And txtfechaAprobacion.Text <> "" Then
            Try
                dts._tituloInforme = txttituloInforme.Text
                dts._idEmpleados = idEmpleados.Text
                dts._tituloInforme = txttipoInforme.Text
                dts._numeroOficio = txtnumeroOficio.Text
                dts._tipoInforme = txttipoInforme.Text
                dts._fechaAprobacion = txtfechaAprobacion.Text
                dts._fechaCulminacion = txtfechaCulminacion.Text
                dts._fechaTraslado = txtfechaTraslado.Text
                dts._avanceInforme = txtavanceInforme.Text
                If func.insertarInforme(dts) Then
                    ModalPopupExtender_Exito.Show()
                    ' Insert_checklist()
                    'Response.Write("<script language=javascript>alert('El elemento se ha agregado')</script>")
                    GestionLimpiar()
                    txtavanceInforme.ClearSelection()
                Else
                    ModalPopupExtender_Incompleto.Show()
                    ' Response.Write("<script language=javascript>alert('Faltan espacio para rellenar')</script>")
                    'MsgBox("Fracaso")
                End If
            Catch ex As Exception
                ModalPopupExtender_Error.Show()
                'Response.Write("<script language=javascript>alert('Hubo un problema en agregar el elemento')</script>")
                'MsgBox(ex.Message)
            End Try
        Else
            ModalPopupExtender_Incompleto.Show()
            'Response.Write("<script language=javascript>alert('Faltan elementos que agregar')</script>")
            'MsgBox("Falta datos")
        End If
    End Sub
#End Region

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        Response.Redirect("Tabla Informe-SistemaRegistroInformes.aspx")
    End Sub

#Region "Limpiar Formulario"
    'EFECTO: Función que se utiliza para limpiar todos los textboxes de la pagina
    'RECIBE: No recibe parametros
    'DEVUELVE: Hace vacio todos los textboxes
    Sub GestionLimpiar()
        txttituloInforme.Text = String.Empty
        txtnumeroOficio.Text = String.Empty
        txtfechaAprobacion.Text = String.Empty
        txtfechaCulminacion.Text = String.Empty
        txtfechaTraslado.Text = String.Empty
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
        For i As Integer = 0 To txtavanceInforme.Items.Count - 1
            If txtavanceInforme.Items(i).Selected Then
                If str = "" Then
                    str = txtavanceInforme.Items(i).Text
                Else
                    str += "," & txtavanceInforme.Items(i).Text
                End If
            End If
        Next
        cmd.Parameters.AddWithValue("@vchAvanceInforme", SqlDbType.VarChar).Value = str.Trim()
        cmd.Connection = con
        'Dim cmd As SqlCommand = New SqlCommand("Insert into Informe(avanceInforme) values('" & str & "')", con)
        'cmd.ExecuteNonQuery()
    End Sub
#End Region


End Class