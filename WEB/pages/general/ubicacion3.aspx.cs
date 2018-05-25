using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_general_ubicacion3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var httpPostedFile = HttpContext.Current.Request.Files["UploadedImage"];
        if (httpPostedFile != null)
        {
            var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("~/pages/imagenes/usuarios_perfil/"), httpPostedFile.FileName);

            // Save the uploaded file to "UploadedFiles" folder
            httpPostedFile.SaveAs(fileSavePath);
        }
    }

    
}