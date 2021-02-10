<%@ Page Title="Tabla_Gestiones-SistemaRegistroGestiones" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master"  CodeBehind="Tabla_Gestiones-SistemaRegistroGestiones.aspx.vb" Inherits="CapPresentacionSiReGe.Tabla_Gestiones" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %> 

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>Tabla_Gestiones-SistemaRegistroGestiones</title>
    <style type="text/css">
        .auto-style2 {
            position: relative;
            width: 1142px;
            -ms-flex: 0 0 100%;
            flex: 0 0 100%;
            max-width: 100%;
            left: 0px;
            top: 10px;
            padding-left: 15px;
            padding-right: 15px;
        }
        .auto-style3 {
            width: 1023px;
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
                    <h1 class="auto-style3">&nbsp;&nbsp; Sistema de Gestiones</h1>
                </div>
            </header>
        </div>


    
        <div class="panel-body">

                            <div class="row">
                                 <div class="col-md-2 col-md-offset--1">
                                    <div class="form-group">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button Text="Nuevo" ID="btnAgregar"  Width="85px" Height="45px" runat="server" OnClick="btnAgregar_Click" />
                                        <asp:Button Text="Borrar" ID="btnBorrar"  Width="85px" Height="45px" runat="server" OnClick="btnBorrar_Click" />
                                        <asp:Button Text="Volver" ID="btnVolver"  Width="85px" Height="45px" runat="server" OnClick="btnVolver_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnBuscar_TipoGestion" runat="server" Width="85px" Height="45px" Text="Buscador" OnClick="btnBuscar_TipoGestion_Click"/>
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
                        

                  <asp:UpdatePanel runat="server" id="UpdatePanel1" updatemode="Conditional">  
                    <ContentTemplate> 
                   <div id="grdCharges" runat="server" style="width: 1209px; overflow: auto; height: 450px; margin-left: 8px;" >                                     
                           
                           <asp:GridView ID="gvwGestiones" runat="server" CellPadding="10" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="2px" AutoGenerateColumns="False" DataKeyNames="intIdGestiones" AllowSorting="True" CellSpacing="10" HorizontalAlign="Center" Width="50%" >
                           <Columns>
                               <asp:buttonfield buttontype="Button" runat="server" commandname="Select" text="Detalle" />
                               <asp:HyperLinkField Text="Modificar" DataNavigateUrlFields="intIdGestiones" DataNavigateUrlFormatString="Modificar_Gestiones-SistemaRegistroGestiones.aspx?intIdGestiones={0}" />
                               <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkTodo" runat="server" onclick = "chkTodo(this);" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect" runat="server"></asp:CheckBox>
                                    </ItemTemplate>
                               </asp:TemplateField>                                                            
                               <asp:BoundField DataField="intIdGestiones" HeaderText="Número de gestión"    >
                                   <HeaderStyle HorizontalAlign="Center" />
                               </asp:BoundField>
                               <asp:BoundField DataField="vchTipoGestiones" HeaderText="Tipo de gestión"  >
                                   <ControlStyle Width="200px"></ControlStyle>
                                   <HeaderStyle Width="200px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="intCedulaUsuario" HeaderText="Cédula del denunciante"  >
                                   <ControlStyle Width="200px"></ControlStyle>
                                   <HeaderStyle Width="200px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchNombreUsuario" HeaderText="Nombre del denunciante"  >
                                   <ControlStyle Width="200px"></ControlStyle>
                                   <HeaderStyle Width="200px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="dtiFechaIngreso" HeaderText="Fecha de ingreso"  HeaderStyle-Width="120px"> 
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchConfidencialidadGestiones" HeaderText="Confidencialidad"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchFuenteGeneradora" HeaderText="Fuente generadora"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchTipoServicio" HeaderText="Tipo de servicio"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchNombreFuncionario" HeaderText="Funcionario que tramita"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchDireccionRegional" HeaderText="Dirección regional de educación"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchSupervicionGestiones" HeaderText="Supervisión"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchNombreCentroEducativo" HeaderText="Nombre del centro educativo"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionUnidad" HeaderText="Descripción unidad"  HeaderStyle-Width="120px" ValidateRequestMode="Inherit"  >
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionDespacho" HeaderText="Descripción despacho" HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionDireccion" HeaderText="Descripción dirección"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchdescripcionDepartamento" HeaderText="Descripción departamento" HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchNumeroOficio" HeaderText="Número de oficio"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchTipoDimension" HeaderText="Dimensión"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchLetraDimension" HeaderText="Letra dimensión" HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionLetraDimension" HeaderText="Detalle de la dimensión"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchTipoUsuario" HeaderText="Tipo de usuario" HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchDetalleGestiones" HeaderText="Detalle de gestiones"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>                                 
                               <asp:BoundField DataField="vchRespuestaGestiones" HeaderText="Respuesta de gestiones" HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                           </Columns>                         
                            <FooterStyle BackColor="#00A0E3" ForeColor="White" />
                            <PagerStyle BackColor="#00A0e3" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" Width="200px" Wrap="True" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#00A0e3" ForeColor="White" HorizontalAlign="Center" Width="150px" Wrap="False" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                       </asp:GridView>                     
                       <asp:SqlDataSource runat="server" ID="sdsGridView_Gestiones" ConnectionString='<%$ ConnectionStrings:bda_SIREGE_Connection %>' SelectCommand="mostrarGestiones" SelectCommandType="StoredProcedure" ></asp:SqlDataSource>                  
                       
                    
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
                     
                     

                        <asp:LinkButton Text="" ID = "lnkFalso" runat="server" />
                        <asp:ModalPopupExtender ID="mpeDetalles" runat="server" PopupControlID="pnlPopup" TargetControlID="lnkFalso"
                        CancelControlID="btnCerrar_Modal" BackgroundCssClass="modalBackground">
                        </asp:ModalPopupExtender>

                       <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none" ScrollBars="Vertical" Height="590px" >
                           <div class="header">
                               Detalles de la Gestión
                           </div>
                           <div class="body">
                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <asp:Label ID="lblPop_Id_Gestiones" runat="server" Text="Número de gestión:" style="text-align: left"></asp:Label>    
                                       </td>
                                        <td>
                                           <asp:Textbox ID="txtSPop_Id_Gestiones" runat="server" Enabled="False" size="64" style="text-align: left" CssClass="Label" Font-Bold="False" Font-Size="Small"/>
                                        </td>
                                    </tr>
                                </table>

                               <table border="0" style="width:100%">
                                    <tr>
                                        <td>
                                            <b>Tipo de gestión: </b>
                                            
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Tipo_Gestiones" runat="server" Enabled="false" size="74" style="text-align: left" /> 
                                        </td>
                                        
                                    </tr>
                                </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Cédula del denunciante: </b>
                                           
                                       </td>
                                            
                                        <td>
                                           <asp:TextBox ID="txtPop_Cedula_Usuario" runat="server" Enabled="false" size="67" style="text-align: left"/>
                                        </td>
                                       
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Nombre del denunciante: </b>
                                            
                                       </td>                                            
                                        <td>
                                           <asp:TextBox ID="txtPop_Nombre_Usuario" runat="server" Enabled="false" size="65" style="text-align: left" />
                                        </td>
                                       
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                    <tr>
                                        <td>
                                            <b>Fecha de ingreso: </b>
                                            
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Fecha_Ingreso" runat="server" Enabled="false" size="73" style="text-align: left" /> 
                                        </td> 
                                        
                                    </tr>

                                   <tr>
                                       <td> 
                                            <b>Confidencialidad: </b>
                                            
                                       </td>
                                        <td>
                                          <asp:TextBox ID="txtPop_Confidencialida" runat="server" Enabled="false" size="73" style="text-align: left"/>
                                        </td>
                                       
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Supervisión: </b>
                                            
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Supervision" runat="server" Enabled="false" size="78" style="text-align: left" />
                                        </td>
                                       
                                    </tr>
                                </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td>
                                            <b>Fuente generadora: </b>                                            
                                        </td>
                                       <td>
                                           <asp:TextBox ID="txtPop_Fuente_Generadora" runat="server" Enabled="false" size="71" style="text-align: left" />
                                        </td>                                     
                                   </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                    <tr>
                                        <td>
                                            <b>Tipo de servicio: </b>                                            
                                        </td> 
                                        <td>
                                           <asp:TextBox ID="txtPop_Tipo_Servicio" runat="server" Enabled="false" size="74" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                    </table>

                               <table border="0" style="width:100%">
                                    <tr>
                                        <td>
                                            <b>Funcionario que tramita: </b>                                           
                                        </td> 
                                        <td>
                                          <asp:TextBox ID="txtPop_Empleado" runat="server" Enabled="false" size="66"  style="text-align: left" /> 
                                        </td>                                     
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                    <tr>
                                        <td>
                                            <b>Dirección regional de educación: </b>                                   
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Regional" runat="server" Enabled="false" size="58" style="text-align: left" />
                                        </td>
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                    <tr>
                                        <td>
                                            <b>Nombre del centro educativo: </b>
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_CE" runat="server" Enabled="false" size="61" style="text-align: left" />
                                        </td>
                                    </tr>
                                   </table>

                                    <table border="0" style="width:100%">
                                    <tr>
                                        <td>
                                            <b>Descripción de unidad: </b>
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Unidad" runat="server" Enabled="false" size="68" style="text-align: left" />
                                        </td> 
                                    </tr>
                                    </table>

                               <table border="0" style="width:100%">
                                    <tr>
                                        <td>
                                            <b>Descripción de despacho: </b>
                                            
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Despacho" runat="server" Enabled="false" size="65"  style="text-align: left" />
                                        </td>
                                       
                                    </tr>
                                </table>

                               <table border="0" style="width:100%">
                                   <tr>

                                        <td>
                                            <b>Descripción de dirección: </b>
                                            
                                        </td>
                                       <td>
                                           <asp:TextBox ID="txtPop_Direccion" runat="server" Enabled="false" size="65"  style="text-align: left" />
                                        </td>
                                       
                                    </tr>
                                </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                        <td>
                                            <b>Descripción de departamento: </b>
                                            
                                        </td>
                                       <td>
                                          <asp:TextBox ID="txtPop_Departamento" runat="server" Enabled="false" size="60"  style="text-align: left" /> 
                                        </td>   
                                    </tr>
                                </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                        <td>
                                            <b>Dimensión: </b>  
                                        </td>
                                       <td>
                                          <asp:TextBox ID="txtPop_Dimension" runat="server" Enabled="false" size="78"  style="text-align: left"/> 
                                        </td>
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td>
                                            <b>Letra de dimensión: </b> 
                                        </td>
                                       <td>
                                           <asp:TextBox ID="txtPop_Letra_Dimension" runat="server" Enabled="false" size="70" style="text-align: left" />
                                        </td>
                                    </tr>
                                </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                        <td>
                                            <b>Detalle de la dimensión: </b>
                                        </td>
                                       <td>
                                          <asp:TextBox ID="txtPop_Detalle_Dimension" runat="server" Enabled="false" TextMode="MultiLine" Width="490px" Height="80px" style="text-align: left; resize:none;" /> 
                                        </td>                                                                                                                           
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                        <td>
                                            <b>Número de oficio: </b>
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Num_Oficio" runat="server" Enabled="false" size="72" style="text-align: left"/> 
                                        </td>
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                        <td>
                                            <b>Tipo de usuario: </b>
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Tipo_Usuario" runat="server" Enabled="false" size="74" style="text-align: left" />
                                        </td>                                       
                                    </tr>
                                   </table>

                                  <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                          <b>Detalle de la gestión:       </b> 
                                       </td>
                                        <td>                                      
                                             <asp:TextBox ID="txtPop_Detalle_Gestion" runat="server" Enabled="false" TextMode="MultiLine" Width="515px" Height="80px" style="text-align: left; resize:none;" />                                        
                                        </td>                                   
                                    </tr>
                                 </table>

                               <table border="0" style="width:100%">
                                   <tr>   
                                       <td> 
                                           <b>Respuesta de la gestión: </b>
                                       </td>
                                        <td>                                            
                                            <asp:TextBox ID="txtPop_Respuesta_Gestion" runat="server" Enabled="false" TextMode="MultiLine" Width="490px" Height="80px" style="text-align: left; resize:none;" />
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

