<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="total.aspx.cs" Inherits="WebApplication1.total" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

    
     <link rel="stylesheet" type="text/css" media="screen" href="css/style.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/slider.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/emp.css">

<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Total</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 193px;
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
                        <h2>Revenu Mensuel</h2>
                        
                    </div>
                </div>
            </div>
        </div>
          </div>


        <div>

            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <!-----   Mois------->

                    <td class="auto-style3"> &nbsp;Mois :
          <asp:DropDownList ID="DropDownList1" runat="server" CssClass="droplist" BackColor="Black" ForeColor="White" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
              <asp:ListItem>1</asp:ListItem>
              <asp:ListItem>2</asp:ListItem>
              <asp:ListItem>3</asp:ListItem>
              <asp:ListItem>4</asp:ListItem>
              <asp:ListItem>5</asp:ListItem>
              <asp:ListItem>6</asp:ListItem>
              <asp:ListItem>7</asp:ListItem>
              <asp:ListItem>8</asp:ListItem>
              <asp:ListItem>9</asp:ListItem>
              <asp:ListItem Value="10">10</asp:ListItem>
              <asp:ListItem>11</asp:ListItem>
              <asp:ListItem>12</asp:ListItem>
          </asp:DropDownList>
                    &nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                       <!-----   Commande employe factures reception------>

                    <td class="auto-style3"><h3>Commande
                        <asp:Label ID="Label1" runat="server" ForeColor="Lime" Text="+$"></asp:Label>
                        </h3></td>
                    <td><h3>Employés
                        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="-$"></asp:Label>
                        </h3></td>
                    <td><h3>Factures
                        <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="-$"></asp:Label>
                        </h3></td>
                    <td><h3>Réception
                        <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="-$"></asp:Label>
                        </h3></td>
                </tr>
                <tr>
                    <td class="auto-style3">
          <asp:TextBox ID="txtcommande" runat="server" CssClass="textbox2"></asp:TextBox></td>
                    <td>
          <asp:TextBox ID="txtemp" runat="server" CssClass="textbox2"></asp:TextBox></td>
                    <td>
          <asp:TextBox ID="txtfactures" runat="server" CssClass="textbox2"></asp:TextBox></td>
                    <td>
          <asp:TextBox ID="txtreception" runat="server" CssClass="textbox2"></asp:TextBox></td>
                </tr>
                <tr>
                      <!-----  total------->

                    <td class="auto-style3"><h3>Total
                        </h3></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>

                    <td class="auto-style3">
          <asp:TextBox ID="txttotal" runat="server" CssClass="textbox2"></asp:TextBox></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                      <!-----   save ------->

                    <td class="auto-style3">
         <asp:Button ID="btsave" runat="server" Text="sauvegarder" CssClass="btns" Width="199px" OnClick="btsave_Click" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                  <!-----   afficher tout ------> 

            </table>

        </div>
        
           <!--==========================AFFICHER LES Moise========================-->
        
      <div class="brand_color">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>Mois</h2>
                        
                    </div>
                </div>
            </div>
        </div>
          </div>

        
                 <br />

        
                 <asp:Button ID="btafficher" runat="server" Text="Aficher tout Les  Mois" CssClass="btns" Width="313px" OnClick="btafficher_Click" />
                 
        
                        <br />
              
                        <asp:Panel ID="Panel1" runat="server" Visible="False">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <br />
                                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CssClass="auto-style3" ForeColor="Black" GridLines="Vertical" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" ShowFooter="True" Width="566px">
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
                                    <asp:Button ID="btsuprimer" runat="server" CssClass="btns" OnClick="btsuprimer_Click" Text="Suprimer tout les élément " Width="358px" />
                                    <br />
                                </ContentTemplate>
                            </asp:UpdatePanel>
          <br />
                                   <br />
                        </asp:Panel>
           
 
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
