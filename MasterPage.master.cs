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
            home.HRef = "Home2.aspx";
            Button1.Visible = true;

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
        else { home.HRef = "Home.aspx"; Button1.Visible = false; }
    }

    protected void btnSubscribe_Click(object sender, EventArgs e)
    {
        UTENTI U = new UTENTI();
        U.codUtente = int.Parse(Session["codUtente"].ToString());

        U.Iscritto();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["CodUtente"] = null;
        Response.Redirect("Home.aspx");
    }
}
