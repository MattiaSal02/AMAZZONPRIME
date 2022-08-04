using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registrazione : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRegistrazione_Click(object sender, EventArgs e)
    {
        //Controlli formali
        if (string.IsNullOrEmpty(txtUserRegistrazione.Text) || (string.IsNullOrEmpty(txtPasswordRegistrazione.Text)))
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "Dati non validi", "alert('Compilare tutti i campi')", true);
            return;
        }
        //dichiaro le variabili
        string user = txtUserRegistrazione.Text.Trim();
        string password = CRYPTA.Crypta(txtPasswordRegistrazione.Text);

        UTENTI u = new UTENTI();
        u.usr=user;
        u.pwd=password;

        // Controllo ridondanza
        if (u.Registrato())
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "Dati non validi", "alert('Dati non validi')", true);
            return;
        }

        u.Insert();

        txtUserRegistrazione.Text="";
        txtPasswordRegistrazione.Text="";
        ScriptManager.RegisterClientScriptBlock(this, GetType(), "Dati Registrati!", "alert('Dati Registrati con successo. Fai ora il Login!')", true);
    }
    public static string RandomString(int length)
    {
        Random random = new Random();
        string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

        string s = "";
        for (int i = 0; i < length; i++) s += chars[random.Next(chars.Length)];

        return s;
    }
}
