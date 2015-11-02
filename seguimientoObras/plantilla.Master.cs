using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace seguimientoObras {

    public partial class plantilla : System.Web.UI.MasterPage {

        protected void Page_Load(object sender, EventArgs e) {
            try {
                string user = (string)Session["nombre"];
                int nivel = (int)Session["nivel"];
                lblUser.Text = user;

            } catch {
                //si arroja error entonces caduco la sesion
                Response.Redirect("index.aspx?e=nosession");
            }
        }
    }
}