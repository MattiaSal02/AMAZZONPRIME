<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registrazione.aspx.cs" Inherits="Registrazione" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   
<title></title>
    <!-- CSS only --><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

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
    <!-- JavaScript Bundle with Popper --><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

</body>
</html>
