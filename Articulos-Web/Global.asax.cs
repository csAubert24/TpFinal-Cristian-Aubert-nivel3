using System;

namespace Articulos_Web
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
        }
        void Application_Error(object sender, EventArgs e)
        {
            Exception exc = Server.GetLastError();

            Session.Add("error", exc.ToString());
            //Response.Redirect("Error.aspx");
            Server.Transfer("error.aspx");

        }
    }
}