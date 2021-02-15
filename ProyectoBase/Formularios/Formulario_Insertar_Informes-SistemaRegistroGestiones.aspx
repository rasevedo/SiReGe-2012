<%@ Page Title="Formulario_Insertar_Informes-SistemaRegistroGestiones" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="Formulario_Insertar_Informes-SistemaRegistroGestiones.aspx.vb" Inherits="CapPresentacionSiReGe.Formulario_Insertar_Informes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>Formulario_Insertar_Informes-SistemaRegistroGestiones</title>
    <style type="text/css">
        .auto-style2 {
            width: 432px;
        }
        .auto-style3 {
            width: 516px;
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
        .input-sm {}
        .auto-style12 {
            width: 256px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">   
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />         
            <div class="row">
                <div class="col-lg-12">                    
                        <header class="panel-heading">
                            <div class="col-md-5 col-md-offset-4">
                                <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Insertar Informe</h1>
                            </div>
                        </header>
                        <div class="panel-body">


                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTitulo_Informe" Text="Título del informe*" runat="server" /></td>

                                                <td class="auto-style8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFuncionario_Tramita" Text="Funcionario que tramita*" runat="server"/></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTipo_Informe" Text="Tipo de informe*" runat="server"/></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtTitulo_Informe" runat="server" Enabled="true" CssClass="form-control input-sm" Height="25px" Width="273px"  /></td>

                                                <td class="auto-style8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNombre_Funcionario" runat="server" Enabled="false" CssClass="form-control input-sm" Height="25px" Width="279px"  /></td>
                                                   

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlTipo_Informe" runat="server" CssClass="form-control input-sm" Height="30px" Width="279px" >
                                                        <asp:ListItem Text=" " Value=" "></asp:ListItem>
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
                                                <td class="auto-style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNumero_Estudio" Text="Número de estudio " runat="server"/></td>

                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFecha_Aprobacion" Text="Fecha de aprobación" runat="server"/></td>

                                            </tr>
                                            <tr>
                                                <td class="auto-style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNumero_Oficio" runat="server"  Enabled="true" CssClass="form-control input-sm" Height="25px" Width="273px" /></td>

                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtFecha_Aprobacion" runat="server" TextMode="DateTimeLocal"  Enabled="true" CssClass="form-control input-sm" Height="25px" Width="279px"   /></td>
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
                                                <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFecha_Culminacion" Text="Fecha de culminación" runat="server"/></td>

                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblFecha_Traslado" Text="Fecha de traslado" runat="server"/></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtFecha_Culminacion" runat="server" TextMode="DateTimeLocal"  Enabled="true" CssClass="form-control input-sm" Height="25px" Width="279px"  /></td>

                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtFecha_Traslado" runat="server" TextMode="DateTimeLocal"  Enabled="true" CssClass="form-control input-sm" Height="25px" Width="279px"  /></td>
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

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblAvance" Text="Avance" runat="server"/>  </td>
                                            </tr>
                                            <tr>

                                                <td class="auto-style12"></td>

                                                <td> <asp:CheckBoxList ID="ddlAvance_Informe" runat="server" Height="25px" Width="266px" CellPadding="5" CssClass="centrar" >
                                                    <asp:ListItem Text="1° etapa" Value="1° etapa"  />
                                                    <asp:ListItem Text="2° etapa" Value="2° etapa"  />
                                                    <asp:ListItem Text="3° etapa" Value="3° etapa"  />
                                                    <asp:ListItem Text="4° etapa" Value="4° etapa"  />
                                                    <asp:ListItem Text="Seguimiento" Value="Seguimiento"  />
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
                                                <td class="auto-style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblRemitido" Text="Remitido a " runat="server"/></td>                                              
                                            </tr>
                                            <tr>
                                                <td class="auto-style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtRemitido" runat="server"  Enabled="true" CssClass="form-control input-sm" Height="25px" Width="743px" /></td>                                             
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
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblHallazgo_Informe" Text="Hallazgos del informe" runat="server"/> </td>

                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat="server" ID="txtHallazgo" TextMode="Multiline" Enabled="true" CssClass="form-control input-lg" Name="S2" Rows="5" Cols="12" Width="1125px" style="resize:none;" /></td>
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
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblRecomendaciones" Text="Recomendaciones" runat="server"/> </td>

                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat="server" ID="txtRecomendaciones" TextMode="Multiline" Enabled="true" CssClass="form-control input-lg" Name="S2" Rows="5" Cols="12" Width="1125px" style="resize:none;" /></td>
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
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblObservaciones_Informe" Text="Observaciones generales" runat="server"/> </td>

                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat="server" ID="txtObservaciones" TextMode="Multiline" Enabled="true" CssClass="form-control input-lg" Name="S2" Rows="5" Cols="12" Width="1125px" style="resize:none;" /></td>
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
                                                <td class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button Text="Agregar" ID="btnAgregar" CssClass="btn btn-primary" Width="85px" Height="45px" runat="server" OnClick="btnAgregar_Click" /></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button Text="Volver" ID="btnVolver" CssClass="btn btn-primary" Width="85px" Height="45px" runat="server" OnClick="btnVolver_Click" /></td>
                                            </tr>                                        
                                        </table>                                                                   
                                    </div>
                                </div>                                                          
                            </div> 
                            <br/>
                            
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
                                    El elemento se ha agregado exitosamente
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
                                    Hubo un problema en agregar el elemento. Porfavor revisar formulario.
                                    <br />
                                    <asp:Button ID="btnCerrar_Error" runat="server" Text="Cerrar" />
                                </div>
                            </asp:Panel>
                                                                                                                                                                                                                                                                                
                       </div>                                         
                </div>
            </div>                           
</asp:Content>