using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using seguimientoObras;
using cfe.webBootstrap;

namespace seguimientoObras {
    public partial class capObra : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            validaNivel(2);
        }

        protected void LinkButton1_Click(object sender, EventArgs e) {
            string noOficio = txtNoOfico.Text;
            string fecha = txtFecha.Text;
            string nombre = txtNameO.Text;
            string direccion = txtDir.Text;
            string agencia = ddlAg.SelectedValue;
            string mpio = ddlMpio.Text;
            string cve_mpio = ddlMpio.SelectedValue;
            string obs = txtObservaciones.Text;
            string path = Server.MapPath("oficios");
            string filename = fuFile.FileName;
            path += "\\" + filename;
            BootStrapAlert alerta = new BootStrapAlert();
            bdsTableAdapters.c_obrasTableAdapter c_obrasTA = new bdsTableAdapters.c_obrasTableAdapter();
            c_obrasTA.InsertQuery(noOficio, DateTime.Parse(fecha), nombre, direccion, mpio, "", DateTime.Parse("01/01/1990"), obs, 0, agencia, filename,cve_mpio);            
            //Se guarda el archivo
            fuFile.SaveAs(path);
            lblMsg.Text = alerta.GeneraAlerta("Se guardo correctamente la Obra.  &nbsp;&nbsp;<a  href='capObra.aspx' class='btn btn-info btn-xs'><i class='fa fa-check-circle'></i> Continuar </a>", "info");


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