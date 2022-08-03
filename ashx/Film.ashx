<%@ WebHandler Language="C#" Class="Film" %>

using System;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Xml;
using System.Xml.Linq;
using System.Linq;
using System.Collections.Generic;
using System.IO;

public class Film : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        XDocument doc = DataTableToXDocument(new VIDEO().SelectAll(new System.Data.SqlClient.SqlCommand()));
                if (doc == null) return;

                // Preparo la risposta...
                context.Response.ContentType = "text/xml";
                context.Response.ContentEncoding = System.Text.Encoding.UTF8;
                //context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                context.Response.Expires = -1;
                context.Response.Cache.SetAllowResponseInBrowserHistory(true);

                // ... e la invio!
                doc.Save(context.Response.Output);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

    XDocument DataTableToXDocument(DataTable dt)
    {
        dt.TableName = "Video";
        MemoryStream ms = new MemoryStream();
        dt.WriteXml(ms);
        ms.Position = 0;

        XmlReader xr = XmlReader.Create(ms);
        xr.MoveToContent();
        if (xr.IsEmptyElement) { xr.Read(); return null; }

        return XDocument.Load(xr);
    }

}