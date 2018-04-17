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
    /// Lógica de interacción para CodeWindow.xaml
    /// </summary>
    public partial class CodeWindow : Window
    {
        public CodeWindow()
        {
            InitializeComponent();
            DataContext = new ViewModel.CodeViewModel();
            atras.Click += volveratras;
        }

        private void volveratras(object sender, RoutedEventArgs e)
        {
            var r = new MainWindow();
            r.Show();
            this.Close();
        }
    }
}
