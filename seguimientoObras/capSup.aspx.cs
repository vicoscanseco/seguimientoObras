using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using seguimientoObras;
using cfe.webBootstrap;


namespace seguimientoObras {
    public partial class capSup : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            //se Obtiene si se registra el parametro de vista = r (solo lectura)            
            string v = "";
            string s = "";
            try {
                v = (string)Request["v"];
                s = (string)Request["s"];
            } catch {
                v = "";
            }
            if (v == "r") {
                //se visualiza la supervisión
                bdsTableAdapters.c_supcomTableAdapter supTA = new bdsTableAdapters.c_supcomTableAdapter();
                bds.c_supcomDataTable supTB = supTA.GetDataByIDSup(int.Parse(s));
                foreach (var item in supTB) {
                    txtFSup.Text = ((DateTime)item["fecha"]).ToShortDateString();
                    txtFSup.Enabled = false;
                    txtObs.Text = (string)item["observaciones"];
                    txtObs.Enabled = false;
                }
                bdsTableAdapters.c_filesupTableAdapter fTA = new bdsTableAdapters.c_filesupTableAdapter();
                bds.c_filesupDataTable fTB = fTA.GetDataBySup(int.Parse(s));
                gvAnexos.DataSource = fTB;
                gvAnexos.DataBind();


            } else {
                validaNivel(1); //Depto. Comercial
            }
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
            //se almacenan los datos de la supervision
            //1. Se almacenan los datos en la tabla de c_supcom
            int id = int.Parse((string)Request["i"]);
            string fecha = txtFSup.Text;
            string obs = txtObs.Text;
            string rpe = (string)Session["rpe"];
            bdsTableAdapters.c_supcomTableAdapter supTA = new bdsTableAdapters.c_supcomTableAdapter();
            supTA.InsertQuery(id, DateTime.Parse(fecha), obs, rpe);
            //
            bds.c_supcomDataTable supTB = supTA.GetDataxSup(id, obs, rpe);
            int idsup = 0;
            foreach (var item in supTB) {
                idsup = (int)item["idsup"];
            }
            //3. Si se inserto la supervision entonces se guardan los anexos de los archivos temporales
            bdsTableAdapters.c_filetmpTableAdapter ftmpTA = new bdsTableAdapters.c_filetmpTableAdapter();
            bdsTableAdapters.c_filesupTableAdapter fsupTA = new bdsTableAdapters.c_filesupTableAdapter();
            bds.c_filetmpDataTable tmp = ftmpTA.GetDataxSup(Session.SessionID);
            foreach (var item in tmp) {
                fsupTA.InsertQuery(idsup, (string)item["filepath"], (string)item["titulo"]);
            }
            //se borran los archivos temporales
            ftmpTA.DeleteQuerySup(Session.SessionID);
            //se actualiza el status de la obra a Supervisada
            bdsTableAdapters.c_obrasTableAdapter c_obrasTA = new bdsTableAdapters.c_obrasTableAdapter();
            c_obrasTA.ActualizaStatus(1, id);
            BootStrapAlert alerta = new BootStrapAlert();
            lblMsg.Text = alerta.GeneraAlerta("Se guardo correctamente la Supervisión de la Obra.  &nbsp;&nbsp;<a  href='principal.aspx' class='btn btn-info btn-xs'><i class='fa fa-check-circle'></i> Continuar </a>", "info");

        }

        protected void addFile_Click(object sender, EventArgs e) {
            //Se guardan en una tabla temporal los anexos de la supervision
            string filename = fuAnexo.FileName;
            string path = Server.MapPath("anexos");
            string newName = Session.SessionID + "_" + filename;
            path += "\\" + newName;
            bdsTableAdapters.c_filetmpTableAdapter ftmpTA = new bdsTableAdapters.c_filetmpTableAdapter();
            ftmpTA.InsertQuery(Session.SessionID, newName, filename);
            fuAnexo.SaveAs(path);
            bds.c_filetmpDataTable tmp = ftmpTA.GetDataxSup(Session.SessionID);
            gvAnexos.DataSource = tmp;
            gvAnexos.DataBind();
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