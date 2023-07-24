<%@ Page Title="" Language="C#" MasterPageFile="~/mimaster.Master" AutoEventWireup="true" CodeBehind="listas.aspx.cs" Inherits="Articulos_Web.listas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h1>Lista</h1>
    <asp:UpdatePanel runat="server" ID="upadatePanelFiltro">
        <ContentTemplate>
            <div class="row">
                <div class="col-6">
                <div class="mb-3">
                    <asp:Label  Text="Buscar" runat="server"></asp:Label>
                    <asp:TextBox runat="server" AutoPostBack="true" ID="Filtro" CssClass="form-control" OnTextChanged="Filtro_TextChanged"></asp:TextBox>

                </div>
                </div>
            </div>
     

    <asp:GridView Id="dgvArticulos" runat="server" CssClass="table" AutoGenerateColumns="false" DataKeyNames="Id"
        OnSelectedIndexChanged="dgvArticulos_SelectedIndexChange"
        OnPageIndexChanging="dgvArticulos_PageIndexChanging" AllowPaging="true"
        PageSize="5" 
        >

        <Columns>
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Categoria" DataField="Categoria.descripcion" />
            <asp:BoundField HeaderText="Marca" DataField="Marca.descripcion" />
            
            <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText="✍" />
        </Columns>
  
    </asp:GridView>
   </ContentTemplate>
    </asp:UpdatePanel>

    
    <asp:Button Text="Agregar" ID="btnIrAgregar" CssClass="btn-primary btn" OnClick="btnIrAgregar_Click" runat="server" />




</asp:Content>
