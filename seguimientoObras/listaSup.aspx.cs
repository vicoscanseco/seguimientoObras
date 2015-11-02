using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace seguimientoObras {
    public partial class listaSup : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            //Se  obtienen los datos de la obra
            int id = int.Parse((string)Request["i"]);
            bdsTableAdapters.c_obrasTableAdapter c_obrasTA = new bdsTableAdapters.c_obrasTableAdapter();
            bds.c_obrasDataTable c_obrasTB = c_obrasTA.GetxID(id);
            foreach (var item in c_obrasTB) {
                txtNoOfico.Text = (string)item["idoficio"];
                txtFecha.Text = ((DateTime)item["fecha"]).ToShortDateString();
                txtNombre.Text = (string)item["nombre_obra"];
            }
        }
    }
}