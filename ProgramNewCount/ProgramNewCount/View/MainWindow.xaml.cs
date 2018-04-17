using ProgramNewCount.Connection;
using ProgramNewCount.View;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ProgramNewCount
{
    /// <summary>
    /// Lógica de interacción para MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private CWS cws;
        public MainWindow()
        {
            InitializeComponent();
             cws = new CWS();
            clave.IsEnabled = false;
            nueva.Click += nuevocodigo;
            lista.Click += listadecodigos;
            petis.Click += ventanapeticiones;
            cargarpetis();
            
        }

        private void cargarpetis()
        {
          var p=  cws.TodaslasPeticiones();
            peticiones.Content = p.Count.ToString();
        }

        private void ventanapeticiones(object sender, RoutedEventArgs e)
        {
            throw new NotImplementedException();
        }

        private void listadecodigos(object sender, RoutedEventArgs e)
        {
            CodeWindow c = new CodeWindow();
            c.Show();
            this.Close();
            
        }

        private void nuevocodigo(object sender, RoutedEventArgs e)
        {
            if (!rol.Text.Equals(""))
            {
                var newcode = cws.Crearnuevousuario(rol.Text);
                if (newcode != null)
                {
                    rol.Text = newcode.rol;
                    clave.Text = newcode.clave;
                }
                else
                {
                    MessageBox.Show("Ha ocurrido un error, compruebe su conexión a Internet", "Error", MessageBoxButton.OK, MessageBoxImage.Error, MessageBoxResult.OK);
                }
            }
            else
            {
                MessageBox.Show("No podemos crear un nuevo código sin saber su rol", "Rellene el campo de Rol", MessageBoxButton.OK, MessageBoxImage.Exclamation, MessageBoxResult.OK);
              
            }
            
        }
    }
}
