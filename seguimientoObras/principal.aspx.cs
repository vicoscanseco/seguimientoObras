using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cfe.webBootstrap;


namespace seguimientoObras {

    public partial class principal : System.Web.UI.Page {

        protected void Page_Load(object sender, EventArgs e) {
            //Session.Add("rpe", "9L0BD");
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
    }
}