using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using WSNuevaCuenta.Model;

namespace WSNuevaCuenta
{
    /// <summary>
    /// Descripción breve de NuevaCuenta
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class NuevaCuenta : System.Web.Services.WebService
    {
        MySqlConnection con;
        [WebMethod]
        public string CrearCodigo(string rol)
        {
            con = new MySqlConnection();
            con.ConnectionString = "Server=127.0.0.1;Database=downtoledo; Uid=toor;Pwd=toor;SslMode=none";
            try
            {
                con.Open();
                String clave = "";
                Random random = new Random();
                for (int i = 0; i < 10; i++)
                {
                    Boolean numerocorrecto = false;
                    int numero = 0;

                    while (!numerocorrecto)
                    {
                        numero = random.Next(48, 122);
                        if ((numero > 57 && numero < 65) || (numero > 90 && numero < 97))
                        {
                            numerocorrecto = false;
                        }
                        else
                        {
                            numerocorrecto = true;
                        }
                    }
                    Char character = Convert.ToChar(numero);
                    clave += character;
                }
                MySqlCommand com = new MySqlCommand("insert into nuevacuenta values('" + clave + "','" + rol + "')", con);
                com.ExecuteNonQuery();
                con.Close();
                NewCount nueva = new NewCount();
                nueva.rol = rol;
                nueva.clave = clave;
                String respuesta = JsonConvert.SerializeObject(nueva);
                return respuesta;
            }catch(MySqlException e)
            {
                return "Ha ocurrido un error";
            }
        }
        [WebMethod]
        public string SacarTodaslasClaves()
        {
            con = new MySqlConnection();
            con.ConnectionString = "Server=127.0.0.1;Database=downtoledo; Uid=toor;Pwd=toor;SslMode=none";
            try
            {
                con.Open();
                MySqlCommand com = new MySqlCommand("select * from nuevacuenta", con);
                MySqlDataReader reader = com.ExecuteReader();
                List<NewCount> listacodigos = new List<NewCount>();
                while (reader.Read())
                {
                    NewCount ncuenta = new NewCount();
                    ncuenta.clave =(String) reader.GetValue(0);
                    ncuenta.rol =(String) reader.GetValue(1);
                    listacodigos.Add(ncuenta);
                }
                return JsonConvert.SerializeObject(listacodigos);
            }catch(MySqlException e)
            {
                return "Ha ocurrido un error";
            }
            }
    }
}
