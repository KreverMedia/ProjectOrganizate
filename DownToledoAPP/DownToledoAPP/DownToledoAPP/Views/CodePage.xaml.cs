using DownToledoAPP.Connection;
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
	public partial class CodePage : ContentPage
	{
		public CodePage ()
		{
			InitializeComponent ();
            comprobar.Clicked += comprobe;
		}

        private async void comprobe(object sender, EventArgs e)
        {
            var cw = new CWS();
            if (code.Text.Equals("")) {
                await DisplayAlert("Campo vacio", "Rellene el campo", "Entendido");
            }
            else
            {
                var existe = cw.ComprobarCodigo(code.Text);
                if (existe)
                {
                    cw.Borrarcodigo(code.Text);
                    await Navigation.PushAsync(new NewUserPage());
                    Navigation.RemovePage(this);
                }
                else
                {
                    await DisplayAlert("No existe", "Introduzca un código valido", "Entendido");
                }
            }
        }
    }
}