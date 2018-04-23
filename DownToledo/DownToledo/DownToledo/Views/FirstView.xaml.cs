using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace DownToledo.Views
{
	public partial class FirstView : ContentPage
	{
		public FirstView()
		{
			InitializeComponent();
            ima.Source = ImageSource.FromResource("DownToledo.img.Logo.png",Assembly.GetExecutingAssembly());
            loguin.Clicked += loguearse;
            register.Clicked += registrarse;
		}

        private async void registrarse(object sender, EventArgs e)
        {
           await Navigation.PushAsync(new RegisterPage());
        }

        private void loguearse(object sender, EventArgs e)
        {
         
        }
    }
}
