<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Video.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/base/jquery-ui.css" type="text/css" media="all" />
    <link rel="stylesheet" href="http://static.jquery.com/ui/css/demo-docs-theme/ui.theme.css" type="text/css" media="all" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/jquery-ui.min.js"></script>

    <script type="text/javascript">


        $(document).ready(function () {

            $('#popup').click(function () {

                //var url = this.href;
                var url = 'popup/Inserimento.aspx';
                var dialog = $('<iframe src="' + url + '" frameborder = "0"></iframe>').appendTo('body');


                //da pippo prendimi il dialog
                dialog.dialog({
                    modal: true,
                    title: 'Inserimento dati',
                    resizable: false,
                    width: '400px',
                    overlay: { opacity: 0.9, background: 'black' },
                    open: function (type, data) {
                        $(this).parent().appendTo('form');
                    }
                });
                return false;
            });
        });


        $(document).ready(function () {

            $('#popup2').click(function () {

                //var url = this.href;
                var url = 'popup/Modifica.aspx';
                var dialog = $('<iframe src="' + url + '" frameborder = "0"></iframe>').appendTo('body');


                //da pippo prendimi il dialog
                dialog.dialog({
                    modal: true,
                    title: 'Inserimento dati',
                    resizable: false,
                    width: '400px',
                    overlay: { opacity: 0.9, background: 'black' },
                    open: function (type, data) {
                        $(this).parent().appendTo('form');
                    }
                });
                return false;
            });
        });


        $(document).ready(function () {

            $('#popup3').click(function () {

                //var url = this.href;
                var url = 'popup/Eliminazione.aspx';
                var dialog = $('<iframe src="' + url + '" frameborder = "0"></iframe>').appendTo('body');


                //da pippo prendimi il dialog
                dialog.dialog({
                    modal: true,
                    title: 'Inserimento dati',
                    resizable: false,
                    width: '400px',
                    overlay: { opacity: 0.9, background: 'black' },
                    open: function (type, data) {
                        $(this).parent().appendTo('form');
                    }
                });
                return false;
            });
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <table>
            <tr>
                <td>
                    <input id="popup" type="button" value="Inserisci" />
                </td>
                <td>
                    <input id="popup2" type="button" value="Modifica" />
                </td>
                <td>
                    <input id="popup3" type="button" value="Elimina" />
                </td>
                <td>
                    <asp:Button ID="btnRicarica" runat="server" Text="Aggiorna" OnClick="btnRicarica_Click" />
                </td>
            </tr>
        </table>
        <asp:GridView ID="griglia" runat="server" DataKeyNames="codVideo" OnRowDataBound="griglia_RowDataBound1" OnSelectedIndexChanged="griglia_SelectedIndexChanged">
            <columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
            </columns>
        </asp:GridView>
        <br />
        <asp:Literal ID="lit" runat="server"></asp:Literal>
    </div>
</asp:Content>

