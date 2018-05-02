using ProgramNewCount.Connection;
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
    /// Lógica de interacción para DetailWindow.xaml
    /// </summary>
    public partial class DetailWindow : Window
    {
        private CWS c;
        public DetailWindow(Model.PeticionMVVM peticionseleccionada)
        {
            InitializeComponent();
            nombre.Text = peticionseleccionada.nombre + " " + peticionseleccionada.apellido1 + " " + peticionseleccionada.apellido2;
            correo.Text = peticionseleccionada.correo;
            descripcion.Text = peticionseleccionada.descripcion;
            nombre.IsEnabled = false;
            correo.IsEnabled = false;
            cargarcombo();
            descripcion.IsEnabled = false;
            nuevaclave.Click += delegate { nueva(peticionseleccionada); };
            rechazar.Click +=delegate { rechazado(peticionseleccionada); };
        }

        private void rechazado(Model.PeticionMVVM peticion)
        {
            c = new CWS();
            c.BorrarPeticion(peticion.correo);
            this.Close();
        }
        private void cargarcombo()
        {
           var  cws = new CWS();
            var r = cws.Sacartodoslosroles();
            for (int i = 0; i < r.Count; i++)
            {
                combo.Items.Add(r[i]);
            }
        }
        private void nueva(Model.PeticionMVVM peticion)
        {
            c = new CWS();
            if (!(rol.Text.Equals("")))
            {
                c.Nuevocodigonuevorol(rol.Text);
            }
            else
            {
                c.Crearnuevousuario((string)combo.SelectedItem);
            }
            c.BorrarPeticion(peticion.correo);
            this.Close();
        }
    }
}
