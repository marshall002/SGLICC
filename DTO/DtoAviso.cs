using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
     public class DtoAviso:DtoSubTipoInmueble
    {
        public string nombre_propietario { get; set; }
        public int id_aviso { get; set; }
        public string tipo_servicio { get; set; }
        public string titulo { get; set; }
        public string descripcion { get; set; }
        public string direccion { get; set; }
        public string visitas { get; set; }
        public int codigo { get; set; }
        public double precio { get; set; }
        public DateTime fecha_inicio { get; set; }
        public DateTime fecha_fin { get; set; }
        public int id_distrito { get; set; }
        public int id_persona { get; set; }
        public int id_tipo_cliete { get; set; }
        public string estado { get; set; }
        public string aviso_tipo { get; set; }
        public int tiempo { get; set; }
         
    }
}
