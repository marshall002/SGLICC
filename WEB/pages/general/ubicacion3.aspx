<%@ Page Title="" Language="C#" MasterPageFile="~/pages/MasterPagePanel.master" AutoEventWireup="true" CodeFile="ubicacion3.aspx.cs" Inherits="pages_general_ubicacion3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <script  src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.5.min.js"></script>


 
    <fieldset>
        <div class="input-file-row-1">
	        <div class="upload-file-container">
                <img id="preview_image" src="#" alt="" />
			    <div class="upload-file-container-text">
                    <div class = 'one_opacity_0'>
                        <input type="file" id="patient_pic" label="add" />
                    </div>
                    <span> Add Photo </span>
				</div>
			</div>
        </div>
	</fieldset>


    <script>
        function readURL(input, target) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                var image_target = $(target);
                reader.onload = function (e) {
                    image_target.attr('src', e.target.result).show();
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#patient_pic").live("change", function () {
            readURL(this, "#preview_image")
        });
    </script>

  

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

