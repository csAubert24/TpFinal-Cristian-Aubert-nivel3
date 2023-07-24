<%@ Page Title="" Language="C#" MasterPageFile="~/mimaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Articulos_Web.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager3" runat="server"></asp:ScriptManager>
    <script>
        function validar() {
            const campo = document.getElementById("ddlCriterio");
            if (campo.value == "") {
                campo.classList.add("is-invalid");
                campo.classList.remove("is-valid");
                return false;

            } else {
                campo.classList.add("is-valid");
                campo.classList.remove("is-invalid");
                return true;
            }
        }
    </script>
    
          <div class="row">
            <div class="col-2">
                <div class="mb-3">
                    <asp:Label Text="Filtro" ID="lblCampo" runat="server" />
                    <asp:DropDownList runat="server" AutoPostBack="true" CssClass="form-control" id="ddlCampo" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                        
                        <asp:ListItem Text="Tipo" />
                        <asp:ListItem Text="Marca" />
                        
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-2">
                <div class="mb-3">
                    <asp:Label Text="Criterio" runat="server" />
                    <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-control" ClientIDMode="Static"  ></asp:DropDownList>
                </div>
            </div>
            <div class="col-2">
                <div class="mb-2">
                
                </div>
         </div>
            <div class="col-4">
                <div class="mb-4">
                <asp:label Text="Buscar por nombre o Precio" runat="server"/>
                <asp:TextBox runat="server" Id="Filtro2" CssClass="form-control" OnTextChanged="Filtro2_TextChanged" AutoPostBack="true"></asp:TextBox>
                </div>
            </div>
              

        </div>
    <div class="row">

        
          <div class="col-2">
                <div class="mb-3">
                   
                   <asp:Button Text="Aplicar Filtro" OnClientClick="return validar()" runat="server" CssClass="btn btn-primary" id="btnBuscar" OnClick="btnBuscar_Click"/>
                </div>
            </div>

    </div>
<%-- </ContentTemplate>
    </asp:UpdatePanel>--%>


   <%-- -------%>
    <div class="row row-cols-1 row-cols-md-3 g-4">

    <asp:Repeater runat="server" ID="IdRepetidor" >
        <ItemTemplate>
            
            
            <div class="col">
                <div class="card carta">
                <img src="<%#Eval("Imagen") %>" class="card-img-top" style="height: 18rem;" alt="...">
                    
                <div class="card-body">
                  <h5 class="card-title"> <%#Eval("Nombre") %>   </h5>
                  <p class="card-text"> <%#Eval("Codigo") %>   </p>
                  <p class="card-text">  <%#Eval("id") %>      </p>  
                  <p class="card-text"> <%#Eval("Precio") %> </p>  
                  <asp:Button runat="server" Id="btnMuestra" CommandArgument='<%#Eval("id") %>' OnClick="btnMuestra_Click" Text="Detalle" CssClass="btn btn-outline-primary"></asp:Button>
                </div>
                </div>
             </div>
               
                <%--</a>--%>
        </ItemTemplate>
    </asp:Repeater>
    </div>
    
</asp:Content>
