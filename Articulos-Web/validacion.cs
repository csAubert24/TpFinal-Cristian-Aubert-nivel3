using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using bussines;
namespace bussines
{
    public static class validacion
    {
        public static bool taxtoVacio(object control)
        {
            if (control is TextBox texto)
            {
                if (string.IsNullOrEmpty(texto.Text))
                    return true;
                else
                    return false;


            }
            if(control is DropDownList drop)
            {
                if(drop.Items.Count <= 0)
                    return true;
                else
                    return false;
            }
            return false;
        }
        


    }
}