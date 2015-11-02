using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using seguimientoObras;
using cfe.webBootstrap;

namespace seguimientoObras {
    public partial class capContratacion : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            validaNivel(1);
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

        protected void LinkButton1_Click(object sender, EventArgs e) {
            //Se guarda la actualizacion de la obra
            string rpu = txtRPU.Text;
            string fcont = txtFCont.Text;
            string obs = txtObs.Text;
            int status = 2;
            int id = int.Parse((string)Request["i"]);
            bdsTableAdapters.c_obrasTableAdapter c_obrasTA = new bdsTableAdapters.c_obrasTableAdapter();
            c_obrasTA.UpdateQuery(rpu, DateTime.Parse(fcont), obs, status, id);
            BootStrapAlert alerta = new BootStrapAlert();
            lblMsg.Text = alerta.GeneraAlerta("Se guardo correctamente la Contratación de la Obra.  &nbsp;&nbsp;<a  href='principal.aspx' class='btn btn-info btn-xs'><i class='fa fa-check-circle'></i> Continuar </a>", "info");
        }
        public void validaNivel(int nivelmin) {
            int nacceso = 0;
            try {
                nacceso = (int)Session["nivel"];
            } catch {
                //si marca error la session caduco
                Response.Redirect("index.aspx?e=nosession");
            }
            if (nacceso >= nivelmin) {
                //si el nivel de acceso es mayor o igual al minimo requerido
                //No se hace nada todo OK
            } else {
                Response.Redirect("principal.aspx?e=nonivel");
            }
        }
    }
}