﻿<%@ Page Title="" Language="C#" MasterPageFile="~/mimaster.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="Articulos_Web.MiPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
      <style>
          .validar{color:red}
      </style>
      <script>
          function Validacion() {
              const TxtNombre = document.getElementById("TxtNombre");
              const TxtApellido = document.getElementById("TxtApellido");
              const TxtConstra = document.getElementById("TxtContraseña");
              
              if (TxtNombre.value == "") {

                  TxtNombre.classList.add("is-invalid");
                  TxtNombre.classList.remove("is-valid");
                  return false;
              } else {
                  TxtNombre.classList.remove("is-invalid");
                  TxtNombre.classList.add("is-valid")
              }
              if (TxtApellido.value == "") {

                  TxtApellido.classList.add("is-invalid");
                  TxtApellido.classList.remove("is-valid");
                  return false;
              } else {
                  
                  TxtApellido.classList.remove("is-invalid");
                  TxtApellido.classList.add("is-valid");
              }
              if (TxtConstra.value == "") {
                  TxtConstra.classList.add("is-invalid");
                  TxtConstra.classList.remove("is-valid");
                  return false;
              } else {
                  TxtConstra.classList.remove("is-invalid");
                  TxtConstra.classList.add("is-valid");
              }
              
              return true;
          
            }
      </script>  

    <div class="row">
         <div class="col-md-4">

            <div class="mb-3">
                <label class="form-label">Email</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" />
                <asp:RegularExpressionValidator runat="server" ErrorMessage="Solo admite formato Email" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" CssClass="validacion" ControlToValidate="txtEmail" />
                
            </div>


            <div class="mb-3">
                <label class="form-label">Nombre</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="TxtNombre" ClientIDMode="Static" />
              
                <%--<asp:RequiredFieldValidator runat="server" CssClass="validar" ErrorMessage="Nombre requerido" ControlToValidate="TxtNombre" />--%>
            </div>

             <div class="mb-3">
                <label class="form-label">Apellido</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="TxtApellido" ClientIDMode="Static" />
            </div>

             <div class="mb-3">
                <label class="form-label">Contraseña</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="TxtContraseña" ClientIDMode="Static" MinLength="6" /> 
            </div>
        </div>

                 <div class="col-md-4">
                    <div class="mb-3">
                    <label class="form-label">Imagen Perfil</label>
                    <input type="file" id="txtImagen" runat="server" class="form-control"/>
                    </div>
                     
                          <asp:Image ID="imgNuevoPerfil" ImageUrl="https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg"
                          runat="server" CssClass="img-fluid mb-3" />
                             
                </div>


         

    </div>
     <div class="row">
        <div class="col-md-4">
            <asp:Button Text="Guardar" OnClientClick="return Validacion()" OnClick="btnGuardar_Click" CssClass="btn btn-primary"   ID="btnGuardar" runat="server" />
            <a href="/">Regresar</a>
        </div>
    </div>
    
</asp:Content>
