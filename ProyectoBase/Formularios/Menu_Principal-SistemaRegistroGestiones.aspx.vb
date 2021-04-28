Public Class Menu_Principal
    Inherits System.Web.UI.Page

    'EFECTO: Las funciones dentro del load funcionan para subir la imagen seleccionada en el sistema, aparte de eso poseen un resize de pixeles para que puedan verse en la pantalla de forma comoda.
    'RECIBE: La ubicación de las imagenes
    'DEVUELVE: Solo retornan las imagenes como botones.
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        imbBtn_Gestion.Attributes.Add("onmouseover", "src='../Contenido/Imagenes/Atencion de Gestiones del Servicio_ON.png'")
        imbBtn_Gestion.Width = Unit.Pixel(300)
        imbBtn_Gestion.Attributes.Add("onmouseout", "src='../Contenido/Imagenes/Atencion de Gestiones del Servicio_OFF.png'")
        imbBtn_Gestion.Width = Unit.Pixel(300)

        imbBtn_DAU.Attributes.Add("onmouseover", "src='../Contenido/Imagenes/DAU_ON.png'")
        imbBtn_DAU.Width = Unit.Pixel(300)
        imbBtn_DAU.Attributes.Add("onmouseout", "src='../Contenido/Imagenes/DAU_OFF.png'")
        imbBtn_DAU.Width = Unit.Pixel(300)

        imbBtn_DMC.Attributes.Add("onmouseover", "src='../Contenido/Imagenes/DMC_ON.png'")
        imbBtn_DMC.Width = Unit.Pixel(300)
        imbBtn_DMC.Attributes.Add("onmouseout", "src='../Contenido/Imagenes/DMC_OFF.png'")
        imbBtn_DMC.Width = Unit.Pixel(300)



    End Sub

    Protected Sub imbBtn_Gestion_Click(sender As Object, e As ImageClickEventArgs) Handles imbBtn_Gestion.Click
        Response.Redirect("Tabla_Gestiones-SistemaRegistroGestiones.aspx")
    End Sub


    Protected Sub imbBtn_DAU_Click(sender As Object, e As ImageClickEventArgs) Handles imbBtn_DAU.Click
        If Session("Perfil") = "A" Then
            Response.Redirect("Tabla_Casos-SistemaRegistroGestiones.aspx")
        ElseIf Session("Perfil") = "DU" Then
            Response.Redirect("Tabla_Casos-SistemaRegistroGestiones.aspx")
        Else
            ModalPopupExtender_No_Permiso_DAT.Show()
            'Response.Write("<script language=javascript>alert('El usuario no posee permisos para acceder la siguiente pantalla')</script>")
        End If
    End Sub


    Protected Sub imbBtn_DMC_Click(sender As Object, e As ImageClickEventArgs) Handles imbBtn_DMC.Click
        If Session("Perfil") = "A" Then
            Response.Redirect("Tabla_Informe-SistemaRegistroInformes.aspx")
        ElseIf Session("Perfil") = "DC" Then
            Response.Redirect("Tabla_Informe-SistemaRegistroInformes.aspx")
        Else
            ModalPopupExtender_No_Permiso_DMC.Show()
            'Response.Write("<script language=javascript>alert('El usuario no posee permisos para acceder la siguiente pantalla')</script>")
        End If
    End Sub

End Class