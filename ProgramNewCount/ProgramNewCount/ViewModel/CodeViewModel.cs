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
              
                    lista = value;
                
              
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

        public event PropertyChangedEventHandler PropertyChanged;

        private void OnPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
            }
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
            
            var z= l.BorrarTodoslosCodigos();
            if (z.Equals("ok"))
            {
                while (Lista.Count > 0) { 
                    Lista.Remove(Lista[0]);
                }
            }
           
        }

        private void AccionBorrarSeleccionados(object obj)
        {
            String z = "";
            for(int i=0; i < Lista.Count; i++)
            {
                if (Lista[i].eliminar)
                {
                   z= l.Borrarcodigo(Lista[i].clave);
                    
                }
            }
            if (z.Equals("ok"))
            {
                
                Lista = convertirObservable(l.TodosLosCodigos());
            }
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
