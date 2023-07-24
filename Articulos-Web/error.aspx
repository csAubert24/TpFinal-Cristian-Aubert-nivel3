<%@ Page Title="" Language="C#" MasterPageFile="~/mimaster.Master" AutoEventWireup="true" CodeBehind="error.aspx.cs" Inherits="Articulos_Web.error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="alert alert-danger" style="margin-top:30px"  role="alert">
         Error!
          <asp:Label Text="text" ID="lblerror" runat="server" />
          <asp:Button Id="btnError" runat="server" CssClass="btn btn-primary" Text="<<Regresar" OnClientClick= "JavaScript:window.history.back(1); return false;"/>
         <%--<a href="Default.aspx" class="btn btn-primary">Home</a>--%>



    </div>
  


</asp:Content>
