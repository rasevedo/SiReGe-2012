<%@ Page Title="Buscador_Gestiones-SistemaRegistroGestiones" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="Buscador_Gestiones-SistemaRegistroGestiones.aspx.vb" Inherits="CapPresentacionSiReGe.Buscador_Gestiones_SistemaRegistroGestiones" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %> 

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>Buscador_Gestiones-SistemaRegistroGestiones</title>
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
                    <h1 class="auto-style3">&nbsp;&nbsp; Buscador de Gestiones</h1>
                </div>
            </header>
        </div>

        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTipo_Gestiones" Text="Tipo de gestiones" runat="server"/></td>
                                                
                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNombre_Funcionario" Text="Nombre de funcionario" runat="server" /></td>
                                                
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFuente_Generadora" Text="Fuente generadora" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlTipo_Gestiones" runat="server"  CssClass="form-control input-sm" Height="30px" Width="279px"  >
                                                        <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                                        <asp:ListItem Text="Atención presencial" Value="Atención presencial"></asp:ListItem>
                                                        <asp:ListItem Text="Vía telefonica" Value="Vía telefonica"></asp:ListItem>
                                                        <asp:ListItem Text="Correo electrónico" Value="Correo Electrónico"></asp:ListItem>
                                                    </asp:DropDownList></td>
                                                    
                                                
                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNombre_Funcionario" runat="server" CssClass="form-control input-sm" Height="25px" Width="274px" /></td>
                                                        
                                                
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlFuente_Generadora" runat="server" CssClass="form-control input-sm" Height="29px" Width="283px" >
                                                        <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                                        <asp:ListItem Text="Solicitud de un usuario" Value="Solicitud de un usuario"></asp:ListItem>
                                                        <asp:ListItem Text="Solicitud del Jerarca de la Administración Activa" Value="Solicitud del Jerarca de la Administración Activa"></asp:ListItem>
                                                        <asp:ListItem Text="Solicitud de algún titular de una Dirección del sector académico o administrativo" Value="Solicitud de algún titular de una Dirección del sector académico o administrativo"></asp:ListItem>
                                                    </asp:DropDownList></td>
                                            </tr>  
                                        </table>
                                    </div>
                                </div>                  
                            </div>

                        <asp:UpdatePanel runat="server" id="UpdatePanel" updatemode="Conditional">  
                        <ContentTemplate>
                        <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblConfidencialidad" Text="Confidencialidad" runat="server"/></td>
                                                
                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDireccion_Regiones" Text="Dirección regional de educación" runat="server" /></td>
                                                
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlConfidencialidad" runat="server" CssClass="form-control input-sm" Height="30px" Width="279px"  >
                                                        <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                                        <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                                    </asp:DropDownList></td>
                                                    
                                                
                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlDireccion_Regional_Educacion" runat="server" CssClass="form-control input-sm" Height="29px" Width="281px" >
                                                            <asp:ListItem Text=" " Value=" "></asp:ListItem>        
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN AGUIRRE" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN AGUIRRE"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN DE ALAJUELA" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN DE ALAJUELA"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN DE CAÑAS" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN DE CAÑAS"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN DE CARTAGO" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN DE CARTAGO"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN DE COTO" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN DE COTO"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN DE DESAMPARADOS" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN DE DESAMPARADOS"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN DE GUÁPILES" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN DE GUÁPILES"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN DE HEREDIA" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN DE HEREDIA"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN DE LIBERIA" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN DE LIBERIA"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN DE LIMÓN" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN DE LIMÓN"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN DE NICOYA" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN DE NICOYA"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN DE OCCIDENTE" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN DE OCCIDENTE"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN DE PÉREZ ZELEDÓN" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN DE PÉREZ ZELEDÓN"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN DE PUNTARENAS" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN DE PUNTARENAS"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN DE PURISCAL" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN DE PURISCAL"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN DE SAN CARLOS" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN DE SAN CARLOS"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN DE SANTA CRUZ" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN DE SANTA CRUZ"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN DE SARAPIQUÍ" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN DE SARAPIQUÍ"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN DE TURRIALBA" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN DE TURRIALBA"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN GRANDE DE TÉRRABA" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN GRANDE DE TÉRRABA"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN NORTE-NORTE" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN NORTE-NORTE"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN SAN JOSÉ NORTE" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN SAN JOSÉ NORTE"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN SAN JOSÉ OESTE" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN SAN JOSÉ OESTE"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL SAN JOSÉ CENTRAL" Value="DIRECCIÓN REGIONAL SAN JOSÉ CENTRAL"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN LOS SANTOS" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN LOS SANTOS"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN PENINSULAR" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN PENINSULAR"></asp:ListItem>
                                                            <asp:ListItem Text="DIRECCIÓN REGIONAL DE EDUCACIÓN SULÁ" Value="DIRECCIÓN REGIONAL DE EDUCACIÓN SULÁ"></asp:ListItem>
                                                    </asp:DropDownList></td>
                                                
                                                <td>&nbsp;</td>
                                            </tr>  
                                        </table>
                                    </div>
                                </div>                  
                            </div>
                            </ContentTemplate>
                            </asp:UpdatePanel>

                    <asp:UpdatePanel runat="server" id="UpdatePanel1" updatemode="Conditional">  
                     <ContentTemplate>
                    <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNombre_Usuario" Text="Nombre de denunciante" runat="server"/></td>
                                                
                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDescripcion_Unidad" Text="Descripción unidad" runat="server" /></td>
                                                                                                
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNombre_Usuario" runat="server"  CssClass="form-control input-sm" Height="25px" Width="270px"  /></td>
                                                    
                                                
                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlDescripcion_Unidad" runat="server" CssClass="form-control input-sm" Height="29px" Width="283px" AutoPostBack="True" OnSelectedIndexChanged="ddlDescripcion_Unidad_SelectedIndexChanged" DataSourceID="sdsDescripcion_Unidad" DataTextField="vchDescripcionUnidad" DataValueField="intIdUnidad"></asp:DropDownList >
                                                            <asp:SqlDataSource runat="server" ID="sdsDescripcion_Unidad" ConnectionString='<%$ ConnectionStrings:bda_SIREGE_Connection %>' SelectCommand="palConsultarUnidades" SelectCommandType="StoredProcedure"></asp:SqlDataSource></td>
                                                        
                                                
                                                <td>&nbsp;</td>
                                            </tr>  
                                        </table>
                                    </div>
                                </div>                  
                            </div>
                        </ContentTemplate>
                        </asp:UpdatePanel>

                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnBuscar_Gestion" runat="server" Width="85px" Height="45px" Text="Buscar" OnClick="btnBuscar_Gestion_Click"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button  ID="btnVolver" runat="server" Width="85px" Height="45px" Text="Volver" OnClick="btnVolver_Click"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button Text="Borrar" ID="btnBorrar"  Width="85px" Height="45px" runat="server" OnClick="btnBorrar_Click" />
                            &nbsp;&nbsp;
                <asp:Button ID="btnBitacora" runat="server" Width="85px" Height="45px" Text="Bitacora" OnClick="btnBitacora_Click"/>
                            &nbsp;&nbsp;
                <asp:Button Text="Exportar" ID="btnExportar"  Width="85px" Height="45px" runat="server" OnClick="btnExportar_Click" />
                <br />
                <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            


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


            <asp:UpdatePanel runat="server" id="UpdatePanelBuscador" updatemode="Conditional">  
            <ContentTemplate>          


                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            


                <asp:Label ID="lblmsg" runat="server" Visible="false"></asp:Label>
            <div id="grdCharges" runat="server" style="width: 1209px; overflow: auto; height: 450px; margin-left: 8px;" >                                           
                    <asp:GridView ID="gvwGestiones" runat="server" CellPadding="10" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="2px" AutoGenerateColumns="False" DataKeyNames="intIdGestiones" AllowSorting="True" CellSpacing="10" HorizontalAlign="Center" Width="50%" >
                           <Columns>
                               <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkTodo" runat="server" onclick = "chkTodo(this);" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect" runat="server"></asp:CheckBox>
                                    </ItemTemplate>
                               </asp:TemplateField>  
                               <asp:buttonfield buttontype="Button" runat="server" commandname="Select" text="Detalle" HeaderText="Detalle" />
                               <asp:TemplateField>
                                   <HeaderTemplate>
                                        <asp:Label ID="lblModificar" runat="server" text="Modificar" />
                                   </HeaderTemplate>
                                   <ItemTemplate>
                                        <asp:Button ID="btnEditar" runat="server" Text="Modificar" OnClick="btnEditar_Click" CommandArgument='<%#Eval("intIdGestiones") %>' />
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
                               <asp:BoundField DataField="vchDescripcionUnidad" HeaderText="Descripción unidad"  HeaderStyle-Width="120px" ValidateRequestMode="Inherit">
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
                     
               </div>
               

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



            </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        
    </div>
    
    
</asp:Content>

