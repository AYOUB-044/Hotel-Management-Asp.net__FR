<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reception.aspx.cs" Inherits="WebApplication1.reception" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    
     <link rel="stylesheet" type="text/css" media="screen" href="css/style.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/slider.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/emp.css">

<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>reception</title>
    <style type="text/css">
        .auto-style2 {
            width: 87px;
        }
        .auto-style3 {
            width: 100%;
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
 
      <div class="brand_color">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>Réception</h2>
                        
                    </div>
                </div>
            </div>
        </div>
          </div>



         <!--=========================AFFICHER============================-->
        <div class ="afficher_recep">
           
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
           
        </div>
             <!--===================grid view=========================-->


                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CssClass="auto-style3" ForeColor="Black" GridLines="Vertical" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ShowFooter="True" Width="566px">
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
                            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
          <br />

       

           <!--==============================AJOUTER==============================-->
      <div class="brand_color">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>Ajouter Nouveau Réception</h2>
                        
                    </div>
                </div>
            </div>
        </div>
          </div>

        <div class="div2">
            <table>
                 <tr>
      <td class="auto-style2">image</td>
      <td>
          <asp:FileUpload ID="FileUpload1" runat="server" BackColor="Black" Width="220px" />
                     </td>
    </tr>
    <tr>
      <td class="auto-style2">Cin</td>
      <td><asp:TextBox ID="txtcin" runat="server" CssClass="textbox2"></asp:TextBox></td>
    </tr>
    <tr>
      <td class="auto-style2">Nom</td>
      <td><asp:TextBox ID="txtnom" runat="server" CssClass="textbox2"></asp:TextBox></td>
    </tr>
    <tr>
      <td class="auto-style2"><label>Prenom  </label>
        </td>
      <td><asp:TextBox ID="txtprenom" runat="server" CssClass="textbox2"></asp:TextBox></td>
    </tr>
    <tr>
      <td class="auto-style2"><label>Adresse  </label>
        </td>
      <td><asp:TextBox ID="txtadresse" runat="server" CssClass="textbox2"></asp:TextBox></td>
    </tr>
    <tr>
      <td class="auto-style2"><label>Tele  </label>
        </td>
      <td><asp:TextBox ID="txttele" runat="server" CssClass="textbox2"></asp:TextBox></td>
    </tr>
    <tr>
      <td class="auto-style2"><label>Date_dep</label></td>
      <td><asp:TextBox ID="txtdate_dep" runat="server" CssClass="textbox2" TextMode="Date"></asp:TextBox></td>
    </tr>
    <tr>
      <td class="auto-style2">S<label>alaire </label></td>
      <td><asp:TextBox ID="txtsalaire" runat="server" CssClass="textbox2"></asp:TextBox></td>
    </tr>
    <tr>
      <td class="auto-style2">Travau</td>
      <td><asp:TextBox ID="txttravau" runat="server" CssClass="textbox2"></asp:TextBox></td>
    </tr>
    <tr>
      <td class="auto-style2">Email</td>
      <td><asp:TextBox ID="txtemail1" runat="server" CssClass="textbox2"></asp:TextBox></td>
    </tr>
    <tr>
      <td class="auto-style2">Mod_pas</td>
      <td><asp:TextBox ID="txtpass1" runat="server" CssClass="textbox2"></asp:TextBox></td>
    </tr>

  </table>
         <asp:Button ID="btajouter" runat="server" Text="Ajouter" CssClass="btns" OnClick="btajouter_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btneau" runat="server" CssClass="btns" Text="Neveau" OnClick="btneau_Click" />   
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
