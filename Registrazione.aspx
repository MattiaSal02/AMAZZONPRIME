﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registrazione.aspx.cs" Inherits="Registrazione" %>

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
            <p>Inserisci qui i tuoi dati per Registrarti!</p>
            <table>
                <tr>
                    <td>User:</td>
                    <td>
                        <asp:TextBox ID="txtUserRegistrazione" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>Password:</td>
                    <td>
                        <asp:TextBox ID="txtPasswordRegistrazione" runat="server"></asp:TextBox>
                    </td>
                     </tr>
                <tr>
                    <td>
                        <a href="Login.aspx">login</a>
                    </td>
                    <td>
                        <asp:Button ID="btnRegistrazione" runat="server" Text="Registrati" OnClick="btnRegistrazione_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <!-- JavaScript Bundle with Popper -->

</body>
</html>