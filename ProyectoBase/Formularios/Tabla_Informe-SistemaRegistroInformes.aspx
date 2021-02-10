<%@ Page Title="Tabla_Informes-SistemaRegistroGestiones" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="Tabla_Informe-SistemaRegistroInformes.aspx.vb" Inherits="CapPresentacionSiReGe.Tabla_Informes" EnableEventValidation="false" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %> 

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>Tabla_Informes-SistemaRegistroGestiones</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">  
    <link href="Estilo.css" rel="stylesheet" />
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


    <div class="row">
        <div class="col-lg-12" style="left: 0px; top: 20px; width: 1438px">
            <header class="panel-heading">
                <div class="col-md-5 col-md-offset-3">
                    <h1>&nbsp;&nbsp;&nbsp;&nbsp; Sistema de Informes</h1>
                </div>
            </header>
        </div>

        <div class="panel-body">

                            <div class="row">
                                 <div class="col-md-2 col-md-offset--1">
                                    <div class="form-group">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button Text="Nuevo" ID="btnAgregar"  Width="85px" Height="45px" runat="server" OnClick="btnAgregar_Click" />
                                        <asp:Button Text="Borrar" ID="btnBorrar"  Width="85px" Height="45px" runat="server" OnClick="btnBorrar_Click" />
                                        <asp:Button Text="Volver" ID="btnVolver" Width="85px" Height="45px" runat="server" OnClick="btnVolver_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnBuscador" runat="server" Width="85px" Height="45px" Text="Buscador" OnClick="btnBuscador_Click"/>
                                        <asp:Button ID="btnBitacora" runat="server" Width="85px" Height="45px" Text="Bitacora" OnClick="btnBitacora_Click"/>
                                        <asp:Button Text="Exportar" ID="btnExportar"  Width="85px" Height="45px" runat="server" OnClick="btnExportar_Click" />                                      
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-0">
                                    <div class="form-group">
                                        <br />

                                    </div>
                                </div>
                             </div> 

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
           

                    <asp:UpdatePanel runat="server" id="UpdatePanelTabla" updatemode="Conditional">  
                    <ContentTemplate>
                   <div id="grdCharges" runat="server"  style="width: 1221px; overflow: auto; height: 450px">
                       
                       <asp:GridView ID="gvwInforme" runat="server" CellPadding="10" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="2px" AutoGenerateColumns="False" DataKeyNames="intIdInforme" AllowPaging="True" AllowSorting="True" CellSpacing="10" HorizontalAlign="Center" style="margin-left: 9px" Width="1199px">
                           <Columns>
                               <asp:buttonfield buttontype="Button" commandname="Select" text="Detalle"/>
                               <asp:HyperLinkField Text="Modificar" DataNavigateUrlFields="intIdInforme" DataNavigateUrlFormatString="Modificar_Informes-SistemaRegistroGestiones.aspx?intIdInforme={0}" />
                               <asp:TemplateField>
                                   <HeaderTemplate>
                                        <asp:CheckBox ID="chkTodo" runat="server" onclick = "checkTodo(this);" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSeleccionar" runat="server"></asp:CheckBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                               <asp:BoundField DataField="intIdInforme" HeaderText="Número del informe" ReadOnly="True" InsertVisible="False" ></asp:BoundField>
                               <asp:BoundField DataField="vchTituloInforme" HeaderText="Título del informe" ></asp:BoundField>
                               <asp:BoundField DataField="vchNombreFuncionario" HeaderText="Funcionario que tramita" ></asp:BoundField>
                               <asp:BoundField DataField="vchTipoInforme" HeaderText="Tipo de informe" ></asp:BoundField>
                               <asp:BoundField DataField="vchNumeroOficio" HeaderText="Número del oficio" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaAprobacion" HeaderText="Fecha de aprobación" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaCulminacion" HeaderText="Fecha de culminación" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaTraslado" HeaderText="Fecha de traslado" ></asp:BoundField>
                               <asp:BoundField DataField="vchAvanceInforme" HeaderText="Avance" ></asp:BoundField>
                               <asp:BoundField DataField="vchRemitido" HeaderText="Remitido a" HtmlEncode="false" ></asp:BoundField>
                               <asp:BoundField DataField="vchHallazgo" HeaderText="Hallazgos" HtmlEncode="false" ></asp:BoundField>
                               <asp:BoundField DataField="vchRecomendaciones" HeaderText="Recomendaciones" HtmlEncode="false" ></asp:BoundField>
                               <asp:BoundField DataField="vchObservaciones" HeaderText="Observaciones generales" HtmlEncode="false" ></asp:BoundField>
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
                                           inputList[i].checked = false;
                                       }
                                   }
                               }
                           }
                      </script> 

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
                                          <asp:Label ID="lblPop_Id_Informe" runat="server" Text="Número de informe:"></asp:Label> 
                                       </td>
                                        <td>               
                                           <asp:TextBox ID="txtPop_Id_Informe" runat="server" Enabled="false" size="70" style="text-align: left"/>
                                        </td>
                                    </tr>
                                   </table>
                               
                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                          <b>Título del informe: </b>
                                       </td>
                                        <td>               
                                           <asp:TextBox ID="txtPop_Titulo_Informe" runat="server" Enabled="false" size="72" style="text-align: left"  />
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
                                          <b>Tipo de informe: </b>
                                       </td>
                                        <td>               
                                           <asp:TextBox ID="txtPop_Tipo_Informe" runat="server" Enabled="false" size="73" style="text-align: left" />
                                        </td>
                                    </tr>
                                   </table>
                               
                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                          <b>Número de oficio: </b>
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
    </div>
   
</asp:Content>