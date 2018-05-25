<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageInicio.master" AutoEventWireup="true" CodeFile="validar.aspx.cs" Inherits="pages_personal_admin_validar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <input type="text" name="nombre" id="nombre" placeholder="escribe tu nombre" value="" />    
<button type="button" class="btn btn-primary" onclick="ShowCurrentTime()">
     llamar al WebMethod 
</button>

      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <asp:TextBox ID="Correo_existe" runat="server"></asp:TextBox>
            <asp:TextBox ID="Documento_existe" runat="server"></asp:TextBox>
            <asp:TextBox ID="ApagarTimer" runat="server"></asp:TextBox>            
            </ContentTemplate>          
            </asp:UpdatePanel>


    <script>

function ShowCurrentTime() {
        $.ajax({
            type: "POST",
            url: "validar.aspx/UpdateIT",
            data: '{name: "' + $("#nombre").val() + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSuccess,
            failure: function (response) {
            alert(response.d);
            }
        });
}

        function OnSuccess(response) {

    alert("hola");
        }





<%--        $.ajax({
            type: "POST",
            url: "SimpleAjax.aspx/IsLeapYear",
            data: '{year: "' + $("#<%=txtYear.ClientID%>").val() + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response.d) {
                $('#<%=txtIsLeapYear.ClientID%>').val('Leap Year');
      }
      else {
          $('#<%=txtIsLeapYear.ClientID%>').val('Not a Leap Year');
            }
        },
        failure: function (response) {
            $('#<%=txtIsLeapYear.ClientID%>').val("Error in calling Ajax:" + response.d);
        }
        });
}
--%>








        function RegistroCompleto() {
            swal({
                title: "Registro Exitoso!",
                text: "Se registro a la persona!",
                icon: "success",
                button: "Cerrar!",

            }).then(function () {
                // Redirect the user
                window.location.href = "gestionar-personal.aspx";
                //console.log('The Ok Button was clicked.');
                swal({
                    timer: 4000,
                })
            });
        }

        function CorreoYaExiste() {
            swal("Este correo ya existe!", {
                button: {
                    text: "Cerrar!",
                },
            });
        }

        function DocumentoYaExiste() {
            swal("Este documento ya existe!", {
                button: {
                    text: "Cerrar!",
                },
            });
        }
    </script>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

