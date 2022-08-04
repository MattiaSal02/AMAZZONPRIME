using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CaricaGriglia();
    }


    protected void CaricaGriglia()
    {
        VIDEO v = new VIDEO();
        SqlCommand cmd = new SqlCommand();
        griglia.DataSource = v.SelectAll(cmd);
        griglia.DataBind();

        lit.Text = "";
        foreach (DataRow dr in v.SelectAll(cmd).Rows)
        {
            byte[] arr1 = dr.Field<byte[]>("immagine");
            string base64String1 = Convert.ToBase64String(arr1, 0, arr1.Length);
            string Src = "data:image/jpg;base64," + base64String1;

            lit.Text += "<img style='width:200px' src='" + Src + "' />";
        }
    }

    protected void btnRicarica_Click(object sender, EventArgs e)
    {
        CaricaGriglia();
    }



    protected void griglia_SelectedIndexChanged(object sender, EventArgs e)
    {
        Modifica.Visible = true;
        Elimina.Visible = true;

        txtNomeM.Text = griglia.SelectedRow.Cells[2].Text;
        txtSinossiM.Text = griglia.SelectedRow.Cells[3].Text;
        txtLinkM.Text = griglia.SelectedRow.Cells[4].Text;

        VIDEO v = new VIDEO();
        v.codVideo = int.Parse(griglia.SelectedDataKey[0].ToString());

        DataTable dt = v.SelectOne(new SqlCommand());
        cbxAbbonamentoM.Checked = dt.Rows[0].Field<bool>("incluso");
        
    }



    protected void griglia_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[1].Visible = false;
    }

    protected void popup_Click(object sender, EventArgs e)
    {
        Response.Redirect("popup/inserimento.aspx");
    }

    protected void btnInserisci_Click(object sender, EventArgs e)
    {
        //dichiaro variabili
        string titolo = txtTitolo.Text;
        string sinossi = txtSinossi.Text;
        string link = txtLink.Text;
        byte[] img = FileUpload1.FileBytes;


        //controllo txt vuote
        if (string.IsNullOrEmpty(titolo) || string.IsNullOrEmpty(sinossi) || string.IsNullOrEmpty(link))
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



    protected void btnElimina_Click(object sender, EventArgs e)
    {
        VIDEO v = new VIDEO();
        v.codVideo = int.Parse(griglia.SelectedDataKey[0].ToString());
        v.Delete();
    }

    protected void btnModifica_Click(object sender, EventArgs e)
    {
        
        VIDEO v = new VIDEO();
        SqlCommand cmd = new SqlCommand();
        v.codVideo = int.Parse(griglia.SelectedDataKey[0].ToString());

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

        v.nome = txtNomeM.Text;
        v.link = txtLinkM.Text;
        v.sinossi = txtSinossiM.Text;
        v.incluso = cbxAbbonamentoM.Checked;


        v.Update();

        //pulisco
        txtLinkM.Text = "";
        txtSinossiM.Text = "";
        txtNomeM.Text = "";
        cbxAbbonamentoM.Checked = false;
    }
}