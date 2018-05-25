using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using CTR;

public partial class pages_personal_Jefe_de_Ventas_Gestionar_Proyectos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ListarProyectos();
    }
    public void ListarProyectos()
    {
        DtoAviso dto_Aviso = new DtoAviso();
        CtrlAviso ctrl_aviso = new CtrlAviso();
        gvAvisos.DataSource = ctrl_aviso.Ctrl_ListarProyectos();
        gvAvisos.DataBind();
    }
    protected void gvAvisos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ver")
        {
            int index = Convert.ToInt32(e.CommandArgument);

            DtoPersonal dto_personal = new DtoPersonal();

            var colsNoVisible = gvAvisos.DataKeys[index].Values;
            string id = colsNoVisible[0].ToString();
            Session["id_cliente"] = id;
            //int id_colaborador = int.Parse(Session["id_colaborador"].ToString());
            //codUsuario = codViajero
            //Response.Redirect("Informacion-colaborador.aspx?id=" + id);  //aqui mandaba por la url el id , pero ahora ya no se manda pes
            Response.Redirect("Informacion-personal.aspx");
        }
    }

    protected void gvAvisos_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gvAvisos_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvAvisos.PageIndex = e.NewPageIndex;
        ListarProyectos();
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {

    }
}