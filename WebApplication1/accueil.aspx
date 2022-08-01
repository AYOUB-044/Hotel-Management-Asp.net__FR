<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="accueil.aspx.cs" Inherits="WebApplication1.acceuil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

    
       <link rel="stylesheet" type="text/css" media="screen" href="css/style.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/slider.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/emp.css">

<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>accueil</title>
    <style type="text/css">
        .auto-style1 {
            width: 400px;
            border: 2px solid #333333;
            text-align:center;
            margin-top:20px;
            padding-top:10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <div class="main">
     <!--==============================header=================================-->
    <header>
      <h1><a href="accueil.aspx"><img src="images/logo.jpg" alt=""></a></h1>
      <div>
         <div class="social-icons"> <span>Deconcter:</span>  <a href="login.aspx" class="icon-1"></a> </div>
       <!--  <div class="social-icons"> </div> -->
<!-----  slideshow  ------->
        <div class="fling-minislide">
          <img src="images/slide2.jpg" alt="Slide 4" />
          <img src="images/slide1.jpg" alt="Slide 3" />
          <img src="images/slide2.jpg" alt="Slide 2" />
          <img src="images/slide1.jpg" alt="Slide 1"  />
        </div>


<!-----   menu (naviagtion) ------->
        <div class="topnav">
         <asp:HyperLink ID="accueil" runat="server" NavigateUrl="~/accueil.aspx" >Accueil</asp:HyperLink>
         <asp:HyperLink ID="HyperLink2chambre" runat="server" NavigateUrl="~/chambres.aspx">Chambres</asp:HyperLink>
         <asp:HyperLink ID="HyperLink3comande" runat="server"  NavigateUrl="~/commande.aspx" >Commande</asp:HyperLink>
         <asp:HyperLink ID="HyperLink4emp" runat="server"  NavigateUrl="~/Employes.aspx">Employes</asp:HyperLink>
         <asp:HyperLink ID="HyperLink5fact" runat="server"  NavigateUrl="~/factures.aspx">Factures</asp:HyperLink>
         <asp:HyperLink ID="HyperLink6recep" runat="server"  NavigateUrl="~/reception.aspx">Réception</asp:HyperLink>
         <asp:HyperLink ID="HyperLink7total" runat="server"  NavigateUrl="~/total.aspx">Total</asp:HyperLink>
        </div>

      </div>
    </header>
           <!--==============================content================================-->

            <section id="content_acc">
 
      <div class="brand_color">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>Bienvenue</h2>
                        
                    </div>
                </div>
            </div>
        </div>
          </div>

        <div>



            <table align="center" class="auto-style1">
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl="~/images/A.jpg" Width="200px" />
                        <br />
                        <asp:Label ID="labelcin" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="labelnom" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Labelprenom" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Labeltele" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Labelemail" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Labeladress" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Labeldate_dep" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Labelsalaire" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Labeltraveau" runat="server" Text="Label"></asp:Label>
                        <br />
                    </td>
                </tr>
            </table>



 </div>


 
    </section>
  </div>

         <!--==============================footer=================================-->
  <footer>
    <p>OFPPT </p>
  </footer>

    </div>
    </form>
</body>
</html>
