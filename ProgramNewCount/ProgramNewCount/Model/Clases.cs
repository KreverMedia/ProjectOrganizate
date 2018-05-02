using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProgramNewCount.Model
{
    public class NewCount
    {
        public string clave { get; set; }
        public string rol { get; set; }
    }
    public class NewCountMVVM
    {
        public string clave { get; set; }
        public string rol { get; set; }
        public Boolean eliminar { get; set; }
    }
    public class Respuesta
    {
        public int correcto { get; set; }
        public List<NewCount> codigos { get; set; }
    }
    public class Peticion
    {
        public string nombre { get; set; }
        public string apellido1 { get; set; }
        public string apellido2 { get; set; }
        public string correo { get; set; }
        public string descripcion { get; set; }
    }
    public class PeticionMVVM
    {
        public string nombre { get; set; }
        public string apellido1 { get; set; }
        public string apellido2 { get; set; }
        public string correo { get; set; }
        public string descripcion { get; set; }
        public Boolean eliminar { get; set; }
    }
    public class RespuestaPeti
    {
        public int correcto { get; set; }
        public List<Peticion> peticiones { get; set; }
    }
    public class Respuestaroles
    {
        public int correcto { get; set; }
        public List<string> roles { get; set; }

    }
}
