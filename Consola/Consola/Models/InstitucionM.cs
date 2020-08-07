using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Consola.Models
{
    public class InstitucionM
    {
        public int idInstitucion { get; set; }
        public String institucionN { get; set; }
        public int idTipoIdentificacion { get; set; }
        public String Identificacion { get; set; }
        public String Telefono { get; set; }
        public String direccion { get; set; }
    }
}