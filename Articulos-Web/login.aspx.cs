using bussines;
using dominio;
using System;
using System.Security.Policy;

namespace Articulos_Web
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void btnIngreso_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario usuario = new Usuario();
                UsuarioBussines bussines = new UsuarioBussines();
                

                if (validacion.taxtoVacio(txtPass) || validacion.taxtoVacio(txtUser))
                
                {
                    Session.Add("Error", "Cargar los campos correspondientes");
                    Response.Redirect("error.aspx");

                }

                usuario.email = txtUser.Text;
                usuario.Pass = txtPass.Text;
                if (bussines.login(usuario))
                    {
                        Session.Add("Usuario", usuario);
                        
                        Response.Redirect("MiPerfil.aspx");
                    }
                    else
                    {
                        
                        Session.Add("Error", "usuario o contraseña inconrrecto");
                        Response.Redirect("error.aspx", false);
                    }

                }
            catch ( System.Threading.ThreadAbortException ex) { }

            catch (Exception ex)
            {

                 Session.Add("error", ex.ToString());
                
            }

        }

        protected void btnRedirec_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registro.aspx");
        }
    }
}