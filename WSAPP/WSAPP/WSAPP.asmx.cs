using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using WSAPP.Model;

namespace WSAPP
{
    /// <summary>
    /// Descripción breve de WSAPP
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class WSAPP : System.Web.Services.WebService
    {
        MySqlConnection con;
        [WebMethod]
        public string Comprobarusuario(string usuario, string contra)
        {
            con = new MySqlConnection();
            con.ConnectionString = "Server=db736844368.db.1and1.com;Database=db736844368; Uid=dbo736844368;Pwd=191295Di+;SslMode=none";
            try
            {
                con.Open();
                MySqlCommand com = new MySqlCommand("call comprobarusuario('" + usuario + "','" + contra + "')", con);
                MySqlDataReader reader = com.ExecuteReader();
                reader.Read();
                string user = (string)reader.GetValue(0);
                string password = (string)reader.GetValue(1);
                con.Close();
                return (user + "," + password);

            }
            catch (MySqlException)
            {
                return "error";
            }

        }
        [WebMethod]
        public string ComprobarCodigo(string codigo)
        {
            con = new MySqlConnection();
            con.ConnectionString = "Server=db736844368.db.1and1.com;Database=db736844368; Uid=dbo736844368;Pwd=191295Di+;SslMode=none";
            try
            {
                con.Open();
                MySqlCommand com = new MySqlCommand("call comprobarcode('" + codigo + "')", con);
                MySqlDataReader reader = com.ExecuteReader();
                reader.Read();
                string code = (string)reader.GetValue(0);

                con.Close();
                return code;

            }
            catch (MySqlException)
            {
                return "error";
            }

        }
        [WebMethod]
        public string Comprobarexisteusuario(string usuario)
        {
            con = new MySqlConnection();
            con.ConnectionString = "Server=db736844368.db.1and1.com;Database=db736844368; Uid=dbo736844368;Pwd=191295Di+;SslMode=none";
            try
            {
                con.Open();
                MySqlCommand com = new MySqlCommand("call comprobarexisteuser('" + usuario + "')", con);
                MySqlDataReader reader = com.ExecuteReader();
                reader.Read();
                string code = (string)reader.GetValue(0);

                con.Close();
                return code;

            }
            catch (MySqlException)
            {
                return "error";
            }
        }
        [WebMethod]
        public string DescargarDatosUsuario(string user)
        {
            con = new MySqlConnection();
            con.ConnectionString = "Server=db736844368.db.1and1.com;Database=db736844368; Uid=dbo736844368;Pwd=191295Di+;SslMode=none";
            try
            {
                con.Open();
                MySqlCommand com = new MySqlCommand("call descargardatosuser('" + user + "')", con);
                MySqlDataReader reader = com.ExecuteReader();
                reader.Read();
                DatosUsuario datos = new DatosUsuario();
                if (!reader.GetValue(0).Equals(DBNull.Value))
                {
                    datos.nombre = Convert.ToString(reader.GetValue(0));
                }
                if (!reader.GetValue(1).Equals(DBNull.Value))
                {
                    datos.apellido1 = Convert.ToString(reader.GetValue(1));
                }
                if (!reader.GetValue(2).Equals(DBNull.Value))
                {
                    datos.apellido2 = Convert.ToString(reader.GetValue(2));
                }
                if (!reader.GetValue(3).Equals(DBNull.Value))
                {

                    datos.dni = Convert.ToString(reader.GetValue(3));
                }
               
              
            
                if(!reader.GetValue(4).Equals(DBNull.Value))
                {
                    datos.fecha_nacimiento = Convert.ToDateTime(reader.GetValue(4));
                }
                if (!reader.GetValue(5).Equals(DBNull.Value))
                {
                    datos.fecha_incorporacion = Convert.ToDateTime(reader.GetValue(5));
                }
                if (!reader.GetValue(6).Equals(DBNull.Value))
                {
                    datos.fecha_finalizacion = Convert.ToDateTime(reader.GetValue(6));
                }
                if (!reader.GetValue(7).Equals(DBNull.Value))
                {

                    datos.edad = Convert.ToInt16(reader.GetValue(7));
                }
                if (!reader.GetValue(8).Equals(DBNull.Value))
                {
                    datos.correo = Convert.ToString(reader.GetValue(8));
                }
                if (!reader.GetValue(9).Equals(DBNull.Value))
                {
                    datos.telefono1 = Convert.ToInt16(reader.GetValue(9));
                }
                if (!reader.GetValue(10).Equals(DBNull.Value))
                {

                    datos.telefono2 = Convert.ToInt16(reader.GetValue(10));
                }
                if (!reader.GetValue(11).Equals(DBNull.Value))
                {
                    datos.numss = Convert.ToString(reader.GetValue(11));
                }
                if (!reader.GetValue(12).Equals(DBNull.Value))
                {
                    datos.direccion = Convert.ToString(reader.GetValue(12));
                }
                if (!reader.GetValue(13).Equals(DBNull.Value))
                {
                    datos.localidad = Convert.ToString(reader.GetValue(13));
                }
                if (!reader.GetValue(14).Equals(DBNull.Value))
                {

                    datos.provincia = Convert.ToString(reader.GetValue(14));
                }
                if (!reader.GetValue(15).Equals(DBNull.Value))
                {
                    datos.antiguedad = Convert.ToInt16(reader.GetValue(15));
                }
                if (!reader.GetValue(16).Equals(DBNull.Value))
                {
                    datos.estudios = Convert.ToString(reader.GetValue(16));
                }
                if (!reader.GetValue(17).Equals(DBNull.Value))
                {
                    datos.experiencia = Convert.ToString(reader.GetValue(17));
                }
                if (!reader.GetValue(18).Equals(DBNull.Value))
                {
                    datos.idiomas = Convert.ToString(reader.GetValue(18));
                }
                if (!reader.GetValue(19).Equals(DBNull.Value))
                {
                    datos.cargo = Convert.ToString(reader.GetValue(19));
                }
                if (!reader.GetValue(20).Equals(DBNull.Value))
                {

                    datos.sueldo_mensual = Convert.ToInt16(reader.GetValue(20));
                }
                if (!reader.GetValue(21).Equals(DBNull.Value))
                {
                    datos.cotizacion_porcentaje = Convert.ToInt16(reader.GetValue(21));
                }
                if (!reader.GetValue(22).Equals(DBNull.Value))
                {

                    datos.horario = Convert.ToString(reader.GetValue(22));

                }

                if (!reader.GetValue(23).Equals(DBNull.Value))
                {

                    datos.foto = Convert.ToString(reader.GetValue(23));

                }


                if (!reader.GetValue(24).Equals(DBNull.Value))
                {


                    datos.documentacion = Convert.ToString(reader.GetValue(24));

                }
                if (!reader.GetValue(25).Equals(DBNull.Value))
                {

                    datos.porcentaje_discapacidad = Convert.ToInt16(reader.GetValue(25));

                }
                if (!reader.GetValue(26).Equals(DBNull.Value))
                {

                    datos.nombreuser = Convert.ToString(reader.GetValue(26));

                }
                if (!reader.GetValue(27).Equals(DBNull.Value))
                {

                    datos.pass = Convert.ToString(reader.GetValue(27));

                }
                if (!reader.GetValue(28).Equals(DBNull.Value))
                {

                    datos.idrol = Convert.ToInt16(reader.GetValue(28));

                }
                con.Close();
                return JsonConvert.SerializeObject(datos);

            }
            catch (MySqlException)
            {
                return "error";
            }
        }
        [WebMethod]
        public string Eliminarcodigo(string codigo)
        {
            con = new MySqlConnection();
            con.ConnectionString = "Server=db736844368.db.1and1.com;Database=db736844368; Uid=dbo736844368;Pwd=191295Di+;SslMode=none";
            try
            {
                con.Open();
                var com = new MySqlCommand("call deletecode ('" + codigo + "')", con);
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
        public string Crearusuario(string user, string pass)
        {
            con = new MySqlConnection();
            con.ConnectionString = "Server=db736844368.db.1and1.com;Database=db736844368; Uid=dbo736844368;Pwd=191295Di+;SslMode=none";
            try
            {
                con.Open();

                MySqlCommand com = new MySqlCommand("call createuser('" + user + "','" + pass + "')", con);
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
        public string DescargarDatosUsuarioInfo(string user)
        {
            con = new MySqlConnection();
            con.ConnectionString = "Server=db736844368.db.1and1.com;Database=db736844368; Uid=dbo736844368;Pwd=191295Di+;SslMode=none";
            try
            {
                con.Open();
                MySqlCommand com = new MySqlCommand("call descargarinfousuario('" + user + "')", con);
                MySqlDataReader reader = com.ExecuteReader();
                reader.Read();
                DatosUsuario datos = new DatosUsuario();
                if (!reader.GetValue(0).Equals(DBNull.Value))
                {
                    datos.idusuario = Convert.ToInt32(reader.GetValue(0));
                }
                if (!reader.GetValue(1).Equals(DBNull.Value))
                {
                    datos.nombre = Convert.ToString(reader.GetValue(1));
                }
             
                if (!reader.GetValue(2).Equals(DBNull.Value))
                {
                    datos.apellido1 = Convert.ToString(reader.GetValue(2));
                }
                if (!reader.GetValue(3).Equals(DBNull.Value))
                {
                    datos.apellido2 = Convert.ToString(reader.GetValue(3));
                }
               

                if (!reader.GetValue(4).Equals(DBNull.Value))
                {

                    datos.foto = Convert.ToString(reader.GetValue(4));

                }
                if (!reader.GetValue(5).Equals(DBNull.Value))
                {

                    datos.nombreuser = Convert.ToString(reader.GetValue(5));

                }
               
                
                if (!reader.GetValue(6).Equals(DBNull.Value))
                {

                    datos.idrol = Convert.ToInt16(reader.GetValue(6));

                }
                con.Close();
                return JsonConvert.SerializeObject(datos);

            }
            catch (MySqlException)
            {
                return "error";
            }
        }

    }
}


