<%@ Page Title="Buscador_Casos-SistemaRegistroGestiones" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="Buscador_Casos-SistemaRegistroGestiones.aspx.vb" Inherits="CapPresentacionSiReGe.Buscador_Casos_SistemaRegistroGestiones" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>Buscador_Casos-SistemaRegistroGestiones</title>
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
                    <h1 class="auto-style3">&nbsp;&nbsp; Buscador de Casos</h1>
                </div>
            </header>
        </div>

        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNumero_Caso" Text="Número de Caso" runat="server" /></td>
                                                
                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblEstado_Casos" Text="Estado de Casos" runat="server"/></td>
                                                
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNombre_Funcionario" Text="Nombre de Funcionario" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNumero_Caso" runat="server" Enabled="true" CssClass="form-control input-sm" Height="25px" Width="273px"  /></td>
                                                        
                                                    
                                                
                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlEstado_Caso" runat="server" CssClass="form-control input-sm" Height="30px" Width="288px"  >
                                                            <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                                            <asp:ListItem Text="ABIERTO" Value="ABIERTO"></asp:ListItem>
                                                            <asp:ListItem Text="CERRADO" Value="CERRADO"></asp:ListItem>
                                                     </asp:DropDownList></td>    
                                                
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNombre_Funcionario" runat="server" CssClass="form-control input-sm" Height="25px" Width="277px" /></td>
                                                        
                                            </tr>  
                                        </table>
                                    </div>
                                </div>                  
                            </div>

                        <asp:UpdatePanel runat="server" id="UpdatePanel1" updatemode="Conditional">  
                        <ContentTemplate>
                        <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblCondicion_Casos" Text="Usuario" runat="server" /></td>
                                                
                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNombre_Denunciante" Text="Nombre del Denunciante" runat="server"/></td>
                                                
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDescripcion_Unidad" Text="Descripción Unidad" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlCondicion_Caso" runat="server" CssClass="form-control input-sm" Height="29px" Width="283px" >
                                                            <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                                            <asp:ListItem Text="EXTERNO " Value="EXTERNO"></asp:ListItem>
                                                            <asp:ListItem Text="INTERNO " Value="INTERNO"></asp:ListItem>
                                                        </asp:DropDownList></td>      
                                                                                                   
                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNombre_Denunciante" runat="server"  CssClass="form-control input-sm" Height="25px" Width="279px"  /></td>
                                                           
                                                           
                                                
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlDescripcion_Unidad" runat="server" CssClass="form-control input-sm" Height="29px" Width="283px" AutoPostBack="True" OnSelectedIndexChanged="ddlDescripcion_Unidad_SelectedIndexChanged" DataSourceID="sdsDescripcion_Unidad" DataTextField="vchDescripcionUnidad" DataValueField="intIdUnidad"></asp:DropDownList >
                                                             <asp:SqlDataSource runat="server" ID="sdsDescripcion_Unidad" ConnectionString='<%$ ConnectionStrings:bda_SIREGE_Connection %>' SelectCommand="palConsultarUnidades" SelectCommandType="StoredProcedure"></asp:SqlDataSource></td>
                                            </tr>  
                                        </table>
                                    </div>
                                </div>                  
                            </div>
                        </ContentTemplate>
                        </asp:UpdatePanel>

                  
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnBuscar_Casos" runat="server" Width="85px" Height="45px" Text="Buscar" OnClick="btnBuscar_Casos_Click"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button  ID="btnVolver" runat="server" Width="85px" Height="45px" Text="Volver" OnClick="btnVolver_Click"/>
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button Text="Borrar" ID="btnBorrar"  Width="85px" Height="45px" runat="server" OnClick="btnBorrar_Click" />
                            &nbsp;&nbsp;
                <asp:Button ID="btnBitacora" runat="server" Width="85px" Height="45px" Text="Bitacora" OnClick="btnBitacora_Click"/>
                            &nbsp;&nbsp;
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
                               <asp:BoundField DataField="vchNumeroCasos" HeaderText="Número de expediente" ></asp:BoundField>
                               <asp:BoundField DataField="vchEstadoCasos" HeaderText="Estado del expediente" ></asp:BoundField>
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
                               <asp:BoundField DataField="vchDetalleInconformidadCasos" HeaderText="Detalle de inconformidad del expediente" ></asp:BoundField>
                               <asp:BoundField DataField="vchRespuestaCasos" HeaderText="Respuesta del expediente" ></asp:BoundField>
                               <asp:BoundField DataField="vchValoracionAdmisibilidad" HeaderText="Valoración de admisibilidad" ></asp:BoundField>
                               <asp:BoundField DataField="vchVeredictoValoracionIngreso" HeaderText="Veredicto de valoración de ingreso" ></asp:BoundField>
                               <asp:BoundField DataField="vchTrazabilidadCasos" HeaderText="Trazabilidad" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaRespuestaCasos" HeaderText="Fecha de respuesta del caso" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaCerradoCasos" HeaderText="Fecha de cerrado" ></asp:BoundField>
                               <asp:BoundField DataField="dtiCasoAvanceFecha1" HeaderText="Fecha del seguimiento 1" ></asp:BoundField>
                               <asp:BoundField DataField="vchCasoAvance1" HeaderText="Detalle del seguimiento 1" ></asp:BoundField>
                               <asp:BoundField DataField="dtiCasoAvanceFecha2" HeaderText="Fecha del seguimiento 2" ></asp:BoundField>
                               <asp:BoundField DataField="vchCasoAvance2" HeaderText="Detalle del seguimiento 2" ></asp:BoundField>
                               <asp:BoundField DataField="dtiCasoAvanceFecha3" HeaderText="Fecha del seguimiento 3" ></asp:BoundField>
                               <asp:BoundField DataField="vchCasoAvance3" HeaderText="Detalle del seguimiento 3" ></asp:BoundField>
                               <asp:BoundField DataField="dtiCasoAvanceFecha4" HeaderText="Fecha del seguimiento 4" ></asp:BoundField>
                               <asp:BoundField DataField="vchCasoAvance4" HeaderText="Detalle del seguimiento 4" ></asp:BoundField>
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
                     
               </div>
               

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
                                           <b>Número del expediente: </b>                                           
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Num_Caso" runat="server" Enabled="false" size="66" style="text-align: left" /> 
                                        </td>                                      
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Estado del expediente: </b>                                           
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Estado_Caso" runat="server" Enabled="false" size="68" style="text-align: left"/>
                                        </td>                                      
                                    </tr>
                                   </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Fecha de ingreso: </b>                                           
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Fecha_Caso" runat="server" Enabled="false" size="72" style="text-align: left" />
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
                                            <b>Respuesta del expediente: </b>  
                                        </td>                                         
                                       <td> 
                                            <asp:TextBox ID="txtPop_Respuesta_Caso" runat="server" Enabled="false" TextMode="MultiLine" Width="480px" Height="80px" style="text-align: left; resize:none;" /> 
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
                                           <b>Fecha del seguimiento 1: </b>                                         
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Fecha_Avance1" runat="server" Enabled="false" size="65" style="text-align: left" />
                                        </td>                                      
                                    </tr>                                                                                                     
                                </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                        <td>
                                             <b>Detalle del seguimiento 1: </b>                                           
                                        </td>
                                       <td>
                                            <asp:TextBox ID="txtPop_Detalle_Avance1" runat="server" Enabled="false" TextMode="MultiLine" Width="480px" Height="80px" style="text-align: left; resize:none;" />                                         
                                       </td>
                                    </tr>
                               </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Fecha del seguimiento 2: </b>                                         
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Fecha_Avance2" runat="server" Enabled="false" size="65" style="text-align: left" />
                                        </td>                                      
                                    </tr>                                                                                                     
                                </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                        <td>
                                             <b>Detalle del seguimiento 2: </b>                                           
                                        </td>
                                       <td>
                                            <asp:TextBox ID="txtPop_Detalle_Avance2" runat="server" Enabled="false" TextMode="MultiLine" Width="480px" Height="80px" style="text-align: left; resize:none;" />                                         
                                       </td>
                                    </tr>
                               </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Fecha del seguimiento 3: </b>                                         
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Fecha_Avance3" runat="server" Enabled="false" size="65" style="text-align: left" />
                                        </td>                                      
                                    </tr>                                                                                                     
                                </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                        <td>
                                             <b>Detalle del seguimiento 3: </b>                                           
                                        </td>
                                       <td>
                                            <asp:TextBox ID="txtPop_Detalle_Avance3" runat="server" Enabled="false" TextMode="MultiLine" Width="480px" Height="80px" style="text-align: left; resize:none;" />                                         
                                       </td>
                                    </tr>
                               </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                       <td> 
                                           <b>Fecha del seguimiento 4: </b>                                         
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Fecha_Avance4" runat="server" Enabled="false" size="65" style="text-align: left" />
                                        </td>                                      
                                    </tr>                                                                                                     
                                </table>

                               <table border="0" style="width:100%">
                                   <tr>
                                        <td>
                                             <b>Detalle del seguimiento 4: </b>                                           
                                        </td>
                                       <td>
                                            <asp:TextBox ID="txtPop_Detalle_Avance4" runat="server" Enabled="false" TextMode="MultiLine" Width="480px" Height="80px" style="text-align: left; resize:none;" />                                         
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

    </div>
    
    
</asp:Content>
