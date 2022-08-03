<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListaVideo.aspx.cs" Inherits="ListaVideo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>AMAZZON Prime - Video</title>

    <%-- jQuery --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- CSS Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />

    <%-- js personale --%>
    <script src="js/ListaVideo.js"></script>

    <%-- css personale --%>
    <link href="css/ListaVideo.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

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
                        <a href="..." id="a1" runat="server">
                            <img src="#" class="d-block w-100" alt="#" id="i1" runat="server" /></a>
                    </div>
                    <div class="carousel-item">
                        <a href="..." id="a2" runat="server">
                            <img src="#" class="d-block w-100" alt="#" id="i2" runat="server" /></a>
                    </div>
                    <div class="carousel-item">
                        <a href="..." id="a3" runat="server">
                            <img src="#" class="d-block w-100" alt="#" id="i3" runat="server" /></a>
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

        <div id="content">
            <%--verrà riempito con i riquadri di tutti i film--%>
        </div>
    </form>

    <!-- JavaScript Bundle with Popper (Bootstrap) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>
