﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <!-- CSS only -->

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>Inserisci qui i tuoi dati per effettuare il Login!</p>
            <table>
                <tr>
                    <td>User:</td>
                    <td>
                        <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>Password:</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                     </tr>
                <tr>
                    <td>
                        <a href="Registrazione.aspx">Registrati</a>
                    </td>
                    <td>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <!-- JavaScript Bundle with Popper -->

</body>
</html>