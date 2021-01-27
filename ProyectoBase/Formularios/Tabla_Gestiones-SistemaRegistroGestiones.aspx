<%@ Page Title="Tabla_Gestiones-SistemaRegistroGestiones" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master"  CodeBehind="Tabla_Gestiones-SistemaRegistroGestiones.aspx.vb" Inherits="CapPresentacionSiReGe.Tabla_Gestiones" EnableEventValidation="false"%>


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
                                        <asp:Button Text="Borrar" ID="btnBorrar"  Width="85px" Height="45px" runat="server" OnClientClick="javascript:return Confirmationbox();" OnClick="btnBorrar_Click" />
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
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                  
                                        <asp:Button ID="btnBuscar_TipoGestion" runat="server" Width="85px" Height="45px" Text="Buscador" OnClick="btnBuscar_TipoGestion_Click"/>
                                    </div>
                                </div> 
                                <div class="col-md-2 col-md-offset-0">
                                    <div class="form-group">
                                        <br />

                                    </div>
                                </div>                               
                            </div> 

                   
                   <div id="grdCharges" runat="server" style="width: 1209px; overflow: auto; height: 450px; margin-left: 8px;" > 
                                           
                           <asp:GridView ID="gvwGestiones" runat="server" CellPadding="10" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="2px" AutoGenerateColumns="False" DataKeyNames="intIdGestiones" AllowSorting="True" CellSpacing="10" HorizontalAlign="Center" Width="50%" >
                           <Columns>
                               <asp:buttonfield buttontype="Button" commandname="Select" text="Detalle" />
                               <asp:HyperLinkField Text="Modificar" DataNavigateUrlFields="intIdGestiones" DataNavigateUrlFormatString="Modificar_Gestiones-SistemaRegistroGestiones.aspx?intIdGestiones={0}" />
                               <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkTodo" runat="server" onclick = "chkTodo(this);" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect" runat="server" onclick="GridCheckOne(this)"></asp:CheckBox>
                                    </ItemTemplate>
                               </asp:TemplateField>                                                            
                               <asp:BoundField DataField="intIdGestiones" HeaderText="Código de Gestión"    >
                                   <HeaderStyle HorizontalAlign="Center" />
                               </asp:BoundField>
                               <asp:BoundField DataField="vchTipoGestiones" HeaderText="Tipo de Gestión"  >
                                   <ControlStyle Width="200px"></ControlStyle>
                                   <HeaderStyle Width="200px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="intCedulaUsuario" HeaderText="Cédula del Denunciante"  >
                                   <ControlStyle Width="200px"></ControlStyle>
                                   <HeaderStyle Width="200px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchNombreUsuario" HeaderText="Nombre del Denunciante"  >
                                   <ControlStyle Width="200px"></ControlStyle>
                                   <HeaderStyle Width="200px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="dtiFechaIngreso" HeaderText="Fecha de Ingreso"  HeaderStyle-Width="120px"> 
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchConfidencialidadGestiones" HeaderText="Confidencialidad"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchFuenteGeneradora" HeaderText="Fuente Generadora"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchTipoServicio" HeaderText="Tipo de servicio"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchNombreFuncionario" HeaderText="Funcionario que Tramita"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchDireccionRegional" HeaderText="Dirección Regional de Educación"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchSupervicionGestiones" HeaderText="Supervisión"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchNombreCentroEducativo" HeaderText="Nombre del Centro Educativo"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionUnidad" HeaderText="Descripción Unidad"  HeaderStyle-Width="120px" ValidateRequestMode="Inherit">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionDespacho" HeaderText="Descripción Despacho" HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionDireccion" HeaderText="Descripción Dirección"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchdescripcionDepartamento" HeaderText="Descripción Departamento" HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchNumeroOficio" HeaderText="Número de Oficio"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchTipoDimension" HeaderText="Dimensión"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchLetraDimension" HeaderText="Letra Dimensión" HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionTipoDimension" HeaderText="Detalle de la Dimensión"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchTipoUsuario" HeaderText="Tipo de Usuario" HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchDetalleGestiones" HeaderText="Detalle de Gestiones"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>                                 
                               <asp:BoundField DataField="vchRespuestaGestiones" HeaderText="Respuesta de Gestiones" HeaderStyle-Width="120px">
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
                               <table border="0">
                                   <tr>
                                       <td> 
                                           <asp:Label ID="lblPop_Id_Gestiones" runat="server" Text="Código de Gestión:"></asp:Label>
                                           
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Id_Gestiones" runat="server" Enabled="false" size="35" style="text-align: left"/>
                                        </td>
                                       
                                    </tr>

                                    <tr>
                                        <td>
                                            <b>Tipo de Gestión: </b>
                                            
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Tipo_Gestiones" runat="server" Enabled="false" size="35" style="text-align: left" /> 
                                        </td>
                                        
                                    </tr>

                                   <tr>
                                       <td> 
                                           <b>Cédula del Denunciante: </b>
                                           
                                       </td>
                                            
                                        <td>
                                           <asp:TextBox ID="txtPop_Cedula_Usuario" runat="server" Enabled="false" size="35" style="text-align: left"/>
                                        </td>
                                       
                                    </tr>

                                   <tr>
                                       <td> 
                                           <b>Nombre del Denunciante: </b>
                                            
                                       </td>                                            
                                        <td>
                                           <asp:TextBox ID="txtPop_Nombre_Usuario" runat="server" Enabled="false" size="35" style="text-align: left" />
                                        </td>
                                       
                                    </tr>

                                    <tr>
                                        <td>
                                            <b>Fecha de Ingreso: </b>
                                            
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Fecha_Ingreso" runat="server" Enabled="false" size="35" style="text-align: left" /> 
                                        </td> 
                                        
                                    </tr>

                                   <tr>
                                       <td> 
                                            <b>Confidencialidad: </b>
                                            
                                       </td>
                                        <td>
                                          <asp:TextBox ID="txtPop_Confidencialida" runat="server" Enabled="false" size="35" style="text-align: left"/>
                                        </td>
                                       
                                    </tr>

                                   <tr>
                                       <td> 
                                           <b>Supervisión: </b>
                                            
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Supervision" runat="server" Enabled="false" size="35" style="text-align: left" />
                                        </td>
                                       
                                    </tr>
                                </table>

                               <table border="0">
                                   <tr>
                                       <td>
                                            <b>Fuente Generadora: </b>                                            
                                        </td>
                                       <td>
                                           <asp:TextBox ID="txtPop_Fuente_Generadora" runat="server" Enabled="false" size="50" style="text-align: left" />
                                        </td>                                     
                                   </tr>
                                    <tr>
                                        <td>
                                            <b>Tipo de Servicio: </b>                                            
                                        </td> 
                                        <td>
                                           <asp:TextBox ID="txtPop_Tipo_Servicio" runat="server" Enabled="false" size="50" style="text-align: left" />
                                        </td>                                      
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>Funcionario que tramita: </b>                                           
                                        </td> 
                                        <td>
                                          <asp:TextBox ID="txtPop_Empleado" runat="server" Enabled="false" size="50"  style="text-align: left" /> 
                                        </td>                                     
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>Dirección Regional de Educación: </b>                                   
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Regional" runat="server" Enabled="false" size="50" style="text-align: left" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>Nombre del Centro Educativo: </b>
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_CE" runat="server" Enabled="false" size="50" style="text-align: left" />
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
                                           <asp:TextBox ID="txtPop_Despacho" runat="server" Enabled="false" size="75"  style="text-align: left" />
                                        </td>
                                       
                                    </tr>
                                   <tr>

                                        <td>
                                            <b>Descripción de Dirección: </b>
                                            
                                        </td>
                                       <td>
                                           <asp:TextBox ID="txtPop_Direccion" runat="server" Enabled="false" size="75"  style="text-align: left" />
                                        </td>
                                       
                                    </tr>
                                   <tr>
                                        <td>
                                            <b>Descripción de Departamento: </b>
                                            
                                        </td>
                                       <td>
                                          <asp:TextBox ID="txtPop_Departamento" runat="server" Enabled="false" size="75"  style="text-align: left" /> 
                                        </td>
                                       
                                    </tr>
                                   <tr>
                                        <td>
                                            <b>Dimensión: </b>
                                            
                                        </td>
                                       <td>
                                          <asp:TextBox ID="txtPop_Dimension" runat="server" Enabled="false" size="75"  style="text-align: left"/> 
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
                                            <b>Tipo de Usuario: </b>
                                            
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtPop_Tipo_Usuario" runat="server" Enabled="false" size="50" style="text-align: left" />
                                        </td>                                       
                                    </tr>
                                   </table>

                                  <table border="0">
                                   <tr>
                                       <td> 
                                          <b>Detalle de la Gestión: </b> 
                                       </td>
                                        <td>                                      
                                             <asp:TextBox ID="txtPop_Detalle_Gestion" runat="server" Enabled="false" TextMode="MultiLine" Width="515px" Height="80px" style="text-align: left; resize:none;" />                                        
                                        </td>                                   
                                    </tr>
                                   <tr>   
                                       <td> 
                                           <b>Respuesta de la Gestión: </b>
                                       </td>
                                        <td>                                            
                                            <asp:TextBox ID="txtPop_Respuesta_Gestion" runat="server" Enabled="false" TextMode="MultiLine" Width="515px" Height="80px" style="text-align: left; resize:none;" />
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