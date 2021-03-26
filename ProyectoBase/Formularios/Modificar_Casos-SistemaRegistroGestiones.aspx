<%@ Page Title="Modificar_Casos-SistemaRegistroGestiones" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="Modificar_Casos-SistemaRegistroGestiones.aspx.vb" Inherits="CapPresentacionSiReGe.Modificar_Casos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>Modificar_Casos-SistemaRegistroGestiones</title>
    <style type="text/css">
        .auto-style2 {
            width: 569px;
        }
        .auto-style3 {
            width: 540px;
        }
        .auto-style7 {
            width: 410px;
        }
        .auto-style9 {
            width: 414px;
        }
        .auto-style11 {
            width: 397px;
        }
        .auto-style15 {
            width: 228px;
        }
        .auto-style16 {
            width: 409px;
        }
        .auto-style17 {
            width: 407px;
        }
        .auto-style18 {
            width: 413px;
        }
        .auto-style19 {
            width: 225px;
        }
        .auto-style20 {
            width: 398px;
        }
        .auto-style21 {
            width: 396px;
        }
        .auto-style22 {
            width: 399px;
        }
        .auto-style23 {
            width: 996px;
        }
        .input-sm {}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server"> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />              
            <div class="row">
                <div class="col-lg-12">                    
                        <header class="panel-heading">
                            <div class="col-md-5 col-md-offset-4">
                                <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Modificar Caso</h1>
                            </div>
                        </header>
                        <div class="panel-body">

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;<asp:TextBox ID="txtId_Casos" runat="server" Enabled="false" CssClass="form-control input-sm" Width="44px" Visible="false" />
                                    </div>
                                </div>                            
                            </div>
                            <br/>

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNumero_Caso" Text="Número de expediente*" runat="server" /></td>

                                                <td class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblEstado_Caso" Text="Estado del expediente*" runat="server" /></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFecha_Caso" Text="Fecha de ingreso*" runat="server"/></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNumero_Caso" runat="server" Enabled="true" CssClass="form-control input-sm" Height="25px" Width="273px"  /></td>

                                                <td class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlEstado_Caso" runat="server" CssClass="form-control input-sm" Height="30px" Width="279px">
                                                        <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                                        <asp:ListItem Text="ABIERTO" Value="ABIERTO"></asp:ListItem>
                                                        <asp:ListItem Text="CERRADO" Value="CERRADO"></asp:ListItem>
                                                    </asp:DropDownList></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtFecha_Caso" runat="server" Enabled="true" CssClass="form-control input-sm" Height="25px" Width="279px" /></td>
                                            </tr>    
                                        </table>
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <br />                                                               
                                            </div>
                                        </div>                                     
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblCedula_Usuario" Text="Cédula del usuario" runat="server" /></td>

                                                <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNombre_Usuario" Text="Nombre del usuario" runat="server" /></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFuncionario_Tramita" Text="Funcionario que tramita" runat="server"/></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtCedula_Usuario" runat="server" Enabled="true" CssClass="form-control input-sm" Height="25px" Width="273px"  /></td>

                                                <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNombre_Usuario" runat="server" Enabled="true" CssClass="form-control input-sm" Height="25px" Width="273px" /></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNombre_Funcionario" runat="server" Enabled="false" CssClass="form-control input-sm" Height="25px" Width="279px"  /></td>
                                                    
                                            </tr>  
                                        </table>
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <br />                                                               
                                            </div>
                                        </div>                                       
                                    </div>
                                </div>                                                                                                                                              
                            </div>
                            
                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNombre_CE" Text="Nombre del centro educativo" runat="server" /></td>

                                                <td class="auto-style21">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNumero_Oficio" Text="Número de oficio" runat="server"/></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFecha_Oficio" Text="Fecha de oficio" runat="server"/></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNombre_CE" runat="server" Enabled="true" CssClass="form-control input-sm" Height="25px" Width="273px" /></td>

                                                <td class="auto-style21">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNumero_Oficio" runat="server"  Enabled="true" CssClass="form-control input-sm" Height="25px" Width="273px" /></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtFecha_Oficio" runat="server" Enabled="true" CssClass="form-control input-sm" placeholder="00/00/0000 00:00:00" Height="25px" Width="279px" /></td>
                                            </tr>
                                        </table>
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <br />                                                               
                                            </div>
                                        </div>                                       
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
                                                <td class="auto-style15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblCondicion_Caso" Text="Usuario*" runat="server" Height="30px" Width="279px" /></td>

                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDescripcion_Unidad" Text="Descripción unidad*" runat="server" Height="30px" Width="279px"/></td>                                                
                                            </tr>
                                            <tr>
                                                <td class="auto-style15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlCondicion_Caso" runat="server" CssClass="form-control input-sm" Height="30px" Width="279px">   
                                                        <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                                        <asp:ListItem Text="EXTERNO " Value="EXTERNO"></asp:ListItem>
                                                        <asp:ListItem Text="INTERNO " Value="INTERNO"></asp:ListItem>
                                                    </asp:DropDownList></td>

                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtDescripcion_Unidad" runat="server" Enabled="false" CssClass="form-control input-sm" Height="25px" Width="272px"/></td>
                                                                                               
                                            </tr>                                           
                                        </table> 
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <br />                                                               
                                            </div>
                                        </div>                                      
                                    </div>
                                </div>                                
                            </div>
                        
                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style18">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDescripcion_Despacho" Text="Descripción despacho" runat="server" /> </td>

                                                <td class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDescripcion_Direccion" Text="Descripción dirección" runat="server" /></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDescripcion_Departamento" Text="Descripción departamento" runat="server"/></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style18">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtDespacho" runat="server" Enabled="false" CssClass="form-control input-sm" Height="25px" Width="273px"></asp:TextBox></td>

                                                <td class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtDireccion" runat="server" Enabled="false" CssClass="form-control input-sm" Height="25px" Width="273px"></asp:TextBox></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtDepartamento" runat="server" Enabled="false" CssClass="form-control input-sm" Height="25px" Width="273px"></asp:TextBox></td>
                                            </tr>                                           
                                        </table>
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <br />                                                               
                                            </div>
                                        </div>                                        
                                    </div>
                                </div>                                                             
                            </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                            <asp:UpdatePanel runat="server" id="UpdatePanel2" updatemode="Conditional">  
                            <ContentTemplate>
                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style18">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDimension" Text="Dimensión*" runat="server" /></td>

                                                <td class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblLetra_Dimension" Text="Letra dimensión*" runat="server" /></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDetalle_Dimension" Text="Detalle dimensión*" runat="server"/></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style18">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtTipo_Dimension" runat="server" Enabled="false" CssClass="form-control input-sm" Height="25px" Width="271px"></asp:TextBox>
                                                    

                                                <td class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtLetra_Dimension" runat="server" Enabled="false" CssClass="form-control input-sm" Height="25px" Width="270px"></asp:TextBox>
                                                    

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtTipo_Detalle_Letra_Dimension" runat="server" Enabled="false" CssClass="form-control input-sm" Height="25px" Width="273px" ></asp:TextBox></td>
                                            </tr>                                          
                                        </table>
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <br />                                                               
                                            </div>
                                        </div>                                                                            
                                    </div>
                                </div>                
                            </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>


                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblValoracion_Admisibilidad" Text="Valoración de admisibilidad*" runat="server"  /></td>

                                                <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblVeredicto_Valoracion" Text="Veredicto de la valoración de ingreso" runat="server" /></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTrazabilidad" Text="Trazabilidad " runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlValoracion_Admisibilidad" runat="server" CssClass="form-control input-sm" Height="30px" Width="279px">                            
                                                        <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                                        <asp:ListItem Text="Poca complejidad" Value="Poca complejidad"></asp:ListItem>
                                                        <asp:ListItem Text="Mediana complejidad" Value="Mediana complejidad"></asp:ListItem>
                                                        <asp:ListItem Text="Alta complejidad" Value="Alta complejidad"></asp:ListItem>
                                                    </asp:DropDownList></td>

                                                <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlVeredicto_Valoracion" runat="server" CssClass="form-control input-sm" Height="30px" Width="279px">                            
                                                        <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                                        <asp:ListItem Text="Desestimación" Value="Desestimación"></asp:ListItem>
                                                        <asp:ListItem Text="Traslado a otras instancias administrativas o jurisdiccionales" Value="Traslado a otras instancias administrativas o jurisdiccionales"></asp:ListItem>
                                                        <asp:ListItem Text="Aceptación condicionada a la ampliación de datos" Value="Aceptación condicionada a la ampliación de datos"></asp:ListItem>
                                                        <asp:ListItem Text="Inicio de una investigación" Value="Inicio de una investigación"></asp:ListItem>
                                                    </asp:DropDownList></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlTrazabilidad_Casos" runat="server" CssClass="form-control input-sm" Height="30px" Width="279px">
                                                        <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                                        <asp:ListItem Text="Despacho Ministerial" Value="Despacho Ministerial"></asp:ListItem>
                                                        <asp:ListItem Text="Viceministerio" Value="Viceministerio"></asp:ListItem>
                                                        <asp:ListItem Text="Dirección" Value="Dirección"></asp:ListItem>
                                                        <asp:ListItem Text="Departamento" Value="Departamento"></asp:ListItem>
                                                        <asp:ListItem Text="Unidad" Value="Unidad"></asp:ListItem>
                                                    </asp:DropDownList></td>
                                                </tr>
                                        </table>
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <br />                                                               
                                            </div>
                                        </div>                                                                           
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDetalle_Inconformidad" Text="Detalle de inconformidad*" runat="server" /> </td>

                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat="server" ID="txtAsunto" TextMode="Multiline" CssClass="form-control input-lg"  Name="S1" Rows="5" Cols="12" Width="1125px" style="resize:none;"  /></td>
                                            </tr>
                                        </table>
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <br />                                                               
                                            </div>
                                        </div>                                     
                                    </div>
                                </div>                                                                
                            </div>
                                                     

                            <asp:UpdatePanel runat="server" id="UpdatePanel3" updatemode="Conditional">  
                            <ContentTemplate>
                            <div class="row">
                                 <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                         <asp:Button ID="btnAgregarAvance1" runat="server" CssClass="btn btn-primary" Width="120px" Height="45px" Text="Agregar Avance 1" OnClick="btnAgregarAvance1_Click" />
                                    </div>
                                </div>                                                            
                             </div>
                             <br/>
                            
                            <asp:UpdatePanel ID="AvancePanel1" runat="server" updatemode="Conditional">                              
                                <ContentTemplate>
                                   
                                    <div class="row">
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <table style="width: 100%;" border="0">
                                                    <tr>
                                                        <td class="auto-style19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFecha_Avance1" Text="Fecha del seguimiento 1" runat="server"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtFecha_Avance1" runat="server" Height="25px" Width="279px" Enabled="true" CssClass="form-control input-sm" placeholder="00/00/0000 00:00:00"  /></td>
                                                    </tr>
                                                </table>
                                                <div class="col-md-3 col-md-offset-1">
                                                    <div class="form-group">
                                                        <br />                                                               
                                                    </div>
                                                </div>                                     
                                            </div>
                                        </div>                                                                
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <table style="width: 100%;" border="0">
                                                    <tr>
                                                        <td class="auto-style19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDetalle_Avance1" Text="Detalle del seguimiento 1" runat="server" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat="server" ID="txtDetalle_Avance1" TextMode="Multiline" Enabled="true" CssClass="form-control input-lg" Rows="2" Cols="12" Width="739px" style="resize:none;" Height="56px" /></td>
                                                    </tr>
                                                </table>
                                                <div class="col-md-3 col-md-offset-1">
                                                    <div class="form-group">
                                                        <br />                                                               
                                                    </div>
                                                </div>                                     
                                            </div>
                                        </div>                                                                
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">                                                
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnInsertar_Avance1" runat="server" Text="Insertar Avance" CssClass="btn btn-primary" Width="120px" Height="45px" OnClick="btnInsertar_Avance1_Click"  />
                                            </div>
                                        </div>                                                                      
                                    </div> 
                   
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger controlid="btnInsertar_Avance1"  />
                                </Triggers>
                          </asp:UpdatePanel>

                        </ContentTemplate>
                       </asp:UpdatePanel>
                        <br/>
                        <br/>
                        <br/>

                        <asp:UpdatePanel runat="server" id="UpdatePanel6" updatemode="Conditional">  
                            <ContentTemplate>
                            <div class="row">
                                 <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                         <asp:Button ID="btnAgregarAvance2" runat="server" CssClass="btn btn-primary" Width="120px" Height="45px" Text="Agregar Avance 2" OnClick="btnAgregarAvance2_Click" />
                                    </div>
                                </div>                                                            
                             </div>
                             <br/>
                            
                            <asp:UpdatePanel ID="AvancePanel2" runat="server" updatemode="Conditional">                              
                                <ContentTemplate>
                                    
                                    <div class="row">
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <table style="width: 100%;" border="0">
                                                    <tr>
                                                        <td class="auto-style19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFecha_Avance2" Text="Fecha del seguimiento 2" runat="server"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtFecha_Avance2" runat="server" Height="25px" Width="279px" Enabled="true" CssClass="form-control input-sm" placeholder="00/00/0000 00:00:00"  /></td>
                                                    </tr>
                                                </table>
                                                <div class="col-md-3 col-md-offset-1">
                                                    <div class="form-group">
                                                        <br />                                                               
                                                    </div>
                                                </div>                                     
                                            </div>
                                        </div>                                                                
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <table style="width: 100%;" border="0">
                                                    <tr>
                                                        <td class="auto-style19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDetalle_Avance2" Text="Detalle del seguimiento 2" runat="server" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat="server" ID="txtDetalle_Avance2" TextMode="Multiline" Enabled="true" CssClass="form-control input-lg" Rows="2" Cols="12" Width="739px" style="resize:none;" Height="56px" /></td>
                                                    </tr>
                                                </table>
                                                <div class="col-md-3 col-md-offset-1">
                                                    <div class="form-group">
                                                        <br />                                                               
                                                    </div>
                                                </div>                                     
                                            </div>
                                        </div>                                                                
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">                                                
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnInsertar_Avance2" runat="server" Text="Insertar Avance" CssClass="btn btn-primary" Width="120px" Height="45px" OnClick="btnInsertar_Avance2_Click"  />
                                            </div>
                                        </div>                                                                      
                                    </div> 
                                         
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger controlid="btnInsertar_Avance2"  />
                                </Triggers>
                          </asp:UpdatePanel>

                        </ContentTemplate>
                       </asp:UpdatePanel>
                        <br/>
                        <br/>
                        <br/>

                        <asp:UpdatePanel runat="server" id="UpdatePanel7" updatemode="Conditional">  
                            <ContentTemplate>
                            <div class="row">
                                 <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                         <asp:Button ID="btnAgregarAvance3" runat="server" CssClass="btn btn-primary" Width="120px" Height="45px" Text="Agregar Avance 3" OnClick="btnAgregarAvance3_Click" />
                                    </div>
                                </div>                                                            
                             </div>
                             <br/>
                            
                            <asp:UpdatePanel ID="AvancePanel3" runat="server" updatemode="Conditional">                              
                                <ContentTemplate>
                                    
                                    <div class="row">
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <table style="width: 100%;" border="0">
                                                    <tr>
                                                        <td class="auto-style19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFecha_Avance3" Text="Fecha del seguimiento 3" runat="server"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtFecha_Avance3" runat="server" Height="25px" Width="279px" Enabled="true" CssClass="form-control input-sm" placeholder="00/00/0000 00:00:00" /></td>
                                                    </tr>
                                                </table>
                                                <div class="col-md-3 col-md-offset-1">
                                                    <div class="form-group">
                                                        <br />                                                               
                                                    </div>
                                                </div>                                     
                                            </div>
                                        </div>                                                                
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <table style="width: 100%;" border="0">
                                                    <tr>
                                                        <td class="auto-style19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDetalle_Avance3" Text="Detalle del seguimiento 3" runat="server" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat="server" ID="txtDetalle_Avance3" TextMode="Multiline" Enabled="true" CssClass="form-control input-lg" Rows="2" Cols="12" Width="739px" style="resize:none;" Height="56px" /></td>
                                                    </tr>
                                                </table>
                                                <div class="col-md-3 col-md-offset-1">
                                                    <div class="form-group">
                                                        <br />                                                               
                                                    </div>
                                                </div>                                     
                                            </div>
                                        </div>                                                                
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">                                                
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnInsertar_Avance3" runat="server" Text="Insertar Avance" CssClass="btn btn-primary" Width="120px" Height="45px" OnClick="btnInsertar_Avance3_Click"  />
                                            </div>
                                        </div>                                                                      
                                    </div> 
                                         
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger controlid="btnInsertar_Avance3"  />
                                </Triggers>
                          </asp:UpdatePanel>

                        </ContentTemplate>
                       </asp:UpdatePanel>
                        <br/>
                        <br/>
                        <br/>


                        <asp:UpdatePanel runat="server" id="UpdatePanel8" updatemode="Conditional">  
                            <ContentTemplate>
                            <div class="row">
                                 <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                         <asp:Button ID="btnAgregarAvance4" runat="server" CssClass="btn btn-primary" Width="120px" Height="45px" Text="Agregar Avance 4" OnClick="btnAgregarAvance4_Click" />
                                    </div>
                                </div>                                                            
                             </div>
                             <br/>
                            
                            <asp:UpdatePanel ID="AvancePanel4" runat="server" updatemode="Conditional">                              
                                <ContentTemplate>
                                    
                                    <div class="row">
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <table style="width: 100%;" border="0">
                                                    <tr>
                                                        <td class="auto-style19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFecha_Avance4" Text="Fecha del seguimiento 4" runat="server"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtFecha_Avance4" runat="server"  Height="25px" Width="279px" Enabled="true" CssClass="form-control input-sm" placeholder="00/00/0000 00:00:00"  /></td>
                                                    </tr>
                                                </table>
                                                <div class="col-md-3 col-md-offset-1">
                                                    <div class="form-group">
                                                        <br />                                                               
                                                    </div>
                                                </div>                                     
                                            </div>
                                        </div>                                                                
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <table style="width: 100%;" border="0">
                                                    <tr>
                                                        <td class="auto-style19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDetalle_Avance4" Text="Detalle del seguimiento 4" runat="server" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat="server" ID="txtDetalle_Avance4" TextMode="Multiline" Enabled="true" CssClass="form-control input-lg" Rows="2" Cols="12" Width="739px" style="resize:none;" Height="56px" /></td>
                                                    </tr>
                                                </table>
                                                <div class="col-md-3 col-md-offset-1">
                                                    <div class="form-group">
                                                        <br />                                                               
                                                    </div>
                                                </div>                                     
                                            </div>
                                        </div>                                                                
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">                                                
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnInsertar_Avance4" runat="server" Text="Insertar Avance" CssClass="btn btn-primary" Width="120px" Height="45px" OnClick="btnInsertar_Avance4_Click"  />
                                            </div>
                                        </div>                                                                      
                                    </div> 
                                         
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger controlid="btnInsertar_Avance4"  />
                                </Triggers>
                          </asp:UpdatePanel>

                        </ContentTemplate>
                       </asp:UpdatePanel>
                        <br/>
                        <br/>

                        <div id="grdAvancePanel" runat="server"  style="width: 1200px;">
                            <asp:UpdatePanel runat="server" id="UpdatePanel4" updatemode="Conditional">  
                            <ContentTemplate>                       
                                <asp:GridView ID="gvwAvance" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" Style="margin-left: 47px; margin-right: 282px;" Width="1134px" DataKeyNames="intIdCasos" AllowSorting="True" Height="154px">
                                    <Columns>
                                        <asp:BoundField DataField="intIdCasos" HeaderText="Código de caso" ReadOnly="True" InsertVisible="False" Visible="False"></asp:BoundField>
                                        <asp:BoundField DataField="dtiCasoAvanceFecha1" HeaderText="Fecha del avance 1"></asp:BoundField>
                                        <asp:BoundField DataField="vchCasoAvance1" HeaderText="Detalle del avance 1" ></asp:BoundField>
                                        <asp:BoundField DataField="dtiCasoAvanceFecha2" HeaderText="Fecha del avance 2" ></asp:BoundField>
                                        <asp:BoundField DataField="vchCasoAvance2" HeaderText="Detalle del avance 2" ></asp:BoundField>
                                        <asp:BoundField DataField="dtiCasoAvanceFecha3" HeaderText="Fecha del avance 3"></asp:BoundField>
                                        <asp:BoundField DataField="vchCasoAvance3" HeaderText="Detalle del avance 3" ></asp:BoundField>
                                        <asp:BoundField DataField="dtiCasoAvanceFecha4" HeaderText="Fecha del avance 4" ></asp:BoundField>
                                        <asp:BoundField DataField="vchCasoAvance4" HeaderText="Detalle del avance 4"></asp:BoundField>
                                    </Columns>
                                    <RowStyle Width="250px" BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                                    <FooterStyle BackColor="#00A0E3" ForeColor="White" />
                                    <PagerStyle BackColor="#00A0e3" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#00A0e3" ForeColor="White" HorizontalAlign="Center" Width="250px" Wrap="False" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />   
                                </asp:GridView>
                                &nbsp;
                                <asp:SqlDataSource runat="server" ID="sdsMostrarAvances" ConnectionString='<%$ ConnectionStrings:bda_SIREGE_Connection %>' SelectCommand="palMostrarAvanceCasos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </ContentTemplate>
                       </asp:UpdatePanel>
                     </div>
                    <br/>                        

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblRespuesta_Caso" Text="Respuesta del expediente" runat="server"/> </td>

                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat="server" ID="txtRespuesta" TextMode="Multiline" Enabled="true" CssClass="form-control input-lg" Name="S2" Rows="5" Cols="12" Width="1125px" style="resize:none;" /></td>
                                            </tr>
                                        </table>
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <br />                                                               
                                            </div>
                                        </div>                                     
                                    </div>
                                </div>                                                                
                            </div>

                             
                           <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFecha_Respuesta" Text="Fecha de respuesta" runat="server"/></td>

                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFecha_Cierre" Text="Fecha de cierre" runat="server"/></td>                                                
                                            </tr>
                                            <tr>
                                                <td class="auto-style19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtFecha_Respuesta_Casos" runat="server"  Enabled="true" CssClass="form-control input-sm" Height="25px" Width="279px" /></td>

                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtFecha_Cerrado_Casos" runat="server"  Enabled="true" CssClass="form-control input-sm" Height="25px" Width="279px" /></td>           
                                            </tr>
                                        </table>
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <br />                                                               
                                            </div>
                                        </div>                                       
                                    </div>
                                </div>                                                                                                                                              
                            </div> 


                        

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style23">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnUpdate" runat="server" Text="Actualizar" CssClass="btn btn-primary" Width="85px" Height="45px" OnClick="btnUpdate_Click" /></td>

                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button Text="Volver" ID="btnCancelar" CssClass="btn btn-primary" Width="85px" Height="45px" runat="server" OnClick="btnCancel_Click" /></td>
                                            </tr>
                                        </table>                                       
                                    </div>
                                </div>                                  
                            </div>
                            <br/>
                            
                            <asp:LinkButton ID="lnk" runat="server"></asp:LinkButton>
                            <asp:ModalPopupExtender ID="ModalPopupExtender_Exito" BehaviorID="MPE_Exito" runat="server"
                                PopupControlID="pnlPopup_Exito" TargetControlID="lnk" BackgroundCssClass="modalBackground"
                                CancelControlID="btnCerrar_Exito">
                            </asp:ModalPopupExtender>
                            <asp:Panel ID="pnlPopup_Exito" runat="server" CssClass="modalPopup" Style="display: none">
                                <div class="header">
                                    Mensaje de Información
                                </div>
                                <div class="body">
                                    El elemento se ha modificado exitosamente
                                    <br />
                                    <asp:Button ID="btnCerrar_Exito" runat="server" Text="Cerrar" PostBackUrl="~/Formularios/Tabla_Casos-SistemaRegistroGestiones.aspx" />
                                </div>
                            </asp:Panel>

                            <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
                            <asp:ModalPopupExtender ID="ModalPopupExtender_Incompleto" BehaviorID="MPE_Incompleto" runat="server"
                                PopupControlID="pnlPopup_Incompleto" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground"
                                CancelControlID="btnCerrar_Incompleto">
                            </asp:ModalPopupExtender>
                            <asp:Panel ID="pnlPopup_Incompleto" runat="server" CssClass="modalPopup" Style="display: none">
                                <div class="header">
                                    Mensaje de Información
                                </div>
                                <div class="body">
                                    Faltan elementos que agregar en el formulario
                                    <br />
                                    <asp:Button ID="btnCerrar_Incompleto" runat="server" Text="Cerrar" />
                                </div>
                            </asp:Panel>

                            <asp:ModalPopupExtender ID="ModalPopupExtender_Error" BehaviorID="MPE_Error" runat="server"
                                PopupControlID="pnlPopup_Error" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground"
                                CancelControlID="btnCerrar_Error">
                            </asp:ModalPopupExtender>
                            <asp:Panel ID="pnlPopup_Error" runat="server" CssClass="modalPopup" Style="display: none">
                                <div class="header">
                                    Mensaje de Alerta
                                </div>
                                <div class="body">
                                    Hubo un problema en modificar el formulario. Porfavor revisar formulario.
                                    <br />
                                    <asp:Button ID="btnCerrar_Error" runat="server" Text="Cerrar" />
                                </div>
                            </asp:Panel>

                            

                            <asp:LinkButton ID="lnkDummy2" runat="server"></asp:LinkButton>
                            <asp:ModalPopupExtender ID="ModalPopupExtender_AvanceExito" BehaviorID="ModalPopupExtender_AvanceExito" runat="server"
                                PopupControlID="pnlPopup_AvanceExito" TargetControlID="lnkDummy2" BackgroundCssClass="modalBackground"
                                CancelControlID="btnCerrar_Avance_Exito">
                            </asp:ModalPopupExtender>
                            <asp:Panel ID="pnlPopup_AvanceExito" runat="server" CssClass="modalPopup" Style="display: none">
                                <div class="header">
                                    Mensaje de Información
                                </div>
                                <div class="body">
                                    El avance del caso ha sido registrado exitosamente
                                    <br />
                                    <asp:Button ID="btnCerrar_Avance_Exito" runat="server" Text="Cerrar" />
                                </div>
                            </asp:Panel>

                            <asp:LinkButton ID="lnkDummy3" runat="server"></asp:LinkButton>
                            <asp:ModalPopupExtender ID="ModalPopupExtender_AvanceError" BehaviorID="ModalPopupExtender_AvanceError" runat="server"
                                PopupControlID="pnlPopup_AvanceError" TargetControlID="lnkDummy3" BackgroundCssClass="modalBackground"
                                CancelControlID="btnCerrar_Avance_Error">
                            </asp:ModalPopupExtender>
                            <asp:Panel ID="pnlPopup_AvanceError" runat="server" CssClass="modalPopup" Style="display: none">
                                <div class="header">
                                    Mensaje de Información
                                </div>
                                <div class="body">
                                    Hubo un problema en agregar el avance. Porfavor revisar que esta ingresando la información correcta.
                                    <br />
                                    <asp:Button ID="btnCerrar_Avance_Error" runat="server" Text="Cerrar" />
                                </div>
                            </asp:Panel>



                      </div>                                         
                </div>
            </div>                           
</asp:Content>