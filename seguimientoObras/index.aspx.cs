using System;
using System.Linq;
using System.Web.UI;
using seguimientoObras.bdsTableAdapters;
using cfe.webBootstrap;

namespace seguimientoObras {

    public partial class index : System.Web.UI.Page {

        protected void Page_Load(object sender, EventArgs e) {
            try {
                string error = (string)Request["e"];
                BootStrapAlert alerta = new BootStrapAlert();
                switch (error) {
                    case "nosession":
                        lblMsg.Text = alerta.GeneraAlerta("<p>Lo siento, caduco tu Sesión!!!</p>", "danger");
                        break;
                    case "nonivel":
                        lblMsg.Text = alerta.GeneraAlerta("<p>Se necesita un nivel administrativo para esta opción!!!</p>", "danger");
                        break;

                    default:
                        break;
                }
            } catch {
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e) {
            if (CheckBox1.Checked) {
                txtUser.Text = "CONSULTA";
                txtClave.Enabled = false;
                rfClave.Enabled = false;
            } else {
                txtClave.Enabled = true;
                txtUser.Text = "";
                rfClave.Enabled = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e) {
            if (Page.IsValid) {
                BootStrapAlert alerta = new BootStrapAlert();
                //se verifica que no este habilitado el modo consulta
                if (CheckBox1.Checked) {
                    //si esta activo entonces se coloca como consulta
                    Session.Add("usuario", "CONSU");
                    Session.Add("nombre", "Consulta");
                    Session.Add("nivel", 0);
                    lblMsg.Text = alerta.GeneraAlerta("Consulta OK!!!", "success");
                    Response.Redirect("principal.aspx");
                } else {
                    //se busca el usuario en la BD
                    string rpe = txtUser.Text;
                    string clave = txtClave.Text;
                    c_usuariosTableAdapter usuTA = new c_usuariosTableAdapter();

                    bds.c_usuariosDataTable usuarios = usuTA.GetDataBy(rpe);                    
                    if (usuarios.Count > 0) {
                        //si encontro entonces compara la clave si no entonces no existe
                        foreach (var item in usuarios) {
                            string c2 = (string)item["clave"];
                            if (c2 == clave) {
                                //OK se da acceso
                                Session.Add("usuario", rpe);
                                Session.Add("nivel", (int)item["nivel"]);
                                Session.Add("nombre", (string)item["nombre"]);
                                Session.Add("puesto", (int)item["puesto"]);
                                Session.Add("iddepto", (string)item["iddepto"]);
                                Session.Add("centro", (string)item["centro"]);
                                Session.Add("rpe", rpe);
                                Response.Redirect("principal.aspx");

                                lblMsg.Text = alerta.GeneraAlerta("Usuario OK!!!", "success");
                            } else {
                                lblMsg.Text = alerta.GeneraAlerta("La clave es incorrecta!!!", "danger");
                            }
                        }
                    } else {
                        lblMsg.Text = alerta.GeneraAlerta("El Usuario no existe!!!", "danger");
                    }
                }
            }
        }
    }
}