<%@ Page Title="Menu_Principal-SistemaRegistroGestiones" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master"  CodeBehind="Menu_Principal-SistemaRegistroGestiones.aspx.vb" Inherits="CapPresentacionSiReGe.Menu_Principal" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>Menu_Principal-SistemaRegistroGestiones</title>
<style type="text/css">
    .auto-style2 {
        height: 23px;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:ImageButton ID="imbBtn_Gestion" runat="server" ImageUrl="~/Contenido/Imagenes/Atencion de Gestiones del Servicio_OFF.png"  OnClick="imbBtn_Gestion_Click"/></td>

                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:ImageButton ID="imbBtn_DAU" runat="server" ImageURL="~/Contenido/Imagenes/DAU_OFF.png"  OnClick="imbBtn_DAU_Click"/></td>

                                        <td>&nbsp;&nbsp;&nbsp; <asp:ImageButton ID="imbBtn_DMC" runat="server" ImageURL="~/Contenido/Imagenes/DMC_OFF.png"  OnClick="imbBtn_DMC_Click"/></td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblGestion_Servicio" Text="Atención de Gestiones del Servicio" runat="server" CssClass="Label" Font-Bold="True" Font-Size="Small" /></td>

                                        <td class="auto-style2"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblAtencion_Usuario" Text="Departamento de Atención al Usuario" runat="server" CssClass="Label" Font-Bold="True" Font-Size="Small" /></td>

                                        <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblMejora_Continua" Text="Departamento de Mejora Continua" runat="server" CssClass="Label" Font-Bold="True" Font-Size="Small" /></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                            
                                                  
                     </div>

                </div>
                       <asp:LinkButton Text="" ID = "dummylink1" runat="server" />
                       <asp:ModalPopupExtender ID="ModalPopupExtender_No_Permiso_DAT" BehaviorID="ModalPopupExtender_No_Permiso_DAT" runat="server"
                                PopupControlID="pnlPopup_NoPermiso1" TargetControlID="dummylink1" BackgroundCssClass="modalBackground"
                                CancelControlID="btnCerrar_NoPermiso">
                            </asp:ModalPopupExtender>
                            <asp:Panel ID="pnlPopup_NoPermiso1" runat="server" CssClass="modalPopup" Style="display: none">
                                <div class="header">
                                    Mensaje de Error
                                </div>
                                <div class="body">
                                    <asp:Label ID="Label1" runat="server" Text="El usuario no posee permiso para ingresar a la siguiente página"></asp:Label>
                                    <br />
                                    <asp:Button ID="btnCerrar_NoPermiso" runat="server" Text="Cerrar" />
                                </div>
                            </asp:Panel>

                       <asp:LinkButton Text="" ID = "dummylink2" runat="server" />
                       <asp:ModalPopupExtender ID="ModalPopupExtender_No_Permiso_DMC" BehaviorID="ModalPopupExtender_No_Permiso_DMC" runat="server"
                                PopupControlID="pnlPopup_NoPermiso2" TargetControlID="dummylink1" BackgroundCssClass="modalBackground"
                                CancelControlID="btnCerrar_NoPermiso2">
                            </asp:ModalPopupExtender>
                            <asp:Panel ID="pnlPopup_NoPermiso2" runat="server" CssClass="modalPopup" Style="display: none">
                                <div class="header">
                                    Mensaje de Error
                                </div>
                                <div class="body">
                                    <asp:Label ID="Label2" runat="server" Text="El usuario no posee permiso para ingresar a la siguiente página"></asp:Label>
                                    <br />
                                    <asp:Button ID="btnCerrar_NoPermiso2" runat="server" Text="Cerrar" />
                                </div>
                            </asp:Panel>


             
        </div>
    </div>                     
</asp:Content>
