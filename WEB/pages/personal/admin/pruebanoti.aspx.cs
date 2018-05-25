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


public partial class pages_personal_admin_pruebanoti : System.Web.UI.Page
{
    
    DtoNotificacion dto_notificacion = new DtoNotificacion();
    DtoNotificacion dto_notificacion2 = new DtoNotificacion();
    CtrNotificacion ctr_notificacion = new CtrNotificacion();

    protected void Page_Load(object sender, EventArgs e)
    {
        contenido.Attributes.Add("style", "DISPLAY: none");
        fecha_emision.Attributes.Add("style", "DISPLAY: none");
        mensaje.Attributes.Add("style", "DISPLAY: none");
        flg_noti_mostrado.Attributes.Add("style", "DISPLAY: none");

        Panel1.Visible = true;
        ctr_notificacion.Ctr_ConsultarUltimoFLG_NOTI_MOSTRADO_Notificacion(dto_notificacion2, int.Parse(Session["id_persona"].ToString()));
        string flg_noti_mostrado2 = dto_notificacion2.flg_noti_mostrado;

        if (flg_noti_mostrado2 == "False")
        {
            Panel1.Visible = true;
            ctr_notificacion.Ctr_MostrarUltimaNotificacion(dto_notificacion, int.Parse(Session["id_persona"].ToString()));
            int id_notificacion = int.Parse(dto_notificacion.id_notificacion);
            contenido.Text = dto_notificacion.titulo;
            fecha_emision.Text = Convert.ToString(dto_notificacion.fecha_emision);
            mensaje.Text = dto_notificacion.mensaje;
            flg_noti_mostrado.Text = dto_notificacion.flg_noti_mostrado;

            Session["flg_noti_mostrado"] = "1"; //mando 1 para que se actualize el flg_noti_mostrado a True

            ctr_notificacion.Ctr_ActualizarFLG_NOTI_MOSTRADO(Convert.ToString(Session["flg_noti_mostrado"].ToString()), id_notificacion);

        }
        else
        {
            flg_noti_mostrado.Text = "";
        }

    }


    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        ctr_notificacion.Ctr_ConsultarUltimoFLG_NOTI_MOSTRADO_Notificacion(dto_notificacion2, int.Parse(Session["id_persona"].ToString()));
        string flg_noti_mostrado2 = dto_notificacion2.flg_noti_mostrado;

        if (flg_noti_mostrado2 == "False")
        {
            Panel1.Visible = true;
            ctr_notificacion.Ctr_MostrarUltimaNotificacion(dto_notificacion, int.Parse(Session["id_persona"].ToString()));
            int id_notificacion = int.Parse(dto_notificacion.id_notificacion);
            contenido.Text = dto_notificacion.titulo;
            fecha_emision.Text = Convert.ToString(dto_notificacion.fecha_emision);
            mensaje.Text = dto_notificacion.mensaje;
            flg_noti_mostrado.Text = dto_notificacion.flg_noti_mostrado;

            Session["flg_noti_mostrado"] = "1"; //mando 1 para que se actualize el flg_noti_mostrado a True

            ctr_notificacion.Ctr_ActualizarFLG_NOTI_MOSTRADO(Convert.ToString(Session["flg_noti_mostrado"].ToString()), id_notificacion);

        }
        else
        {
            flg_noti_mostrado.Text = "";
        }
    }



}
