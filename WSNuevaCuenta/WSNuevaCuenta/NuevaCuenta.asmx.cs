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
        public string CrearPeticion(string nombre,string apellido1,string apellido2, string correo, string descripcion )
        {
            con = new MySqlConnection();
            con.ConnectionString = "Server=127.0.0.1;Database=downtoledo; Uid=toor;Pwd=toor;SslMode=none";
            try
            {
                con.Open();
               
                MySqlCommand com = new MySqlCommand("insert into peticiones  values(0,'"+nombre+"','"+apellido1+"','"+apellido2+"','"+correo+"','"+descripcion+"')", con);
                com.ExecuteNonQuery();
                con.Close();
                
                return "ok";
            }
            catch (MySqlException e)
            {
                return "error";
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
                Respuesta r = new Respuesta();
                r.codigos = listacodigos;
                r.correcto = 0;
                return JsonConvert.SerializeObject(r);
            }catch(MySqlException e)
            {

                Respuesta r = new Respuesta();
                r.codigos = new List<NewCount>();
                r.correcto = 1;
                return JsonConvert.SerializeObject(r);
            }
        }
        [WebMethod]
        public string SacarTodaslasPeticiones()
        {
            con = new MySqlConnection();
            con.ConnectionString= "Server=127.0.0.1;Database=downtoledo; Uid=toor;Pwd=toor;SslMode=none";
            try
            {
                con.Open();
                MySqlCommand com = new MySqlCommand("select * from peticiones", con);
                MySqlDataReader reader = com.ExecuteReader();
                List<Peticion> peticiones = new List<Peticion>();
                while (reader.Read())
                {
                    Peticion peti = new Peticion();
                    peti.nombre = (String)reader.GetValue(1);
                    peti.apellido1 = (String)reader.GetValue(2);
                    peti.apellido2 = (String)reader.GetValue(3);
                    peti.correo = (String)reader.GetValue(4);
                    peti.descripcion = (String)reader.GetValue(5);
                    peticiones.Add(peti);
                }
                RespuestaPeti rpeti = new RespuestaPeti();
                rpeti.peticiones = peticiones;
                rpeti.correcto = 0;
                return JsonConvert.SerializeObject(rpeti);

            }catch(MySqlException e)
            {
                RespuestaPeti rpeti = new RespuestaPeti();
                rpeti.correcto = 1;
                rpeti.peticiones = new List<Peticion>();
                return JsonConvert.SerializeObject(rpeti);
            }
        }
        [WebMethod]
        public string Eliminarcodigo(string codigo)
        {
            con = new MySqlConnection();
            con.ConnectionString= "Server=127.0.0.1;Database=downtoledo; Uid=toor;Pwd=toor;SslMode=none";
            try
            {
                con.Open();
                    var com = new MySqlCommand("delete from nuevacuenta where codigo=" + codigo,con);
                com.ExecuteNonQuery();
                con.Close();
                return "ok";
            }catch(MySqlException e)
            {
                return "error";
            }
        }
        [WebMethod]
        public string Eliminartodosloscodigos()
        {
            con = new MySqlConnection();
            con.ConnectionString = "Server=127.0.0.1;Database=downtoledo; Uid=toor;Pwd=toor;SslMode=none";
            try
            {
                con.Open();
                var com = new MySqlCommand("delete from nuevacuenta", con);
                com.ExecuteNonQuery();
                con.Close();
                return "ok";
            }
            catch (MySqlException e)
            {
                return "error";
            }
        }
        [WebMethod]
        public string Eliminarpeticion(string correo)
        {
            con = new MySqlConnection();
            con.ConnectionString = "Server=127.0.0.1;Database=downtoledo; Uid=toor;Pwd=toor;SslMode=none";
            try
            {
                con.Open();
               
                    var com = new MySqlCommand("delete from peticiones where correo=" +correo, con);
                    com.ExecuteNonQuery();
                
                con.Close();
                return "ok";
            }
            catch (MySqlException e)
            {
                return "error";
            }
        }
        [WebMethod]
        public string EliminarTodaslasPeticiones()
        {
            con = new MySqlConnection();
            con.ConnectionString = "Server=127.0.0.1;Database=downtoledo; Uid=toor;Pwd=toor;SslMode=none";
            try
            {
                con.Open();
                
                    var com = new MySqlCommand("delete from peticiones", con);
                    com.ExecuteNonQuery();
                
                con.Close();
                return "ok";
            }
            catch (MySqlException e)
            {
                return "error";
            }
        }
    }
}
