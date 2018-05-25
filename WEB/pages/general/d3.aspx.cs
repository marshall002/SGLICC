using CuteWebUI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_general_d3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnUpload_Click(object sender, EventArgs e)  
   {
        if (FileUpload.HasFile)
        {
            foreach (HttpPostedFile p in FileUpload.PostedFiles)
            {
                p.SaveAs(MapPath("~/pages/imagenes/inmuebles/venta/" + p.FileName));
            }
            Response.Write(FileUpload.PostedFiles.Count + " file Upload Successfully");
        }
    }
    public void InsertMsg(string msg)
    {
        ListBoxEvents.Items.Insert(0, msg);
        ListBoxEvents.SelectedIndex = 0;
    }

    protected override void OnInit(EventArgs e)
    {

        Attachments1.InsertButton.Style["display"] = "none";
    }
    protected void Attachments1_AttachmentAdded(object sender, AttachmentItemEventArgs args)
    {
        InsertMsg(args.Item.FileName + " has been uploaded.");
    }
    protected void ButtonDeleteAll_Click(object sender, EventArgs e)
    {
        InsertMsg("Attachments1.DeleteAllAttachments();");
        Attachments1.DeleteAllAttachments();
    }
    protected void ButtonTellme_Click(object sender, EventArgs e)
    {
        ListBoxEvents.Items.Clear();
        foreach (AttachmentItem item in Attachments1.Items)
        {
            InsertMsg(item.FileName + ", " + item.FileSize + " bytes.");

            //Copies the uploaded file to a new location.
            //item.CopyTo("c:\\temp\\"+args.FileName);
            //You can also open the uploaded file's data stream.
            //System.IO.Stream data = args.OpenStream();
        }
    }

    protected void Uploader_FileUploaded(object sender, UploaderEventArgs args)
    {
        if (GetVisibleItemCount() >= 3)
        {
            Response.Write("<script>alert('hola');</script>");
        }
        else
        {
            using (System.IO.Stream stream = args.OpenStream())
            {
                Attachments1.Upload(args.FileSize, "ChangeName-" + args.FileName, stream);
            }
        }
    }
    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);
        if (GetVisibleItemCount() >= 3)
        {
            Uploader1.InsertButton.Enabled = false;
        }
        else
        {
            Uploader1.InsertButton.Enabled = true;
        }
    }
    int GetVisibleItemCount()
    {
        int count = 0;
        foreach (AttachmentItem item in Attachments1.Items)
        {
            if (item.Visible)
                count++;
        }
        return count;
    }



}