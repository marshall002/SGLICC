using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using CTR;
using DTO;
using DAO;
using System.Globalization;
using System.Net.Mail;
using System.Net;

public partial class inicio : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
        EnviarCorreo();
    }

    public void EnviarCorreo()
    {
        /*-------------------------MENSAJE DE CORREO----------------------*/

        string documento = "48177258";
        string nombres = "Roger Mauricio";
        string apellidos = "Pineda Verde";
        string correo = "kesk9403@gmail.com";
        string clave = "1111";


        System.Net.Mail.MailMessage mmsg = new System.Net.Mail.MailMessage();
        mmsg.To.Add(correo);
        mmsg.Subject = "Bienvenido a MiHogar-Perú";
        mmsg.SubjectEncoding = System.Text.Encoding.UTF8;

        //Direccion de correo electronico que queremos que reciba una copia del mensaje
        //mmsg.Bcc.Add("destinatariocopia@servidordominio.com"); //Opcional

        mmsg.Body = "<div style='margin-top:20px; margin-bottom:20px; margin-right:auto; margin-left:auto; border-style:groove; position:relative; min-height:1px; padding-right:15px; "+
        "padding-left:15px; -webkit-box-flex:0; -webkit-flex: 0 0 50%; -ms-flex: 0 0 50%; flex: 0 0 50%; max-width:50%;'>"+
        "<div style='-webkit-box-flex:1; -webkit-flex:1 1 auto; -ms-flex:1 1 auto; flex:1 1 auto; padding:1.25rem'>"+

        "<div style='background-color:limegreen; margin-top:7px; margin-bottom:17px; padding-top:30px; padding-bottom:30px; align-items:center;'>"+
        "<h4 style='font-size:45px; margin-top:5px; margin-bottom:5px; color:#fff; text-align:center; font-weight:800;'> MiHogar-Perú </h4>"+
             
         "</div>"+

         "<p style ='margin-bottom:0;'> Hola " + nombres + " " + apellidos + " , gracias por haberte registrado en MiHogar-Perú , tus datos registrados fueron :</p>" +
                 
         "<div style='margin-top:10px; margin-bottom:10px; margin-right:auto; margin-left:auto; position:relative; width:100%; min-height:1px; padding-right:15px; padding-left:15px; -webkit-box-flex:0;"+
         "-webkit-flex:0 0 33.333333 %; -ms-flex:0 0 33.333333 %; flex:0 0 33.333333 %; max-width:33.333333 %; -webkit-box-flex: 0;'>"+

         "<p><span style='color:red;'> Dni :</span> " + documento + "</p>" +

         "<p><span style='color:red;'> Correo : </span> " + correo + "</p>" +

         "<p><span style='color:red;'> Contraseña :</span> " + clave + "</p>" +                                                           
         "</div>"+                                                         

          "<p style='margin-bottom:0'>"+
          "Ahora necesitas activar tu cuenta para poder hacer uso de nuestros servicios , por favor activa tu cuenta presionando en el siguiente enlace :"+ 
          "<a href='#' style='text-decoration:none;'> ACTIVAR CUENTA </a> , gracias."+
          "</p>" +
          "<div style='margin-top:20px; padding-top:10px; padding-bottom:10px; background-color: limegreen;' >" +
          "</div>" +
          "</div>" +
          "</div> ";

        mmsg.BodyEncoding = System.Text.Encoding.UTF8;
        mmsg.IsBodyHtml = true; //Si no queremos que se envíe como HTML

        mmsg.From = new System.Net.Mail.MailAddress("mihogarperuu@gmail.com");

        /*-------------------------CLIENTE DE CORREO----------------------*/

        System.Net.Mail.SmtpClient cliente = new System.Net.Mail.SmtpClient();

        cliente.Credentials =
            new System.Net.NetworkCredential("mihogarperuu@gmail.com", "elcastito");
        //Lo siguiente es obligatorio si enviamos el mensaje desde Gmail
        cliente.Port = 25;
        cliente.EnableSsl = true;

        cliente.Host = "smtp.gmail.com"; //Para Gmail "smtp.gmail.com";
        /*-------------------------ENVIO DE CORREO----------------------*/
        try
        {
            cliente.Send(mmsg);
        }
        catch (System.Net.Mail.SmtpException ex)
        {
            // MI PROGRA NO TIENE ERRORES :V
        }
    }


    public void correo()

    {
        MailMessage msg = new MailMessage();
        msg.From = new MailAddress("mihogarperuu@gmail.com");
        msg.To.Add("kesk9403@gmail.com");
        msg.Subject = "hola";
        msg.Body = "que tal men";
        MailAddress ms = new MailAddress("kesk9403@gmail.com");
        msg.CC.Add(ms);
        SmtpClient sc = new SmtpClient("smtp.gmail.com");
        sc.Port = 25;
        sc.Credentials = new NetworkCredential("mihogarperuu@gmail.com","elcastito");
        sc.EnableSsl = true;
        sc.Send(msg);

    }
}