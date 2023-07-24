<%@ Page Title="" Language="C#" MasterPageFile="~/mimaster.Master" AutoEventWireup="true" CodeBehind="Formulario.aspx.cs" Inherits="Articulos_Web.Formulario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <script>
        function validar() {
            const codigo = document.getElementById("txtcodigo");
            const nombre = document.getElementById("txtNombre");
            const precio = document.getElementById("txtprecio");
            if (codigo.value == "") {
                codigo.classList.add("is-invalid");
                codigo.classList.remove("is-valid");
                return false;

            } else {
                codigo.classList.add("is-valid");
                codigo.classList.remove("is-invalid");
                
            }
            if (nombre.value == "") {
                nombre.classList.add("is-valid");
                nombre.classList.remove("is-valid");
                return false;
            } else {
                nombre.classList.add("is-valid");
                nombre.classList.remove("is-invalid");
                
            }
            if (precio.value == "") {
                precio.classList.add("is-invalid");
                precio.classList.remove("is-valid");
                return false;
            } else {
                precio.classList.add("is-valid");
                precio.classList.remove("is-invalid");
                
            }
            return true;

        }

</script>
    

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">
    <div class="col-6">
        <div class="mb-3">
            <label for="txtId" class="form-label">Id</label>
            <asp:TextBox runat="server" ID="txtId" CssClass="form-control"/>
        </div>
         <div class="mb-3">
            <label for="txtcodio" class="form-label">Codigo</label>
            <asp:TextBox runat="server" ID="txtcodigo" CssClass="form-control" ClientIDMode="Static" />
        </div>
        <div class="mb-3">
            <label for="txtNombre" class="form-label">Nombre</label>
            <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" ClientIDMode="Static"/>
        </div>

            <div class="mb-3">
            <label for="ddlmarcas" class="form-label">Marca</label>
            <asp:DropDownList runat="server" Id="ddlmarca" CssClass="form-select"></asp:DropDownList>
        </div>
            <div class="mb-3">
            <label for="ddlcategoria" class="form-label">Categoria</label>
            <asp:DropDownList runat="server" Id="ddlcategoria" CssClass="form-select"></asp:DropDownList>
        </div>
            <div class="mb-3">
            <label for="txtprecio" class="form-label">Precio</label>
            <asp:TextBox runat="server" ID="txtprecio" CssClass="form-control" ClientIDMode="Static"/>
        </div>
        <div >   
            <div class="mb-3">
                <asp:Button Text="Aceptar"  OnClientClick="return validar()" ForeColor="White" BackColor="#33cc33" ID="btnAceptar"  CssClass="btn" OnClick="btnAceptar_Click" runat="server"/>
                <asp:Button Text="Cancelar" ForeColor="White" BackColor="#666666" ID="btnCancelar"  CssClass="btn" OnClick="btnCancelar_Click" runat="server"/>
                
            </div>
        </div>
    </div>

    <div class="col-6">

           <div class="mb-3">
            <label for="txtDescripcion" class="form-label">Descripcion</label>
            <asp:TextBox runat="server" ID="TxtDescripcion" TextMode="MultiLine" CssClass="form-control"/>
        </div>
        <asp:UpdatePanel ID="updatePanel" runat="server">
            <ContentTemplate>
            <div class="mb-3">
                <label for="txtImagenUrl" class="form-label">Url Imagen</label>
                        <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control"
                            AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" />
                    </div>
                    <asp:Image ImageUrl="https://grupoact.com.ar/wp-content/uploads/2020/04/placeholder.png"
                        runat="server" ID="imgArticulo" Width="60%" />

                </ContentTemplate>
        </asp:UpdatePanel>

    </div>

    </div>


    <div class="row">
        <div class="col-6">
            <asp:UpdatePanel runat="server" ID="updatePanel2">
                <ContentTemplate>






            <div class="mb-3">
                <asp:Button Text="Eliminar" ID="btnEliminar"  CssClass="btn btn-danger" runat="server" OnClick="btnEliminar_Click" />

                <% if(confirmaEliminacion) {%>


                 <asp:CheckBox Text="Confirmar" ID="checkEliminacion" runat="server" />
                 <asp:Button Text="Eliminar definitivamente" ID="ConfimarEliminacion"  CssClass="btn btn-outline-danger" runat="server" OnClick="ConfirmarEliminacion_Click"/>

                    <% } %>
            </div>

               
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    
        </div>

</asp:Content>
