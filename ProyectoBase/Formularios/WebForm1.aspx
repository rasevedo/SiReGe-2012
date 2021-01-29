<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" MasterPageFile="~/MasterPage.Master" Inherits="CapPresentacionSiReGe.WebForm1" %>

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
    
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="Formularios\Bitacora_Gestion.rdlc"></LocalReport>
    </rsweb:ReportViewer>
   
</asp:Content> 