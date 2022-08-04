using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //Controlli formali
        if(string.IsNullOrEmpty(txtUser.Text) || (string.IsNullOrEmpty(txtPassword.Text)))
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "Dati non validi", "alert('Compilare tutti i campi')", true);
            return;
        }

        //dichiaro le variabili
        string usr = txtUser.Text.Trim();
        string pwd = CRYPTA.Crypta(txtPassword.Text);

        UTENTI u = new UTENTI(usr,pwd);
        
        
        //Controllo il Login
        if(!u.Login())
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "Dati non validi", "alert('Dati non validi')", true);
            return;
        }

        // Salvo il tipo utente e il codiceUtente nella Session
        Session["TipoUtente"] = u.RecuperaTipoUtente();
        Session["CodUtente"] = u.RecuperaCodicePersonale();

        // Reindirizzamento alla pagina principale
        Response.Redirect("ListaVideo.aspx");
    }
}
