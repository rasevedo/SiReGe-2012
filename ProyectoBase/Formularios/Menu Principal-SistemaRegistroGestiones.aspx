<%@ Page Title="Menu Principal-SistemaRegistroGestiones" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master"  CodeBehind="Menu Principal-SistemaRegistroGestiones.aspx.vb" Inherits="CapPresentacionSiReGe.MenuPrincipal" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>Menu Principal-SistemaRegistroGestiones</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <div class="row"> 
        <div class="col-lg-12">
            
                <header class="panel-heading">
                    <div class="col-md-5 col-md-offset-4">
                        <h1></h1>
                    </div>
                </header>
                <div class="panel-body">

                    <div class="row">
                        <div class="col-md-3 col-md-offset-1">
                            <div class="form-group">                              
                                <table style="width: 100%;">
                                    <tr>
                                        <td><asp:ImageButton ID="ImgBtnGestion" runat="server" ImageUrl="~/Contenido/Imagenes/Atencion de Gestiones del Servicio_OFF.png"  OnClick="ImgBtnGestion_Click"/></td>

                                        <td><asp:ImageButton ID="ImgBtnDAU" runat="server" ImageURL="~/Contenido/Imagenes/DAU_OFF.png"  OnClick="ImgBtnDAU_Click"/></td>

                                        <td><asp:ImageButton ID="ImgBtnDMC" runat="server" ImageURL="~/Contenido/Imagenes/DMC_OFF.png"  OnClick="ImgBtnDMC_Click"/></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label1" Text="Atención de Gestiones del Servicio" runat="server" CssClass="centrar" /></td>

                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label2" Text="Departamento de Atención al Usuario" runat="server" CssClass="centrar" /></td>

                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label3" Text="Departamento de Mejora Continua" runat="server" CssClass="centrar" /></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                            
                                                  
                     </div>

                </div>
             
        </div>
    </div>                     
</asp:Content>
