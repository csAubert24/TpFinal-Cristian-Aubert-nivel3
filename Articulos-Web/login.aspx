<%@ Page Title="" Language="C#" MasterPageFile="~/mimaster.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Articulos_Web.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function validar() {
            const user = document.getElementById("txtUser");
            const contra = document.getElementById("txtPass");
            if (user.value == "") {
                user.classList.add("is-invalid");
                user.classList.remove("is-valid");
                return false;
            } else {
                user.classList.add("is-valid");
                user.classList.remove("is-invalid");
            }
            if (contra.value == "") {
                contra.classList.add("is-invalid");
                contra.classList.remove("is-valid");
                return false;
            } else {
                contra.classList.add("is-valid");
                contra.classList.remove("is-invalid");
            }
            
            return true;
        }
</script>


    <div class="row">
        <div class="col-5">
            <h2> Ingresar   </h2>
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Usuario</label>
                <asp:TextBox  ID="txtUser" runat="server" placeHolder="User name" CssClass="form-control" ClientIDMode="Static"/>
            </div>
              </div>

    </div>
    <div class="row">
        <div class="col-5">
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Contraseña</label>
                <asp:TextBox  ID="txtPass" runat="server" placeHolder="*******" CssClass="form-control" ClientIDMode="Static" />
            </div>
              </div>

    </div>
    <div class="row">
        <div class="col-3">
            <asp:Button CssClass="btn btn-primary" OnClientClick="return validar()" ID="btnIngreso" Text ="Ingresar" runat="server" OnClick="btnIngreso_Click" />     
        </div>
        <div class="col-4">
            <asp:Button CssClass="btn btn-secondary" ID="btnRedirec" Text ="no tienes cuenta?" runat="server" OnClick="btnRedirec_Click" />     
        </div>
    </div>

</asp:Content>
