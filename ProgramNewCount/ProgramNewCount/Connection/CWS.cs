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

        public NuevoUsuario Crearnuevousuario(string rol)
        {
            var l= AsyncHelper.RunSync<NuevoUsuario>(() => NewUser(rol));
            return l;
        }
        private async Task<NuevoUsuario> NewUser(string rol)
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
                var nuevaRespuesta = new NuevoUsuario();
                nuevaRespuesta = JsonConvert.DeserializeObject<NuevoUsuario>(xml.DocumentElement.InnerText);
                return nuevaRespuesta; 
            }
            else
            {
               return null;
            }
           
        }
        public List<NuevoUsuario> TodosLosCodigos()
        {
            var l= AsyncHelper.RunSync<List<NuevoUsuario>>(() => AllCodes());
            return l;
        }

        private async Task<List<NuevoUsuario>> AllCodes()
        {
            url = new Uri("http://localhost:61177/NuevaCuenta.asmx/SacarTodaslasClaves");
            var response = await cliente.GetAsync(url);
            if (response.IsSuccessStatusCode)
            {
                var contenido = response.Content.ReadAsStringAsync().Result;
                xml = new XmlDocument();
                xml.LoadXml(contenido);
                var listadecodigos = new List<NuevoUsuario>();
                listadecodigos = JsonConvert.DeserializeObject<List<NuevoUsuario>>(xml.DocumentElement.InnerText);
                return listadecodigos;
            }
            else
            {
                return null;
            }
        }
    }
}
