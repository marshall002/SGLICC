using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAO;

namespace CTR
{
    public class Ctrlmagen
    {
        DaoImagen_X_Aviso dao_imagen;
        public Ctrlmagen()
        {
            dao_imagen = new DaoImagen_X_Aviso();
        }
        public List<DtoImagen_X_Aviso> Ctr_Capturar_Imagen(DtoAviso dto_aviso)
        {
            return dao_imagen.Dao_Capturar_Imagenes(dto_aviso);
        }
    }
}
