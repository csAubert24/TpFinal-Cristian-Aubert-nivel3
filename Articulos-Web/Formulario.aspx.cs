using bussines;
using dominio;
using System;
using System.Collections.Generic;
using System.Web;

namespace Articulos_Web
{
    public partial class Formulario : System.Web.UI.Page
    {
        public bool confirmaEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            confirmaEliminacion = false;
            //configuración inicial de la pantalla.
            try
            {
                if (!IsPostBack)
                {
                    ElementoNegocio negocio = new ElementoNegocio();
                    List<elemento> lista = negocio.listar();
                    List<elemento> lista2 = negocio.listar2();

                    ddlmarca.DataSource = lista;
                    ddlmarca.DataValueField = "Id";
                    ddlmarca.DataTextField = "Descripcion";
                    ddlmarca.DataBind();

                    ddlcategoria.DataSource = lista2;
                    ddlcategoria.DataValueField = "Id";
                    ddlcategoria.DataTextField = "Descripcion";
                    ddlcategoria.DataBind();
                }
                //configuracion si estamos modificando
                if (Request.QueryString["id"] != null && !IsPostBack)
                {
                    ArticuloNegocio neg = new ArticuloNegocio();    
                    List<Articulo> articulos = neg.listar(Request.QueryString["id"].ToString());
                    Articulo art = articulos[0];

                    //pre cargar campos
                    txtId.Text = art.id.ToString();
                    txtcodigo.Text = art.codigo;
                    txtNombre.Text = art.nombre;    
                    TxtDescripcion.Text = art.nombre;
                    txtprecio.Text = Convert.ToString(art.precio);
                    imgArticulo.ImageUrl = art.Imagen.ToString();

                    ddlmarca.SelectedValue = art.marca.id.ToString();
                   ddlcategoria.SelectedValue = art.categoria.id.ToString();
                }
                
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("error.aspx");
            }




        }
        
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
              {
                Articulo nuevo = new Articulo();
                ArticuloNegocio neg = new ArticuloNegocio();

                
                if (validacion.taxtoVacio(txtcodigo) )
                {
                    Session.Add("Error", "Campo codigo sin cubrir en el formulario");
                    Response.Redirect("error.aspx");
                }
                if (validacion.taxtoVacio(txtNombre))
                {
                    Session.Add("Error", "Campo nombre sin cubrir en el formulario");
                    Response.Redirect("error.aspx");
                }
                if (validacion.taxtoVacio(txtprecio))
                {
                    Session.Add("Error", "Campo precio sin cubrir en el formulario");
                    Response.Redirect("error.aspx");
                }

                nuevo.codigo = txtcodigo.Text;
                nuevo.nombre = txtNombre.Text;
                nuevo.descrpcion = TxtDescripcion.Text;
                nuevo.Imagen = txtImagenUrl.Text;
                nuevo.precio = Convert.ToDecimal(txtprecio.Text);

                nuevo.marca = new elemento();
                nuevo.marca.id = int.Parse(ddlmarca.SelectedValue);

                nuevo.categoria = new elemento();
                nuevo.categoria.id = int.Parse(ddlcategoria.SelectedValue);

                if (Request.QueryString["id"] != null)
                {
                    nuevo.id = int.Parse(txtId.Text);
                    neg.modificarConSp(nuevo);
                    
                }
                else{ 
                    neg.agregarConSP(nuevo);
                }
                
                Response.Redirect("listas.aspx", false);

            }
            catch (System.Threading.ThreadAbortException ex) { }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                throw;
            }
        }
        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
            imgArticulo.ImageUrl = txtImagenUrl.Text;
        }
        protected void btnCancelar_Click(Object sender, EventArgs e)
        {
            Response.Redirect("listas.aspx", false);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            confirmaEliminacion = true;
        }

        protected void ConfirmarEliminacion_Click(object sender, EventArgs e)
        {
            try
            {
                if (checkEliminacion.Checked)
                {
                    ArticuloNegocio negocio = new ArticuloNegocio();
                    negocio.EliminarFisico(int.Parse(txtId.Text));
                    Response.Redirect("Listas.aspx");
                }
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex);
            }
        }
    }
}