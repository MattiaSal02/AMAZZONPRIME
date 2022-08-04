<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ListaVideo.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>AMAZZON Prime - Video</title>

    <%-- jQuery --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <%-- js personale --%>
    <script src="js/ListaVideo.js"></script>

    <%-- css personale --%>
    <link href="css/ListaVideo.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="carousel">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <%-- Le immagini saranno selezionate casualmente dal DB, e verrà loro assegnato un src e alt --%>
                    <div class="carousel-item active">
                            <img src="#" class="d-block" alt="#" id="i1" runat="server" />
                    </div>
                    <div class="carousel-item">
                            <img src="#" class="d-block" alt="#" id="i2" runat="server" />
                    </div>
                    <div class="carousel-item">
                            <img src="#" class="d-block" alt="#" id="i3" runat="server" />
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <div id="content" class="flex-md row justify-content-center">
            <%--verrà riempito con i riquadri di tutti i film--%>
        </div>
</asp:Content>

