﻿<%@ Page Title="Buscador_Informes-SistemaRegistroGestiones" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="Buscador_Informes-SistemaRegistroGestiones.aspx.vb" Inherits="CapPresentacionSiReGe.Buscador_Informes_SistemaRegistroGestiones" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>Buscador_Informes-SistemaRegistroGestiones</title>
    <style type="text/css">
        .input-sm {
            margin-top: 0px;
            margin-bottom: 0px;
            margin-left: 1px;
        }
        .input-lg {}
        .auto-style2 {
            width: 392px;
        }
        .auto-style3 {
            width: 432px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <link href="Estilo.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

     
    <div class="row">

        <div class="auto-style2">
            <header class="panel-heading">
                <div class="col-md-5 col-md-offset-3">
                    <h1 class="auto-style3">&nbsp;&nbsp; Buscador de Informes</h1>
                </div>
            </header>
        </div>

        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTitulo_Informe" Text="Título del informe" runat="server"/></td>
                                                
                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNombre_Funcionario" Text="Nombre de funcionario" runat="server" /></td>
                                                
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTipo_Informe" Text="Tipo de informe" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtTitulo_Informe" runat="server" CssClass="form-control input-sm" Height="25px" Width="279px"  /></td>
                                                                                                                                                    
                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNombre_Funcionario" runat="server" CssClass="form-control input-sm" Height="25px" Width="277px" /></td>
                                                                                                        
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlTipo_Informe" runat="server" CssClass="form-control input-sm" Height="30px" Width="283px" >
                                                        <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                                        <asp:ListItem Text="Informe" Value="Informe"></asp:ListItem>
                                                        <asp:ListItem Text="Estudio" Value="Estudio"></asp:ListItem>
                                                        <asp:ListItem Text="Capacitación" Value="Capacitación"></asp:ListItem>
                                                        <asp:ListItem Text="Elaboración y/o Revisión de Manuales" Value="Elaboración y/o Revisión de Manuales"></asp:ListItem>
                                                        <asp:ListItem Text="Procedimientos" Value="Procedimientos"></asp:ListItem>
                                                        <asp:ListItem Text="Instructivos" Value="Instructivos"></asp:ListItem>
                                                        <asp:ListItem Text="Otros" Value="Otros"></asp:ListItem>
                                                    </asp:DropDownList></td>
                                            </tr>  
                                        </table>
                                    </div>
                                </div>                  
                            </div>

                                           
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnBuscar_Informe" runat="server" Width="85px" Height="45px" Text="Buscar" OnClick="btnBuscar_Informe_Click"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button  ID="btnVolver" runat="server" Width="85px" Height="45px" Text="Volver" OnClick="btnVolver_Click"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button Text="Borrar" ID="btnBorrar"  Width="85px" Height="45px" runat="server" OnClick="btnBorrar_Click" />
                            &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnBitacora" runat="server" Width="85px" Height="45px" Text="Bitacora" OnClick="btnBitacora_Click"/>
                            &nbsp;&nbsp;&nbsp;
                <asp:Button Text="Exportar" ID="btnExportar"  Width="85px" Height="45px" runat="server" OnClick="btnExportar_Click" />
                <br />
                <br />

                <asp:ConfirmButtonExtender ID="cbeConfirmacion" runat="server" DisplayModalPopupID="mpeConfirmacion" TargetControlID="btnBorrar">
                </asp:ConfirmButtonExtender>
                <asp:ModalPopupExtender ID="mpeConfirmacion" runat="server" PopupControlID="PanelConfirmacion" TargetControlID="btnBorrar" OkControlID = "btnYes"
                    CancelControlID="btnNo" BackgroundCssClass="modalBackground">
                </asp:ModalPopupExtender>
                <asp:Panel ID="PanelConfirmacion" runat="server" CssClass="modalPopup" Style="display: none">
                    <div class="header">
                        Confirmación
                    </div>
                    <div class="body">
                        ¿Esta seguro que desea borrar las siguientes filas?
                    </div>
                    <div class="footer" align="center">
                        <asp:Button ID="btnYes" runat="server" Text="Confirmar" />
                        <asp:Button ID="btnNo" runat="server" Text="Cancelar" />
                    </div>
                </asp:Panel>

             <asp:ConfirmButtonExtender ID="cbeConfirmacion_Bitacora" runat="server" DisplayModalPopupID="mpeConfirmacion_Bitacora" TargetControlID="btnBitacora">
                        </asp:ConfirmButtonExtender>
                        <asp:ModalPopupExtender ID="mpeConfirmacion_Bitacora" runat="server" PopupControlID="PanelConfirmacion_Bitacora" TargetControlID="btnBitacora" OkControlID = "btnConfirmar"
                            CancelControlID="btnCancelar" BackgroundCssClass="modalBackground">
                        </asp:ModalPopupExtender>
                        <asp:Panel ID="PanelConfirmacion_Bitacora" runat="server" CssClass="modalPopup" Style="display: none">
                            <div class="header">
                                Confirmación
                            </div>
                            <div class="body">
                                Solo la primer selección de la tabla se exportará a la bitácora
                            </div>
                            <div class="footer" align="center">
                                <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar" />
                                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" />
                            </div>
                    </asp:Panel>


                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblmsg" runat="server" Visible="false"></asp:Label>
          
                
            <asp:UpdatePanel runat="server" id="UpdatePanelTabla" updatemode="Conditional">  
            <ContentTemplate>
            <div id="grdCharges" runat="server"  style="width: 1221px; overflow: auto; height: 450px">
                       <asp:GridView ID="gvwInforme" runat="server" CellPadding="10" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="2px" AutoGenerateColumns="False" DataKeyNames="intIdInforme" AllowPaging="True" AllowSorting="True" CellSpacing="10" HorizontalAlign="Center" style="margin-left: 9px" Width="1199px">
                            <Columns>
                               <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkTodo" runat="server" onclick = "chkTodo(this);" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSeleccionar" runat="server"></asp:CheckBox>
                                    </ItemTemplate>
                               </asp:TemplateField>  
                               <asp:buttonfield buttontype="Button" runat="server" commandname="Select" text="Detalle" HeaderText="Detalle" />
                               <asp:TemplateField>
                                   <HeaderTemplate>
                                        <asp:Label ID="lblModificar" runat="server" text="Modificar" />
                                   </HeaderTemplate>
                                   <ItemTemplate>
                                        <asp:Button ID="btnEditar" runat="server" Text="Modificar" OnClick="btnEditar_Click" CommandArgument='<%#Eval("intIdInforme")%>' />
                                   </ItemTemplate>
                               </asp:TemplateField>
                               <asp:BoundField DataField="intIdInforme" HeaderText="Número" ReadOnly="True" InsertVisible="False" ></asp:BoundField>
                               <asp:BoundField DataField="vchTituloInforme" HeaderText="Título" ></asp:BoundField>
                               <asp:BoundField DataField="vchNombreFuncionario" HeaderText="Funcionario que tramita" ></asp:BoundField>
                               <asp:BoundField DataField="vchTipoInforme" HeaderText="Tipo" ></asp:BoundField>
                               <asp:BoundField DataField="vchNumeroOficio" HeaderText="Número del estudio" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaAprobacion" HeaderText="Fecha de aprobación" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaCulminacion" HeaderText="Fecha de culminación" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaTraslado" HeaderText="Fecha de traslado" ></asp:BoundField>
                               <asp:BoundField DataField="vchAvanceInforme" HeaderText="Avance" ></asp:BoundField>
                               <asp:BoundField DataField="vchRemitido" HeaderText="Remitido a" ></asp:BoundField>
                               <asp:BoundField DataField="vchHallazgo" HeaderText="Hallazgos" ></asp:BoundField>
                               <asp:BoundField DataField="vchRecomendaciones" HeaderText="Recomendaciones" ></asp:BoundField>
                               <asp:BoundField DataField="vchObservaciones" HeaderText="Observaciones generales" ></asp:BoundField>
                           </Columns>
                            <RowStyle Width="250px" BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" Wrap="True" />
                            <FooterStyle BackColor="#00A0E3" ForeColor="White" />
                            <PagerStyle BackColor="#00A0e3" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#00A0e3" ForeColor="White" HorizontalAlign="Center" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                       </asp:GridView>
                       <asp:SqlDataSource runat="server" ID="sdsGridview_Informes" ConnectionString='<%$ ConnectionStrings:bda_SIREGE_Connection %>' SelectCommand="mostrarInforme" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                  
                       <script type = "text/javascript">
                           function chkTodo(objRef) {
                               var GridView = objRef.parentNode.parentNode.parentNode;
                               var inputList = GridView.getElementsByTagName("input");
                               for (var i = 0; i < inputList.length; i++) {
                                   //Get the Cell To find out ColumnIndex
                                   var row = inputList[i].parentNode.parentNode;
                                   if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                                       if (objRef.checked) {
                                           //If the header checkbox is checked check all checkboxes and highlight all rows
                                           inputList[i].checked = true;
                                       }
                                       else {
                                           //If the header checkbox is checked uncheck all checkboxes and change rowcolor back to original
                                           if (row.rowIndex % 2 == 0) {
                                           }
                                           inputList[i].checked = false;
                                       }
                                   }
                               }
                           }
                      </script>
                     
               </div>
            
                        

                        <asp:LinkButton Text="" ID = "lnkFalso" runat="server" />
                        <asp:ModalPopupExtender ID="mpeDetalles" runat="server" PopupControlID="pnlPopup" TargetControlID="lnkFalso"
                        CancelControlID="btnCerrar_Modal" BackgroundCssClass="modalBackground">
                        </asp:ModalPopupExtender>

                       <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none" ScrollBars="Vertical" Height="430px" >
                           <div class="header">
                               Detalles del Informe
                           </div>
                           <div class="body">
                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                          <asp:Label ID="lblPop_Id_Informe" runat="server" Text="Número:"></asp:Label> 
                                       </td>
                                        <td>               
                                           <asp:TextBox ID="txtPop_Id_Informe" runat="server" Enabled="false" size="82" style="text-align: left"/>
                                        </td>
                                    </tr>
                                   </table>
                               
                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                          <b>Título: </b>
                                       </td>
                                        <td>               
                                           <asp:TextBox ID="txtPop_Titulo_Informe" runat="server" Enabled="false" size="84" style="text-align: left"  />
                                        </td>
                                    </tr>
                                   </table>
                               
                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                          <b>Nombre del funcionario: </b>
                                       </td>
                                        <td>               
                                           <asp:TextBox ID="txtPop_Empleado_Informe" runat="server" Enabled="false" size="66" style="text-align: left" />
                                        </td>
                                    </tr>
                                   </table>
                               
                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                          <b>Tipo: </b>
                                       </td>
                                        <td>               
                                           <asp:TextBox ID="txtPop_Tipo_Informe" runat="server" Enabled="false" size="85" style="text-align: left" />
                                        </td>
                                    </tr>
                                   </table>
                               
                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                          <b>Número de estudio: </b>
                                       </td>
                                        <td>               
                                           <asp:TextBox ID="txtPop_Num_Oficio_Informe" runat="server" Enabled="false" size="72" style="text-align: left" />
                                        </td>
                                    </tr>
                                   </table>
                               
                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                          <b>Fecha de aprobación: </b>
                                       </td>
                                        <td>               
                                           <asp:TextBox ID="txtPop_Fecha_Aprobacion" runat="server" Enabled="false" size="69" style="text-align: left" />
                                        </td>
                                    </tr>
                                   </table>
                               
                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                          <b>Fecha de culminación: </b>
                                       </td>
                                        <td>               
                                           <asp:TextBox ID="txtPop_Fecha_Culminacion" runat="server" Enabled="false" size="68" style="text-align: left" />
                                        </td>
                                    </tr>
                                   </table>
                               
                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                          <b>Fecha de traslado: </b>
                                       </td>
                                        <td>               
                                           <asp:TextBox ID="txtPop_Fecha_Traslado" runat="server" Enabled="false" size="72" style="text-align: left" />
                                        </td>
                                    </tr>
                                   </table>
                               
                               <table border="0" style="width:100%">                                                                                                           
                                   <tr>
                                        <td>
                                            <b>Avance: </b>                                            
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Avance_Informe" runat="server" Enabled="false" size="82" style="text-align: left" />
                                        </td> 
                                    </tr>
                                </table>   
                               
                               <table border="0" style="width:100%">                                                                                                           
                                   <tr>
                                        <td>
                                            <b>Remitido a: </b>                                            
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Remitido" runat="server" Enabled="false" style="text-align: left" size="78"/>
                                        </td> 
                                    </tr>
                                </table>

                               <table border="0" style="width:100%">                                                                                                           
                                   <tr>
                                        <td>
                                            <b>Hallazgos: </b>                                            
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Hallazgo_Informe" runat="server" Enabled="false" TextMode="MultiLine" Width="588px" Height="80px" style="text-align: left; resize:none;" /> 
                                        </td> 
                                    </tr>
                                </table>

                               <table border="0" style="width:100%">                                                                                                           
                                   <tr>
                                        <td>
                                            <b>Recomendaciones: </b>                                            
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Recomendaciones" runat="server" Enabled="false" TextMode="MultiLine" Width="533px" Height="80px" style="text-align: left; resize:none;" /> 
                                        </td> 
                                    </tr>
                                </table>

                               <table border="0" style="width:100%">                                                                                                           
                                   <tr>
                                        <td>
                                            <b>Observaciones generales: </b>                                            
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Observaciones_Generales" runat="server" Enabled="false" TextMode="MultiLine" Width="490px" Height="80px" style="text-align: left; resize:none;" /> 
                                        </td> 
                                    </tr>
                                </table>                                                                               
                           </div>                           
                           <div class="footer" style="float: right">                             
                               <asp:Button ID="btnCerrar_Modal" runat="server" Text="Cerrar" CssClass="button"/>
                           </div>
                       </asp:Panel>

                        
                            <asp:LinkButton Text="" ID = "dummylink1" runat="server" />
                            <asp:ModalPopupExtender ID="ModalPopupExtender_Borrar_No_Permiso" BehaviorID="ModalPopupExtender_Borrar_No_Permiso" runat="server"
                                PopupControlID="pnlPopup_NoPermiso" TargetControlID="dummylink1" BackgroundCssClass="modalBackground"
                                CancelControlID="btnCerrar_NoPermiso">
                            </asp:ModalPopupExtender>
                            <asp:Panel ID="pnlPopup_NoPermiso" runat="server" CssClass="modalPopup" Style="display: none">
                                <div class="header">
                                    Mensaje de Error
                                </div>
                                <div class="body">
                                    <asp:Label ID="Label1" runat="server" Text="El usuario no posee permiso para seleccionar el botón de borrar"></asp:Label>
                                    <br />
                                    <asp:Button ID="btnCerrar_NoPermiso" runat="server" Text="Cerrar" />
                                </div>
                            </asp:Panel>


                           <asp:LinkButton Text="" ID = "dummylink2" runat="server" />
                           <asp:ModalPopupExtender ID="ModalPopupExtender_Error" BehaviorID="ModalPopupExtender_Error" runat="server"
                                PopupControlID="pnlPopup_Error" TargetControlID="dummylink2" BackgroundCssClass="modalBackground"
                                CancelControlID="btnCerrar_Error">
                            </asp:ModalPopupExtender>
                            <asp:Panel ID="pnlPopup_Error" runat="server" CssClass="modalPopup" Style="display: none">
                                <div class="header">
                                    Mensaje de Alerta
                                </div>
                                <div class="body">
                                    <asp:Label ID="Label2" runat="server" Text="Hubo un problema en eliminar los elementos. Porfavor revisar la selección."></asp:Label>
                                    <br />
                                    <asp:Button ID="btnCerrar_Error" runat="server" Text="Cerrar" />
                                </div>
                            </asp:Panel>

        </div>
                </ContentTemplate>
                  <Triggers>
                        <asp:PostBackTrigger ControlID="btnBorrar" />
                  </Triggers>
            </asp:UpdatePanel>

    </div>
    
    
</asp:Content>
