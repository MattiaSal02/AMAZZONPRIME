using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class popup_Inserimento : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnInserisci_Click(object sender, EventArgs e)
    {
        //dichiaro variabili
        string titolo = txtTitolo.Text;
        string sinossi = txtSinossi.Text;
        string link = txtLink.Text;
        byte[] img = FileUpload1.FileBytes;
       

        //controllo txt vuote
        if(string.IsNullOrEmpty(titolo) || string.IsNullOrEmpty(sinossi) || string.IsNullOrEmpty(link))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Attenzione!", "alert('Dati non validi')", true);
            return;
        }

        VIDEO v = new VIDEO();
        v.nome = titolo;
        v.immagine = img;
        v.link = link;
        v.sinossi = sinossi;
        v.incluso = cbxAbbonamento.Checked;

        v.Insert();
        

        txtLink.Text = "";
        txtSinossi.Text = "";
        txtTitolo.Text = "";

    }
}