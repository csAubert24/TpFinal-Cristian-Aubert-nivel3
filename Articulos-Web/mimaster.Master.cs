using bussines;
using dominio;
using System;
using System.Web.UI;
using System.Web;
using System.Web.UI.WebControls;

namespace Articulos_Web
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            imgAvatar.ImageUrl = "https://simg.nicepng.com/png/small/202-2022264_usuario-annimo-usuario-annimo-user-icon-png-transparent.png";
            
            if (!(Page is login || Page is Registro || Page is Default || Page is error))
            {
                if (!Security.sesionActiva(Session["usuario"]))
                    Response.Redirect("Login.aspx", false);
            }
            if (Security.sesionActiva(Session["usuario"]))
             {
                Usuario usuario = (Usuario)Session["usuario"];
                if (!string.IsNullOrEmpty(usuario.ImagenPerfil))
                    imgAvatar.ImageUrl = "~/imagenes/" + usuario.ImagenPerfil;
                if (!string.IsNullOrEmpty(usuario.Nombre))
                    lblUsuario.Text = usuario.Nombre;
            
            } 
                    
        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registro.aspx");
        }


        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("login.aspx");
        }

       
    }
}