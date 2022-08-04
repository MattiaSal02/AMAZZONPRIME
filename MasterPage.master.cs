using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // rendo visibile il bottone iscriviti solo se sei loggato e non iscritto
        if (Session["CodUtente"] != null)
        {
            UTENTI u = new UTENTI();
            u.codUtente = int.Parse(Session["codUtente"].ToString());

            if (!u.Abbonamento())
            {
                btnSubscribe.Visible = true;
            }
            else
            {
                btnSubscribe.Visible = false;
            }

            if (Session["TipoUtente"].ToString() == "a")
            {
                GestioneVideo.Visible = true;
            }
        }
    }

    protected void btnSubscribe_Click(object sender, EventArgs e)
    {
        UTENTI U = new UTENTI();
        U.codUtente = int.Parse(Session["codUtente"].ToString());

        U.Iscritto();
    }
}
