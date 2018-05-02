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
	public partial class NewUserPage : ContentPage
	{
		public NewUserPage ()
		{
			InitializeComponent ();
            crear.Clicked += crearcuenta;
		}

        private async void crearcuenta(object sender, EventArgs e)
        {
            var cw = new CWS();
            if (user.Text.Equals("")|| pass.Text.Equals("")) {
                await DisplayAlert("Campo vacio", "Rellene el campo", "Entendido");
            }
            else
            {
              var r= cw.ComprobarUsuarioExiste(user.Text);
                if (!r)
                {
                    cw.Crearusuario(user.Text, pass.Text);
                }
                else
                {
                    await DisplayAlert("Existe usuario", "Este usuario ya existe, introduzca otro usuario", "Entendido");
                }
            }
        }
    }
}