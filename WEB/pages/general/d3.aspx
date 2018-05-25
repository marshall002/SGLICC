<%@ Page Title="" Language="C#" MasterPageFile="~/pages/MasterPagePanel.master" AutoEventWireup="true" CodeFile="d3.aspx.cs" Inherits="pages_general_d3" %>

 <%@ Register Namespace="CuteWebUI" Assembly="CuteWebUI.AjaxUploader" TagPrefix="CuteWebUI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   

       <asp:FileUpload id="FileUpload" AllowMultiple="true" type="file"  name="FileUpload[]" runat="server" />
 <style>
     body { 
text-align: center; 
margin-top:20px;
} 
body, input, select {
    font-size: 14px;
}

.content { 
font-size:16px;
text-align: left; 
margin: 80px auto;
width: 800px;
border:solid 10px #CBCAC6;
background-color:#f9f9f9;
padding: 20px 20px 20px 20px; 
font-family:Segoe UI, Arial,Verdana,Helvetica,sans-serif;
border-radius: 15px;
-webkit-border-radius: 15px;
-moz-border-radius: 15px;
}
select {
    width:80%;
}

fieldset
{
	background-color:White;
}
.uploaderbrowsebutton,.uploadercancelbutton,button  {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    overflow: hidden;
    margin: 10px 0;
    padding: 5px 12px;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -webkit-transition: all 60ms ease-in-out;
    transition: all 60ms ease-in-out;
    text-align: center;
    white-space: nowrap;
    text-decoration: none !important;
    text-transform: none;
    text-transform: capitalize;
    color: #fff;
    border: 0 none;
    border-radius: 4px;
    font-size: 14px;
    font-weight: 500;
    line-height: 1.3;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-flex: 0;
    -ms-flex: 0 0 160px;
    flex: 0 0 160px;
    border-color : #2989d8;
  background: #2989d8;
  background: -moz-linear-gradient(top, #2989d8 0%, #1e5799 100%);
  background: -webkit-gradient(linear, left top, left bottom, 
    color-stop(0%,#2989d8), color-stop(100%,#1e5799));
  background: -webkit-linear-gradient(top, #2989d8 0%,#1e5799 100%);
  background: -o-linear-gradient(top, #2989d8 0%,#1e5799 100%);
  background: -ms-linear-gradient(top, #2989d8 0%,#1e5799 100%);
  background: linear-gradient(top, #2989d8 0%,#1e5799 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( 
    startColorstr='#2989d8', endColorstr='#1e5799',GradientType=0 );
}
 </style>


 <script runat="server">

     
    </script>


        <div class="content">
            <h2>
                Uploading multiple files (Limit the maximum number of files allowed to upload)</h2>
            <p>
                This example shows you how to limit the maximum number of files allowed to upload.
                In the following example, you can only upload <span style="color: red">3</span>
                files.</p>
            <fieldset>
                <legend>
                    <CuteWebUI:Uploader runat="server" ID="Uploader1" InsertText="Upload Multiple files Now"
                        MultipleFilesUpload="true" OnFileUploaded="Uploader_FileUploaded">
                    </CuteWebUI:Uploader>
                </legend>
                <div>
                    <CuteWebUI:UploadAttachments runat="server" ID="Attachments1" OnAttachmentAdded="Attachments1_AttachmentAdded">
                    </CuteWebUI:UploadAttachments>
                </div>
            </fieldset>
            <p>
                <asp:Button ID="ButtonDeleteAll" runat="server" Text="Delete All" OnClick="ButtonDeleteAll_Click" />&nbsp;&nbsp;
                <asp:Button ID="ButtonTellme" runat="server" Text="Show Uploaded File Information"
                    OnClick="ButtonTellme_Click" />
            </p>
            <p>
                Server Trace:
                <br />
                <asp:ListBox runat="server" ID="ListBoxEvents" />
            </p>
        </div>





</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

