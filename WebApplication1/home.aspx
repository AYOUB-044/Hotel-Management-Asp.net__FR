<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

    
    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/slider.css">

<head runat="server">



    <title>home</title>
    <style type="text/css">
        .auto-style1 {
            width: 242px;
        }
        .auto-style2 {
            width: 255px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <div class="main">

    <!--==============================header=================================-->
    <header>
      <h1><a href="home.aspx"><img src="images/logo.jpg" alt=""></a></h1>
      <div>
        <div class="div"></div>
      
<!-----  slideshow  ------->
        <div class="fling-minislide">
          <img src="images/slide2.jpg" alt="Slide 4" />
          <img src="images/slide1.jpg" alt="Slide 3" />
          <img src="images/slide2.jpg" alt="Slide 2" />
          <img src="images/slide1.jpg" alt="Slide 1"  />
        </div>


<!-----   menu (naviagtion) ------->
        <div class="topnav">
           <asp:HyperLink ID="HyperLink1Accueil" runat="server" NavigateUrl="~/home.aspx">Accueil</asp:HyperLink>
          <asp:HyperLink ID="HyperLink2Login" runat="server" NavigateUrl="~/login.aspx">Login</asp:HyperLink>
             
        </div>

      </div>
    </header>


    <!--==============================content================================-->
    <section id="content">

      <div >

        <div >

          <h2 >Bienvenu</h2>

          <p >Bonjour dans votre hotel de 3 étoiles,il ya dans cette hotele 20 chmabres avec des wifi et television
            <br /> 1 Le site Web utilisé par le directeur et la réception .
            <br /> 2 Sur ce site Web, vous pouvez voir la pièce fermée et la modifier . <br /> 3 Vous pouvez ajouter les commandes des clients et imprimer un petite Facture . <br /> 4 Faire des mises à jour sur vos employés et factures , après cela vous calculez le total de Revenus et factures par mois </p>
          <br />
        
            <!-----   images ------->


          <h2 >Photos de l'hôtel.</h2>
          <div class="wrap block-1">
          </div>
        </div>

        <div  class="tab1">
        <table>
          <tr  style="text-align: left;">
            <th class="auto-style2">
              <div class="hotel"> <img src="images/page1-img1.jpg" alt="" class="img-border"> </div>
            </th>
            <th class="auto-style1">
              <div class="piscine"> <img src="images/page1-img2.jpg" alt="" class="img-border"> </div>
            </th>
            <th>
              <div class="restaur"> <img src="images/page1-img3.jpg" alt="" class="img-border"> </div>
            </th>
          </tr>
          <tr>
            <td class="auto-style2">
              <h3>Hôtel</h3>
            </td>
            <td class="auto-style1">
              <h3>Piscine</h3>
            </td>
            <td>
              <h3>Restaurant</h3>
            </td>
           
          </tr>
          <tr>
            <td class="auto-style2">
              <p>  Voici à quoi ressemble la chambre,<br/> 
                très agréable et calme, </p>
            </td>
            <td class="auto-style1">
              <p>Voici à quoi ressemble la piscine,<br/>
                il est très grande </p>
            </td>
            <td>
              <p>Voici à quoi ressemble le restaurant,<br/>
                 la nourriture est très délicieuse.</p>
            </td>
          </tr>

        </table>
      </div>

          <!-----   information) ------->


        <div class="tab2">
      
            <form id="form_1"  action="#">
              <h2>Informations sur l'hôtel</h2>

              <table>
                <tr>

                </tr>
                <tr>
                  <td><label>Nombre des chambres</label> </td>
                  <td> <input type="text" name="" value="10" disabled="true">

                  </td>
                </tr>
                <td> <label>Etoils</label></td>
                <td><input type="text" name="" value="***" disabled="true"></td><br>
                </tr>
                <tr>
                  <td><label>Patron</label></td>
                  <td><input type="text" name="" value="Driss " disabled="true"></td>
                </tr>

              </table>
               </div>
            </form>

    <!-----   localisation ) ------->


            <div class="tab3">
            <h2 class="p3">Localisation</h2>
            <img src="images/page1-img4.png" alt="">
            <div class="lists">
              
               <a href="#"  class="lien">Maroc  / Sefrou / Trik fés</a>
               
            
            </div>
            </div>


        
     
      </div>
    </section>
  </div>

  <!--==============================footer=================================-->
  <footer>
    <p> Créé par Ahnouche Ayoub</p>
       <p> Projet de fin d'année OFPPT</p>
   
  </footer>

    </form>
</body>
</html>
