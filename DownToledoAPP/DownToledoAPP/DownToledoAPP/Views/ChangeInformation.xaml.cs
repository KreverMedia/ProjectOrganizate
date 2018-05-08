using DownToledoAPP.Connection;
using DownToledoAPP.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace DownToledoAPP.Views
{
	[XamlCompilation(XamlCompilationOptions.Compile)]
	public partial class ChangeInformation : TabbedPage
	{
        private CWS cws;
		public ChangeInformation (string nombreuser)
		{
            
			InitializeComponent ();
          var datos=  cws.DescargarInfousuario(nombreuser);
            cargardatos(datos);
		}

        private void cargardatos(DatosUsuario datos)
        {
            //imagenusuario.Source = ImageSource.FromUri(datos.foto);
        }
    }
}