<%@ Page Title="Tabla_Casos-SistemaRegistroGestiones" Language="vb" AutoEventWireup="false"  MasterPageFile="~/MasterPage.Master" CodeBehind="Tabla_Casos-SistemaRegistroGestiones.aspx.vb" Inherits="CapPresentacionSiReGe.Tabla_Casos" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>Tabla_Casos-SistemaRegistroGestiones</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">   
    <link href="Estilo.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <div class="row">

        <div class="col-lg-12" style="left: 0px; top: 20px; width: 1438px">
            <header class="panel-heading">
                <div class="col-md-5 col-md-offset-3">
                    <h1>&nbsp;&nbsp;&nbsp;&nbsp; Sistema de Casos</h1>
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
                                        <asp:Button Text="Volver" ID="btnVolver"  Width="85px" Height="45px" runat="server" OnClick="btnVolver_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnBuscador" runat="server" Width="85px" Height="45px" Text="Buscador" OnClick="btnBuscador_Click"/>
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
                   <div id="grdCharges" runat="server"  style="width: 1209px; overflow: auto; height: 450px">
                       
                       <asp:GridView ID="gvwCasos" runat="server" CellPadding="10" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="2px" AutoGenerateColumns="False" AllowSorting="True" CellSpacing="10" HorizontalAlign="Center" Style="margin-left: 14px" Width="2422px" DataKeyNames="intIdCasos" >
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
                                        <asp:Button ID="btnEditar" runat="server" Text="Modificar" OnClick="btnEditar_Click" CommandArgument='<%#Eval("intIdCasos") %>' />
                                   </ItemTemplate>
                               </asp:TemplateField>    
                               <asp:BoundField DataField="intIdCasos" HeaderText="" ReadOnly="True" InsertVisible="True" Visible="False" ></asp:BoundField>
                               <asp:BoundField DataField="vchNumeroCasos" HeaderText="Número de caso" ></asp:BoundField>
                               <asp:BoundField DataField="vchEstadoCasos" HeaderText="Estado del caso" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaCasos" HeaderText="Fecha de ingreso" ></asp:BoundField>
                               <asp:BoundField DataField="intCedulaDenuncianteCasos" HeaderText="Cédula del denunciante" ></asp:BoundField>
                               <asp:BoundField DataField="vchNombreDenucianteCasos" HeaderText="Nombre del denuciante" ></asp:BoundField>
                               <asp:BoundField DataField="vchNombreFuncionario" HeaderText="Nombre del funcionario" ></asp:BoundField>
                               <asp:BoundField DataField="vchNombreCentroEducativo" HeaderText="Nombre del centro educativo" ></asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionUnidad" HeaderText="Descripción unidad"></asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionDespacho" HeaderText="Descripción despacho" ></asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionDireccion" HeaderText="Descripción dirección" ></asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionDepartamento" HeaderText="Descripción departamento" ></asp:BoundField>
                               <asp:BoundField DataField="vchNumeroOficio" HeaderText="Número del oficio" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaOficio" HeaderText="Fecha del oficio" ></asp:BoundField>
                               <asp:BoundField DataField="vchTipoDimension" HeaderText="Dimensión" ></asp:BoundField>
                               <asp:BoundField DataField="vchLetraDimension" HeaderText="Letra dimensión" ></asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionLetraDimension" HeaderText="Descripcion de la dimensión"></asp:BoundField>
                               <asp:BoundField DataField="vchCondicionCasos" HeaderText="Usuario" ></asp:BoundField>
                               <asp:BoundField DataField="vchDetalleInconformidadCasos" HeaderText="Detalle de inconformidad del caso" ></asp:BoundField>
                               <asp:BoundField DataField="vchRespuestaCasos" HeaderText="Respuesta del caso" ></asp:BoundField>
                               <asp:BoundField DataField="vchValoracionAdmisibilidad" HeaderText="Valoración de admisibilidad" ></asp:BoundField>
                               <asp:BoundField DataField="vchVeredictoValoracionIngreso" HeaderText="Veredicto de Valoración de ingreso" ></asp:BoundField>
                               <asp:BoundField DataField="vchTrazabilidadCasos" HeaderText="Trazabilidad" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaRespuestaCasos" HeaderText="Fecha de respuesta del caso" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaCerradoCasos" HeaderText="Fecha de cerrado" ></asp:BoundField>
                               <asp:BoundField DataField="dtiCasoAvanceFecha1" HeaderText="Fecha del avance 1" ></asp:BoundField>
                               <asp:BoundField DataField="vchCasoAvance1" HeaderText="Detalle del avance 1" ></asp:BoundField>
                               <asp:BoundField DataField="dtiCasoAvanceFecha2" HeaderText="Fecha del avance 2" ></asp:BoundField>
                               <asp:BoundField DataField="vchCasoAvance2" HeaderText="Detalle del avance 2" ></asp:BoundField>
                               <asp:BoundField DataField="dtiCasoAvanceFecha3" HeaderText="Fecha del avance 3" ></asp:BoundField>
                               <asp:BoundField DataField="vchCasoAvance3" HeaderText="Detalle del avance 3" ></asp:BoundField>
                               <asp:BoundField DataField="dtiCasoAvanceFecha4" HeaderText="Fecha del avance 4" ></asp:BoundField>
                               <asp:BoundField DataField="vchCasoAvance4" HeaderText="Detalle del avance 4" ></asp:BoundField>
                           </Columns>
                            <RowStyle Width="250px" BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                            <FooterStyle BackColor="#00A0E3" ForeColor="White" />
                            <PagerStyle BackColor="#00A0e3" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#00A0e3" ForeColor="White" HorizontalAlign="Center" Width="250px" Wrap="False" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />                      
                       </asp:GridView>                   
                       <asp:SqlDataSource runat="server" ID="sdsGridView_Casos" ConnectionString='<%$ ConnectionStrings:bda_SIREGE_Connection %>' SelectCommand="palMostrarCasos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                   
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
                               Detalles del Caso
                           </div>
                           <div class="body">

                               <table border="0" style="width:100%">
                                    <tr>
                                       <td> 
                                           <b>Número de caso: </b>                                           
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Num_Caso" runat="server" Enabled="false" size="73" style="text-align: left" /> 
                                        </td>                                      
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Estado del caso: </b>                                           
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Estado_Caso" runat="server" Enabled="false" size="74" style="text-align: left"/>
                                        </td>                                      
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Fecha de ingreso: </b>                                           
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Fecha_Caso" runat="server" Enabled="false" size="74" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Cédula del denunciante: </b>                                           
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Cedula_Usuario" runat="server" Enabled="false" size="66" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Nombre del denunciante: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Nombre_Usuario" runat="server" Enabled="false" size="64" style="text-align: left"/>
                                        </td>                                      
                                    </tr> 
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Funcionario que tramita: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Empleado" runat="server" Enabled="false" size="65" style="text-align: left" />
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
                                           <asp:TextBox ID="txtPop_Unidad" runat="server" Enabled="false" size="67" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                      </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Descripción de despacho: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Despacho" runat="server" Enabled="false" size="65" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Descripción de dirección: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Direccion" runat="server" Enabled="false" size="65" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Descripción de departamento: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Departamento" runat="server" Enabled="false" size="60" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Dimensión: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Dimension" runat="server" Enabled="false"  size="78" style="text-align: left"/>
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
                                           <b>Número del oficio: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Num_Oficio" runat="server" Enabled="false" size="71" style="text-align: left"/>
                                        </td>                                      
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Fecha del oficio: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Fecha_Oficio" runat="server" Enabled="false" size="73" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Usuario: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Condicion_Caso" runat="server" Enabled="false" size="80" style="text-align: left" />
                                        </td>                                      
                                    </tr>                               
                                   </table>

                                  <table border="0" style="width:100%">
                                   <tr>
                                        <td>
                                             <b>Detalle de inconformidad: </b>                                           
                                        </td>
                                       <td>
                                            <asp:TextBox ID="txtPop_Detalle_Inconformidad" runat="server" Enabled="false" TextMode="MultiLine" Width="480px" Height="80px" style="text-align: left; resize:none;" />                                         
                                       </td>
                                    </tr>
                                  </table>

                               <table border="0" style="width:100%">
                                   <tr>   
                                        <td>
                                            <b>Respuesta del caso: </b>  
                                        </td>                                         
                                       <td> 
                                            <asp:TextBox ID="txtPop_Respuesta_Caso" runat="server" Enabled="false" TextMode="MultiLine" Width="520px" Height="80px" style="text-align: left; resize:none;" /> 
                                        </td> 
                                    </tr>                                
                               </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Fecha de respuesta: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Fecha_Respuesta" runat="server" Enabled="false" size="70" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Valoración de admisibilidad: </b>                                         
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Valoracion_Admisibilidad" runat="server" Enabled="false" size="62" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Veredicto de valoración de ingreso: </b>                                         
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Veredicto" runat="server" Enabled="false" size="56" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Trazabilidad: </b>                                         
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Trazabilidad" runat="server" Enabled="false" size="77" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Fecha de cerrado: </b>                                         
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Fecha_Cerrado" runat="server" Enabled="false" size="72" style="text-align: left" />
                                        </td>                                      
                                    </tr>                                                                                                     
                                </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Fecha del avance 1: </b>                                         
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Fecha_Avance1" runat="server" Enabled="false" size="70" style="text-align: left" />
                                        </td>                                      
                                    </tr>                                                                                                     
                                </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                        <td>
                                             <b>Detalle del avance 1: </b>                                           
                                        </td>
                                       <td>
                                            <asp:TextBox ID="txtPop_Detalle_Avance1" runat="server" Enabled="false" TextMode="MultiLine" Width="510px" Height="80px" style="text-align: left; resize:none;" />                                         
                                       </td>
                                    </tr>
                               </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Fecha del avance 2: </b>                                         
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Fecha_Avance2" runat="server" Enabled="false" size="70" style="text-align: left" />
                                        </td>                                      
                                    </tr>                                                                                                     
                                </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                        <td>
                                             <b>Detalle del avance 2: </b>                                           
                                        </td>
                                       <td>
                                            <asp:TextBox ID="txtPop_Detalle_Avance2" runat="server" Enabled="false" TextMode="MultiLine" Width="510px" Height="80px" style="text-align: left; resize:none;" />                                         
                                       </td>
                                    </tr>
                               </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Fecha del avance 3: </b>                                         
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Fecha_Avance3" runat="server" Enabled="false" size="70" style="text-align: left" />
                                        </td>                                      
                                    </tr>                                                                                                     
                                </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                        <td>
                                             <b>Detalle del avance 3: </b>                                           
                                        </td>
                                       <td>
                                            <asp:TextBox ID="txtPop_Detalle_Avance3" runat="server" Enabled="false" TextMode="MultiLine" Width="510px" Height="80px" style="text-align: left; resize:none;" />                                         
                                       </td>
                                    </tr>
                               </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Fecha del avance 4: </b>                                         
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Fecha_Avance4" runat="server" Enabled="false" size="70" style="text-align: left" />
                                        </td>                                      
                                    </tr>                                                                                                     
                                </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                        <td>
                                             <b>Detalle del avance 4: </b>                                           
                                        </td>
                                       <td>
                                            <asp:TextBox ID="txtPop_Detalle_Avance4" runat="server" Enabled="false" TextMode="MultiLine" Width="510px" Height="80px" style="text-align: left; resize:none;" />                                         
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
                                    <asp:Label ID="Label1" runat="server" Text="El usuario no posee permiso para borrar"></asp:Label>
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
                    </asp:UpdatePanel>

                </div>

    </div>

    
</asp:Content>
