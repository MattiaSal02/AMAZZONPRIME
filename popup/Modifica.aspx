<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Modifica.aspx.cs" Inherits="popup_Modifica" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="mod" runat="server">
             <table>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Titolo"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Sinossi"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Immagine"></asp:Label>
                    </td>                    
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtTitolo" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSinossi" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>

                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Link"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Incluso"></asp:Label>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtLink" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="cbxAbbonamento" runat="server" Text="Incluso" />
                    </td>
                    <td>
                        <asp:Button ID="btnModifica" runat="server" Text="Modifica" OnClick="btnModifica_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
