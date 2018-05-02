using ProgramNewCount.Connection;
using ProgramNewCount.Model;
using ProgramNewCount.Util;
using ProgramNewCount.View;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace ProgramNewCount.ViewModel
{
    class PetitionViewModel
    {
        private PeticionMVVM peticionseleccionada;
        public PeticionMVVM Peticionseleccionada
        {
            get { return peticionseleccionada; }
            set
            {
                if (value != null)
                {
                    peticionseleccionada = value;
                    OnPropertyChanged("Peticionseleccionada");
                    var p = new DetailWindow(Peticionseleccionada);
                    p.Show();

                    p.Closing += recargar;
                }

            }
        }

        private void recargar(object sender, CancelEventArgs e)
        {
            for(int i=0; i<Lista.Count; i++)
            {
                Lista.Remove(Lista[i]);
            }
            Lista = convertirenObservable(l.TodaslasPeticiones());
        }

        public event PropertyChangedEventHandler PropertyChanged;
        
        private void OnPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
            }
        }
        private ObservableCollection<PeticionMVVM> lista;
        public ObservableCollection<PeticionMVVM> Lista
        {
            get
            {
                return lista;
            }
            set
            {
                lista = value;
                OnPropertyChanged("Lista");
            }
        }
        private CWS l;
        public ICommand EliminarTodos { get; set; }
        public PetitionViewModel()
        {
            l = new CWS();
            Lista=(convertirenObservable(l.TodaslasPeticiones()));
            EliminarTodos = new Command(AccionEliminarTodo);
        }

        private ObservableCollection<PeticionMVVM> convertirenObservable(List<Peticion> list)
        {
            var r = new ObservableCollection<PeticionMVVM>();
            for(int i=0; i < list.Count; i++)
            {
                var p = new PeticionMVVM();
                p.nombre = list[i].nombre;
                p.apellido1 = list[i].apellido1;
                p.apellido2 = list[i].apellido2;
                p.correo = list[i].correo;
                p.descripcion = list[i].descripcion;
                p.eliminar = false;
                r.Add(p);

            }
            return r;
        }
        private void AccionEliminarTodo(object obj)
        {

            var z = l.BorrarTodaslasPeticiones();
            if (z.Equals("ok"))
            {
                while (Lista.Count > 0)
                {
                    Lista.Remove(Lista[0]);
                }
            }

        }


    }
}
