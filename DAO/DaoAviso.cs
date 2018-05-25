using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using System.Data.SqlClient;
using System.Data;

namespace DAO
{
    public class DaoAviso
    {
        SqlConnection conexion;
        
        public DaoAviso()
        {
            conexion = new SqlConnection(ConexionBD.CadenaConexion);
        }
        public List<DtoAviso> Dao_Listar_Avisos_de_Inmueble(int tipo_cliente,int estado)
        {
            SqlCommand cmd = new SqlCommand("sp_Listar_Avisos_de_Inmueble",conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tipo_cliente", tipo_cliente);
            cmd.Parameters.AddWithValue("@estado", estado);
            conexion.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            List<DtoAviso> listarAvisosdeInmuebles = new List<DtoAviso>();
            DtoAviso dto_aviso;

            while(reader.Read())
            {
                dto_aviso = new DtoAviso();
                dto_aviso.id_persona = int.Parse(reader[0].ToString());
                dto_aviso.codigo = int.Parse(reader[1].ToString());
                dto_aviso.nombre_propietario = reader[2].ToString().Trim();
                dto_aviso.tipo_servicio = reader[3].ToString();
                dto_aviso.descripcion_subtipo_inmueble = reader[4].ToString();
                dto_aviso.precio = double.Parse(reader[5].ToString());
                dto_aviso.estado = reader[6].ToString();
                dto_aviso.fecha_inicio= reader.GetDateTime(7);
                listarAvisosdeInmuebles.Add(dto_aviso);
            }
            conexion.Close();
            return listarAvisosdeInmuebles;
        }
        public List<DtoAviso> Dao_Carga_información_del_Aviso(DtoAviso dto_avisos)

       {
            SqlCommand cmd = new SqlCommand("sp_Cargar_informacion_del_aviso", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@codigo", dto_avisos.codigo);
            conexion.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            List<DtoAviso> listarInformaciondeAviso = new List<DtoAviso>();
            while(reader.Read())
            {
                dto_avisos.tipo_servicio = reader[0].ToString();
                dto_avisos.descripcion_tipo_inmueble = reader[1].ToString();
                dto_avisos.descripcion_subtipo_inmueble = reader[2].ToString();
                dto_avisos.titulo = reader[3].ToString();
                dto_avisos.descripcion = reader[4].ToString();
                dto_avisos.direccion = reader[5].ToString();
                dto_avisos.precio = double.Parse(reader[6].ToString());
                dto_avisos.fecha_inicio = reader.GetDateTime(7);
                dto_avisos.fecha_fin = reader.GetDateTime(8);
                dto_avisos.aviso_tipo = reader[9].ToString();
                dto_avisos.tiempo = int.Parse(reader[10].ToString());
                listarInformaciondeAviso.Add(dto_avisos);
            }
            conexion.Close();
            return listarInformaciondeAviso;
        }
        public List<DtoCaracteristicasAviso> Dao_Cargar_sub_caracteristicas_del_aviso(DtoCaracteristicasAviso dto_aviso1)
        {
            SqlCommand cmd = new SqlCommand("sp_Cargar_sub_caracteristicas_del_aviso", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@codigo", dto_aviso1.codigo);
            conexion.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            List<DtoCaracteristicasAviso> listarSubCaracteristicasdeAviso = new List<DtoCaracteristicasAviso>();
            DtoCaracteristicasAviso dto_subcaviso;
            while (reader.Read())
            {
                dto_subcaviso = new DtoCaracteristicasAviso();
                dto_subcaviso.descripcion_sub_caracteristica = reader[0].ToString();
                listarSubCaracteristicasdeAviso.Add(dto_subcaviso);
            }
            conexion.Close();
            return listarSubCaracteristicasdeAviso;
        }
        public List<DtoCaracteristicasAviso> Dao_Cargar_Caracteristicas_Adicionales_del_Aviso(DtoCaracteristicasAviso dto_aviso, int caracteristica)
        {
            SqlCommand cmd = new SqlCommand("sp_Listar_Caracteristicas_del_Aviso", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_caracteristica", caracteristica);
            cmd.Parameters.AddWithValue("@codigo", dto_aviso.codigo);
            conexion.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            List<DtoCaracteristicasAviso> listarSubCaracteristicasdeAviso = new List<DtoCaracteristicasAviso>();
            DtoCaracteristicasAviso dto_subcaviso;
            while(reader.Read())
            {
                dto_subcaviso = new DtoCaracteristicasAviso();
                dto_subcaviso.descripcion_sub_caracteristica = reader[0].ToString();
                listarSubCaracteristicasdeAviso.Add(dto_subcaviso);
            }
            conexion.Close();
            return listarSubCaracteristicasdeAviso;
        }
        public void Dao_Actualizar_Estado_de_Aviso(DtoAviso dto_aviso, int estado )
        {
            SqlCommand cmd = new SqlCommand("sp_Actualizar_Estado_de_Aviso", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@codigo", dto_aviso.codigo);
            cmd.Parameters.AddWithValue("@estado", estado);
            conexion.Open();
            cmd.ExecuteNonQuery();
            conexion.Close();
        }
        
           
        

    }
}
