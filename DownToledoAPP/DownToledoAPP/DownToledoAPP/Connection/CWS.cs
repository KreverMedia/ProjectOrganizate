using DownToledoAPP.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace DownToledoAPP.Connection
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
            cliente.Timeout = TimeSpan.FromMinutes(1);
        }
        public Boolean ComprobarUsuario(string usuario,string pass)
        {
            var l = AsyncHelper.RunSync<Boolean>(() => Checkuser(usuario,pass));
            return l;
        }

       

        private async Task<bool> Checkuser(string usuario, string pass)
        {
            Boolean existe = false;
            url = new Uri("http://proyectorganizate.com/WSAPP.asmx/Comprobarusuario");
            formulario = new List<KeyValuePair<string, string>>();
            formulario.Add(new KeyValuePair<string, string>("usuario", usuario));
            formulario.Add(new KeyValuePair<string, string>("contra", pass));
            content = new FormUrlEncodedContent(formulario);
            var response = await cliente.PostAsync(url, content);
            if (response.IsSuccessStatusCode)
            {
                var contenido = response.Content.ReadAsStringAsync().Result;
                xml = new XmlDocument();
                xml.LoadXml(contenido);

               var r = (xml.DocumentElement.InnerText);
                if (!(r.Equals("error")))
                {
                    existe = true;
                }
            }
            return existe;
        }

        public Boolean ComprobarCodigo(string code)
        {
            var l = AsyncHelper.RunSync<Boolean>(() => Checkcode(code));
            return l;
        }

        private async Task<bool> Checkcode(string code)
        {
            Boolean existe = false;
            url = new Uri("http://proyectorganizate.com/WSAPP.asmx/ComprobarCodigo");
            formulario = new List<KeyValuePair<string, string>>();
            formulario.Add(new KeyValuePair<string, string>("codigo",  code));
            content = new FormUrlEncodedContent(formulario);
            var response = await cliente.PostAsync(url, content);
            if (response.IsSuccessStatusCode)
            {
                var contenido = response.Content.ReadAsStringAsync().Result;
                xml = new XmlDocument();
                xml.LoadXml(contenido);

                var r = (xml.DocumentElement.InnerText);
                if (!(r.Equals("error")))
                {
                    existe = true;
                }
            }
            return existe;
        }
        public string Borrarcodigo(string codigo)
        {
            var l = AsyncHelper.RunSync<string>(() => DeleteCode(codigo));
            return l;
        }
        private async Task<string> DeleteCode(string codigo)
        {
            url = new Uri("http://proyectorganizate.com/WSAPP.asmx/Eliminarcodigo");
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
        public Boolean ComprobarUsuarioExiste(string text)
        {
            var l = AsyncHelper.RunSync<Boolean>(() => Checkuserexist(text));
            return l;
        }

        private async Task<bool> Checkuserexist(string usuario)
        {
            Boolean existe = false;
            url = new Uri("http://proyectorganizate.com/WSAPP.asmx/Comprobarexisteusuario");
            formulario = new List<KeyValuePair<string, string>>();
            formulario.Add(new KeyValuePair<string, string>("usuario", usuario));
            content = new FormUrlEncodedContent(formulario);
            var response = await cliente.PostAsync(url, content);
            if (response.IsSuccessStatusCode)
            {
                var contenido = response.Content.ReadAsStringAsync().Result;
                xml = new XmlDocument();
                xml.LoadXml(contenido);

                var r = (xml.DocumentElement.InnerText);
                if (!(r.Equals("error")))
                {
                    existe = true;
                }
            }
            return existe;

        }
        public void Crearusuario(string user,string pass)
        {
            var l = AsyncHelper.RunSync<Boolean>(() => Createuser(user,pass));
            
        }

        private async Task<bool> Createuser(string usuario,string pass)
        {
            Boolean existe = false;
            url = new Uri("http://proyectorganizate.com/WSAPP.asmx/Crearusuario");
            formulario = new List<KeyValuePair<string, string>>();
            formulario.Add(new KeyValuePair<string, string>("user", usuario));
            formulario.Add(new KeyValuePair<string, string>("pass", pass));
            content = new FormUrlEncodedContent(formulario);
            var response = await cliente.PostAsync(url, content);
            if (response.IsSuccessStatusCode)
            {
                var contenido = response.Content.ReadAsStringAsync().Result;
                xml = new XmlDocument();
                xml.LoadXml(contenido);

                var r = (xml.DocumentElement.InnerText);
                if (!(r.Equals("error")))
                {
                    existe = true;
                }
            }
            return existe;

        }
        public DatosUsuario DescargarInfousuario(string user)
        {
            var l = AsyncHelper.RunSync<DatosUsuario>(() => DownloadInfoUser(user));
            return l;
        }

        private async Task<DatosUsuario> DownloadInfoUser(string usuario)
        {
            DatosUsuario datos = new DatosUsuario();
            url = new Uri("http://proyectorganizate.com/WSAPP.asmx/DescargarDatosUsuarioInfo");
            formulario = new List<KeyValuePair<string, string>>();
            formulario.Add(new KeyValuePair<string, string>("user", usuario));
            content = new FormUrlEncodedContent(formulario);
            var response = await cliente.PostAsync(url, content);
            if (response.IsSuccessStatusCode)
            {
                var contenido = response.Content.ReadAsStringAsync().Result;
                xml = new XmlDocument();
                xml.LoadXml(contenido);

                var r = (xml.DocumentElement.InnerText);
                if (!(r.Equals("error")))
                {
                    return JsonConvert.DeserializeObject<DatosUsuario>(r);
                }
                else
                {
                    return null;
                }
            }
            return null;

        }
        public DatosUsuario DescargarInfousuarioall(string user)
        {
            var l = AsyncHelper.RunSync<DatosUsuario>(() => DownloadInfoUserall(user));
            return l;
        }

        private async Task<DatosUsuario> DownloadInfoUserall(string usuario)
        {
            DatosUsuario datos = new DatosUsuario();
            url = new Uri("http://proyectorganizate.com/WSAPP.asmx/DescargarDatosUsuario");
            formulario = new List<KeyValuePair<string, string>>();
            formulario.Add(new KeyValuePair<string, string>("user", usuario));
            content = new FormUrlEncodedContent(formulario);
            var response = await cliente.PostAsync(url, content);
            if (response.IsSuccessStatusCode)
            {
                var contenido = response.Content.ReadAsStringAsync().Result;
                xml = new XmlDocument();
                xml.LoadXml(contenido);

                var r = (xml.DocumentElement.InnerText);
                if (!(r.Equals("error")))
                {
                    return JsonConvert.DeserializeObject<DatosUsuario>(r);
                }
                else
                {
                    return null;
                }
            }
            return null;

        }
    }
}
