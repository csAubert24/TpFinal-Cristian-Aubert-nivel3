using bussines;
using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;

namespace Articulos_Web
{
    public partial class muestra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = (string)Session["id"];
            ArticuloNegocio neg = new ArticuloNegocio();
            List<Articulo> articulos = neg.listar(id);
            Articulo art = articulos[0];

            muestraNombre.Text = art.nombre;
            if (!(string.IsNullOrEmpty((string)art.Imagen)))
                muestraImagen.ImageUrl = art.Imagen;
            else
            {
                muestraImagen.ImageUrl = "https://grupoact.com.ar/wp-content/uploads/2020/04/placeholder.png";
            }
            muestraPrecio.Text = Convert.ToString(art.precio);
            MuestraCate.Text = art.categoria.ToString();
            MuestraMarca.Text = art.marca.ToString();   
            MuestraDescripcion.Text = art.descrpcion.ToString();
        }

       

        protected void btnFavorito_Click(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            Usuario usuario = (Usuario)Session["usuario"];
            
            int id = Convert.ToInt32(Session["id"]);
            string art = (string)Session["id"];
            negocio.agregarFavorito(id, usuario);
            
        }
    }
}