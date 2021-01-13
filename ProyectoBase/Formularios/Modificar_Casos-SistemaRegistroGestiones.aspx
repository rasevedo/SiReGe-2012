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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">                
            <div class="row">
                <div class="col-lg-12">                    
                        <header class="panel-heading">
                            <div class="col-md-5 col-md-offset-4">
                                <h1 class="centrar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Modificar Caso</h1>
                            </div>
                        </header>
                        <div class="panel-body">

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lblCodigo_Caso" Text="Codigo de Caso" runat="server" />
                                        &nbsp;<asp:TextBox ID="txtId_Casos" runat="server" Enabled="false" CssClass="form-control input-sm" Width="44px"  />
                                    </div>
                                </div>                            
                            </div>

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNumero_Caso" Text="Número de Caso" runat="server" /></td>

                                                <td class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblEstado_Caso" Text="Estado del Caso" runat="server" /></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFecha_Caso" Text="Fecha de Caso*" runat="server"/></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNumero_Caso" runat="server" Enabled="true" CssClass="form-control input-sm" Height="25px" Width="273px"  /></td>

                                                <td class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlEstado_Caso" runat="server" CssClass="form-control input-sm" Height="30px" Width="279px">
                                                        <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                                        <asp:ListItem Text="ABIERTO" Value="ABIERTO"></asp:ListItem>
                                                        <asp:ListItem Text="CERRADO" Value="CERRADO"></asp:ListItem>
                                                    </asp:DropDownList></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtFecha_Caso" runat="server" TextMode="Date" Enabled="true" CssClass="form-control input-sm" Height="30px" Width="279px" /></td>
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
                                                <td class="auto-style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblCedula_Usuario" Text="Cédula del Usuario" runat="server" /></td>

                                                <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNombre_Usuario" Text="Nombre del Usuario" runat="server" /></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFuncionario_Tramita" Text="Funcionario que Tramita" runat="server"/></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtCedula_Usuario" runat="server" Enabled="true" CssClass="form-control input-sm" Height="25px" Width="273px"  /></td>

                                                <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNombre_Usuario" runat="server" Enabled="true" CssClass="form-control input-sm" Height="25px" Width="273px" /></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="intIdEmpleados" runat="server" CssClass="form-control input-sm" DataSourceID="sdsEmpleados" DataTextField="vchNombreEmpleados" DataValueField="intIdEmpleados" Height="30px" Width="279px"  />
                                                    <asp:SqlDataSource ID="sdsEmpleados" runat="server" ConnectionString="<%$ ConnectionStrings:bda_SIREGE_Connection %>" SelectCommand="palSeleccionarEmpleados" SelectCommandType="StoredProcedure"></asp:SqlDataSource></td>
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
                                                <td class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNombre_CE" Text="Nombre del Centro Educativo" runat="server" /></td>

                                                <td class="auto-style21">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNumero_Oficio" Text="Número de Oficio" runat="server"/></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFecha_Oficio" Text="Fecha de Oficio" runat="server"/></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNombre_CE" runat="server" Enabled="true" CssClass="form-control input-sm" Height="25px" Width="273px" /></td>

                                                <td class="auto-style21">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNumero_Oficio" runat="server"  Enabled="true" CssClass="form-control input-sm" Height="25px" Width="273px" /></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtFecha_Oficio" runat="server" TextMode="Date" Enabled="true" CssClass="form-control input-sm" Height="30px" Width="279px" /></td>
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
                                                <td class="auto-style15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblCondicion_Caso" Text="Condición del Caso" runat="server" Height="30px" Width="279px" /></td>

                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDescripcion_Unidad" Text="Descripción Unidad" runat="server" Height="30px" Width="279px"/></td>                                                
                                            </tr>
                                            <tr>
                                                <td class="auto-style15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlCondicion_Caso" runat="server" CssClass="form-control input-sm" Height="30px" Width="279px">   
                                                        <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                                        <asp:ListItem Text="EXTERNO " Value="EXTERNO"></asp:ListItem>
                                                        <asp:ListItem Text="INTERNO " Value="INTERNO"></asp:ListItem>
                                                    </asp:DropDownList></td>

                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlDescripcion_Unidad" runat="server" CssClass="form-control input-sm" AutoPostBack="True" OnSelectedIndexChanged="ddlDescripcion_Unidad_SelectedIndexChanged" DataSourceID="sdsDescripcion_Unidad" DataTextField="vchDescripcionUnidad" DataValueField="intIdUnidad" Height="30px" Width="279px"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="sdsDescripcion_Unidad" ConnectionString='<%$ ConnectionStrings:bda_SIREGE_Connection %>' SelectCommand="palConsultarUnidades" SelectCommandType="StoredProcedure"></asp:SqlDataSource></td>                                           
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
                                                <td class="auto-style18">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDescripcion_Despacho" Text="Descripción Despacho" runat="server" /> </td>

                                                <td class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDescripcion_Direccion" Text="Descripción Dirección" runat="server" /></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDescripcion_Departamento" Text="Descripción Departamento" runat="server"/></td>
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

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style18">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDimension" Text="Dimensión*" runat="server" /></td>

                                                <td class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblLetra_Dimension" Text="Letra Dimensión*" runat="server" /></td>

                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDetalle_Dimension" Text="Detalle Dimensión*" runat="server"/></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style18">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlTipo_Dimension" runat="server" CssClass="form-control input-sm" DataSourceID="sdsTipo_Dimensiones" DataTextField="vchTipoDimension" DataValueField="vchTipoDimension" Height="30px" Width="279px"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="sdsTipo_Dimensiones" ConnectionString='<%$ ConnectionStrings:bda_SIREGE_Connection %>' SelectCommand="palAgruparTipoDimensiones" SelectCommandType="StoredProcedure"></asp:SqlDataSource></td>

                                                <td class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlLetra_Dimension" runat="server" CssClass="form-control input-sm" DataSourceID="sdsLetra_Dimension" DataTextField="vchLetraDimension" DataValueField="intIdDimension" AutoPostBack="True" OnSelectedIndexChanged="ddlLetra_Dimension_SelectedIndexChanged" Height="30px" Width="279px"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="sdsLetra_Dimension" ConnectionString='<%$ ConnectionStrings:bda_SIREGE_Connection %>' SelectCommand="palSeleccionarLetraDimensiones" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlTipo_Dimension" PropertyName="SelectedValue" Name="vchTipoDimension" Type="String"></asp:ControlParameter>
                                                        </SelectParameters>
                                                    </asp:SqlDataSource></td>

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


                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblValoracion_Admisibilidad" Text="Valoración de Admisibilidad" runat="server"  /></td>

                                                <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblVeredicto_Valoracion" Text="Veredicto de la Valoración de Ingreso" runat="server" /></td>

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
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDetalle_Inconformidad" Text="Detalle de Inconformidad" runat="server" /> </td>

                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat="server" ID="txtAsunto" TextMode="Multiline" CssClass="form-control input-lg"  Name="S1" Rows="5" Cols="12" Width="1125px"  /></td>
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
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblRespuesta_Caso" Text="Respuesta del Caso" runat="server"/> </td>

                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat="server" ID="txtRespuesta" TextMode="Multiline" Enabled="true" CssClass="form-control input-lg" Name="S2" Rows="5" Cols="12" Width="1125px" /></td>
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
                                                <td class="auto-style19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFecha_Respuesta" Text="Fecha de Respuesta" runat="server"/></td>

                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFecha_Cierre" Text="Fecha de Cierre" runat="server"/></td>                                                
                                            </tr>
                                            <tr>
                                                <td class="auto-style19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtFecha_Respuesta_Casos" runat="server" TextMode="Date" Enabled="true" CssClass="form-control input-sm" Height="30px" Width="279px" /></td>

                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtFecha_Cerrado_Casos" runat="server" TextMode="Date" Enabled="true" CssClass="form-control input-sm" Height="30px" Width="279px" /></td>           
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
                                         <asp:Button ID="btnAgregarAvance" runat="server" CssClass="btn btn-primary" Width="170px" Text="Agregar Avance" OnClick="btnAgregarAvance_Click" />
                                    </div>
                                </div>
                                                             
                             </div>

                            
                            <asp:UpdatePanel ID="AvancePanel" runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                    <div class="col-md-3 col-md-offset-1" >
                                            <div class="form-group">
                                                <asp:Label ID="lblFecha_Avance" Text="Fecha del Avance" runat="server"/>
                                                <asp:TextBox ID="txtFecha_Avance" runat="server" TextMode="Date" Enabled="true" CssClass="form-control input-sm"  />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <asp:Label ID="lblDetalle_Avance" Text="Detalle del Avance" runat="server" />
                                                <asp:TextBox runat="server" ID="txtDetalle_Avance" TextMode="Multiline" Enabled="true" CssClass="form-control input-lg" Rows="2" Cols="12" />
                                            </div>
                                        </div>                                       
                                    </div> 
                                    
                                    <div class="row">
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">                                                
                                                <asp:Button ID="btnInsertar_Avance" runat="server" Text="Insertar Avance" CssClass="btn btn-primary" Width="170px" OnClick="btnInsertar_Avance_Click" />
                                            </div>
                                        </div>                                                                      
                                    </div>

                                    <asp:GridView ID="gvwAvance" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" DataKeyNames="intIdAvanceCasos,intIdCasos" >
                                        <Columns>
                                            <asp:BoundField DataField="intIdAvanceCasos" HeaderText="Codigo de Avance(General)" ReadOnly="True" InsertVisible="False" SortExpression="intIdAvanceCasos" Visible="False"></asp:BoundField>
                                            <asp:BoundField DataField="intIdCasos" HeaderText="Codigo de Caso" SortExpression="intIdCasos" InsertVisible="False" ReadOnly="True" Visible="False"></asp:BoundField>
                                            <asp:BoundField DataField="vchDetalleAvance" HeaderText="Detalle del Avance" SortExpression="vchDetalleAvance"></asp:BoundField>
                                            <asp:BoundField DataField="dtiFechaAvance" HeaderText="Fecha del Avance" SortExpression="dtiFechaAvance"></asp:BoundField>
                                        </Columns>
                                        <FooterStyle BackColor="White" ForeColor="#000066"></FooterStyle>
                                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                        <PagerStyle HorizontalAlign="Left" BackColor="White" ForeColor="#000066"></PagerStyle>
                                        <RowStyle ForeColor="#000066"></RowStyle>
                                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
                                        <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
                                        <SortedAscendingHeaderStyle BackColor="#007DBB"></SortedAscendingHeaderStyle>
                                        <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
                                        <SortedDescendingHeaderStyle BackColor="#00547E"></SortedDescendingHeaderStyle>
                                    </asp:GridView>

                                    </div>
                                </div>
                            </div>                         
                                <asp:SqlDataSource runat="server" ID="sdsMostrarAvances" ConnectionString='<%$ ConnectionStrings:bda_SIREGE_Connection %>' SelectCommand="palMostrarCasoAvances" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </ContentTemplate>
                          </asp:UpdatePanel>

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style23">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnUpdate" runat="server" Text="Actualizar" CssClass="btn btn-primary" Width="170px" OnClick="btnUpdate_Click" /></td>

                                                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button Text="Cancelar" ID="btnCancelar" CssClass="btn btn-primary" Width="170px" runat="server" OnClick="btnCancel_Click" /></td>
     
                                            </tr>
                                        </table>                                       
                                    </div>
                                </div>                                  
                            </div>
                            
                            
                           

                            <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
                            <asp:ModalPopupExtender ID="ModalPopupExtender_Exito" BehaviorID="MPE_Exito" runat="server"
                                PopupControlID="pnlPopup_Exito" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground"
                                CancelControlID="btnCerrar_Exito">
                            </asp:ModalPopupExtender>
                            <asp:Panel ID="pnlPopup_Exito" runat="server" CssClass="modalPopup" Style="display: none">
                                <div class="header">
                                    Mensaje de Información
                                </div>
                                <div class="body">
                                    El elemento se ha modificado exitosamente
                                    <br />
                                    <asp:Button ID="btnCerrar_Exito" runat="server" Text="Cerrar" />
                                </div>
                            </asp:Panel>

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

                            <asp:ModalPopupExtender ID="ModalPopupExtender_AvanceExito" BehaviorID="MPE_Error" runat="server"
                                PopupControlID="pnlPopup_AvanceExito" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground"
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

                            <asp:ModalPopupExtender ID="ModalPopupExtender_AvanceError" BehaviorID="MPE_Error" runat="server"
                                PopupControlID="pnlPopup_AvanceError" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground"
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