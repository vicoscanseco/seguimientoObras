using System;
using System.Web.UI;
using cfe.webBootstrap;


namespace seguimientoObras {
    public partial class verObra : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            validaNivel(2);
            if (!Page.IsPostBack) {
                cargaDatos(int.Parse(Request["i"]));
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e) {
            BootStrapAlert alerta = new BootStrapAlert();
            int i = int.Parse(Request["i"]);
            string observaciones = txtObservaciones.Text;
            bdsTableAdapters.c_obrasTableAdapter obta = new bdsTableAdapters.c_obrasTableAdapter();
            obta.UpdateComentario(observaciones, i);
            lblMsg.Text = alerta.GeneraAlerta("Se actualizo el comentario correctamente de la Obra.  &nbsp;&nbsp;<a  href='principal.aspx' class='btn btn-info btn-xs'><i class='fa fa-check-circle'></i> Continuar </a>", "info");
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
        private void cargaDatos(int idobra) {
            bdsTableAdapters.c_obrasTableAdapter obrasTA = new bdsTableAdapters.c_obrasTableAdapter();
            bds.c_obrasDataTable obrasTB = obrasTA.GetxID(idobra);            
            foreach (var item in obrasTB) {
                txtNoOfico.Text = (string)item["idoficio"];
                txtFecha.Text = ((DateTime)item["fecha"]).ToShortDateString();
                txtNameO.Text = (string)item["nombre_obra"];
                txtDir.Text = (string)item["direccion"];
                ddlAg.SelectedValue = (string)item["centro"];
                ddlMpio.SelectedValue = (string)item["cve_mpio"];
                txtObservaciones.Text = item["observaciones"] == System.DBNull.Value ? "" : (string)item["observaciones"];
                // <a href='capSup.aspx?i=<%# Eval("idobra") %>&' title="Supervisión"><i class="fa fa-user-secret fa-lg"></i></a>
                lblFile.Text = (item["oficio"]) == System.DBNull.Value ? "" : @"< a href = '" + ((string)item["oficio"]) + "' title = 'Supervisión' >< i class='fa fa-file-pdf-o fa-lg'></i></a>";
            }
            bloqueaCaptura();       
        }
        private void bloqueaCaptura() {
            txtNoOfico.Enabled = false;
            txtFecha.Enabled = false;
            txtNameO.Enabled = false;
            txtDir.Enabled = false;
            ddlAg.Enabled = false;
            ddlMpio.Enabled = false;
        }
    }

}