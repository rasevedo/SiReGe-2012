﻿<%@ Page Title="Modificar_Gestiones-SistemaRegistroGestiones" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="Modificar_Gestiones-SistemaRegistroGestiones.aspx.vb" Inherits="CapPresentacionSiReGe.Modificar_Gestiones" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>Modificar_Gestiones-SistemaRegistroGestiones</title>
    <style type="text/css">
        .input-sm {}
        .auto-style2 {
            width: 561px;
        }
        .auto-style3 {
            width: 554px;
        }
        .auto-style10 {
            width: 601px;
        }
        .auto-style11 {
            width: 492px;
        }
        .auto-style14 {
            width: 446px;
        }
        .auto-style15 {
            width: 386px;
        }
        .auto-style16 {
            width: 384px;
        }
        .auto-style17 {
            width: 441px;
        }
        .auto-style18 {
            width: 382px;
        }
        .auto-style19 {
            width: 443px;
        }
        .auto-style20 {
            width: 380px;
        }
        .auto-style21 {
            width: 445px;
        }
        .auto-style22 {
            width: 379px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">                
            <div class="row">
                <div class="col-lg-12">                    
                        <header class="panel-heading">
                            <div class="col-md-5 col-md-offset-4">
                                <h1 class="centrar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Modificar Gestión</h1>
                            </div>
                        </header>
                        <div class="panel-body">

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lblCodigo_Gestion" Text="Codigo de Gestión" runat="server" />
                                        &nbsp;<asp:TextBox ID="txtId_Gestiones" runat="server" Enabled="false" CssClass="form-control input-sm" Width="44px"  />
                                    </div>
                                </div>                            
                            </div>


                            <div class="row align-items-start">                               
                                <div class="col-md-3 col-md-offset-5">
                                <div class="form-group">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lblTipo_Gestion" Text="Tipo de Gestión*" runat="server" Font-Size="Medium" />
                                        <br />
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:RadioButtonList ID="rblTipo_Gestion"  runat="server" RepeatLayout="Flow" CssClass="DropDown" CellPadding="5" CellSpacing="5" Height="60px" Font-Size="Medium" >
                                            <asp:ListItem>Atención presencial</asp:ListItem>
                                            <asp:ListItem>Vía telefonica</asp:ListItem>
                                            <asp:ListItem>Correo Electrónico</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <br />
                                    </div>
                                </div>                              
                            </div>

                            <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <br />
                                                                  
                                    </div>
                                </div>

                            

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblCedula_Usuario" Text="Cédula del Usuario" runat="server" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblNombre_Usuario" Text="Nombre del Usuario" runat="server" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblFecha_Ingreso" Text="Fecha de Ingreso*" runat="server"/>
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtCedula_Usuario" runat="server" Enabled="true" CssClass="form-control input-sm" Height="25px" Width="273px"  />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:TextBox ID="txtNombre_Usuario" runat="server" Enabled="true" CssClass="form-control input-sm" Height="25px" Width="273px" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtFecha_Ingreso" runat="server" TextMode="Date" Enabled="true" CssClass="form-control input-sm" Height="25px" Width="271px"  />
                                    </div>
                                </div>

                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <br />
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFuncionario_Tramita" Text="Funcionario que tramita*" runat="server"/></td>
                                                
                                                <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblConfidencialidad" Text="Confidencialidad" runat="server" /></td>
                                                
                                                <td>&nbsp;<asp:Label ID="lblFuente_Generadora" Text="Fuente Generadora*" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="intIdEmpleados" runat="server" CssClass="form-control input-sm" DataSourceID="sdsEmpleados" DataTextField="vchNombreEmpleados" DataValueField="intIdEmpleados" Height="30px" Width="279px"  />
                                                    <asp:SqlDataSource ID="sdsEmpleados" runat="server" ConnectionString="<%$ ConnectionStrings:bda_SIREGE_Connection %>" SelectCommand="palSeleccionarEmpleados" SelectCommandType="StoredProcedure"></asp:SqlDataSource></td>
                                                
                                                <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlConfidencialidad" runat="server" CssClass="form-control input-sm" Height="29px" Width="277px" >
                                                        <asp:ListItem Text="-Seleccione-" Value=" "></asp:ListItem>
                                                        <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                                    </asp:DropDownList></td>
                                                
                                                <td>&nbsp;<asp:DropDownList ID="ddlFuente_Generadora" runat="server" CssClass="form-control input-sm" Height="29px" Width="283px" >
                                                        <asp:ListItem Text="-Seleccione-" Value=" "></asp:ListItem>
                                                        <asp:ListItem Text="Solicitud de un usuario" Value="Solicitud de un usuario"></asp:ListItem>
                                                        <asp:ListItem Text="Solicitud del Jerarca de la Administración Activa" Value="Solicitud del Jerarca de la Administración Activa"></asp:ListItem>
                                                        <asp:ListItem Text="Solicitud de algún titular de una Dirección del sector académico o administrativo" Value="Solicitud de algún titular de una Dirección del sector académico o administrativo"></asp:ListItem>
                                                    </asp:DropDownList></td>
                                            </tr>  
                                        </table>
                                    </div>
                                </div>                  
                            </div>

                            <div class="row">
                                <div class="col-md-3 col-md-offset-1">
                                    <div class="form-group">
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                                <br />
                                             </div>
                                        </div>
                                          <table style="width: 100%;">
                                                <tr>
                                                    <td class="auto-style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTipo_Servicio" Text="Tipo de servicio*" runat="server" /></td>
                                                    
                                                    <td class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDireccion_Regional" Text="Dirección Regional de Educación" runat="server" /></td>
                                                    
                                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblSupervision" Text="Supervisión " runat="server" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlTipo_Servicio" runat="server" CssClass="form-control input-sm" Height="29px" Width="283px">
                                                            <asp:ListItem Text="-Seleccione-" Value=" "></asp:ListItem>
                                                            <asp:ListItem Text="Evacuación de Consultas" Value="Evacuación de Consultas"></asp:ListItem>
                                                            <asp:ListItem Text="Denuncias e inconformidades" Value="Denuncias e inconformidades"></asp:ListItem>
                                                            <asp:ListItem Text="Investigaciones integrales de gestión del servicio" Value="Investigaciones integrales de gestión del servicio"></asp:ListItem>
                                                            <asp:ListItem Text="Asesoramiento y acompañamiento en instrucción" Value="Asesoramiento y acompañamiento en instrucción"></asp:ListItem>
                                                            <asp:ListItem Text="Elaboración de instrumentos y mecanismos de referencia para la evaluación global del servicio" Value="Elaboración de instrumentos y mecanismos de referencia para la evaluación global del servicio"></asp:ListItem>
                                                        </asp:DropDownList> </td>
                                                    
                                                    <td class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddl_Direccion_Regional_Educacion" runat="server" CssClass="form-control input-sm" Height="29px" Width="283px" >
                                                            <asp:ListItem Text="-Seleccione-" Value=" "></asp:ListItem>
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
                                                    
                                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlSupervision" runat="server" CssClass="form-control input-sm" Height="29px" Width="283px" >
                                                            <asp:ListItem Text="-Seleccione-" Value=" "></asp:ListItem>
                                                            <asp:ListItem Text="Circuito 1" Value="Circuito 1"></asp:ListItem>
                                                            <asp:ListItem Text="Circuito 2" Value="Circuito 2"></asp:ListItem>
                                                            <asp:ListItem Text="Circuito 3" Value="Circuito 3"></asp:ListItem>
                                                            <asp:ListItem Text="Circuito 4" Value="Circuito 4"></asp:ListItem>
                                                            <asp:ListItem Text="Circuito 5" Value="Circuito 5"></asp:ListItem>
                                                            <asp:ListItem Text="Circuito 6" Value="Circuito 6"></asp:ListItem>
                                                            <asp:ListItem Text="Circuito 7" Value="Circuito 7"></asp:ListItem>
                                                            <asp:ListItem Text="Circuito 8" Value="Circuito 8"></asp:ListItem>
                                                            <asp:ListItem Text="Circuito 9" Value="Circuito 9"></asp:ListItem>
                                                            <asp:ListItem Text="Circuito 10" Value="Circuito 10"></asp:ListItem>
                                                            <asp:ListItem Text="Circuito 11" Value="Circuito 11"></asp:ListItem>
                                                            <asp:ListItem Text="Circuito 12" Value="Circuito 12"></asp:ListItem>
                                                            <asp:ListItem Text="Circuito 13" Value="Circuito 13"></asp:ListItem>
                                                            <asp:ListItem Text="Circuito 14" Value="Circuito 14"></asp:ListItem>
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
                                                       <td class="auto-style18">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNombre_CE" Text="Nombre del Centro Educativo" runat="server" /></td>
                                                       
                                                       <td class="auto-style19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDescripcion_Unidad" Text="Descripción Unidad" runat="server" /></td>
                                                       
                                                       <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNumero_Oficio" Text="Número de Oficio " runat="server"/></td>
                                                   </tr>
                                                   <tr>
                                                       <td class="auto-style18">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNombre_CE" runat="server" Enabled="true" CssClass="form-control input-sm" Height="25px" Width="273px" /></td>
                                                       
                                                       <td class="auto-style19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlDescripcion_Unidad" runat="server" CssClass="form-control input-sm" Height="29px" Width="283px" AutoPostBack="True" OnSelectedIndexChanged="ddlDescripcion_Unidad_SelectedIndexChanged" DataSourceID="sdsDescripcion_Unidad" DataTextField="vchDescripcionUnidad" DataValueField="intIdUnidad"></asp:DropDownList >
                                                            <asp:SqlDataSource runat="server" ID="sdsDescripcion_Unidad" ConnectionString='<%$ ConnectionStrings:bda_SIREGE_Connection %>' SelectCommand="palConsultarUnidades" SelectCommandType="StoredProcedure"></asp:SqlDataSource></td>
                                                       
                                                       <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNumero_Oficio" runat="server"  Enabled="true" CssClass="form-control input-sm" Height="25px" Width="273px"  /></td>
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
                                              <td class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDescripcion_Despacho" Text="Descripción Despacho" runat="server" /></td>

                                              <td class="auto-style21">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDescripcion_Direccion" Text="Descripción Dirección" runat="server" /></td>

                                              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDescripcion_Departamento" Text="Descripción Departamento" runat="server"/></td>
                                              </tr>
                                              <tr>
                                              <td class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtDespacho" runat="server" Enabled="false" CssClass="form-control input-sm" Height="25px" Width="273px"></asp:TextBox></td>

                                              <td class="auto-style21">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtDireccion" runat="server" Enabled="false" CssClass="form-control input-sm" Height="25px" Width="273px" ></asp:TextBox></td>

                                              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtDepartamento" runat="server" Enabled="false" CssClass="form-control input-sm" Height="25px" Width="273px" ></asp:TextBox></td>
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
                                                 <td class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDimension" Text="Dimensión*" runat="server" /></td>

                                                 <td class="auto-style14">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblLetra_Dimension" Text="Letra Dimensión*" runat="server" /></td>

                                                 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDetalle_Dimension" Text="Detalle Dimensión*" runat="server"/></td>
                                            </tr>
                                            <tr>
                                                 <td class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlTipo_Dimension" runat="server" CssClass="form-control input-sm" Height="29px" Width="283px" DataSourceID="sdsTipo_Dimensiones" DataTextField="vchTipoDimension" DataValueField="vchTipoDimension"></asp:DropDownList>
                                                      <asp:SqlDataSource runat="server" ID="sdsTipo_Dimensiones" ConnectionString='<%$ ConnectionStrings:bda_SIREGE_Connection %>' SelectCommand="palAgruparTipoDimensiones" SelectCommandType="StoredProcedure"></asp:SqlDataSource></td>

                                                 <td class="auto-style14">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlLetra_Dimension" runat="server" CssClass="form-control input-sm" Height="29px" Width="283px" DataSourceID="sdsLetra_Dimension" DataTextField="vchLetraDimension" DataValueField="intIdDimension" AutoPostBack="True" OnSelectedIndexChanged="ddlLetra_Dimension_SelectedIndexChanged"></asp:DropDownList>
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
                                                    <td class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTipo_Usuario" Text="Tipo de Usuario*" runat="server"  /></td>

                                                    <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblCategoria" Text="Categoría" runat="server" /></td>

                                                    <td>&nbsp;</td>
                                               </tr>
                                               <tr>
                                                    <td class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlTipo_Usuario" runat="server" CssClass="form-control input-sm" Height="29px" Width="283px">                            
                                                            <asp:ListItem Text="-Seleccione-" Value=" "></asp:ListItem>
                                                            <asp:ListItem Text="Externo" Value="Externo"></asp:ListItem>
                                                            <asp:ListItem Text="Interno" Value="Interno"></asp:ListItem>
                                                        </asp:DropDownList></td>

                                                    <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-control input-sm" Height="29px" Width="283px"> 
                                                            <asp:ListItem Text="-Seleccione-" Value=" "></asp:ListItem>
                                                            <asp:ListItem Text="Redireccionar a dependencia" Value="Redireccionar a dependencia"></asp:ListItem>
                                                            <asp:ListItem Text="Asignación casos DAT" Value="Asignación casos DAT"></asp:ListItem>
                                                            <asp:ListItem Text="Prensa y Drh comunicaciones" Value="Prensa y Drh comunicaciones"></asp:ListItem>
                                                            <asp:ListItem Text="Mejora Continua" Value="Mejora Continua"></asp:ListItem>
                                                            <asp:ListItem Text="Espera información" Value="Espera información"></asp:ListItem>
                                                            <asp:ListItem Text="Dirección de la CS" Value="Dirección de la CS"></asp:ListItem>
                                                        </asp:DropDownList></td>

                                                    <td>&nbsp;</td>
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
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDetalle" Text="Detalle*" runat="server" /></td>                                                 
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat="server" ID="txtAsunto" TextMode="Multiline" CssClass="form-control input-lg"  Rows="5" Width="1125px"  /></td>          
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
                                        <div class="col-md-3 col-md-offset-1">
                                            <div class="form-group">
                                       <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblRespuesta" Text="Respuesta" runat="server"/></td>                                                 
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox runat="server" ID="txtRespuesta" TextMode="Multiline" Enabled="true" CssClass="form-control input-lg" Rows="5" Cols="12" Width="1125px" /></td>           
                                            </tr>                                                   
                                        </table>
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
                                                    <td class="auto-style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnUpdate" runat="server" Text="Actualizar" CssClass="btn btn-primary" Width="170px" OnClick="btnUpdate_Click" /></td>
                                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button Text="Cancelar" ID="btnCancelar" CssClass="btn btn-primary" Width="170px" runat="server" OnClick="btnCancel_Click" /></td>
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
                                    El elemento se ha agregado exitosamente
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
                            <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none">
                                <div class="header">
                                    Mensaje de Alerta
                                </div>
                                <div class="body">
                                    Hubo un problema en agregar el elemento. Porfavor revisar formulario.
                                    <br />
                                    <asp:Button ID="btnCerrar_Error" runat="server" Text="Cerrar" />
                                </div>
                            </asp:Panel>
                           

                       </div>                                         
                </div>
            </div>                           
</asp:Content>