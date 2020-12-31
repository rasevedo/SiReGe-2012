<%@ Page Title="Casos" Language="vb" AutoEventWireup="false"  MasterPageFile="~/MasterPage.Master" CodeBehind="Casos.aspx.vb" Inherits="CapPresentacionSiReGe.Casos" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">   
    <link href="Estilo.css" rel="stylesheet" />
   
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
                                        <asp:Button Text="Nuevo" ID="btnAgregar"  Width="170px" runat="server" OnClick="Button1_Click" />
                                        <asp:Button Text="Borrar" ID="btnBorrar"  Width="170px" runat="server" OnClick="Button3_Click" />
                                        <asp:Button Text="Exportar" ID="btnExportar"  Width="170px" runat="server" OnClick="Button2_Click" />
                                        <asp:Button Text="Volver" ID="btnVolver"  Width="170px" runat="server" OnClick="Button4_Click" />
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-0">
                                    <div class="form-group">
                                        <br />

                                    </div>
                                </div>
                             </div> 
                           
                
                   <div id="grdCharges" runat="server"  style="width: 1209px; overflow: auto; height: 450px">

                       <asp:GridView ID="GridViewCasos" runat="server" CellPadding="10" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="2px" AutoGenerateColumns="False" DataKeyNames="intIdCasos" AllowPaging="True" AllowSorting="True" CellSpacing="10" HorizontalAlign="Center" style="margin-left: 14px" Width="2422px">
                           <Columns>
                               <asp:buttonfield buttontype="Button" commandname="Select" text="Detalle"/>
                               <asp:HyperLinkField Text="Modificar" DataNavigateUrlFields="intIdCasos" DataNavigateUrlFormatString="Modificar_Casos.aspx?intIdCasos={0}" />
                               <asp:TemplateField>
                                   <HeaderTemplate>
                                        <asp:CheckBox ID="checkAll" runat="server" onclick = "checkAll(this);" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect" runat="server" onclick="GridCheckOne(this)"></asp:CheckBox>
                                    </ItemTemplate>
                               </asp:TemplateField>    
                               <asp:BoundField DataField="intIdCasos" HeaderText="Codigo Casos" ReadOnly="True" InsertVisible="False" ></asp:BoundField>
                               <asp:BoundField DataField="vchNumeroCasos" HeaderText="Numero de Caso"></asp:BoundField>
                               <asp:BoundField DataField="vchEstadoCasos" HeaderText="Estado de los Casos" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaCasos" HeaderText="Fecha Caso" ></asp:BoundField>
                               <asp:BoundField DataField="intCedulaDenuncianteCasos" HeaderText="Cédula del Usuario" ></asp:BoundField>
                               <asp:BoundField DataField="vchNombreDenucianteCasos" HeaderText="Nombre del Usuario" ></asp:BoundField>
                               <asp:BoundField DataField="vchNombreEmpleados" HeaderText="Funcionario que Tramita" ></asp:BoundField>
                               <asp:BoundField DataField="vchNombreCentroEducativo" HeaderText="Nombre del Centro Educativo" ></asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionUnidad" HeaderText="Descripción Unidad" ></asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionDespacho" HeaderText="Descripción Despacho" ></asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionDireccion" HeaderText="Descripción Direccion" ></asp:BoundField>
                               <asp:BoundField DataField="vchdescripcionDepartamento" HeaderText="Descripción Departamento" ></asp:BoundField>
                               <asp:BoundField DataField="vchNumeroOficio" HeaderText="Numero del Oficio" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaOficio" HeaderText="Fecha del Oficio" ></asp:BoundField>
                               <asp:BoundField DataField="vchTipoDimension" HeaderText="Dimension" ></asp:BoundField>
                               <asp:BoundField DataField="vchLetraDimension" HeaderText="Letra Dimension" ></asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionTipoDimension" HeaderText="Detalle Dimension" ></asp:BoundField>
                               <asp:BoundField DataField="vchCondicionCasos" HeaderText="Condición Casos" ></asp:BoundField>
                               <asp:BoundField DataField="vchDetalleInconformidadCasos" HeaderText="Detalle de Inconformidad" ></asp:BoundField>
                               <asp:BoundField DataField="vchRespuestaCasos" HeaderText="Respuesta" ></asp:BoundField>
                               <asp:BoundField DataField="vchValoracionAdmisibilidad" HeaderText="Valoracion de Admisibilidad" ></asp:BoundField>
                               <asp:BoundField DataField="vchVeredictoValoracionIngreso" HeaderText="Veredicto de Valoracion de Ingreso" ></asp:BoundField>
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

                       <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:bda_SIREGE_Connection %>' SelectCommand="mostrarCasos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                   
                       <script type = "text/javascript">
                           function checkAll(objRef) {
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

                       <asp:LinkButton Text="" ID = "lnkFake" runat="server" />
                        <asp:ModalPopupExtender ID="mpe" runat="server" PopupControlID="pnlPopup" TargetControlID="lnkFake"
                        CancelControlID="btnClose" BackgroundCssClass="modalBackground">
                        </asp:ModalPopupExtender>
                       
                       <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none" ScrollBars="Vertical" Height="590px" >
                           <div class="header">
                               Detalles del Caso
                           </div>
                           <div class="body">
                               <table border="0">
                                   <tr>
                                       <td> 
                                           
                                       </td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text="Codigo de Caso"></asp:Label>
                                           <asp:TextBox ID="txtId_Caso" runat="server" Enabled="false" style="text-align: center"/>
                                        </td>
                                       <td> 
                                           
                                       </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>Número de Caso: </b>
                                            <asp:TextBox ID="txtNumCaso" runat="server" Enabled="false" style="text-align: center" />
                                        </td>
                                        <td>
                                            <b>Estado del Caso: </b>
                                            <asp:TextBox ID="txtEstadoCaso" runat="server" Enabled="false" style="text-align: center"/>
                                        </td>
                                        <td>
                                            <b>Fecha del Caso: </b>
                                            <asp:TextBox ID="txtFechaCaso" runat="server" Enabled="false" style="text-align: center" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>Cédula del Usuario: </b>
                                            <asp:TextBox ID="txtCedulaUsuario" runat="server" Enabled="false" style="text-align: center" />
                                        </td>
                                        <td>
                                            <b>Nombre del Usuario: </b>
                                            <asp:TextBox ID="txtNombreUsuario" runat="server" Enabled="false" style="text-align: center"/>
                                        </td> 
                                        <td>
                                            
                                        </td>
                                    </tr>
                                </table>

                               <table border="0">
                                   <tr>
                                       <td>
                                            <b>Funcionario que tramita: </b>
                                            <asp:TextBox ID="txtempleado" runat="server" Enabled="false" size="100" style="text-align: center" />
                                        </td>
                                   </tr>
                                    <tr>
                                        <td>
                                            <b>Nombre del Centro Educativo: </b>
                                            <asp:TextBox ID="txtCE" runat="server" Enabled="false" size="100" style="text-align: center" />
                                        </td> 
                                    </tr>                                 
                                    <tr>
                                        <td>
                                            <b>Descripción de Unidad: </b>
                                            <asp:TextBox ID="txtUnidad" runat="server" Enabled="false" size="100" style="text-align: center" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>Descripción de Despacho: </b>
                                            <asp:TextBox ID="txtDespacho" runat="server" Enabled="false" size="100" style="text-align: center" />
                                        </td>
                                    </tr>
                                   <tr>
                                        <td>
                                            <b>Descripción de Dirección: </b>
                                            <asp:TextBox ID="txtDireccion" runat="server" Enabled="false" size="100" style="text-align: center" />
                                        </td>
                                    </tr>
                                   <tr>
                                        <td>
                                            <b>Descripción de Departamento: </b>
                                            <asp:TextBox ID="txtDepartamento" runat="server" Enabled="false" size="100" style="text-align: center" />
                                        </td>
                                    </tr>
                                   <tr>
                                        <td>
                                            <b>Dimensión: </b>
                                            <asp:TextBox ID="txtDimension" runat="server" Enabled="false"  size="100" style="text-align: center"/>
                                        </td>
                                    </tr>
                                   <tr>
                                       <td>
                                            <b>Letra de Dimensión: </b>
                                             <asp:TextBox ID="txtLetraDim" runat="server" Enabled="false" style="text-align: center" />
                                        </td>
                                    </tr>
                                   <tr>
                                        <td>
                                            <b>Detalle de la Dimensión: </b>
                                            <asp:label ID="lblDetalleDim" runat="server" backcolor="#f8f8f8" borderwidth="1px" />
                                        </td>
                                    </tr>
                                   </table>

                               <table border="0">
                                   <tr>
                                        <td>
                                            <b>Número de Oficio: </b>
                                            <asp:TextBox ID="txtNumOficio" runat="server" Enabled="false" style="text-align: center"/>
                                        </td>
                                        <td>
                                            <b>Fecha del Oficio: </b>
                                            <asp:TextBox ID="txtFechaOficio" runat="server" Enabled="false" style="text-align: center" />
                                        </td>
                                       <td>
                                           <b>Condición del Caso: </b>
                                           <asp:TextBox ID="txtCondicionCaso" runat="server" Enabled="false" style="text-align: center" />
                                        </td>
                                    </tr>
                                   </table>

                                  <table border="0">
                                   <tr>
                                        <td>
                                             <b>Detalle de Inconformidad: </b>
                                             <asp:Label ID="lblDetalleInconformidad" runat="server" backcolor="#f8f8f8" borderwidth="1px"  />                                        
                                        </td>
                                    </tr>
                                   <tr>   
                                        <td>
                                            <b>Respuesta del Caso: </b>
                                            <asp:Label ID="lblRespuesta_Caso" runat="server" backcolor="#f8f8f8" borderwidth="1px" />
                                        </td>  
                                    </tr>                                
                               </table>
                               <table border="0">
                                   <tr>
                                        <td>
                                            <b>Fecha de Respuesta: </b>
                                            <asp:TextBox ID="txtFechaRespuesta" runat="server" Enabled="false" size="100" style="text-align: center" />
                                        </td>
                                    </tr>
                                   <tr>
                                        <td>
                                            <b>Valoración de Admisibilidad: </b>
                                            <asp:TextBox ID="txtValoracionAdmisibilidad" runat="server" Enabled="false" size="100" style="text-align: center" />
                                        </td>
                                    </tr>
                                   <tr>
                                        <td>
                                            <b>Veredicto de Valoración de Ingreso: </b>
                                            <asp:TextBox ID="txtVeredicto" runat="server" Enabled="false" size="100" style="text-align: center" />
                                        </td>
                                    </tr>
                                   <tr>
                                        <td>
                                            <b>Trazabilidad: </b>
                                            <asp:TextBox ID="txtTrazabilidad" runat="server" Enabled="false" size="100" style="text-align: center" />
                                        </td>
                                    </tr>
                                   <tr>
                                        <td>
                                            <b>Fecha de Cerrado: </b>
                                            <asp:TextBox ID="txtFechaCerrado" runat="server" Enabled="false" size="100" style="text-align: center" />
                                        </td>
                                    </tr>
                                </table>

                           </div>
                           
                           <div class="footer" style="float: right">
                               <asp:Button Text="Exportar Información" ID="btnExportarWord" runat="server" CssClass="button" OnClick="ExportarWord_Click" />
                               <asp:Button ID="btnClose" runat="server" Text="Cerrar" CssClass="button"/>
                           </div>
                       </asp:Panel>
                   
                   
                   </div>


                </div>

    </div>

    
</asp:Content>
