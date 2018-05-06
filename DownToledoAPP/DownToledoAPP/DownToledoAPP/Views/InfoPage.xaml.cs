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
	public partial class InfoPage : TabbedPage
	{
        private CWS cws;
        private DatosUsuario actualusuario;
		public InfoPage (string text)
		{
			InitializeComponent ();
            cws = new CWS();
             actualusuario=cws.DescargarInfousuario(text);
           
            //image.Source = actualusuario.foto;
            //name.Text = actualusuario.nombre + " " + actualusuario.apellido1 + " " + actualusuario.apellido2 + "  Alias:" + actualusuario.nombreuser;
            logout.Clicked += salir;
            userinfo.Clicked += change;
		}

        private async void change(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new ChangeInformation(/*actualusuario.nombreuser*/ null));
            Navigation.RemovePage(this);
        }

        private async void salir(object sender, EventArgs e)
        {
            var r = await DisplayAlert("Cerrar sesión", "¿Esta seguro de que desea cerrar sesión?", "Si", "No");
            if (r)
            {
                await Navigation.PushAsync(new LoguinPage());
                Navigation.RemovePage(this);
            }
        }
    }
}