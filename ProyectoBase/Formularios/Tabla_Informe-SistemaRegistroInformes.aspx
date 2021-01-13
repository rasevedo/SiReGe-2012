<%@ Page Title="Tabla_Informes-SistemaRegistroGestiones" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="Tabla_Informe-SistemaRegistroInformes.aspx.vb" Inherits="CapPresentacionSiReGe.Tabla_Informes" EnableEventValidation="false" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>Tabla_Informes-SistemaRegistroGestiones</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">  
    <link href="Estilo.css" rel="stylesheet" />
   
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
                                        <asp:Button Text="Nuevo" ID="btnAgregar"  Width="170px" runat="server" OnClick="btnAgregar_Click" />
                                        <asp:Button Text="Borrar" ID="btnBorrar"  Width="170px" runat="server" OnClick="btnBorrar_Click" />
                                        <asp:Button Text="Exportar" ID="btnExportar"  Width="170px" runat="server" OnClick="btnExportar_Click" />
                                        <asp:Button Text="Volver" ID="btnVolver"  Width="170px" runat="server" OnClick="btnVolver_Click" />
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-0">
                                    <div class="form-group">
                                        <br />

                                    </div>
                                </div>
                             </div> 

                           

                
                   <div id="grdCharges" runat="server"  style="width: 1221px; overflow: auto; height: 450px">

                       <asp:GridView ID="gvwInforme" runat="server" CellPadding="10" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="2px" AutoGenerateColumns="False" DataKeyNames="intIdInforme" AllowPaging="True" AllowSorting="True" CellSpacing="10" HorizontalAlign="Center" style="margin-left: 9px" Width="1199px">
                           <Columns>
                               <asp:buttonfield buttontype="Button" commandname="Select" text="Detalle"/>
                               <asp:HyperLinkField Text="Modificar" DataNavigateUrlFields="intIdInforme" DataNavigateUrlFormatString="Modificar Informes-SistemaRegistroGestiones.aspx?intIdInforme={0}" />
                               <asp:TemplateField>
                                   <HeaderTemplate>
                                        <asp:CheckBox ID="chkTodo" runat="server" onclick = "checkTodo(this);" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSeleccionar" runat="server" onclick="GridCheckOne(this)"></asp:CheckBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                               <asp:BoundField DataField="intIdInforme" HeaderText="Codigo del Informe" ReadOnly="True" InsertVisible="False" ></asp:BoundField>
                               <asp:BoundField DataField="vchTituloInforme" HeaderText="Título del Informe" ></asp:BoundField>
                               <asp:BoundField DataField="vchNombreEmpleados" HeaderText="Funcionario que Tramita" ></asp:BoundField>
                               <asp:BoundField DataField="vchTipoInforme" HeaderText="Tipo de Informe" ></asp:BoundField>
                               <asp:BoundField DataField="vchNumeroOficio" HeaderText="Número del Oficio" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaAprobacion" HeaderText="Fecha de Aprobación" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaCulminacion" HeaderText="Fecha de Culminación" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaTraslado" HeaderText="Fecha de Traslado" ></asp:BoundField>
                               <asp:BoundField DataField="vchAvanceInforme" HeaderText="Avance" ></asp:BoundField>
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

                        <asp:LinkButton Text="" ID = "lnkFalso" runat="server" />
                        <asp:ModalPopupExtender ID="mpeDetalles" runat="server" PopupControlID="pnlPopup" TargetControlID="lnkFalso"
                        CancelControlID="btnCerrar_Modal" BackgroundCssClass="modalBackground">
                        </asp:ModalPopupExtender>

                       <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none" ScrollBars="Vertical" Height="430px" >
                           <div class="header">
                               Detalles del Informe
                           </div>
                           <div class="body">
                               <table border="0">
                                   <tr>
                                       <td> 
                                           
                                       </td>
                                        <td>
                                            <asp:Label ID="lblPop_Id_Informe" runat="server" Text="Codigo de Informe"></asp:Label>
                                           <asp:TextBox ID="txtPop_Id_Informe" runat="server" Enabled="false" style="text-align: center"/>
                                        </td>
                                       <td> 
                                           
                                       </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>Título del Informe: </b>
                                            <asp:TextBox ID="txtPop_Titulo_Informe" runat="server" Enabled="false" style="text-align: center" size="30" />
                                        </td>
                                        <td>
                                            <b>Nombre del funcionario: </b>
                                            <asp:TextBox ID="txtPop_Empleado_Informe" runat="server" Enabled="false" style="text-align: center" size="30"/>
                                        </td>
                                        <td>
                                            <b>Tipo de Informe: </b>
                                            <asp:TextBox ID="txtPop_Tipo_Informe" runat="server" Enabled="false" style="text-align: center" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>Número de Oficio: </b>
                                            <asp:TextBox ID="txtPop_Num_Oficio_Informe" runat="server" Enabled="false" style="text-align: center" />
                                        </td>
                                        <td>
                                            
                                        </td> 
                                        <td>
                                            
                                        </td>
                                    </tr>
                                   <tr>
                                        <td>
                                            <b>Fecha de Aprobación: </b>
                                            <asp:TextBox ID="txtPop_Fecha_Aprobacion" runat="server" Enabled="false" style="text-align: center" />
                                        </td>
                                        <td>
                                            <b>Fecha de Culminación: </b>
                                            <asp:TextBox ID="txtPop_Fecha_Culminacion" runat="server" Enabled="false" style="text-align: center" />
                                        </td> 
                                        <td>
                                            <b>Fecha de Traslado: </b>
                                            <asp:TextBox ID="txtPop_Fecha_Traslado" runat="server" Enabled="false" style="text-align: center" />
                                        </td>
                                    </tr>
                                   <tr>
                                        <td>
                                            <b>Avance: </b>
                                            <asp:TextBox ID="txtPop_Avance_Informe" runat="server" Enabled="false" style="text-align: center" size="30"/>
                                        </td>
                                        <td>
                                           
                                        </td> 
                                        <td>
                                            
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