<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employes.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

     <link rel="stylesheet" type="text/css" media="screen" href="css/style.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/slider.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/emp.css">

<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Employes</title>
    <style type="text/css">
 
        .auto-style3 {
           
   
        
    }
        .auto-style6 {
            text-align: center;
            background: #2098f5;
            font-size: 20px;
            line-height: 24px;
            color: #fff;
            display: inline-block;
            padding: 5px 23px 5px 23px;
            text-decoration: none;
            margin: 5px 10px 0 0px;
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
                        <h2>Mes Employés</h2>
                        
                    </div>
                </div>
            </div>
        </div>
          </div>

           <!--==========================AFFICHER EMPLYES=============================-->
        <div class ="afficher_emp">
            <div>

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            </div>
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
        </div>
             <!--===================grid view=========================-->

        
          <br />

       


         
   
        


           <!--===================================================================================================-->
         
        
        <div>

 
 </div>
         <!--==========================AJOUTER============================-->

      <div class="brand_color">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>Ajouter Nouveau Employe</h2>
                        

                        
                    </div>
                </div>
            </div>
        </div>
          </div>

        <div class="div2">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <br />
                    <table>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Cin</td>
                            <td>
                                <asp:TextBox ID="txtcin" runat="server" CssClass="textbox2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                Nom
                                </label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtnom" runat="server" CssClass="textbox2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                Prenom
                                </label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtprenom" runat="server" CssClass="textbox2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                Adresse
                                </label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtadresse" runat="server" CssClass="textbox2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                Tele
                                </label>
                            </td>
                            <td>
                                <asp:TextBox ID="txttele" runat="server" CssClass="textbox2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Travau</td>
                            <td>
                                <asp:TextBox ID="txttravau" runat="server" CssClass="textbox2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                Date_dep
                                </label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtdate_dep" runat="server" CssClass="textbox2" TextMode="Date"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>S<label>alaire
                                </label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtsalaire" runat="server" CssClass="textbox2"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Button ID="Button2" runat="server" CssClass="auto-style6" OnClick="Button2_Click" Text="Nouveau " Width="140px" />
                    </ContentTemplate>
            </asp:UpdatePanel>
                       <asp:Button ID="Button1" runat="server" CssClass="btns" OnClick="Button1_Click" Text="Ajouter" />
            <asp:Label ID="lb1" runat="server" Text="*"></asp:Label>
             
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
