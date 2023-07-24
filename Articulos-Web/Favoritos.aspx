<%@ Page Title="" Language="C#" MasterPageFile="~/mimaster.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="Articulos_Web.Favoritos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h2>Favoritos</h2>
    <asp:UpdatePanel runat="server" ID="updateFav">
    <ContentTemplate>
    <asp:GridView runat="server" ID="dgvFavoritos" CssClass="table" DataKeyNames="ID"
        AutoGenerateColumns="false" OnSelectedIndexChanged="dgvFavoritos_SelectedIndexChanged"
        OnSelectedIndexChanging="dgvFavoritos_SelectedIndexChanging" AllowPaging="true" PageSize="5"
        >
        <Columns>
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Categoria" DataField="Categoria.descripcion" />
            <asp:BoundField HeaderText="Marca" DataField="Marca.descripcion" />
            
            <asp:CommandField HeaderText="Favorito" ShowSelectButton="true" SelectText=" Quitar" />
        </Columns>
    </asp:GridView>
        </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
