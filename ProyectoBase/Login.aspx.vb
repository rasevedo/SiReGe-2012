Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            lblVersion.Text += Space(1) + System.Reflection.Assembly.GetExecutingAssembly.GetName.Version.ToString
            ' Dim dsInfoUsuario As DataSet
            ' Dim intAplicacion As Integer
            'Consecutivo que genera el Sistema de Control de Accesos y Seguridad

        Catch ex As Exception
        End Try
    End Sub

    Private Sub Mensajes(ByVal str_CuerpoMensaje As String)
        Dim str_Mensaje As String
        str_Mensaje = "<script language=JavaScript>"
        str_Mensaje = str_Mensaje + "alert(""" & str_CuerpoMensaje & """);"
        str_Mensaje = str_Mensaje + "</script>"
        If (Not ClientScript.IsStartupScriptRegistered("clientScript")) Then
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "clientScript", str_Mensaje)
        End If
    End Sub

End Class