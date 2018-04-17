using Newtonsoft.Json;
using ProgramNewCount.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Xml;

namespace ProgramNewCount.Connection
{
    class CWS
    {
        private HttpClient cliente;
        private Uri url;
        private FormUrlEncodedContent content;
        private List<KeyValuePair<string, string>> formulario;
        private XmlDocument xml;
        public CWS()
        {
           
            cliente = new HttpClient();
            cliente.Timeout = TimeSpan.FromSeconds(4);
        }

        public NewCount Crearnuevousuario(string rol)
        {
            var l= AsyncHelper.RunSync<NewCount>(() => NewUser(rol));
            return l;
        }
        private async Task<NewCount> NewUser(string rol)
        {
            
            url = new Uri("http://localhost:61177/NuevaCuenta.asmx/CrearCodigo");
            formulario = new List<KeyValuePair<string, string>>();
            formulario.Add(new KeyValuePair<string, string>("rol",rol));
            content = new FormUrlEncodedContent(formulario);
            var response = await cliente.PostAsync(url,content);
            if (response.IsSuccessStatusCode)
            {
                var contenido = response.Content.ReadAsStringAsync().Result;
                xml = new XmlDocument();
                xml.LoadXml(contenido);
                var nuevaRespuesta = new NewCount();
                nuevaRespuesta = JsonConvert.DeserializeObject<NewCount>(xml.DocumentElement.InnerText);
                return nuevaRespuesta; 
            }
            else
            {
               return null;
            }
           
        }
        public List<NewCount> TodosLosCodigos()
        {
            var l= AsyncHelper.RunSync<List<NewCount>>(() => AllCodes());
            return l;
        }

        private async Task<List<NewCount>> AllCodes()
        {
            url = new Uri("http://localhost:61177/NuevaCuenta.asmx/SacarTodaslasClaves");
            var response = await cliente.GetAsync(url);
            if (response.IsSuccessStatusCode)
            {
                var contenido = response.Content.ReadAsStringAsync().Result;
                xml = new XmlDocument();
                xml.LoadXml(contenido);
                var listadecodigos = new Respuesta();
                listadecodigos = JsonConvert.DeserializeObject<Respuesta>(xml.DocumentElement.InnerText);
                if (listadecodigos.correcto == 0)
                {
                    return listadecodigos.codigos;
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return null;
            }
        }
        public string Borrarcodigo(string codigo)
        {
            var l = AsyncHelper.RunSync<string>(() => DeleteCode(codigo));
            return l;
        }
        private async Task<string> DeleteCode(string codigo)
        {
            url = new Uri("http://localhost:61177/NuevaCuenta.asmx/Eliminarcodigo");
            formulario = new List<KeyValuePair<string, string>>();
            formulario.Add(new KeyValuePair<string, string>("codigo", codigo));
            content = new FormUrlEncodedContent(formulario);
            var response = await cliente.PostAsync(url, content);
            if (response.IsSuccessStatusCode)
            {
                var contenido = response.Content.ReadAsStringAsync().Result;
                xml = new XmlDocument();
                xml.LoadXml(contenido);
                return xml.DocumentElement.InnerText;
            }
            else
            {
                return null;
            }
        }
        public string BorrarPeticion(string correo)
        {
            var l = AsyncHelper.RunSync<string>(() => DeletePetition(correo));
            return l;
        }
        private async Task<string> DeletePetition(string correo)
        {
            url = new Uri("http://localhost:61177/NuevaCuenta.asmx/Eliminarpeticion");
            formulario = new List<KeyValuePair<string, string>>();
            formulario.Add(new KeyValuePair<string, string>("correo", correo));
            content = new FormUrlEncodedContent(formulario);
            var response = await cliente.PostAsync(url, content);
            if (response.IsSuccessStatusCode)
            {
                var contenido = response.Content.ReadAsStringAsync().Result;
                xml = new XmlDocument();
                xml.LoadXml(contenido);
                return xml.DocumentElement.InnerText;
            }
            else
            {
                return null;
            }
        }
        public string BorrarTodoslosCodigos()
        {
            var l = AsyncHelper.RunSync<string>(() => DeleteAllCodes());
            return l;
        }
        private async Task<string> DeleteAllCodes()
        {
            url = new Uri("http://localhost:61177/NuevaCuenta.asmx/Eliminartodosloscodigos");
            var response = await cliente.GetAsync(url);
            if (response.IsSuccessStatusCode)
            {
                var contenido = response.Content.ReadAsStringAsync().Result;
                xml = new XmlDocument();
                xml.LoadXml(contenido);
                return xml.DocumentElement.InnerText;
            }
            else
            {
                return null;
            }
        }
        public string BorrarTodaslasPeticiones()
        {
            var l = AsyncHelper.RunSync<string>(() => DeleteAllPeticions());
            return l;
        }
        private async Task<string> DeleteAllPeticions()
        {
            url = new Uri("http://localhost:61177/NuevaCuenta.asmx/EliminarTodaslasPeticiones");
            var response = await cliente.GetAsync(url);
            if (response.IsSuccessStatusCode)
            {
                var contenido = response.Content.ReadAsStringAsync().Result;
                xml = new XmlDocument();
                xml.LoadXml(contenido);
                return xml.DocumentElement.InnerText;
            }
            else
            {
                return null;
            }
        }
        public List<Peticion> TodaslasPeticiones()
        {
            var l = AsyncHelper.RunSync<List<Peticion>>(() => AllPeticions());
            return l;
        }
        private async Task<List<Peticion>> AllPeticions()
        {
            url = new Uri("http://localhost:61177/NuevaCuenta.asmx/SacarTodaslasPeticiones");
            var response = await cliente.GetAsync(url);
            if (response.IsSuccessStatusCode)
            {
                var contenido = response.Content.ReadAsStringAsync().Result;
                xml = new XmlDocument();
                xml.LoadXml(contenido);
                var listadepeticiones = new RespuestaPeti();
                listadepeticiones = JsonConvert.DeserializeObject<RespuestaPeti>(xml.DocumentElement.InnerText);
                if (listadepeticiones.correcto == 0)
                {
                    return listadepeticiones.peticiones;
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return null;
            }
        }
    }
}
