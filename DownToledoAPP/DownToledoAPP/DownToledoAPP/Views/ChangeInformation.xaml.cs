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
	public partial class ChangeInformation : ContentPage
	{
		public ChangeInformation (string nombreuser)
		{
			InitializeComponent ();
		}
	}
}