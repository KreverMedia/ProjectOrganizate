Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel


' Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente.
' <System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")>
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<ToolboxItem(False)>
Public Class NuevaCuenta
    Inherits System.Web.Services.WebService


    <WebMethod()>
    Public Function HelloWorld() As String
        Dim cadenadeconexion = "server=localhost;uid=root;pwd=;database=downtoledo"
        Dim con = MySqlConnection()
        Return "Hola a todos"
    End Function

End Class