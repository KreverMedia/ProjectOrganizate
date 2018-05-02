using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WSAPP.Model
{
    public class DatosUsuario
    {
        public string nombre { get; set; }
        public string apellido1 { get; set; }
        public string apellido2 { get; set; }
        public string dni { get; set; }
        public DateTime fecha_nacimiento { get; set; }

        public DateTime fecha_finalizacion { get; set; }
        public DateTime fecha_incorporacion { get; set; }
        public int edad { get; set; }
        public string correo { get; set; }

        public int telefono1 { get; set; }
        public int telefono2 { get; set; }
        public string numss { get; set; }
        public string direccion { get; set; }
        public string localidad { get; set; }
        public string provincia { get; set; }
        public int antiguedad { get; set; }
        public string estudios { get; set; }

        public string experiencia { get; set; }
        public string idiomas { get; set; }
        public string cargo { get; set; }
        public int sueldo_mensual { get; set; }
        public int cotizacion_porcentaje { get; set; }
        public string horario { get; set; }

        public string foto { get; set; }

        public string documentacion { get; set; }

        public int porcentaje_discapacidad { get; set; }

        public string nombreuser { get; set; }

        public string pass { get; set; }

        public int idrol { get; set; }
    }
}