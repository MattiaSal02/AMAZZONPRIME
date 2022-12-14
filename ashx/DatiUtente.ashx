<%@ WebHandler Language="C#" Class="DatiUtente" %>

using System;
using System.Web;

public class DatiUtente : IHttpHandler, System.Web.SessionState.IReadOnlySessionState
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        if (context.Session["CodUtente"] == null)
        {
            context.Response.Write("NESSUNO");
            return;
        }

        int codUtente = int.Parse(context.Session["CodUtente"].ToString());
        UTENTI u = new UTENTI();
        u.codUtente = codUtente;
        string risposta = u.SelectOne().Rows[0]["abbonamento"].ToString();
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