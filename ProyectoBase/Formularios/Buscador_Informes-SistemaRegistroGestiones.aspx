<%@ Page Title="Buscador_Informes-SistemaRegistroGestiones" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="Buscador_Informes-SistemaRegistroGestiones.aspx.vb" Inherits="CapPresentacionSiReGe.Buscador_Informes_SistemaRegistroGestiones" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %> 

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
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTitulo_Informe" Text="Título del Informe" runat="server"/></td>
                                                
                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNombre_Funcionario" Text="Nombre de Funcionario" runat="server" /></td>
                                                
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTipo_Informe" Text="Tipo de Informe" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtTitulo_Informe" runat="server" CssClass="form-control input-sm" Height="30px" Width="279px"  /></td>
                                                                                                                                                    
                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNombre_Funcionario" runat="server" CssClass="form-control input-sm" Height="29px" Width="277px" /></td>
                                                                                                        
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlTipo_Informe" runat="server" CssClass="form-control input-sm" Height="29px" Width="283px" >
                                                        <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                                        <asp:ListItem Text="Informe" Value="Informe"></asp:ListItem>
                                                        <asp:ListItem Text="Estudio" Value="Estudio"></asp:ListItem>
                                                        <asp:ListItem Text="Capacitación" Value="Capacitación"></asp:ListItem>
                                                    </asp:DropDownList></td>
                                            </tr>  
                                        </table>
                                    </div>
                                </div>                  
                            </div>

                                           
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnBuscar_Informe" runat="server" Width="125px" Text="Buscar" OnClick="btnBuscar_Informe_Click"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button  ID="btnVolver" runat="server" Width="125px" Text="Volver" OnClick="btnVolver_Click"/>
                <br />
                <br />
                
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
                                        <asp:CheckBox ID="chkSeleccionar" runat="server" onclick="GridCheckOne(this)"></asp:CheckBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                               <asp:BoundField DataField="intIdInforme" HeaderText="Codigo del Informe" ReadOnly="True" InsertVisible="False" ></asp:BoundField>
                               <asp:BoundField DataField="vchTituloInforme" HeaderText="Título del Informe" ></asp:BoundField>
                               <asp:BoundField DataField="vchNombreFuncionario" HeaderText="Funcionario que Tramita" ></asp:BoundField>
                               <asp:BoundField DataField="vchTipoInforme" HeaderText="Tipo de Informe" ></asp:BoundField>
                               <asp:BoundField DataField="vchNumeroOficio" HeaderText="Número del Oficio" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaAprobacion" HeaderText="Fecha de Aprobación" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaCulminacion" HeaderText="Fecha de Culminación" ></asp:BoundField>
                               <asp:BoundField DataField="dtiFechaTraslado" HeaderText="Fecha de Traslado" ></asp:BoundField>
                               <asp:BoundField DataField="vchAvanceInforme" HeaderText="Avance" ></asp:BoundField>
                               <asp:BoundField DataField="vchRemitido" HeaderText="Remitido A" ></asp:BoundField>
                               <asp:BoundField DataField="vchHallazgo" HeaderText="Hallazgos" ></asp:BoundField>
                               <asp:BoundField DataField="vchRecomendaciones" HeaderText="Recomendaciones" ></asp:BoundField>
                               <asp:BoundField DataField="vchObservaciones" HeaderText="Observaciones Generales" ></asp:BoundField>
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
                        <asp:Label ID="lblmsg" runat="server" Visible="false"></asp:Label>

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
                                          <asp:Label ID="lblPop_Id_Informe" runat="server" Text="Codigo de Informe"></asp:Label> 
                                       </td>
                                        <td>               
                                           <asp:TextBox ID="txtPop_Id_Informe" runat="server" Enabled="false" size="30" style="text-align: left"/>
                                        </td>
                                    </tr>
                                   <tr>
                                       <td> 
                                          <b>Título del Informe: </b>
                                       </td>
                                        <td>               
                                           <asp:TextBox ID="txtPop_Titulo_Informe" runat="server" Enabled="false" size="30" style="text-align: left"  />
                                        </td>
                                    </tr>
                                   <tr>
                                       <td> 
                                          <b>Nombre del funcionario: </b>
                                       </td>
                                        <td>               
                                           <asp:TextBox ID="txtPop_Empleado_Informe" runat="server" Enabled="false" size="30" style="text-align: left" />
                                        </td>
                                    </tr>
                                   <tr>
                                       <td> 
                                          <b>Tipo de Informe: </b>
                                       </td>
                                        <td>               
                                           <asp:TextBox ID="txtPop_Tipo_Informe" runat="server" Enabled="false" size="30" style="text-align: left" />
                                        </td>
                                    </tr>
                                   <tr>
                                       <td> 
                                          <b>Número de Oficio: </b>
                                       </td>
                                        <td>               
                                           <asp:TextBox ID="txtPop_Num_Oficio_Informe" runat="server" Enabled="false" size="30" style="text-align: left" />
                                        </td>
                                    </tr>
                                   <tr>
                                       <td> 
                                          <b>Fecha de Aprobación: </b>
                                       </td>
                                        <td>               
                                           <asp:TextBox ID="txtPop_Fecha_Aprobacion" runat="server" Enabled="false" size="30" style="text-align: left" />
                                        </td>
                                    </tr>
                                   <tr>
                                       <td> 
                                          <b>Fecha de Culminación: </b>
                                       </td>
                                        <td>               
                                           <asp:TextBox ID="txtPop_Fecha_Culminacion" runat="server" Enabled="false" size="30" style="text-align: left" />
                                        </td>
                                    </tr>
                                   <tr>
                                       <td> 
                                          <b>Fecha de Traslado: </b>
                                       </td>
                                        <td>               
                                           <asp:TextBox ID="txtPop_Fecha_Traslado" runat="server" Enabled="false" size="30" style="text-align: left" />
                                        </td>
                                    </tr>
                                   </table>
                               
                               <table border="0">                                                                                                           
                                   <tr>
                                        <td>
                                            <b>Avance: </b>                                            
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Avance_Informe" runat="server" Enabled="false" size="7" style="text-align: left" />
                                        </td> 
                                    </tr>
                                </table>   
                               
                               <table border="0">                                                                                                           
                                   <tr>
                                        <td>
                                            <b>Remitido A: </b>                                            
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Remitido" runat="server" Enabled="false" style="text-align: left" size="30"/>
                                        </td> 
                                    </tr>
                                </table>

                               <table border="0">                                                                                                           
                                   <tr>
                                        <td>
                                            <b>Hallazgos: </b>                                            
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Hallazgo_Informe" runat="server" Enabled="false" TextMode="MultiLine" Width="593px" Height="80px" style="text-align: left; resize:none;" /> 
                                        </td> 
                                    </tr>
                                </table>

                               <table border="0">                                                                                                           
                                   <tr>
                                        <td>
                                            <b>Recomendaciones: </b>                                            
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Recomendaciones" runat="server" Enabled="false" TextMode="MultiLine" Width="538px" Height="80px" style="text-align: left; resize:none;" /> 
                                        </td> 
                                    </tr>
                                </table>

                               <table border="0">                                                                                                           
                                   <tr>
                                        <td>
                                            <b>Observaciones Generales: </b>                                            
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Observaciones_Generales" runat="server" Enabled="false" TextMode="MultiLine" Width="515px" Height="80px" style="text-align: left; resize:none;" /> 
                                        </td> 
                                    </tr>
                                </table>                                                                               
                           </div>                           
                           <div class="footer" style="float: right">
                               
                               <asp:Button ID="btnCerrar_Modal" runat="server" Text="Cerrar" CssClass="button"/>
                           </div>
                       </asp:Panel>

        </div>

    </div>
    
</asp:Content>
