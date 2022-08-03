using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class popup_Modifica : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["codVideo"] == null)
            {
                mod.Visible = false;
                return;
            }
            mod.Visible = true;

            int codVideo = int.Parse(Session["codVideo"].ToString());

            VIDEO v = new VIDEO();
            v.codVideo = codVideo;

            SqlCommand cmd = new SqlCommand();
            DataTable dt = v.SelectOne(cmd);


            txtTitolo.Text = dt.Rows[0]["nome"].ToString();
            txtSinossi.Text = dt.Rows[0]["sinossi"].ToString();
            txtLink.Text = dt.Rows[0]["link"].ToString();
            cbxAbbonamento.Checked = dt.Rows[0].Field<bool>("incluso");
            //byte[] = (byte[])v.SelectAll(cmd).Rows[0]["immagine"];
        }
    }
    protected void btnModifica_Click(object sender, EventArgs e)
    {
        //controllo che la riga sia stata selezionata
        if (Session["codVideo"] == null)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Attenzione!", "alert('Nessun campo selezionato')", true);
            return;
        }
        VIDEO v = new VIDEO();
        SqlCommand cmd = new SqlCommand();
        v.codVideo = int.Parse(Session["codVideo"].ToString());

        byte[] imgVecchia = v.SelectOne(cmd).Rows[0].Field<byte[]>("immagine");

        //controllo che la riga non sia vuota
        if (string.IsNullOrEmpty(txtLink.Text) || string.IsNullOrEmpty(txtSinossi.Text) || string.IsNullOrEmpty(txtTitolo.Text))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Attenzione!", "alert('Dati non validi')", true);
            return;
        }
        //dichiaro variabili
        if (!FileUpload1.HasFile)
        {
            v.immagine = imgVecchia;
        }
        else
        {
            v.immagine = FileUpload1.FileBytes;
        }

        v.nome = txtTitolo.Text;
        v.link = txtLink.Text;
        v.sinossi = txtSinossi.Text;
        v.incluso = cbxAbbonamento.Checked;


        v.Update();

        //pulisco
        txtLink.Text = "";
        txtSinossi.Text = "";
        txtTitolo.Text = "";
        cbxAbbonamento.Checked = false;

    }
}