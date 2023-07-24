<%@ Page Title="" Language="C#" MasterPageFile="~/mimaster.Master" AutoEventWireup="true" CodeBehind="muestra.aspx.cs" Inherits="Articulos_Web.muestra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row" >
        <div class="col-4 columnaM" style="margin-top:20px">
            <div class="mb-4">
                <asp:Label runat="server" ID="muestraNombre" Text="" CssClass="form-control"></asp:Label>
                <asp:Button runat="server" text="Agregar Favorito" ID="btnFavorito" OnClick="btnFavorito_Click" CssClass="btn btn-outline-warning bg-white mt-1" CommandArgument='<%#Eval("id") %>' />
                
            </div>
            
            <div class="mb-4">
                
                <asp:Image runat="server" ID="muestraImagen"
                    ImageUrl="https://grupoact.com.ar/wp-content/uploads/2020/04/placeholder.png" Width="80%"/>
                
            </div>

            <div class="mb-4">
                <asp:Label runat="server" ID="muestraPrecio" Text="" CssClass="form-control"></asp:Label>
            </div>
            
        </div>
    

    
        <div class="col-6" style="margin-top:20px">
            <div class="mb-4">
                <asp:Label runat="server" ID="MuestraDescripcion" Text="" CssClass="form-control"></asp:Label>
            </div>


            <div class="mb-4">
                
                <asp:Label runat="server" Text="" ID="MuestraMarca" CssClass="form-control"></asp:Label>
                
            </div>

            <div class="mb-2">
                <asp:Label runat="server" ID="MuestraCate" Text="" CssClass="form-control"></asp:Label>
            </div>
        </div>
    </div>





    
</asp:Content>
