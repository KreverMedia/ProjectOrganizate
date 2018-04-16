using ProgramNewCount.Connection;
using ProgramNewCount.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProgramNewCount.ViewModel
{
    class CodeViewModel
    {
        private ObservableCollection<NuevoUsuario> lista;
        public ObservableCollection<NuevoUsuario> Lista
        {
            get { return lista; }
            set
            {
                lista = value;
                OnPropertyChanged("Lista");
            }
        }
        private NuevoUsuario cuentaseleccionada;
        public NuevoUsuario Cuentaseleccionada
        {
            get { return cuentaseleccionada; }
            set
            {
                cuentaseleccionada = value;
                OnPropertyChanged("Cuentaseleccionada");
            }
        }
        public CodeViewModel()
        {
            var l = new CWS();
           Lista= convertirObservable(l.TodosLosCodigos());
            l = null;
        }

        private ObservableCollection<NuevoUsuario> convertirObservable(List<NuevoUsuario> list)
        {
            var p = new ObservableCollection<NuevoUsuario>();
            for(int i = 0; i < list.Count; i++)
            {
                p.Add(list[i]);
            }
            return p;
        }

        public event PropertyChangedEventHandler PropertyChanged;

        private void OnPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
            }
        }

    }
}
