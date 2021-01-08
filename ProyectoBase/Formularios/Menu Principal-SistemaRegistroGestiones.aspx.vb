Public Class MenuPrincipal
    Inherits System.Web.UI.Page

    'EFECTO: Las funciones dentro del load funcionan para subir la imagen seleccionada en el sistema, aparte de eso poseen un resize de pixeles para que puedan verse en la pantalla de forma comoda.
    'RECIBE: La ubicación de las imagenes
    'DEVUELVE: Solo retornan las imagenes como botones.
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ImgBtnGestion.Attributes.Add("onmouseover", "src='/Contenido/Imagenes/Atencion de Gestiones del Servicio_ON.png'")
        ImgBtnGestion.Width = Unit.Pixel(300)
        ImgBtnGestion.Attributes.Add("onmouseout", "src='/Contenido/Imagenes/Atencion de Gestiones del Servicio_OFF.png'")
        ImgBtnGestion.Width = Unit.Pixel(300)

        ImgBtnDAU.Attributes.Add("onmouseover", "src='/Contenido/Imagenes/DAU_ON.png'")
        ImgBtnDAU.Width = Unit.Pixel(300)
        ImgBtnDAU.Attributes.Add("onmouseout", "src='/Contenido/Imagenes/DAU_OFF.png'")
        ImgBtnDAU.Width = Unit.Pixel(300)

        ImgBtnDMC.Attributes.Add("onmouseover", "src='/Contenido/Imagenes/DMC_ON.png'")
        ImgBtnDMC.Width = Unit.Pixel(300)
        ImgBtnDMC.Attributes.Add("onmouseout", "src='/Contenido/Imagenes/DMC_OFF.png'")
        ImgBtnDMC.Width = Unit.Pixel(300)



    End Sub

    Protected Sub ImgBtnGestion_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnGestion.Click
        Response.Redirect("Tabla Gestiones-SistemaRegistroGestiones.aspx")
    End Sub


    Protected Sub ImgBtnDAU_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnDAU.Click
        Response.Redirect("Tabla Casos-SistemaRegistroGestiones.aspx")
    End Sub


    Protected Sub ImgBtnDMC_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnDMC.Click
        Response.Redirect("Tabla Informe-SistemaRegistroInformes.aspx")
    End Sub




End Class