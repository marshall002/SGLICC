<%@ Page Title="" Language="C#" MasterPageFile="~/pages/MasterPagePanel.master" AutoEventWireup="true" CodeFile="pruebanoti.aspx.cs" Inherits="pages_personal_admin_pruebanoti" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server"  Visible="False">

                <%-- <div id="lblMensaje" style="visibility:hidden;">--%>
                   <%-- <asp:Label ID="Label2" runat="server" Font-Size="Large"></asp:Label>--%>
                
                <asp:TextBox ID="contenido" runat="server" ></asp:TextBox>
                <asp:TextBox ID="fecha_emision" runat="server" ></asp:TextBox>
                <asp:TextBox ID="mensaje" runat="server" ></asp:TextBox>
                <asp:TextBox ID="flg_noti_mostrado" runat="server" ></asp:TextBox>
                     <br />
                   <%-- </div> --%> 
                    
         
            </asp:Panel>
            <asp:Timer ID="Timer1" runat="server" Interval="4000" OnTick="Timer1_Tick"></asp:Timer>
        </ContentTemplate>
    </asp:UpdatePanel>

    <input type="button" >

 

    
    <script>

        //window.onload = function () {

            var flg_noti_mostrado = $("#<%=flg_noti_mostrado.ClientID%>").val();
            if (flg_noti_mostrado === "False") {
                alerta();
            }
        //    else {

        //    }
        //    //setInterval(window.onload, 2000);

        //}


        function alerta() {

            var contenido = $("#<%=contenido.ClientID%>").val();
            var fecha_emision = $("#<%=fecha_emision.ClientID%>").val();
            var mensaje = $("#<%=mensaje.ClientID%>").val();
            Push.create(contenido, {
                body: mensaje,
                icon: "../../imagenes/usuarios_perfil/royer.jpg",
                timeout: 8000,
                onClick: function () {
                    window.location = "https://www.google.com.pe";
                    this.close();
                }
            });
        }
            </script>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

