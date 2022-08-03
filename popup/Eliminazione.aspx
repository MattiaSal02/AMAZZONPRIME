<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Eliminazione.aspx.cs" Inherits="popup_Eliminazione" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="mod" runat="server">
            <p>Sicuro di voler eliminare il record?</p>
            <asp:Button ID="btnElimina" runat="server" Text="Elimina" OnClick="btnElimina_Click" />
            <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
