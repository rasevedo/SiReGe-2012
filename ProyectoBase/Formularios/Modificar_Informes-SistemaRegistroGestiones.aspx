<%@ Page Title="Modificar_Informes-SistemaRegistroGestiones" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="Modificar_Informes-SistemaRegistroGestiones.aspx.vb" Inherits="CapPresentacionSiReGe.Modificar_Informe" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>Modificar_Informes-SistemaRegistroGestiones</title>
    <style type="text/css">
        .auto-style2 {
            width: 432px;
        }
        .auto-style3 {
            width: 516px;
        }
        .auto-style5 {
            width: 52px;
        }
        .Combobox {}
        .auto-style6 {
            width: 882px;
        }
        .auto-style8 {
            width: 390px;
        }
        .auto-style10 {
            width: 287px;
        }
        .auto-style11 {
            width: 239px;
        }
        .auto-style12 {
            width: 11px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">               
            <div class="row">
                <div class="col-lg-12">                    
                        <header class="panel-heading">
                            <div class="col-md-5 col-md-offset-4">
                                <h1 class="centrar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Modificar Informe</h1>
                            </div>
                        </header>
                        <div class="panel-body">

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lblCodigo_Informe" Text="Codigo del Informe" runat="server" />
                                        &nbsp;<asp:TextBox ID="txtId_Informe" runat="server" Enabled="false" CssClass="form-control input-sm" Width="44px"  />
                                    </div>
                                </div>                            
                            </div>

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTitulo_Informe" Text="Título del Informe" runat="server" /></td>

                                                <td class="auto-style8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFuncionario_Tramita" Text="Funcionario que tramita*" runat="server"/></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTipo_Informe" Text="Tipo de Informe " runat="server"/></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtTitulo_Informe" runat="server" Enabled="true" CssClass="form-control input-sm" Height="25px" Width="273px"  /></td>

                                                <td class="auto-style8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="intIdEmpleados" runat="server" CssClass="form-control input-sm" DataSourceID="sdsEmpleados" DataTextField="vchNombreEmpleados" DataValueField="intIdEmpleados" Height="30px" Width="279px"  />
                                                    <asp:SqlDataSource ID="sdsEmpleados" runat="server" ConnectionString="<%$ ConnectionStrings:bda_SIREGE_Connection %>" SelectCommand="palSeleccionarEmpleados" SelectCommandType="StoredProcedure"></asp:SqlDataSource></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlTipo_Informe" runat="server" CssClass="form-control input-sm" Height="30px" Width="279px" >
                                                        <asp:ListItem Text="Informe" Value="Informe"></asp:ListItem>
                                                        <asp:ListItem Text="Estudio" Value="Estudio"></asp:ListItem>
                                                        <asp:ListItem Text="Capacitación" Value="Capacitación"></asp:ListItem>
                                                    </asp:DropDownList></td>
                                            </tr>                                            
                                        </table>
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <br />                                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>                            
                            </div>


                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNumero_Oficio" Text="Número de oficio " runat="server"/></td>

                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFecha_Aprobacion" Text="Fecha de Aprobación" runat="server"/></td>

                                            </tr>
                                            <tr>
                                                <td class="auto-style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNumero_Oficio" runat="server"  Enabled="true" CssClass="form-control input-sm" Height="25px" Width="273px" /></td>

                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtFecha_Aprobacion" runat="server" TextMode="Date" Enabled="true" CssClass="form-control input-sm" Height="30px" Width="279px"   /></td>
                                            </tr>                                            
                                        </table> 
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <br />                                                               
                                            </div>
                                        </div>                                       
                                    </div>
                                </div>                                                               
                            </div>

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFecha_Culminacion" Text="Fecha de Culminación" runat="server"/></td>

                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFecha_Traslado" Text="Fecha de Traslado" runat="server"/></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtFecha_Culminacion" runat="server" TextMode="Date" Enabled="true" CssClass="form-control input-sm" Height="30px" Width="279px"  /></td>

                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtFecha_Traslado" runat="server" TextMode="Date" Enabled="true" CssClass="form-control input-sm" Height="30px" Width="279px"  /></td>
                                            </tr>
                                        </table>
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <br />                                                               
                                            </div>
                                        </div>                                       
                                    </div>
                                </div>                                      
                            </div>

                              
                            <script type="text/javascript">
                                function OnlyOneCheckList(chk) {
                                    var chkList = chk.parentNode.parentNode.parentNode;
                                    var chks = chkList.getElementsByTagName("input");
                                    for (var i = 0; i < chks.length; i++) {
                                        if (chks[i] != chk && chk.checked) {
                                            chks[i].checked = false;
                                        }
                                    }
                                }
                            </script>

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>

                                                <td class="auto-style12"></td>

                                                <td class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblAvance" Text="Avance" runat="server"/>  </td>
                                            </tr>
                                            <tr>

                                                <td class="auto-style12"></td>

                                                <td> <asp:CheckBoxList ID="ddlAvance_Informe" runat="server" Height="25px" Width="155px" CellPadding="5" CssClass="centrar" >
                                                    <asp:ListItem Text="1° etapa" Value="1° etapa"  />
                                                    <asp:ListItem Text="2° etapa" Value="2° etapa"  />
                                                    <asp:ListItem Text="3° etapa" Value="3° etapa"  />
                                                    <asp:ListItem Text="4° etapa" Value="4° etapa"  />
                                                </asp:CheckBoxList> </td>                                             
                                            </tr>
                                        </table>
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <br />                                                               
                                            </div>
                                        </div>                                       
                                    </div>
                                </div>                                      
                            </div>


                            <div class="row">                                
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnUpdate" runat="server" Text="Actualizar" CssClass="btn btn-primary" Width="170px" OnClick="btnUpdate_Click" /></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button Text="Cancelar" ID="btnCancelar" CssClass="btn btn-primary" Width="170px" runat="server" OnClick="btnCancel_Click" /></td>
                                            </tr>                                        
                                        </table>                                                                   
                                    </div>
                                </div>                                                          
                            </div> 
                            
                            
                            <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
                            <asp:ModalPopupExtender ID="ModalPopupExtender_Exito" BehaviorID="MPE_Exito" runat="server"
                                PopupControlID="pnlPopup_Exito" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground"
                                CancelControlID="btnCerrar_Exito">
                            </asp:ModalPopupExtender>
                            <asp:Panel ID="pnlPopup_Exito" runat="server" CssClass="modalPopup" Style="display: none">
                                <div class="header">
                                    Mensaje de Información
                                </div>
                                <div class="body">
                                    El elemento se ha modificado exitosamente
                                    <br />
                                    <asp:Button ID="btnCerrar_Exito" runat="server" Text="Cerrar" />
                                </div>
                            </asp:Panel>

                            <asp:ModalPopupExtender ID="ModalPopupExtender_Incompleto" BehaviorID="MPE_Incompleto" runat="server"
                                PopupControlID="pnlPopup_Incompleto" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground"
                                CancelControlID="btnCerrar_Incompleto">
                            </asp:ModalPopupExtender>
                            <asp:Panel ID="pnlPopup_Incompleto" runat="server" CssClass="modalPopup" Style="display: none">
                                <div class="header">
                                    Mensaje de Información
                                </div>
                                <div class="body">
                                    Faltan elementos que agregar en el formulario
                                    <br />
                                    <asp:Button ID="btnCerrar_Incompleto" runat="server" Text="Cerrar" />
                                </div>
                            </asp:Panel>

                            <asp:ModalPopupExtender ID="ModalPopupExtender_Error" BehaviorID="MPE_Error" runat="server"
                                PopupControlID="pnlPopup_Error" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground"
                                CancelControlID="btnCerrar_Error">
                            </asp:ModalPopupExtender>
                            <asp:Panel ID="pnlPopup_Error" runat="server" CssClass="modalPopup" Style="display: none">
                                <div class="header">
                                    Mensaje de Alerta
                                </div>
                                <div class="body">
                                    Hubo un problema en modificar el formulario. Porfavor revisar formulario.
                                    <br />
                                    <asp:Button ID="btnCerrar_Error" runat="server" Text="Cerrar" />
                                </div>
                            </asp:Panel> 
                            
                           

                      </div>                                         
                </div>
            </div>                           
</asp:Content>
