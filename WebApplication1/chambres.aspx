<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chambres.aspx.cs" Inherits="WebApplication1.chambres" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/slider.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/chambres.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/emp.css">

<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>chambres</title>
    <style type="text/css">

     
        .auto-style3 {
            margin-right: 0px;
        }
     
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    

        <div class="main">
                <header>
    <!--==============================header=================================-->
   

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
                        <h2>Les Chambres</h2>
                    </div>
                </div>
            </div>
        </div>

    </div>

 <!--==============================CHAMBRES================================-->
    <div class="chambre1">
        <table>
          <h3>Chambre  1</h3>
          <tr>
            <td><label>Size    :</label> </td>
            <td> <input type="text" name="" value="30 ft" disabled="true">

            </td>
          </tr>
          <td> <label>Capacity    :</label></td>
          <td><input type="text" name="" value="1 pirsone" disabled="true"></td><br>
          </tr>
          <tr>
            <td><label>Services  :</label></td>
            <td><input type="text" name="" value="wifi,tv,piscine,restaurant" disabled="true"></td>
          </tr>
          <tr>
            <td><label>prix  :</label></td>
            <td><input type="text" name="" value="400$/day" disabled="true"></td>
          </tr>
          
        </table>
        <asp:Button ID="Button1" runat="server" Text="open" CssClass="open_close" BackColor="GreenYellow" Enabled="False" Font-Bold="True"/>
         </div>
    

         <div class="chambre2">
          <table>
            <h3>Chambre  2</h3>
            <tr>
              <td><label>Size    :</label> </td>
              <td> <input type="text" name="" value="30 ft" disabled="true">
  
              </td>
            </tr>
            <td> <label>Capacity    :</label></td>
            <td><input type="text" name="" value="1 pirsone" disabled="true"></td><br>
            </tr>
            <tr>
              <td><label>Services  :</label></td>
              <td><input type="text" name="" value="wifi,tv,piscine,restaurant" disabled="true"></td>
            </tr>
            <tr>
              <td><label>prix  :</label></td>
              <td><input type="text" name="" value="400$/day" disabled="true"></td>
            </tr>
            
          </table>
          <asp:Button ID="Button2" runat="server" Text="open" CssClass="open_close" BackColor="GreenYellow" Enabled="False" Font-Bold="True"/>
           </div>
           
    <div class="chambre3">
      <table>
        <h3>Chambre  3</h3>
        <tr>
          <td><label>Size    :</label> </td>
          <td> <input type="text" name="" value="30 ft" disabled="true">

          </td>
        </tr>
        <td> <label>Capacity    :</label></td>
        <td><input type="text" name="" value="1 pirsone" disabled="true"></td><br>
        </tr>
        <tr>
          <td><label>Services  :</label></td>
          <td><input type="text" name="" value="wifi,tv,piscine,restaurant" disabled="true"></td>
        </tr>
        <tr>
          <td><label>prix  :</label></td>
          <td><input type="text" name="" value="400$/day" disabled="true"></td>
        </tr>
        
      </table>
      <asp:Button ID="Button3" runat="server" Text="open" CssClass="open_close" BackColor="GreenYellow" Enabled="False" Font-Bold="True"/>
       </div>
       
    <div class="chambre4">
      <table>
        <h3>Chambre  4</h3>
        <tr>
          <td><label>Size    :</label> </td>
          <td> <input type="text" name="" value="50 ft" disabled="true">

          </td>
        </tr>
        <td> <label>Capacity    :</label></td>
        <td><input type="text" name="" value=2 pirsone" disabled="true"></td><br>
        </tr>
        <tr>
          <td><label>Services  :</label></td>
          <td><input type="text" name="" value="wifi,tv,piscine,restaurant " disabled="true"></td>
        </tr>
        <tr>
          <td><label>prix  :</label></td>
          <td><input type="text" name="" value="400$/day" disabled="true"></td>
        </tr>
        
      </table>
    <asp:Button ID="Button4" runat="server" Text="open" CssClass="open_close" BackColor="GreenYellow" Enabled="False" Font-Bold="True"/>
       </div>

      
       <div class="chambre5">
        <table>
          <h3>Chambre 5</h3>
          <tr>
            <td><label>Size    :</label> </td>
            <td> <input type="text" name="" value="50 ft" disabled="true">
  
            </td>
          </tr>
          <td> <label>Capacity    :</label></td>
          <td><input type="text" name="" value="2 pirsone" disabled="true"></td><br>
          </tr>
          <tr>
            <td><label>Services  :</label></td>
            <td><input type="text" name="" value="wifi,tv,piscine,restaurant" disabled="true"></td>
          </tr>
          <tr>
            <td><label>prix  :</label></td>
            <td><input type="text" name="" value="400$/day" disabled="true"></td>
          </tr>
          
        </table>
        <asp:Button ID="Button5" runat="server" Text="open" CssClass="open_close" BackColor="GreenYellow" Enabled="False" Font-Bold="True"/>
         </div>

      
         <div class="chambre6">
          <table>
            <h3>Chambre  6</h3>
            <tr>
              <td><label>Size    :</label> </td>
              <td> <input type="text" name="" value="50 ft" disabled="true">
    
              </td>
            </tr>
            <td> <label>Capacity    :</label></td>
            <td><input type="text" name="" value="2 pirsone" disabled="true"></td><br>
            </tr>
            <tr>
              <td><label>Services  :</label></td>
              <td><input type="text" name="" value="wifi,tv,piscine,restaurant" disabled="true"></td>
            </tr>
            <tr>
              <td><label>prix  :</label></td>
              <td><input type="text" name="" value="400$/day" disabled="true"></td>
            </tr>
            
          </table>
          <asp:Button ID="Button6" runat="server" Text="open" CssClass="open_close" BackColor="GreenYellow" Enabled="False" Font-Bold="True"/>
           </div>

      
         
      
             <div class="chambre7">
              <table>
                <h3>Chambre  7</h3>
                <tr>
                  <td><label>Size    :</label> </td>
                  <td> <input type="text" name="" value="200 ft" disabled="true">
        
                  </td>
                </tr>
                <td> <label>Capacity    :</label></td>
                <td><input type="text" name="" value="5 pirsone" disabled="true"></td><br>
                </tr>
                <tr>
                  <td><label>Services  :</label></td>
                  <td><input type="text" name="" value="wifi,tv,piscine,restaurant " disabled="true"></td>
                </tr>
                <tr>
                  <td><label>prix  :</label></td>
                  <td><input type="text" name="" value="600$/day" disabled="true"></td>
                </tr>
                
              </table>
        <asp:Button ID="Button7" runat="server" Text="open" CssClass="open_close" BackColor="GreenYellow" Enabled="False" Font-Bold="True"/>
               </div>

      
               <div class="chambre8">
                <table>
                  <h3>Chambre  8</h3>
                  <tr>
                    <td><label>Size    :</label> </td>
                    <td> <input type="text" name="" value="200 ft" disabled="true">
          
                    </td>
                  </tr>
                  <td> <label>Capacity    :</label></td>
                  <td><input type="text" name="" value="5 pirsone" disabled="true"></td><br>
                  </tr>
                  <tr>
                    <td><label>Services  :</label></td>
                    <td><input type="text" name="" value="wifi,tv,piscine,restaurant " disabled="true"></td>
                  </tr>
                  <tr>
                    <td><label>prix  :</label></td>
                    <td><input type="text" name="" value="600$/day" disabled="true"></td>
                  </tr>
                  
                </table>
                <asp:Button ID="Button8" runat="server" Text="open" CssClass="open_close" BackColor="GreenYellow" Enabled="False" Font-Bold="True"/>
                 </div>

                       
    <div class="chambre9">
      <table>
        <h3>Chambre  9</h3>
        <tr>
          <td><label>Size    :</label> </td>
          <td> <input type="text" name="" value="200 ft" disabled="true">

          </td>
        </tr>
        <td> <label>Capacity    :</label></td>
        <td><input type="text" name="" value="5 pirsone" disabled="true"></td><br>
        </tr>
        <tr>
          <td><label>Services  :</label></td>
          <td><input type="text" name="" value="wifi,tv,piscine,restaurant" disabled="true"></td>
        </tr>
        <tr>
          <td><label>prix  :</label></td>
          <td><input type="text" name="" value="600$/day" disabled="true"></td>
        </tr>
        
      </table>
     <asp:Button ID="Button9" runat="server" Text="open" CssClass="open_close" BackColor="GreenYellow" Enabled="False" Font-Bold="True"/>
       </div>

       <div class="chambre10">
        <table>
          <h3>Chambre  10</h3>
          <tr>
            <td><label>Size    :</label> </td>
            <td> <input type="text" name="" value="200 ft" disabled="true">
  
            </td>
          </tr>
          <td> <label>Capacity    :</label></td>
          <td><input type="text" name="" value="5 pirsone" disabled="true"></td><br>
          </tr>
          <tr>
            <td><label>Services  :</label></td>
            <td><input type="text" name="" value="wifi,tv,piscine,restaurant " disabled="true"></td>
          </tr>
          <tr>
            <td><label>prix  :</label></td>
            <td><input type="text" name="" value="600$/day" disabled="true"></td>
          </tr>
          
        </table>
        <asp:Button ID="Button10" runat="server" Text="open" CssClass="open_close" BackColor="GreenYellow" Enabled="False" Font-Bold="True"/>
         </div>

        <asp:Panel ID="Panel1" runat="server">
            <div class="brand_color">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>Modifier les chambres</h2>
                        
                    </div>
                </div>
            </div>
        </div>
          </div>

             <div class="modifier les chambres">
                 <br />

                 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                 <asp:Button ID="btaffichertout" runat="server" Text="Aficher tout les Commande" Width="313px"  style="height: 45px" BackColor="#2098F5" ForeColor="White" Font-Size="Large" OnClick="btaffichertout_Click" CssClass="btns" />
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                     <ContentTemplate>
                         <asp:GridView ID="GridView2" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CssClass="auto-style3" ForeColor="Black" GridLines="Vertical" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowEditing="GridView2_RowEditing1" OnRowUpdating="GridView2_RowUpdating" ShowFooter="True" Width="566px">
                             <AlternatingRowStyle BackColor="#CCCCCC" />
                             <Columns>
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
                     <Triggers>
                         <asp:AsyncPostBackTrigger ControlID="btaffichertout" EventName="Click" />
                     </Triggers>
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
 
    </form>
</body>
</html>
