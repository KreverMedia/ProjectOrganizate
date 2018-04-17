using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace ProgramNewCount.View
{
    /// <summary>
    /// Lógica de interacción para PetitionWindow.xaml
    /// </summary>
    public partial class PetitionWindow : Window
    {
        public PetitionWindow()
        {
            InitializeComponent();
            DataContext = new ViewModel.PetitionViewModel();
            atras.Click += patras;
        }

        private void patras(object sender, RoutedEventArgs e)
        {
            var p = new MainWindow();
            p.Show();
            this.Close();
        }
    }
}
