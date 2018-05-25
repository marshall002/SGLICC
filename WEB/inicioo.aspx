<%@ Page Language="C#" AutoEventWireup="true" CodeFile="inicioo.aspx.cs" Inherits="inicio" %>


<!DOCTYPE html>
<html class="no-js" lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Portal Inmobiliario Perú | Venta y Alquiler -  Lamudi</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
  <link type="text/css" href="plugins/loguin/css/loguin.css" rel="stylesheet" />
</head>

    <body>   
        <form runat="server">

            <div class="contenedor col-lg-6 col-md-6 col-sm-6 col-xl-6">
                <div class="card-block">
                    <div class="caja-titulo">
                        <h4 class="titulo">MiHogar-Perú</h4>
                    </div>
                    <%--<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>--%>
                    <p class="card-text">Hola Roger Pineda , gracias haberte registrado en MiHogar-Perú , tus datos registrados fueron :</p>
                    <div class="datos-usuario col-lg-4 col-md-4 col-sm-4 col-xl-4">
                        <p><span class="texto">Dni :</span> 48177158</p>
                        <p><span class="texto">Correo : </span>kesk9403@gmail.com</p>
                        <p><span class="texto">Contraseña :</span> 1111</p>
                    </div>
                    <p class="card-text">
                        Ahora necesitas activar tu cuenta para poder hacer uso de nuestros servicios , por favor activa tu cuenta presionando en el siguiente enlace : 
                        <a href="#" class="card-link">ACTIVAR CUENTA</a> , gracias .
                    </p>
                    <div class="caja-footer">
                    </div>
                </div>
            </div>

            <asp:Button CssClass="btn-success" ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"/>





              <div style="margin-top:20px; margin-bottom:20px; margin-right:auto; margin-left:auto; border-style :groove; position: relative; min-height: 1px; padding-right: 15px;
              padding-left: 15px; -webkit-box-flex: 0; -webkit-flex: 0 0 50%; -ms-flex: 0 0 50%; flex: 0 0 50%;  max-width: 50%;">
              <div style="-webkit-box-flex: 1; -webkit-flex: 1 1 auto; -ms-flex: 1 1 auto; flex: 1 1 auto; padding: 1.25rem">
              <div style="background-color:limegreen;  margin-top:7px;  margin-bottom:17px;   padding-top:30px;  padding-bottom:30px; align-items:center;">
              <h4 style="font-size: 45px;  margin-top: 5px; margin-bottom: 5px; color: #fff; text-align:center; font-weight:800;">MiHogar-Perú</h4>
              </div>              
              <p style="margin-bottom: 0 ; ">Hola Roger Pineda , gracias haberte registrado en MiHogar-Perú , tus datos registrados fueron :</p>
              <div style=" margin-top:10px; margin-bottom:10px; margin-right:auto; margin-left:auto; position: relative; width: 100%; min-height: 1px; padding-right: 15px; padding-left: 15px; -webkit-box-flex: 0;
              -webkit-flex: 0 0 33.333333%;-ms-flex: 0 0 33.333333%; flex: 0 0 33.333333%; max-width: 33.333333%; -webkit-box-flex: 0;">

              <p><span style=" color:red;">Dni :</span> 48177158</p>
              <p><span style=" color:red;">Correo : </span>kesk9403@gmail.com</p>
              <p><span style=" color:red;">Contraseña :</span> 1111</p>
              </div>

              <p style=" margin-bottom: 0">
              Ahora necesitas activar tu cuenta para poder hacer uso de nuestros servicios , por favor activa tu cuenta presionando en el siguiente enlace : 
              <a href="#" style=" text-decoration: none;">ACTIVAR CUENTA</a> , gracias .
              </p>
              <div style=" margin-top: 20px; padding-top: 10px; padding-bottom: 10px; background-color: limegreen;">
              </div>
              </div>
              </div>


        </form>
    </body>
</html>