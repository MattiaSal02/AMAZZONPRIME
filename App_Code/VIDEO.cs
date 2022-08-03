using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Descrizione di riepilogo per VIDEO
/// </summary>
public class VIDEO
{
    public int codVideo;
    public string nome;
    public string sinossi;
    public byte[] immagine;
    public string link;
    public bool incluso;
    public VIDEO()
    {
        
    }

    public DataTable SelectAll(SqlCommand cmd)
    {
        CONNESSIONE C = new CONNESSIONE();

        cmd.CommandText = "video_SelectAll";

        return C.EseguiSelect(cmd);
    }


    public DataTable SelectOne(SqlCommand cmd)
    {
        CONNESSIONE C = new CONNESSIONE();

        cmd.CommandText = "video_SelectOne";
        cmd.Parameters.AddWithValue("@codVideo", codVideo);

        return C.EseguiSelect(cmd);
    }


    public void Insert()
    {
        CONNESSIONE c = new CONNESSIONE();
        SqlCommand cmd = new SqlCommand();
        
        cmd.CommandText = "video_Insert";
        cmd.Parameters.AddWithValue("@nome", nome);
        cmd.Parameters.AddWithValue("@sinossi", sinossi);
        cmd.Parameters.AddWithValue("@immagine", immagine);
        cmd.Parameters.AddWithValue("@link", link);
        cmd.Parameters.AddWithValue("@incluso", incluso);

        c.EseguiCmd(cmd);
    }


    public void Update()
    {
        CONNESSIONE c = new CONNESSIONE();
        SqlCommand cmd = new SqlCommand();

        cmd.CommandText = "video_Update";
        cmd.Parameters.AddWithValue("@codVideo", codVideo);
        cmd.Parameters.AddWithValue("@nome", nome);
        cmd.Parameters.AddWithValue("@sinossi", sinossi);
        cmd.Parameters.AddWithValue("@immagine", immagine);
        cmd.Parameters.AddWithValue("@link", link);
        cmd.Parameters.AddWithValue("@incluso", incluso);


        c.EseguiCmd(cmd);
    }

    public void Delete()
    {
        CONNESSIONE c = new CONNESSIONE();
        SqlCommand cmd = new SqlCommand();

        cmd.CommandText = "video_Delete";
        cmd.Parameters.AddWithValue("@codVideo", codVideo);

        c.EseguiCmd(cmd);
    }


}