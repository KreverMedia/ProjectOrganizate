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
	public partial class LoguinPage : ContentPage
	{
		public LoguinPage ()
		{
			InitializeComponent ();
            loguin.Clicked += loguearse;
            register.Clicked += registrarse;
		}

        private void registrarse(object sender, EventArgs e)
        {
            Navigation.PushAsync(new CodePage());
        }

        private void loguearse(object sender, EventArgs e)
        {
            var cws = new CWS();
            var bo = cws.ComprobarUsuario(user.Text, pass.Text);
            if (bo)
            {
                Navigation.PushAsync(new InfoPage(user.Text));
                Navigation.RemovePage(this);
            }
        }
    }
}