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
                                        <asp:Button Text="Exportar Todo" ID="btnExportar"  Width="100px" Height="45px" runat="server" OnClick="btnExportar_Click" />
                                        <asp:Button Text="Volver" ID="btnVolver"  Width="85px" Height="45px" runat="server" OnClick="btnVolver_Click" />
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-0">
                                    <div class="form-group">
                                        <br />

                                    </div>
                                </div>
                             </div> 

                            <div class="row">
                                 <div class="col-md-4 col-md-offset--1">
                                    <div class="form-group">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                  
                                        <asp:Button ID="btnBuscador" runat="server" Width="85px" Height="45px" Text="Buscador" OnClick="btnBuscador_Click"/>
                                    </div>
                                </div> 
                                <div class="col-md-2 col-md-offset-0">
                                    <div class="form-group">
                                        <br />

                                    </div>
                                </div>                               
                            </div> 
                           
                
                   <div id="grdCharges" runat="server"  style="width: 1209px; overflow: auto; height: 450px">

                       <asp:GridView ID="gvwCasos" runat="server" CellPadding="10" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="2px" AutoGenerateColumns="False" DataKeyNames="intIdCasos" AllowPaging="False" AllowSorting="True" CellSpacing="10" HorizontalAlign="Center" style="margin-left: 14px" Width="2422px">
                           <Columns>
                               <asp:buttonfield buttontype="Button" commandname="Select" text="Detalle"/>
                               <asp:HyperLinkField Text="Modificar" DataNavigateUrlFields="intIdCasos" DataNavigateUrlFormatString="Modificar_Casos-SistemaRegistroGestiones.aspx?intIdCasos={0}" />
                               <asp:TemplateField>
                                   <HeaderTemplate>
                                        <asp:CheckBox ID="chkTodo" runat="server" onclick = "chkTodo(this);" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSeleccionar" runat="server" onclick="GridCheckOne(this)"></asp:CheckBox>
                                    </ItemTemplate>
                               </asp:TemplateField>    
                               <asp:BoundField DataField="intIdCasos" HeaderText="Código Casos" ReadOnly="True" InsertVisible="False" ></asp:BoundField>
                               <asp:BoundField DataField="vchNumeroCasos" HeaderText="Número de Caso"></asp:BoundField>
                               <asp:BoundField DataField="vchEstadoCasos" HeaderText="Estado de los Casos" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaCasos" HeaderText="Fecha Caso" ></asp:BoundField>
                               <asp:BoundField DataField="intCedulaDenuncianteCasos" HeaderText="Cédula del Denunciante" ></asp:BoundField>
                               <asp:BoundField DataField="vchNombreDenucianteCasos" HeaderText="Nombre del Denunciante" ></asp:BoundField>
                               <asp:BoundField DataField="vchNombreFuncionario" HeaderText="Funcionario que Tramita" ></asp:BoundField>
                               <asp:BoundField DataField="vchNombreCentroEducativo" HeaderText="Nombre del Centro Educativo" ></asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionUnidad" HeaderText="Descripción Unidad" ></asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionDespacho" HeaderText="Descripción Despacho" ></asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionDireccion" HeaderText="Descripción Dirección" ></asp:BoundField>
                               <asp:BoundField DataField="vchdescripcionDepartamento" HeaderText="Descripción Departamento" ></asp:BoundField>
                               <asp:BoundField DataField="vchNumeroOficio" HeaderText="Número de Oficio" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaOficio" HeaderText="Fecha de Oficio" ></asp:BoundField>
                               <asp:BoundField DataField="vchTipoDimension" HeaderText="Dimensión" ></asp:BoundField>
                               <asp:BoundField DataField="vchLetraDimension" HeaderText="Letra Dimensión" ></asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionTipoDimension" HeaderText="Detalle de la Dimensión" ></asp:BoundField>
                               <asp:BoundField DataField="vchCondicionCasos" HeaderText="Condición Casos" ></asp:BoundField>
                               <asp:BoundField DataField="vchDetalleInconformidadCasos" HeaderText="Detalle de Inconformidad" ></asp:BoundField>
                               <asp:BoundField DataField="vchRespuestaCasos" HeaderText="Respuesta" ></asp:BoundField>
                               <asp:BoundField DataField="vchValoracionAdmisibilidad" HeaderText="Valoración de Admisibilidad" ></asp:BoundField>
                               <asp:BoundField DataField="vchVeredictoValoracionIngreso" HeaderText="Veredicto de Valoración de Ingreso" ></asp:BoundField>
                               <asp:BoundField DataField="vchTrazabilidadCasos" HeaderText="Trazabilidad" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaRespuestaCasos" HeaderText="Fecha Respuesta del Caso" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaCerradoCasos" HeaderText="Fecha de Cerrado" ></asp:BoundField>
                           </Columns>

                           <RowStyle Width="250px" BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                            <FooterStyle BackColor="#00A0E3" ForeColor="White" />
                            <PagerStyle BackColor="#00A0e3" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#00A0e3" ForeColor="White" HorizontalAlign="Center" Width="250px" Wrap="False" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                       
                       </asp:GridView>

                       <asp:SqlDataSource runat="server" ID="sdsGridView_Casos" ConnectionString='<%$ ConnectionStrings:bda_SIREGE_Connection %>' SelectCommand="mostrarCasos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                   
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
                               <table border="0">
                                   <tr>
                                       <td> 
                                           <asp:Label ID="lblPop_Id_Caso" runat="server" Text="Código de Caso"></asp:Label>                                           
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Id_Caso" runat="server" Enabled="false" size="35" style="text-align: left"/> 
                                        </td>                                      
                                    </tr>
                                    <tr>
                                       <td> 
                                           <b>Número de Caso: </b>                                           
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Num_Caso" runat="server" Enabled="false" size="35" style="text-align: left" /> 
                                        </td>                                      
                                    </tr>
                                   <tr>
                                       <td> 
                                           <b>Estado del Caso: </b>                                           
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Estado_Caso" runat="server" Enabled="false" size="35" style="text-align: left"/>
                                        </td>                                      
                                    </tr>
                                   <tr>
                                       <td> 
                                           <b>Fecha del Caso: </b>                                           
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Fecha_Caso" runat="server" Enabled="false" size="35" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   <tr>
                                       <td> 
                                           <b>Cédula del Denunciante: </b>                                           
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Cedula_Usuario" runat="server" Enabled="false" size="35" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   <tr>
                                       <td> 
                                           <b>Nombre del Denunciante: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Nombre_Usuario" runat="server" Enabled="false" size="35" style="text-align: left"/>
                                        </td>                                      
                                    </tr> 
                                   <tr>
                                       <td> 
                                           <b>Funcionario que tramita: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Empleado" runat="server" Enabled="false" size="35" style="text-align: left" />
                                        </td>                                      
                                    </tr>                                   
                                </table>

                               <table border="0">                               
                                   <tr>
                                       <td> 
                                           <b>Nombre del Centro Educativo: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_CE" runat="server" Enabled="false" size="45" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   </table>

                                  <table border="0">
                                   <tr>
                                       <td> 
                                           <b>Descripción de Unidad: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Unidad" runat="server" Enabled="false" size="75" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   <tr>
                                       <td> 
                                           <b>Descripción de Despacho: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Despacho" runat="server" Enabled="false" size="75" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   <tr>
                                       <td> 
                                           <b>Descripción de Dirección: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Direccion" runat="server" Enabled="false" size="75" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   <tr>
                                       <td> 
                                           <b>Descripción de Departamento: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Departamento" runat="server" Enabled="false" size="75" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   <tr>
                                       <td> 
                                           <b>Dimensión: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Dimension" runat="server" Enabled="false"  size="75" style="text-align: left"/>
                                        </td>                                      
                                    </tr>
                                   <tr>
                                       <td> 
                                           <b>Letra de Dimensión: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Letra_Dimension" runat="server" Enabled="false" size="75" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                  </table>

                                 <table border="0">
                                   <tr>
                                       <td> 
                                           <b>Detalle de la Dimensión: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Detalle_Dimension" runat="server" Enabled="false" TextMode="MultiLine" Width="515px" Height="80px" style="text-align: left; resize:none;" /> 
                                        </td>                                      
                                    </tr>                                 
                                   </table>

                               <table border="0">
                                   <tr>
                                       <td> 
                                           <b>Número de Oficio: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Num_Oficio" runat="server" Enabled="false" size="50" style="text-align: left"/>
                                        </td>                                      
                                    </tr>
                                   <tr>
                                       <td> 
                                           <b>Fecha del Oficio: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Fecha_Oficio" runat="server" Enabled="false" size="50" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   <tr>
                                       <td> 
                                           <b>Condición del Caso: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Condicion_Caso" runat="server" Enabled="false" size="50" style="text-align: left" />
                                        </td>                                      
                                    </tr>                               
                                   </table>

                                  <table border="0">
                                   <tr>
                                        <td>
                                             <b>Detalle de Inconformidad: </b>                                           
                                        </td>
                                       <td>
                                            <asp:TextBox ID="txtPop_Detalle_Inconformidad" runat="server" Enabled="false" TextMode="MultiLine" Width="515px" Height="80px" style="text-align: left; resize:none;" />                                         
                                       </td>
                                    </tr>
                                  </table>

                               <table border="0">
                                   <tr>   
                                        <td>
                                            <b>Respuesta del Caso: </b>  
                                        </td>                                         
                                       <td> 
                                            <asp:TextBox ID="txtPop_Respuesta_Caso" runat="server" Enabled="false" TextMode="MultiLine" Width="515px" Height="80px" style="text-align: left; resize:none;" /> 
                                        </td> 
                                    </tr>                                
                               </table>

                               <table border="0">
                                   <tr>
                                       <td> 
                                           <b>Fecha de Respuesta: </b>                                          
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Fecha_Respuesta" runat="server" Enabled="false" size="50" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   <tr>
                                       <td> 
                                           <b>Valoración de Admisibilidad: </b>                                         
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Valoracion_Admisibilidad" runat="server" Enabled="false" size="50" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   <tr>
                                       <td> 
                                           <b>Veredicto de Valoración de Ingreso: </b>                                         
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Veredicto" runat="server" Enabled="false" size="50" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   <tr>
                                       <td> 
                                           <b>Trazabilidad: </b>                                         
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Trazabilidad" runat="server" Enabled="false" size="50" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                   <tr>
                                       <td> 
                                           <b>Fecha de Cerrado: </b>                                         
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Fecha_Cerrado" runat="server" Enabled="false" size="50" style="text-align: left" />
                                        </td>                                      
                                    </tr>                                                                                                     
                                </table>

                           </div>
                           
                           <div class="footer" style="float: right">
                               <asp:Button Text="Exportar Información" ID="btnExportar_Word" runat="server" CssClass="button" OnClick="btnExportar_Word_Click" />
                               <asp:Button ID="btnCerrar_Modal" runat="server" Text="Cerrar" CssClass="button"/>
                           </div>
                       </asp:Panel>
                   
                   
                   </div>


                </div>

    </div>

    
</asp:Content>
