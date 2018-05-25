using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using CTR;
using DTO;
using System.Data;
using System.Data.SqlClient;
namespace CTR
{
     public class CtrlAviso
    {
        DaoAviso dao_aviso;
        
        public CtrlAviso()
        {
            dao_aviso = new DaoAviso();
        }
        public List<DtoAviso> Ctrl_ListarAvisos()
        {
            return dao_aviso.Dao_Listar_Avisos_de_Inmueble(1,1);
        }
        public List<DtoAviso> Ctrl_ListarProyectos()
        {
            return dao_aviso.Dao_Listar_Avisos_de_Inmueble(2,1);
        }
        public List<DtoAviso> Ctrl_CargarInformaciondelAviso(DtoAviso dto_aviso)
        {
            return dao_aviso.Dao_Carga_información_del_Aviso(dto_aviso);
        }
        public List<DtoCaracteristicasAviso> Ctrl_CargaSubCaracteristicasdelAviso(DtoCaracteristicasAviso dto_aviso)
        {
            return dao_aviso.Dao_Cargar_sub_caracteristicas_del_aviso(dto_aviso);
        }
        public List<DtoCaracteristicasAviso> Ctrl_CargaCaracteristicasAdicionalesdelAviso(DtoCaracteristicasAviso dto_aviso, int caracteristica)
        {
            return dao_aviso.Dao_Cargar_Caracteristicas_Adicionales_del_Aviso(dto_aviso,caracteristica);
        }
        public void Ctrl_Actualizar_Estado_Aviso(DtoAviso dto_aviso, int estado)
        {
            dao_aviso.Dao_Actualizar_Estado_de_Aviso(dto_aviso, estado);
        }
    }
}
