using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListaVideo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Recupera i dati dei video
            DataTable dt = new VIDEO().SelectAll(new SqlCommand());

            // Carico il carosello
            CaricaCarousel(dt);

            // Popolo la griglia dei video
            //foreach(DataRow v in dt.Rows)
            //{
            //    CreaRiquadro(v);
            //}
        }
    }

    void CaricaCarousel(DataTable dt)
    {
        // Recupera i dati degli ultimi tre video
        DataRow v1 = dt.Rows[dt.Rows.Count - 1];
        DataRow v2 = dt.Rows[dt.Rows.Count - 2];
        DataRow v3 = dt.Rows[dt.Rows.Count - 3];

        // Imposta il carosello per mostrare gli ultimi tre video
        a1.HRef = v1.Field<string>("link");
        i1.Alt = v1.Field<string>("titolo");
        byte[] arr1 = v1.Field<byte[]>("immagine");
        string base64String1 = Convert.ToBase64String(arr1, 0, arr1.Length);
        i1.Src = "data:image/jpg;base64," + base64String1;

        a2.HRef = v2.Field<string>("link");
        i2.Alt = v2.Field<string>("titolo");
        byte[] arr2 = v2.Field<byte[]>("immagine");
        string base64String2 = Convert.ToBase64String(arr2, 0, arr2.Length);
        i2.Src = "data:image/jpg;base64," + base64String2;

        a3.HRef = v3.Field<string>("link");
        i3.Alt = v3.Field<string>("titolo");
        byte[] arr3 = v3.Field<byte[]>("immagine");
        string base64String3 = Convert.ToBase64String(arr3, 0, arr3.Length);
        i3.Src = "data:image/jpg;base64," + base64String3;
    }

    //void CreaRiquadro(DataRow video)
    //{
    //    // Magari con jquery?
    //}
}