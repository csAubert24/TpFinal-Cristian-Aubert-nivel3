using bussines;
using dominio;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace Articulos_Web
{
    public partial class listas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Security.esAdmin(Session["usuario"]))
            {
                Session.Add("error", "Es necesario ser administrador");
                Response.Redirect("error.aspx");
            }


            ArticuloNegocio negocio = new ArticuloNegocio();
            Session.Add("listaArticulos", negocio.listarConSp());
            dgvArticulos.DataSource = Session["listaArticulos"];
            dgvArticulos.DataBind();
        }

        protected void dgvArticulos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvArticulos.PageIndex = e.NewPageIndex;
            dgvArticulos.DataBind();
        }
        protected void dgvArticulos_SelectedIndexChange(object sender, EventArgs e)
        {
            string id = dgvArticulos.SelectedDataKey.Value.ToString();
            Response.Redirect("Formulario.aspx?id=" + id);
        }

        protected void Filtro_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];
            List<Articulo> listaFiltrada = lista.FindAll(x => x.nombre.ToUpper().Contains(Filtro.Text.ToUpper()) || x.marca.descripcion.ToUpper().Contains(Filtro.Text.ToUpper()) || x.categoria.descripcion.ToUpper().Contains(Filtro.Text.ToUpper()));
            dgvArticulos.DataSource = listaFiltrada;
            dgvArticulos.DataBind();
        }

        protected void btnIrAgregar_Click(object sender, EventArgs e)
        {

            Response.Redirect("Formulario.aspx");
        }
    }
}