<%@ WebHandler Language="C#" Class="DatiUtente" %>

using System;
using System.Web;

public class DatiUtente : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        if (context.Session["CodUtente"] == null)
        {
            context.Response.Write("NESSUNO");
            return;
        }

        int codUtente = (int)context.Session["CodUtente"];
        string risposta = new UTENTI.SelectOne(codUtente).Rows[0]["abbonamento"].ToString();
        context.Response.Write(risposta);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}