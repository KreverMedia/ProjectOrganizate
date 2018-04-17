using ProgramNewCount.Connection;
using ProgramNewCount.Model;
using ProgramNewCount.Util;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace ProgramNewCount.ViewModel
{
    class CodeViewModel
    {
        private ObservableCollection<NewCountMVVM> lista;
        public ObservableCollection<NewCountMVVM> Lista
        {
            get { return lista; }
            set
            {
                if (value.Count != 0)
                {
                    lista = value;
                }
              
                OnPropertyChanged("Lista");
            }
        }
        private NewCountMVVM cuentaseleccionada;
        public NewCountMVVM Cuentaseleccionada
        {
            get { return cuentaseleccionada; }
            set
            {
                if (value != null)
                {
                    cuentaseleccionada = value;
                    OnPropertyChanged("Cuentaseleccionada");
                    cargarmensaje();
                }
            }
        }

        private void OnPropertyChanged(string v)
        {
          
        }

        private void cargarmensaje()
        {
         var l=  MessageBox.Show("¿Desea eliminar este codigo?", "Editar o Eliminar", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (l.Equals(MessageBoxResult.Yes))
            {
               Lista.Remove(Cuentaseleccionada);

            }
            else
            {
           
            }
        }
        private CWS l;
        public ICommand EliminarSeleccionados { get; set; }
        public ICommand EliminarTodos { get; set; }
        public CodeViewModel()
        {
             l = new CWS();
           Lista= convertirObservable(l.TodosLosCodigos());
            EliminarSeleccionados = new Command(AccionBorrarSeleccionados);
            EliminarTodos = new Command(AccionEliminarTodo);
        }

        private void AccionEliminarTodo(object obj)
        {
            l.BorrarTodoslosCodigos();
            Lista = convertirObservable(l.TodosLosCodigos());
            Lista.Count();
        }

        private void AccionBorrarSeleccionados(object obj)
        {
            for(int i=0; i < Lista.Count; i++)
            {
                if (Lista[i].eliminar)
                {
                    l.Borrarcodigo(Lista[i].clave);
                    
                }
            }
            for (int i = 0; i < Lista.Count; i++)
            {
                Lista.Remove(Lista[i]);
            }
            Lista = convertirObservable(l.TodosLosCodigos());
        }

        private ObservableCollection<NewCountMVVM> convertirObservable(List<NewCount> list)
        {
            var p = new ObservableCollection<NewCountMVVM>();
            for(int i = 0; i < list.Count; i++)
            {
                var r = new NewCountMVVM();
                r.clave = list[i].clave;
                r.rol = list[i].rol;
                r.eliminar = false;
                p.Add(r);
            }
            return p;
        }

     

    }
}
