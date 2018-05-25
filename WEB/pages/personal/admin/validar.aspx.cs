using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class pages_personal_admin_validar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [System.Web.Services.WebMethod]
    public static string GetCurrentTime(string name)
    {
        return "Saludos " + name + Environment.NewLine + "La hora es: " + DateTime.Now.ToString();
    }
}