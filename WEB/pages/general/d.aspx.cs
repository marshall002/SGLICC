using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_general_d : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btn_save_Click(object sender, EventArgs e)
    {
        if (imageFile.HasFile)

        {
            foreach (HttpPostedFile p in imageFile.PostedFiles)
            {
                p.SaveAs(MapPath("~/pages/imagenes/inmuebles/venta/" + p.FileName));
            }
            Response.Write(imageFile.PostedFiles.Count + " file Upload Successfully");
        }
    }
}