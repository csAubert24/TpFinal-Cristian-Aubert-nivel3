using bussines;
using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Articulos_Web
{
    public partial class Favoritos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Security.sesionActiva(Session["usuario"]))
            {
                Session.Add("error", "Es necesario ser usuario o administrador");
                Response.Redirect("error.aspx");
            }
            ArticuloNegocio negocio = new ArticuloNegocio();
            Usuario user = (Usuario)Session["usuario"];
            string id = (user.Id).ToString();
            dgvFavoritos.DataSource = negocio.listarFavoritos(id);
            dgvFavoritos.DataBind();
        }

        protected void dgvFavoritos_SelectedIndexChanged(object sender, EventArgs e)
        {
            ArticuloNegocio Neg = new ArticuloNegocio();    
            string art = dgvFavoritos.SelectedDataKey.Value.ToString();
            int id = Convert.ToInt32(art);
            Usuario user = (Usuario)Session["usuario"];
            string IDU = (user.Id).ToString();
            int usuario = Convert.ToInt32(IDU);
            Neg.EliminarFav(id,usuario);
            dgvFavoritos.DataSource = Neg.listarFavoritos(usuario.ToString());
            dgvFavoritos.DataBind();

        }

        protected void dgvFavoritos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }
    }
}