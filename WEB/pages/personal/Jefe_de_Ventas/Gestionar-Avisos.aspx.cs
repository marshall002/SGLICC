using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using CTR;
public partial class pages_personal_Jefe_de_Ventas_Gestionar_Avisos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ListarAvisos();
    }
    public void ListarAvisos()
    {
        DtoAviso dto_aviso = new DtoAviso();
        CtrlAviso ctrl_aviso = new CtrlAviso();
        gvAvisos.DataSource = ctrl_aviso.Ctrl_ListarAvisos();
        //Como hago para que ese data field llamdo fecha_inicio se iguale a eso 
       
        gvAvisos.DataBind();
    }
    protected void gvAvisos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ver")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            var colsNoVisible1 = gvAvisos.DataKeys[index].Values;
            string id = colsNoVisible1[0].ToString();
            string ida = colsNoVisible1[1].ToString();
            Session["id_cliente"] = id;
            Session["id_aviso"] = ida;
           /* int index = Convert.ToInt32(e.CommandArgument);

            DtoPersonal dto_personal = new DtoPersonal();
            
            var colsNoVisible = gvAvisos.DataKeys[index].Values;
            string id = colsNoVisible[0].ToString();
            Session["id_cliente"] = id;
            //int id_colaborador = int.Parse(Session["id_colaborador"].ToString());
            //codUsuario = codViajero
            //Response.Redirect("Informacion-colaborador.aspx?id=" + id);  //aqui mandaba por la url el id , pero ahora ya no se manda pes*/
            Response.Redirect("Ver-información-de-Aviso.aspx");
        }
    }

    protected void gvAvisos_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gvAvisos_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvAvisos.PageIndex = e.NewPageIndex;
        ListarAvisos();
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {

    }
}