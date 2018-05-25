<%@ Page Title="" Language="C#" MasterPageFile="~/pages/MasterPagePanel.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="pages_personal_admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

    <asp:Button ID="Button1" runat="server" Text="Button" style="margin-left:40px;" onclientclick="buscar();"/>
            </ContentTemplate>
    </asp:UpdatePanel>

    
   <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>

    <asp:Button ID="Button2" runat="server" Text="Button" style="margin-left:40px;" onclientclick="popup();"/>
            </ContentTemplate>
    </asp:UpdatePanel>


    <script type="text/javascript">


        function popup() {

            swal({
                title: "Registro Exitoso!",
                text: "Se registro a la persona!",
                icon: "success",               
                button: "Cerrar!"
            }).then(function () {
                // Redirect the user
                window.location.href = "gestionar-personal.aspx";
                console.log('The Ok Button was clicked.');
                });



          
        }

      
        function buscar() {


            swal({
                text: 'Search for a movie. e.g. "La La Land".',
                content: "input",
                button: {
                    text: "Search!",
                    closeModal: false,
                },
            })
                .then(name => {
                    if (!name) throw null;

                    return fetch(`https://itunes.apple.com/search?term=${name}&entity=movie`);
                })
                .then(results => {
                    return results.json();
                })
                .then(json => {
                    const movie = json.results[0];

                    if (!movie) {
                        return swal("No movie was found!");
                    }

                    const name = movie.trackName;
                    const imageURL = movie.artworkUrl100;

                    swal({
                        title: "Top result:",
                        text: name,
                        icon: imageURL,
                    });
                })
                .catch(err => {
                    if (err) {
                        swal("Oh noes!", "The AJAX request failed!", "error");
                    } else {
                        swal.stopLoading();
                        swal.close();
                    }
                });


        }    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

