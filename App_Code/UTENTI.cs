using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


public class UTENTI
{
    public int codUtente;
    public string usr;
    public string pwd;
    public char tipoUtente;
    public bool abbonamento;
    public UTENTI() {}
    public UTENTI(string usr, string pwd)
    {
        this.usr = usr;
        this.pwd = pwd;
    }
    public bool Registrato()
    {
        SqlCommand cmd = new SqlCommand("UTENTI_REGISTRATO");
        cmd.Parameters.AddWithValue("@usr", usr);

        CONNESSIONE c = new CONNESSIONE();
        DataTable dt = c.EseguiSelect(cmd);

        return dt.Rows.Count > 0;
    }
    public bool Abbonamento()
    {
        SqlCommand cmd = new SqlCommand("UTENTI_ABBONAMENTO");
        cmd.Parameters.AddWithValue("@codUtente", codUtente);

        CONNESSIONE c = new CONNESSIONE();
        DataTable dt = c.EseguiSelect(cmd);

        return dt.Rows.Count > 0;

    }
    public bool Login()
    {
        SqlCommand cmd = new SqlCommand("UTENTI_LOGIN");
        cmd.Parameters.AddWithValue("@usr", usr);
        cmd.Parameters.AddWithValue("@pwd", pwd);

        CONNESSIONE c = new CONNESSIONE();
        DataTable dt = c.EseguiSelect(cmd);

        return dt.Rows.Count > 0;
    }
    public DataTable Select()
    {
        SqlCommand cmd = new SqlCommand("UTENTI_SELECTALL");
        CONNESSIONE C = new CONNESSIONE();

        return C.EseguiSelect(cmd);
    }
    public DataTable SelectOne()
    {
        SqlCommand cmd = new SqlCommand("UTENTI_SELECTONE");
        cmd.Parameters.AddWithValue("@codUtente", codUtente);

        CONNESSIONE C = new CONNESSIONE();

        return C.EseguiSelect(cmd);
    }

    public string RecuperaTipoUtente()
    {
        SqlCommand cmd = new SqlCommand("UTENTI_GETUSERTYPE");
        cmd.Parameters.AddWithValue("@usr", usr);

        CONNESSIONE conn = new CONNESSIONE();
        DataTable dt = conn.EseguiSelect(cmd);

        return dt.Rows[0]["TipoUtente"].ToString();
    }

    public string RecuperaCodicePersonale()
    {
        SqlCommand cmd = new SqlCommand("UTENTI_GETUSERTYPE");
        cmd.Parameters.AddWithValue("@usr", usr);

        CONNESSIONE conn = new CONNESSIONE();
        DataTable dt = conn.EseguiSelect(cmd);

        return dt.Rows[0]["codUtente"].ToString();
    }
    public void Insert()
    {
        SqlCommand cmd = new SqlCommand("UTENTI_INSERT");
        cmd.Parameters.AddWithValue("@usr", usr);
        cmd.Parameters.AddWithValue("@pwd", pwd);

        CONNESSIONE conn = new CONNESSIONE();
        conn.EseguiCmd(cmd);
    }
    public void Iscritto()
    {
        SqlCommand cmd = new SqlCommand("UTENTI_ISCRITTI");
        cmd.Parameters.AddWithValue("@codUtente", codUtente);

        CONNESSIONE C = new CONNESSIONE();

        return C.EseguiSelect(cmd);
    }
}