<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="factures.aspx.cs" Inherits="WebApplication1.factures" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

       <link rel="stylesheet" type="text/css" media="screen" href="css/style.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/slider.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/emp.css">

<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>factures</title>
    <style type="text/css">
        .auto-style1 {
            width:100%;
           
            margin-top :20px;
        }
        .auto-style2 {
            width: 96px;
        }
        .auto-style3 {
            margin-right: 0px;
        }
     
        </style>
</head>
<body>
    
        <form id="form1" runat="server">
    <div>
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
         <asp:HyperLink ID="HyperLink4emp" runat="server"  NavigateUrl="~/Employes.aspx">Employés</asp:HyperLink>
         <asp:HyperLink ID="HyperLink5fact" runat="server"  NavigateUrl="~/factures.aspx">Factures</asp:HyperLink>
         <asp:HyperLink ID="HyperLink6recep" runat="server"  NavigateUrl="~/reception.aspx">Réception</asp:HyperLink>
         <asp:HyperLink ID="HyperLink7total" runat="server"  NavigateUrl="~/total.aspx">Total</asp:HyperLink>
        </div>

      </div>
    </header>
           <!--==============================content================================-->
    <section id="content_acc">
 
  
         <!--==========================AFFICHER LES FACTURES========================-->
        
      <div class="brand_color">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>Factures</h2>
                        
                    </div>
                </div>
            </div>
        </div>
          </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
     
                       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
            <table align="center" class="auto-style1" >
            

                <tr>
                    <td>     
                        <br />
                        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CssClass="auto-style3" ForeColor="Black" GridLines="Vertical" ShowFooter="True" Width="566px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:CommandField ButtonType="Button" HeaderText="select" ShowSelectButton="True">
                                <ControlStyle BackColor="#2098F5" ForeColor="White" />
                                </asp:CommandField>
                                <asp:CommandField ButtonType="Button" HeaderText="suprimer" ShowDeleteButton="True">
                                <ControlStyle BackColor="#2098F5" ForeColor="White" />
                                </asp:CommandField>
                                <asp:CommandField ButtonType="Button" HeaderText="modifier" ShowEditButton="True">
                                <ControlStyle BackColor="#2098F5" ForeColor="White" />
                                </asp:CommandField>
                            </Columns>
                            <FooterStyle BackColor="#333333" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                            <PagerStyle BackColor="#666666" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#2098F5" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="Gray" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
          <br />
                        <asp:Button ID="btsuprimer_tout" runat="server" CssClass="btns" Text="Suprimer tous Les éléments" Width="351px" OnClick="btsuprimer_tout_Click" OnClientClick="return confirm('voulez vous supeimer')" />
          <br /></td>
                </tr>
              
            </table>
                        
                    </ContentTemplate>
                </asp:UpdatePanel>


               <!--=========================AJOUTER LES FACTURES========================-->

      <div class="brand_color">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>Ajouter nouveau facture</h2>
                        
                    </div>
                </div>
            </div>
        </div>
          </div>

        <div class="div2">
        
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                        <table>
                 <tr>
      <td class="auto-style2">&nbsp;</td>
      <td>
          &nbsp;</td>
    </tr>
    <tr>
      <td class="auto-style2">Libelle</td>
      <td><asp:TextBox ID="txtlibelle" runat="server" CssClass="textbox2"></asp:TextBox></td>
    </tr>
    <tr>
      <td class="auto-style2">Date</td>
      <td><asp:TextBox ID="txtdate" runat="server" CssClass="textbox2" TextMode="Date"></asp:TextBox></td>
    </tr>
    <tr>
      <td class="auto-style2">Description</td>
      <td><asp:TextBox ID="txtdescription" runat="server" CssClass="textbox2"></asp:TextBox></td>
    </tr>
    <tr>
      <td class="auto-style2">Prix</td>
      <td><asp:TextBox ID="txtprix" runat="server" CssClass="textbox2" ToolTip="dh"></asp:TextBox></td>
    </tr>
    <tr>
      <td class="auto-style2">Mois</td>
      <td>
          <asp:DropDownList ID="DropDownListmois" runat="server" CssClass="droplist" BackColor="Black" ForeColor="White">
              <asp:ListItem>1</asp:ListItem>
              <asp:ListItem>2</asp:ListItem>
              <asp:ListItem>3</asp:ListItem>
              <asp:ListItem>4</asp:ListItem>
              <asp:ListItem>5</asp:ListItem>
              <asp:ListItem>6</asp:ListItem>
              <asp:ListItem>7</asp:ListItem>
              <asp:ListItem>8</asp:ListItem>
              <asp:ListItem>9</asp:ListItem>
              <asp:ListItem Value="A">10</asp:ListItem>
              <asp:ListItem>11</asp:ListItem>
              <asp:ListItem>12</asp:ListItem>
          </asp:DropDownList>
                    </td>
    </tr>
        
  </table>
            <br />

                     <asp:Button ID="btneveau" runat="server" CssClass="btns" Text="Neveau" OnClick="btneveau_Click1"  />   
            <br />
                </ContentTemplate>
            </asp:UpdatePanel>
           
         <asp:Button ID="btajouter" runat="server" Text="Ajouter" CssClass="btns" OnClick="btajouter_Click1"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
