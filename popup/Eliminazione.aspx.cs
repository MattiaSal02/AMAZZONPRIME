using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class popup_Eliminazione : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["codVideo"] == null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Attenzione!", "alert('Nessun campo selezionato')", true);
                mod.Visible = false;

                return;
            }
        }
    }

    protected void btnElimina_Click(object sender, EventArgs e)
    {
        VIDEO v = new VIDEO();

        v.codVideo = int.Parse(Session["codVideo"].ToString());

        v.Delete();

        lblSuccess.Text = "Film eliminato correttamente";
    }


}