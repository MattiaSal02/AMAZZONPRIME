<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title></title>
    <link href="css/styleLogin-registrazione.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
    <div style="background-image: url('img/Prime1.jpg'); background-repeat: no-repeat; background-attachment: fixed; background-position: left;">
            <div class="wrapper fadeInDown">
                <div id="formContent">
                    <!-- Tabs Titles -->

                    <!-- Icon -->
                    <div class="fadeIn first">
                        <img src="img/img7.jpg" id="icon" alt="User Icon" />
                    </div>

                    <!-- Login Form -->
                    <div>
                        <asp:TextBox ID="txtUser" class="fadeIn second" runat="server" placeholder="user"></asp:TextBox>
                        <asp:TextBox ID="txtPassword" runat="server" placeholder="password" TextMode="Password" CssClass="fadeIn third"></asp:TextBox>
                        <asp:Button ID="btnLogin" class="fadeIn fourth" runat="server" Text="LogIn" OnClick="btnLogin_Click" />

                    </div>

                    <!-- link Regiistrazione -->
                    <div id="formFooter">
                        <a class="underlineHover" href="Registrazione.aspx">Registrati</a>
                    </div>

                </div>
            </div>
        </div>
   

</asp:Content>

