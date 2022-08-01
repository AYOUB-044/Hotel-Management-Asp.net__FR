<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="commande.aspx.cs" Inherits="WebApplication1.commande" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
      <link rel="stylesheet" type="text/css" media="screen" href="css/style.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/slider.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/emp.css">

<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Commande</title>
    <style type="text/css">
        
        .div3{
  position: absolute;
  width:400px;
  top: 675px;
  left: 870px;
  padding:10px 10px  10px  10px ;
  border:#fff 4px solid;
}
       
        .auto-style2 {
            width: 200px;
        }
        .auto-style4 {
            width: 200px;
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
                        <h2>Commande</h2>
                        
                    </div>
                </div>
            </div>
        </div>
          </div>

             <!--=======================imprimer===========================-->
        <div class="div3">
      
            <asp:Label ID="Label1" runat="server" Text="client"></asp:Label>
            <br />
            <table  class="auto-style1">
                <tr>
                    <td class="auto-style2">Nom</td>
                    <td class="auto-style4">
                        <asp:Label ID="lbnom" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Tele</td>
                    <td class="auto-style4">
                        <asp:Label ID="lbtele" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Date_dep</td>
                    <td class="auto-style4">
                        <asp:Label ID="lbdate_dep" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Date_fin</td>
                    <td class="auto-style4">
                        <asp:Label ID="lbdate_fin" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Chambre</td>
                    <td class="auto-style4">
                        <asp:Label ID="lbchambre" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Prix</td>
                    <td class="auto-style4">
                        <asp:Label ID="lbprix" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                  
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="btimprimer" runat="server" Text="imprimer" class="btns" OnClick="btimprimer_Click"/>
                    </td>
                    <td class="auto-style4"></td>
                </tr>
            </table>
            <br />
     
            </div>

         <!--========================ajouter=============================-->

        <div class="div2">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                 <asp:UpdatePanel ID="UpdatePanel3" runat="server">
              <ContentTemplate>

            <table style="width:40%;">
                 <tr>
      <td>&nbsp;</td>
      <td>
          
                     </td>
    </tr>
    <tr>
      <td>Cin</td>
      <td><asp:TextBox ID="txtcin" runat="server" CssClass="textbox2"></asp:TextBox></td>
    </tr>
    <tr>
      <td>Nom</td>
      <td><asp:TextBox ID="txtnom" runat="server" CssClass="textbox2"></asp:TextBox></td>
    </tr>
    <tr>
      <td>Tele</td>
      <td>
          <asp:TextBox ID="txttele" runat="server" CssClass="textbox2"></asp:TextBox>
        </td>
    </tr>
    <tr>
      <td>Chambre</td>
      <td>
         

          <asp:DropDownList ID="DropDownListchmabre" runat="server" CssClass="droplist" BackColor="Black" ForeColor="White" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="numero" DataValueField="numero" >
              <asp:ListItem>0</asp:ListItem>
          </asp:DropDownList>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=MOB\SQLEXPRESS;Initial Catalog=gestion_hotele;Integrated Security=True" SelectCommand="SELECT [numero] FROM [chambre] WHERE ([open_close] = @open_close2)">
              <SelectParameters>
                  <asp:Parameter DefaultValue="open" Name="open_close2" Type="String" />
              </SelectParameters>
          </asp:SqlDataSource>
        </td>

         

    </tr>
    <tr>
      <td>jours</td>
      <td>
          <asp:TextBox ID="txtday" runat="server" CssClass="textbox2" TextMode="Number"></asp:TextBox>
        </td>
    </tr>
    <tr>
      <td>Date_dep</td>
      <td><asp:TextBox ID="txtdate_dep" runat="server" CssClass="textbox2" TextMode="Date"></asp:TextBox></td>
    </tr>
    <tr>
      <td>Date_fin</td>
      <td>
          <asp:TextBox ID="txtdate_fin" runat="server" CssClass="textbox2" TextMode="Date"></asp:TextBox>
        </td>
    </tr>
    <tr>
      <td>Mois</td>
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

    <tr>
      <td>Prix</td>
      <td>
     

          <asp:TextBox ID="txtprix" runat="server" CssClass="textbox2"></asp:TextBox>
       
           </td>  
        
    </tr>
  </table>

         <asp:Button ID="btcalculer" runat="server" Text="Calculer" CssClass="btns" OnClick="btcalculer_Click" />
                  <asp:Label ID="lbcal" runat="server" Text="*"></asp:Label>
                 
                  <asp:Label ID="Label2" runat="server" Text="Calculer (Prix =  chambre + jours )"></asp:Label>
                  <br />
            <asp:Button ID="btneveau" runat="server" CssClass="btns" Text="Neveau" OnClick="btneveau_Click" />   
                  <br />
        
  </ContentTemplate>
              <Triggers>
                  
                  <asp:AsyncPostBackTrigger ControlID="btneveau" EventName="Click" />
              </Triggers>
          </asp:UpdatePanel>
             
                    <asp:Button ID="btajouter" runat="server" Text="Ajouter" CssClass="btns" OnClick="btajouter_Click" />
                  
            <asp:Label ID="lbaj" runat="server" Text="*"></asp:Label>
        </div>
 
           <!--==========================AFFICHER LES commande========================-->
        
      <div class="brand_color">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>Comandes</h2>
                        
                    </div>
                </div>
            </div>
        </div>
          </div>

             <div class="afficher_comm">
                 
                 <asp:Button ID="btaffichertout" runat="server" Text="Aficher tout Les Commande" CssClass="btns" Width="313px" OnClick="btaffichertout_Click" style="height: 45px" />
                 <br /> <br />

                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                     <ContentTemplate>

                         <br />
                         <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                             <ProgressTemplate>
                                 <asp:Image ID="Image1" runat="server" Height="98px" ImageUrl="~/images/loading.gif" Width="109px" />
                                 <br />
                             </ProgressTemplate>
                         </asp:UpdateProgress>
                        <asp:Panel ID="Panel1" runat="server" Visible="False">

                                   <asp:GridView ID="GridView2" runat="server" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="566px" ShowFooter="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CssClass="auto-style3" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowDeleting="GridView2_RowDeleting" OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating">
              <AlternatingRowStyle BackColor="#CCCCCC" />
              <Columns>
                  <asp:CommandField ButtonType="Button" ShowSelectButton="True" HeaderText="select">
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
              <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#666666" />
              <SelectedRowStyle BackColor="#2098F5" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="Gray" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#383838" />
          </asp:GridView>
                                   <br />
                                   <asp:Button ID="btsuprimer_tout" runat="server" CssClass="btns" OnClick="btsuprimer_tout_Click" OnClientClick="return confirm('voulez vous supeimer')" Text="Suprimer tous Les Element" Width="351px" />
          <br />
                        </asp:Panel>

                 </ContentTemplate>
                     <Triggers>
                         <asp:AsyncPostBackTrigger ControlID="btaffichertout" EventName="Click" />
                     </Triggers>
                 </asp:UpdatePanel>
                
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
