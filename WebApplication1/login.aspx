<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.login" %>

<!DOCTYPE html>

    
    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css">
   <link rel="stylesheet" type="text/css" media="screen" href="css/slider.css">
   <link rel="stylesheet" type="text/css" media="screen" href="css/login.css">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>login</title>
    </head>
<body>
    <form id="form1" runat="server">
      <div class="main">
    <!--==============================header=================================-->
    <header>
      <h1><a href="home.aspx"><img src="images/logo.jpg" alt=""></a></h1>
      <div>
        <div class="div"></div>
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
         <asp:HyperLink ID="HyperLink1Accueil" runat="server" NavigateUrl="~/home.aspx">Accueil</asp:HyperLink>
          <asp:HyperLink ID="HyperLink2Login" runat="server" NavigateUrl="~/login.aspx">Login</asp:HyperLink>
                     
        </div>

      </div>
    </header>


    <!--==============================content================================-->
    <section id="content">

      <div >

          <asp:ScriptManager ID="ScriptManager1" runat="server">
          </asp:ScriptManager>

        </div>

          <h2 >&nbsp;Login</h2>
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate>
                 <asp:RadioButton ID="RadioButtondirect" runat="server" AutoPostBack="True" GroupName="login" Text="dericteur" />
                 <asp:RadioButton ID="RadioButtonrecp" runat="server" AutoPostBack="True" GroupName="login" Text="reception" />
             </ContentTemplate>
        </asp:UpdatePanel>
         <!--=  ==  <form id="form" method="post" action="#">=========-->
       
              <br />
       
              <asp:Login ID="Login1" runat="server" Height="250px" TextLayout="TextOnTop" TitleText="" Width="541px" ForeColor="White" OnAuthenticate="Login1_Authenticate">
                  <LabelStyle CssClass="label" />
                  <LoginButtonStyle BorderStyle="None" CssClass="btns" />
                  <TextBoxStyle BackColor="#131313" CssClass="textbox" />
                  <TitleTextStyle ForeColor="#CC00FF" />
            </asp:Login>
            
           <!--= </form>=========-->
       


    </section>
  </div>

  <!--==============================footer=================================-->
  <footer>
        <p> Créé par Ahnouche Ayoub</p>
       <p> Projet de fin d'année ofppt</p>
  </footer>
    </form>
</body>
</html>
