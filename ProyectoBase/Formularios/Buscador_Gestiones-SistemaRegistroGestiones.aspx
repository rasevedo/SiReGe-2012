<%@ Page Title="Buscador_Gestiones-SistemaRegistroGestiones" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="Buscador_Gestiones-SistemaRegistroGestiones.aspx.vb" Inherits="CapPresentacionSiReGe.Buscador_Gestiones_SistemaRegistroGestiones" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %> 

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


    <asp:UpdatePanel runat="server" id="UpdatePanelBuscador" updatemode="Conditional">  
    <ContentTemplate>
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
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTipo_Gestiones" Text="Tipo de Gestiones" runat="server"/></td>
                                                
                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNombre_Funcionario" Text="Nombre de Funcionario" runat="server" /></td>
                                                
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFuente_Generadora" Text="Fuente Generadora" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlTipo_Gestiones" runat="server"  CssClass="form-control input-sm" Height="30px" Width="279px"  >
                                                        <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                                        <asp:ListItem Text="Atención presencial" Value="Atención presencial"></asp:ListItem>
                                                        <asp:ListItem Text="Vía telefonica" Value="Vía telefonica"></asp:ListItem>
                                                        <asp:ListItem Text="Correo Electrónico" Value="Correo Electrónico"></asp:ListItem>
                                                    </asp:DropDownList></td>
                                                    
                                                
                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNombre_Funcionario" runat="server" CssClass="form-control input-sm" Height="29px" Width="277px" /></td>
                                                        
                                                
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
                                                
                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDireccion_Regiones" Text="Dirección Regional de Educación" runat="server" /></td>
                                                
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlConfidencialidad" runat="server" CssClass="form-control input-sm" Height="30px" Width="279px"  >
                                                        <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                                        <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                                    </asp:DropDownList></td>
                                                    
                                                
                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlDireccion_Regional_Educacion" runat="server" CssClass="form-control input-sm" Height="29px" Width="277px" >
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
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNombre_Usuario" Text="Nombre de Denunciante" runat="server"/></td>
                                                
                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDescripcion_Unidad" Text="Descripción Unidad" runat="server" /></td>
                                                                                                
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNombre_Usuario" runat="server"  CssClass="form-control input-sm" Height="30px" Width="279px"  /></td>
                                                    
                                                
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
                <asp:Button ID="btnBuscar_Gestion" runat="server" Width="125px" Text="Buscar" OnClick="btnBuscar_Gestion_Click"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button  ID="btnVolver" runat="server" Width="125px" Text="Volver" OnClick="btnVolver_Click"/>
                <br />
                <br />
                
            <div id="grdCharges" runat="server" style="width: 1209px; overflow: auto; height: 450px; margin-left: 8px;" >                                           
                           <asp:GridView ID="gvwGestiones" runat="server" CellPadding="10" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="2px" AutoGenerateColumns="False" DataKeyNames="intIdGestiones" AllowSorting="True" CellSpacing="10" HorizontalAlign="Center" Width="50%" >
                           <Columns>
                               <asp:buttonfield buttontype="Button" commandname="Select" text="Detalle"/>
                               <asp:HyperLinkField Text="Modificar" DataNavigateUrlFields="intIdGestiones" DataNavigateUrlFormatString="Modificar_Gestiones-SistemaRegistroGestiones.aspx?intIdGestiones={0}" />
                               <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkTodo" runat="server" onclick = "chkTodo(this);" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect" runat="server" onclick="GridCheckOne(this)"></asp:CheckBox>
                                    </ItemTemplate>
                               </asp:TemplateField>                                                            
                               <asp:BoundField DataField="intIdGestiones" HeaderText="Codigo de Gestión"    >
                                   <HeaderStyle HorizontalAlign="Center" />
                               </asp:BoundField>
                               <asp:BoundField DataField="vchTipoGestiones" HeaderText="Tipo de Gestión"  >
                                   <ControlStyle Width="200px"></ControlStyle>
                                   <HeaderStyle Width="200px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="intCedulaUsuario" HeaderText="Cedula del Usuario"  >
                                   <ControlStyle Width="200px"></ControlStyle>
                                   <HeaderStyle Width="200px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchNombreUsuario" HeaderText="Nombre del Usuario"  >
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
                               <asp:BoundField DataField="vchDescripcionUnidad" HeaderText="Descripción Unidad"  HeaderStyle-Width="120px">
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
                               <asp:BoundField DataField="vchNumeroOficio" HeaderText="Numero de Oficio"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchTipoDimension" HeaderText="Dimensión"  HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchLetraDimension" HeaderText="Letra Dimensión" HeaderStyle-Width="120px">
                                   <HeaderStyle Width="120px"></HeaderStyle>
                               </asp:BoundField>
                               <asp:BoundField DataField="vchDescripcionTipoDimension" HeaderText="Detalle Dimensión"  HeaderStyle-Width="120px">
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
                     
               </div>
               <asp:Label ID="lblmsg" runat="server" Visible="false"></asp:Label>

             <asp:LinkButton Text="" ID = "lnkFalso" runat="server" />
                        <asp:ModalPopupExtender ID="mpeDetalles" runat="server" PopupControlID="pnlPopup" TargetControlID="lnkFalso"
                        CancelControlID="btnCerrar_Modal" BackgroundCssClass="modalBackground">
                        </asp:ModalPopupExtender>

                       <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none" ScrollBars="Vertical" Height="590px" >
                           <div class="header">
                               Detalles de la Gestión
                           </div>
                           <div class="body">
                               <table border="1">
                                   <tr>
                                       <td> 
                                           <asp:Label ID="lblPop_Id_Gestiones" runat="server" Text="Codigo de Gestión:"></asp:Label>
                                           
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
                               
                               <asp:Button ID="btnCerrar_Modal" runat="server" Text="Cerrar" CssClass="button"/>
                           </div>
                       </asp:Panel>

        </div>

    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>

