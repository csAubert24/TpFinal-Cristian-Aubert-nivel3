using bussines;
using dominio;
using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Web.UI.WebControls;

namespace Articulos_Web
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulo> listaArticulos;

        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            Session.Add("ListaArt", articuloNegocio.listarConSp());
            listaArticulos = articuloNegocio.listarConSp();
            if (!IsPostBack)
            {
                IdRepetidor.DataSource = listaArticulos;
                IdRepetidor.DataBind();
            }

        }

        protected void btnEjemplo_Click(object sender, EventArgs e)
        {
            string valor = ((Button)sender).CommandArgument;
        }

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();

            string campo = ddlCampo.SelectedItem.ToString();

            if (campo == "Marca")
            {
                ddlCriterio.Items.Add("Samsung");
                ddlCriterio.Items.Add("Apple");
                ddlCriterio.Items.Add("Sony");
                ddlCriterio.Items.Add("Huawei");
                ddlCriterio.Items.Add("Motorola");
            }
            else if (campo == "Tipo")
            {
                ddlCriterio.Items.Add("Celulares");
                ddlCriterio.Items.Add("Televisores");
                ddlCriterio.Items.Add("Media");
                ddlCriterio.Items.Add("Audio");
            }

        }
        
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();

            try
            {
                if ( validacion.taxtoVacio(ddlCriterio))
                {
                    Session.Add("Error", "campos sin cubrir");
                    Response.Redirect("error.aspx");
                }

                IdRepetidor.DataSource = negocio.filtrar
                (ddlCampo.SelectedItem.ToString(), ddlCriterio.SelectedItem.ToString());
                IdRepetidor.DataBind();

            }
            catch (System.Threading.ThreadAbortException ex) { }
            catch (Exception)
            {

                Session.Add("Error en la busqueda. Intente nuevamente", false);
                Response.Redirect("error.aspx", false);

            }


        }

        protected void Filtro2_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["listaArt"];
            List<Articulo> listaFiltrada = lista.FindAll(x => x.nombre.ToUpper().Contains(Filtro2.Text.ToUpper()) || x.precio.ToString().Contains(Filtro2.Text.ToUpper()));
            IdRepetidor.DataSource = listaFiltrada;
            IdRepetidor.DataBind();
        }

        protected void btnMuestra_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;
            Session.Add("id", id);
            Response.Redirect("muestra.aspx");
        }
    }
}