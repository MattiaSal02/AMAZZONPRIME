using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Video : System.Web.UI.Page
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

            lit.Text += "<img style='width:200px' src='"+Src+"' />";
        }

        

    }

    protected void btnRicarica_Click(object sender, EventArgs e)
    {
        CaricaGriglia();
    }



    protected void griglia_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["codVideo"] = griglia.SelectedDataKey[0];
    }



    protected void griglia_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[1].Visible = false;
    }
}