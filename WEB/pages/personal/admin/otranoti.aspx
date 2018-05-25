<%@ Page Title="" Language="C#" MasterPageFile="~/pages/MasterPagePanel.master" AutoEventWireup="true" CodeFile="prueba2.aspx.cs" Inherits="pages_personal_admin_prueba2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <input type="button" id="notificationButton" />


    <script>


        $(document).ready(function () {
            function changeColor() {
                if ($('body').hasClass('white')) {
                    $('body').removeClass('white');
                    $('body').addClass('black');
                    $('h1').removeClass('black');
                    $('h1').addClass('white');
                }
                else {
                    $('body').removeClass('black');
                    $('body').addClass('white');
                    $('h1').removeClass('white');
                    $('h1').addClass('black');
                }
            }

            setInterval(changeColor, 3000);
        });


        window.onload = function () {

            document.addEventListener('DOMContentLoaded', function () {

                if (Notification.permission !== "granted") {
                    Notification.requestPermission();
                }

            });

            function notifyBrowser(title, desc, url) {

                if (Notification.permission !== "granted") {
                    Notification.requestPermission();
                }
                else {
                    var notification = new Notification(title, {
                        icon: 'http://YourWebsite.com/logo.png',
                        body: desc,
                    });

                    /* Remove the notification from Notification Center when clicked.*/
                    notification.onclick = function () {
                        window.open(url);
                    };

                    /* Callback function when the notification is closed. */
                    notification.onclose = function () {
                        console.log('Notification closed');
                    };

                }
            }


            var articles = [
                [
                    "Cómo reproducir sonidos en una notificación utilizando jQuery",
                    "http://programacion.net/articulo/como_reproducir_sonidos_en_una_notificacion_utilizando_jquery_1473"
                ],
                [
                    "Sistema de likes como el de Facebook con jQuery, MySQL y PHP",
                    "http://programacion.net/articulo/sistema_de_likes_como_el_de_facebook_con_jquery-_mysql_y_php_1472"
                ],
                [
                    "Subida de imágenes múltiple sin refrescar la página en Ajax con jQuery",
                    "http://programacion.net/articulo/subida_de_imagenes_multiple_sin_refrescar_la_pagina_en_ajax_con_jquery_1471"
                ],

                [
                    "Cómo implementar una verificación por email con PHP",
                    "http://programacion.net/articulo/como_implementar_una_verificacion_por_email_con_php_1470"
                ],
                [
                    "Cómo bloquear la subida de imágenes de desnudos con PHP",
                    "http://programacion.net/articulo/como_bloquear_la_subida_de_imagenes_de_desnudos_con_php_1469l"
                ],

            ];


            document.addEventListener('DOMContentLoaded', function () {
                document.querySelector("#notificationButton").addEventListener("click", function (e) {
                    var x = Math.floor((Math.random() * 10) + 1); /* Random number between 1 to 10 */
                    var title = articles[x][0];
                    var desc = 'Most popular article.';
                    var url = articles[x][1];
                    notifyBrowser(title, desc, url);
                    e.preventDefault();
                });
            });


            setTimeout(function () {
                var x = Math.floor((Math.random() * 10) + 1); /* Random number between 1 to 10 */
                var title = articles[x][0];
                var desc = 'Most popular article.';
                var url = articles[x][1];
                notifyBrowser(title, desc, url);
            }, 2000); //calls every 2 minutes 

            $(document).ready(function () {
                $("#notificationButton").click(function () {
                    var x = Math.floor((Math.random() * 10) + 1); /* Random number between 1 to 10 */
                    var title = articles[x][0];
                    var desc = 'Most popular article.';
                    var url = articles[x][1];
                    notifyBrowser(title, desc, url);
                    return false;
                });
            });

        }
    
</script>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

