using System;

namespace Articulos_Web
{
    public partial class error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblerror.Text = Session["Error"].ToString(); 
            
        }

    }
}