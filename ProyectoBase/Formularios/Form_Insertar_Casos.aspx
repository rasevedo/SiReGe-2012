﻿<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="Form_Insertar_Casos.aspx.vb" Inherits="CapPresentacionSiReGe.Form_Insertar_Casos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">                
            <div class="row">
                <div class="col-lg-12">                    
                        <header class="panel-heading">
                            <div class="col-md-5 col-md-offset-4">
                                <h1>Insertar Caso</h1>
                            </div>
                        </header>
                        <div class="panel-body">

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label ID="Label1" Text="Número de Caso" runat="server" />
                                        <asp:TextBox ID="txtnumeroCaso" runat="server" Enabled="true" CssClass="form-control input-sm"  />
                                    </div>
                                </div>

                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label ID="Label2" Text="Estado del Caso" runat="server" />
                                        <asp:DropDownList ID="txtestadoCaso" runat="server" CssClass="form-control input-sm" >
                                            <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                            <asp:ListItem Text="ABIERTO" Value="ABIERTO"></asp:ListItem>
                                            <asp:ListItem Text="CERRADO" Value="CERRADO"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-3 col-md-offset-1" >
                                    <div class="form-group">
                                        <asp:Label ID="Label3" Text="Fecha de Caso*" runat="server"/>
                                        <asp:TextBox ID="txtfechaCaso" runat="server" TextMode="Date" Enabled="true" CssClass="form-control input-sm"  />
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label ID="Label4" Text="Cédula del Usuario" runat="server" />
                                        <asp:TextBox ID="txtcedulaUsuario" runat="server" Enabled="true" CssClass="form-control input-sm"  />
                                    </div>
                                </div>

                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label ID="Label5" Text="Nombre del Usuario" runat="server" />
                                        <asp:TextBox ID="txtnombreUsuario" runat="server" Enabled="true" CssClass="form-control input-sm"  />
                                    </div>
                                </div>

                                <div class="col-md-3 col-md-offset-1" >
                                    <div class="form-group">
                                        <asp:Label ID="Label6" Text="Funcionario que Tramita" runat="server"/>                                       
                                        <asp:DropDownList ID="idEmpleados" runat="server" CssClass="form-control input-sm" DataSourceID="SqlDataSource1" DataTextField="vchNombreEmpleados" DataValueField="intIdEmpleados"  />
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bda_SIREGE_Connection %>" SelectCommand="palSeleccionarEmpleados" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label ID="Label7" Text="Nombre del Centro Educativo" runat="server" />
                                        <asp:TextBox ID="txtnombreCE" runat="server" Enabled="true" CssClass="form-control input-sm"  />
                                    </div>
                                </div>

                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label ID="Label8" Text="Número de Oficio" runat="server"/>
                                        <asp:TextBox ID="txtnumeroOficio" runat="server"  Enabled="true" CssClass="form-control input-sm"  />
                                    </div>
                                </div>

                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label ID="Label9" Text="Fecha de Oficio" runat="server"/>
                                        <asp:TextBox ID="txtfechaOficio" runat="server" TextMode="Date" Enabled="true" CssClass="form-control input-sm"  />
                                    </div>
                                </div>
                            </div>
                        
                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label ID="Label10" Text="Condición del Caso" runat="server"  />
                                        <asp:DropDownList ID="txtcondicionCaso" runat="server" CssClass="form-control input-sm">   
                                            <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                            <asp:ListItem Text="EXTERNO " Value="EXTERNO"></asp:ListItem>
                                            <asp:ListItem Text="INTERNO " Value="INTERNO"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label ID="Label11" Text="Descripción Unidad" runat="server" />
                                        <asp:DropDownList ID="DD1" runat="server" CssClass="form-control input-sm" AutoPostBack="True" OnSelectedIndexChanged="DD1_SelectedIndexChanged" DataSourceID="SqlDataSource2" DataTextField="vchDescripcionUnidad" DataValueField="intIdUnidad"></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:bda_SIREGE_Connection %>' SelectCommand="palConsultarUnidades" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </div>
                                </div>

                              
                            </div>

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label ID="Label12" Text="Descripción Despacho" runat="server" />                                      
                                        <asp:TextBox ID="txtDespacho" runat="server" Enabled="false" CssClass="form-control input-sm"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label ID="Label13" Text="Descripción Dirección" runat="server" />
                                        <asp:TextBox ID="txtDireccion" runat="server" Enabled="false" CssClass="form-control input-sm"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-3 col-md-offset-1" >
                                    <div class="form-group">
                                        <asp:Label ID="Label14" Text="Descripción Departamento" runat="server"/>
                                        <asp:TextBox ID="txtDepartamento" runat="server" Enabled="false" CssClass="form-control input-sm"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                       <asp:Label ID="Label15" Text="Dimensión*" runat="server" />
                                        <asp:DropDownList ID="DDL_Dimension1" runat="server" CssClass="form-control input-sm" DataSourceID="SqlDataSource3" DataTextField="vchTipoDimension" DataValueField="vchTipoDimension"></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:bda_SIREGE_Connection %>' SelectCommand="palAgruparTipoDimensiones" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                                       
                                    </div>
                                </div>

                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label ID="Label16" Text="Letra Dimensión*" runat="server" />
                                        <asp:DropDownList ID="DDL_Dimension2" runat="server" CssClass="form-control input-sm" DataSourceID="SqlDataSource4" DataTextField="vchLetraDimension" DataValueField="intIdDimension" AutoPostBack="True" OnSelectedIndexChanged="DDL_Dimension2_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:bda_SIREGE_Connection %>' SelectCommand="palSeleccionarLetraDimensiones" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DDL_Dimension1" PropertyName="SelectedValue" Name="vchTipoDimension" Type="String"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>

                                <div class="col-md-3 col-md-offset-1" >
                                    <div class="form-group">
                                        <asp:Label ID="Label17" Text="Detalle Dimensión*" runat="server"/>
                                       <asp:TextBox ID="txtTipoDetalleLetraDimension" runat="server" Enabled="false" CssClass="form-control input-sm" ></asp:TextBox>
                                        
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label ID="Label18" Text="Valoración de Admisibilidad" runat="server"  />
                                        <asp:DropDownList ID="txtvaloracionAdmisibilidad" runat="server" CssClass="form-control input-sm">                            
                                            <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                            <asp:ListItem Text="Poca complejidad" Value="Poca complejidad"></asp:ListItem>
                                            <asp:ListItem Text="Mediana complejidad" Value="Mediana complejidad"></asp:ListItem>
                                            <asp:ListItem Text="Alta complejidad" Value="Alta complejidad"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label ID="Label19" Text="Veredicto de la Valoración de Ingreso" runat="server" />
                                        <asp:DropDownList ID="txtveredictoValoracion" runat="server" CssClass="form-control input-sm">                            
                                            <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                            <asp:ListItem Text="Desestimación" Value="Desestimación"></asp:ListItem>
                                            <asp:ListItem Text="Traslado a otras instancias administrativas o jurisdiccionales" Value="Traslado a otras instancias administrativas o jurisdiccionales"></asp:ListItem>
                                            <asp:ListItem Text="Aceptación condicionada a la ampliación de datos" Value="Aceptación condicionada a la ampliación de datos"></asp:ListItem>
                                            <asp:ListItem Text="Inicio de una investigación" Value="Inicio de una investigación"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label ID="Label20" Text="Trazabilidad " runat="server" />
                                        <asp:DropDownList ID="txttrazabilidadCasos" runat="server" CssClass="form-control input-sm">
                                            <asp:ListItem Text=" " Value=" "></asp:ListItem>
                                            <asp:ListItem Text="Despacho Ministerial" Value="Despacho Ministerial"></asp:ListItem>
                                            <asp:ListItem Text="Viceministerio" Value="Viceministerio"></asp:ListItem>
                                            <asp:ListItem Text="Dirección" Value="Dirección"></asp:ListItem>
                                            <asp:ListItem Text="Departamento" Value="Departamento"></asp:ListItem>
                                            <asp:ListItem Text="Unidad" Value="Unidad"></asp:ListItem>
                                        </asp:DropDownList>                                      
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-12 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label ID="Label21" Text="Detalle de Inconformidad" runat="server" />                                       
                                        <asp:TextBox runat="server" ID="txtasunto" TextMode="Multiline" CssClass="form-control input-lg"  Name="S1" Rows="5" Cols="12" />
                                    </div>
                                </div>
                            </div>                           
                            <div class="row">                              
                                <div class="col-md-12 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label ID="Label22" Text="Respuesta del Caso" runat="server"/>
                                        <asp:TextBox runat="server" ID="txtrespuesta" TextMode="Multiline" Enabled="true" CssClass="form-control input-lg" Name="S2" Rows="5" Cols="12" />                                        
                                    </div>
                                </div>
                            </div>  
                            
                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label ID="Label23" Text="Fecha de Respuesta" runat="server"/>
                                        <asp:TextBox ID="txtfechaRespuestaCasos" runat="server" TextMode="Date" Enabled="true" CssClass="form-control input-sm"  />
                                    </div>
                                </div>

                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label ID="Label24" Text="Fecha de Cierre" runat="server"/>
                                        <asp:TextBox ID="txtfechaCerradoCasos" runat="server" TextMode="Date" Enabled="true" CssClass="form-control input-sm"  />
                                    </div>
                                </div>                                
                            </div>
                            
                            <div class="row">
                                 <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Button Text="Agregar" ID="btnAgregar" CssClass="btn btn-primary" Width="170px" runat="server" OnClick="Button1_Click" />
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-6">
                                    <div class="form-group">
                                        <asp:Button Text="Volver" ID="btnVolver" CssClass="btn btn-primary" Width="170px" runat="server" OnClick="Button2_Click" />
                                    </div>
                                </div>                               
                             </div>
                           
                         </div>                                         
                </div>
            </div>                           
</asp:Content>