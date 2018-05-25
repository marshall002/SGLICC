<%@ Page Title="" Language="C#" MasterPageFile="~/pages/MasterPagePanel.master" AutoEventWireup="true" CodeFile="d.aspx.cs" Inherits="pages_general_d" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<input multiple="1" onchange="readURL(this);" id="uploadedImages" name="pictures[]" type="file" style="margin-top:20px;">
    
  <div id ="up_images"  style="margin-top:20px;"  ></div>   

     
            

<script type="text/javascript">

  var readURL = function(input) {
      $('#up_images').empty();   
      var number = 0;
      $.each(input.files, function(value) {
          var reader = new FileReader();
          reader.onload = function (e) {
              var id = (new Date).getTime();
              number++;
              $('#up_images').append('<img id='+id+' src='+e.target.result+' width="100px" height="100px" style="margin-top:20px; margin-left:10px;margin-rigth:10px;" data-index='+number+' />')
          };
          reader.readAsDataURL(input.files[value]);
          }); 
    }

</script>


      <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="../../plugins/jquery-multifile/jquery.MultiFile.js"></script>

    <div class="dragArea">
      <h3>Jala y suelta tus imagenes aquí</h3>
      <h4>O seleccionalos:</h4>
      <div>
       <%-- <input multiple="multiple" type="file" id="imageFile" />--%>
          <asp:FileUpload id="imageFile" AllowMultiple="true" type="file"  name="imageFile[]" runat="server" />
          <asp:Button ID="btn_save" runat="server" OnClick="btn_save_Click" Text="Save" />
      </div>
    </div>

    <div class="row resultImageWrapper" style="z-index: 1;" >
    
        </div>
    <script>
        jQuery.event.props.push('dataTransfer');
        var cont = 0;        
        var i;
        var file;
        $(function () {        
        var dropTimer;
        var dropTarget = $('.dragArea');
        var fileInput = $('#<%=imageFile.ClientID%>');


        dropTarget.on("dragover", function (event) {
            dropTarget.addClass('over');
            return false; // Required for drop to work
        });
        dropTarget.on('dragleave', function (event) {
            dropTarget.removeClass('over');
        });
        handleDrop = function (files) {
            dropTarget.removeClass('over');
           
            // iterate through all dropped files
            for (i = 0; i < files.length; i++) {
                file = files[i];
                if (file.type.match('image.*')) {
                    resizeImage(file, 100, function (result) {
                        var fileInput1 = document.getElementById('<%=imageFile.ClientID%>').value;
                       
                        var res = String(fileInput1);
                        // we now need to append a new Image instead of reusing a single one
                        if (cont < 3) {
                            cont = cont + 1; 
                          
                           
                           $('.resultImageWrapper').append(
                               
                               $('<div id=' + res + ' ><div id=' + cont + ' class="resultImageWrapper2"><a id="borrar" href="#" onclick="removerImagen(' + cont + '); ">X</a><img src=' + result + ' width="150" height="150" id=' + cont +' > </div > </div >')
                                
                            )
                            $('.resultImageWrapper').show();
                            
                            
                        }
                        else
                        {
                            alert("Llegaste al límite.");
                        }
                    });
                } else {
                    alert("Este archivo no es una imagen.");
                }
            }
        };
        dropTarget.on('drop', function (event) {
            event.preventDefault(); // Or else the browser will open the file
            handleDrop(event.dataTransfer.files);
        });
        fileInput.on('change', function (event) {
            handleDrop(event.target.files);
        });
        resizeImage = function (file, size, callback) {
            // no need for a FileReader, a blobURI is better
            var image = new Image();
            image.onload = function () {
                var canvas = document.createElement("canvas");
                /*
                if(image.height > size) {
                      image.width *= size / image.height;
                      image.height = size;
                }
                */
                if (image.width > size) {
                    image.height *= size / image.width;
                    image.width = size;
                }
                var ctx = canvas.getContext("2d");
                canvas.width = image.width;
                canvas.height = image.height;
                ctx.drawImage(image, 0, 0, image.width, image.height);
                callback(canvas.toDataURL("/inmuebles/venta/"));
            };
            image.src = URL.createObjectURL(file);

        };

        });
       

        function removerImagen(id) {
          
                var nested = document.getElementById(id);
                nested.outerHTML = "";
                delete nested;
                cont = cont - 1;
                var newFileList = Array.from(event.target.files);
                newFileList.splice('C:\fakepath\katy.png', 1);
     
           <%-- $('#<%=imageFile.ClientID%>').reset().val('').attr('value', '')[id].value = '';--%>
        }

        function removerImagen2(nombre) {
            $('#<%=imageFile.ClientID%> input[name="' + nombre + '"]').val("");
        }

        
        function Imagen1(evt) {
           
            //var newFileList = Array.from(evt.target.files);
            //newFileList.splice('C:\fakepath\katy.png', 1);
            alert(evt.target.files[0].size);
            var fileArray = [];
            var value = 'C:\fakepath\katy.png';
            $.each(evt.target.files, function (index, value) {
                //Add your condition for allowing only specific file
                var fileReader = new FileReader();
                fileReader.readAsDataURL(value);
                fileArray.push(fileReader);
            });
        }
        document.getElementById('<%=imageFile.ClientID%>').addEventListener('change', Imagen1, false);
        </script>
    <style>


    .dragArea {
        background-color: #efefef;
        border: 3px dashed #cccccc;
        border-radius: 10px;
        text-align: center;
        padding:50px;
    }

    .dragArea.over {
        border-color: #ff0000;
        background-color: #FFE9EA;
    }

    .resultImageWrapper {
        /*display: none;*/
        margin-top: 50px;
        text-align: left;
        padding-left:110px;
        padding-right:110px;
    }

    .resultImageWrapper > img {
        box-shadow: rgba(0, 0, 0, 0.4) 0 2px 5px;
    }

    .resultImageWrapper2 {
      width:200px;
    }

    .resultImageWrapper2 > img {
        
       /*position: absolute;*/ 
       margin-left:5px; 
       bottom: 120px; 
       z-index: 2;
    }

   
    </style>

     

      

   
   

<!-- end snippet -->







</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

