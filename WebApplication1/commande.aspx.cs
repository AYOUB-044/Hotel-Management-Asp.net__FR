using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace WebApplication1
{
    public partial class commande : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection();

        public int prixchmabre;
        public int totalprix;



        protected void Page_Load(object sender, EventArgs e)
        {


            cn.ConnectionString = @"Data Source=MOB\SQLEXPRESS;Initial Catalog=gestion_hotele;Integrated Security=True";
            HyperLink3comande.BackColor = System.Drawing.Color.DodgerBlue;
            lbaj.Text = "*";
            lbcal.Text = "*";

            if (Session["email_directeur"] != null)
            {

            }
            else if (Session["email_reception"] != null)
            {

                HyperLink4emp.Visible = false;
                HyperLink5fact.Visible = false;
                HyperLink6recep.Visible = false;
                HyperLink7total.Visible = false;


            }
            else
            {
                Response.Redirect("~/login.aspx");
            }

            // -------afficher just les chmabre 'open' dans dropdownlist -----//


        }



        void comboboc1()
        {

        }


        protected void btcalculer_Click(object sender, EventArgs e)
        {

            Label2.Text = "Calculer (Prix =  chambre + jours )";
            //-------afficher le prix de chambre dans un var---- -

            cn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT chambre.prix FROM chambre WHERE(chambre.numero =@nbchmabre)";
                cmd.Parameters.AddWithValue("nbchmabre", DropDownListchmabre.SelectedValue);
                cmd.Connection = cn;
                //// txtprix.Text = cmd.ExecuteScalar().ToString();
                prixchmabre = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                cn.Close();
           
            //    --------  calculer le prix : prix de chambre x nombre de jour


            if (txtday.Text != "")
            {
                int day = Convert.ToInt32(txtday.Text);
                totalprix = prixchmabre * day;
                txtprix.Text = totalprix.ToString();
            }
            else Label2.Text = "les jours et vide";
         


        }

    protected void btneveau_Click(object sender, EventArgs e)
        {
            lbaj.Text = "*";
            lbcal.Text = "*";

                txtcin.Text = "";
                txtnom.Text = "";
                txttele.Text = "";
                //DropDownListchmabre.SelectedValue = "";
                txtday.Text = "";
                txtdate_dep.Text = "";
                txtdate_fin.Text = "";
                DropDownListmois.Text = "";
                txtprix.Text = "";
            


          

        }

        //----------ajouter commande --------------------//
        protected void btajouter_Click(object sender, EventArgs e)
        {
            lbaj.Text = "*";
           

            if (txtcin.Text != "" && txtnom.Text != "" && 
           txttele.Text !="" && txtday.Text != "" &&
           txtdate_dep.Text != "" && txtdate_fin.Text != "" && txtprix.Text != "" )
            {
                try
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "insert into commande values (@cin_client,@nom_prenom,@tele,@nb_chambre,@day,@date_dep,@date_fin,@mois,@prix)";

                    cmd.Parameters.AddWithValue("cin_client", txtcin.Text);
                    cmd.Parameters.AddWithValue("nom_prenom", txtnom.Text);
                    cmd.Parameters.AddWithValue("tele", txttele.Text);
                    cmd.Parameters.AddWithValue("nb_chambre", DropDownListchmabre.SelectedValue);
                    cmd.Parameters.AddWithValue("day", txtday.Text);
                    cmd.Parameters.AddWithValue("date_dep", txtdate_dep.Text);
                    cmd.Parameters.AddWithValue("date_fin", txtdate_fin.Text);
                    cmd.Parameters.AddWithValue("mois", DropDownListmois.SelectedValue);
                    cmd.Parameters.AddWithValue("prix", txtprix.Text);
                    cmd.Connection = cn;
                    cmd.ExecuteNonQuery();
                    cn.Close();
                    afficher();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('entrez un corect valeur')</script>");
                }
            }
           else lbaj.Text = "les valeure et vide";



            //----close chambre --

            cn.Open();
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = "Update chambre Set open_close='close'  WHERE(chambre.numero =@nbchmabre)";
            cmd1.Parameters.AddWithValue("nbchmabre", DropDownListchmabre.Text);
            cmd1.Connection = cn;
            cmd1.ExecuteNonQuery();
            cn.Close();

            //Session["cin"] = txtcin.Text;

            lbnom.Text = txtnom.Text;
            lbtele.Text = txttele.Text;
            lbchambre.Text = DropDownListchmabre.Text;
            lbdate_dep.Text = txtdate_dep.Text;
            lbdate_fin.Text = txtdate_fin.Text;
            lbprix.Text = txtprix.Text;
          
        }

        //----------imprimer -------------------//

      
        protected void btimprimer_Click(object sender, EventArgs e)
        {
          // Response.Redirect("~/imprimer.aspx");
        }


        //----------affichher tout les commande dans grid view --------------------//
        void afficher()
        {

            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from commande";
            cmd.Connection = cn;
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            GridView2.DataSource = dt;
            GridView2.DataBind();
            dr.Close();
            cn.Close();
        }
        protected void btaffichertout_Click(object sender, EventArgs e)
        {


            Panel1.Visible = true;
            afficher();
        }

       

        //----------mise a jour  grid view --------------------//

        //----------suprimer  --------------------//
        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "delete from commande where nb_commande =@nb_commande";
                cmd.Parameters.AddWithValue("nb_commande", GridView2.Rows[e.RowIndex].Cells[3].Text);
                cmd.Connection = cn;
                cmd.ExecuteNonQuery();
                GridView2.DataBind();
                cn.Close();
                afficher();
            }
            catch (Exception ex)
            {

            }
        }
        //----------modifier  --------------------//
        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {

            GridView2.EditIndex = e.NewEditIndex;
            afficher();
        }

        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;
            afficher();
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
        //    TextBox nb_commande = GridView2.Rows[e.RowIndex].FindControl("TextBox1") as TextBox;
        //    TextBox cin = GridView2.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
        //    TextBox nom_prenom = GridView2.Rows[e.RowIndex].FindControl("TextBox3") as TextBox;

        //    TextBox tele = GridView2.Rows[e.RowIndex].FindControl("TextBox4") as TextBox;
        //    TextBox nb_chambre = GridView2.Rows[e.RowIndex].FindControl("TextBox5") as TextBox;
        //    TextBox date = GridView2.Rows[e.RowIndex].FindControl("TextBox6") as TextBox;
        //    TextBox date_dep = GridView2.Rows[e.RowIndex].FindControl("TextBox7") as TextBox;
        //    TextBox date_fin = GridView2.Rows[e.RowIndex].FindControl("TextBox8") as TextBox;
        //    TextBox mois = GridView2.Rows[e.RowIndex].FindControl("TextBox9") as TextBox;
        //    TextBox pri = GridView2.Rows[e.RowIndex].FindControl("TextBox10") as TextBox;

       TextBox t1 = (TextBox)GridView2.Rows[e.RowIndex].Cells[3].Controls[0];
        TextBox t2 = (TextBox)GridView2.Rows[e.RowIndex].Cells[4].Controls[0];
        TextBox t3 = (TextBox)GridView2.Rows[e.RowIndex].Cells[5].Controls[0];
        TextBox t4 = (TextBox)GridView2.Rows[e.RowIndex].Cells[6].Controls[0];
        TextBox t5 = (TextBox)GridView2.Rows[e.RowIndex].Cells[7].Controls[0];
        TextBox t6 = (TextBox)GridView2.Rows[e.RowIndex].Cells[8].Controls[0];
        TextBox t7 = (TextBox)GridView2.Rows[e.RowIndex].Cells[9].Controls[0];
        TextBox t8 = (TextBox)GridView2.Rows[e.RowIndex].Cells[10].Controls[0];
        TextBox t9 = (TextBox)GridView2.Rows[e.RowIndex].Cells[11].Controls[0];
        TextBox t10 = (TextBox)GridView2.Rows[e.RowIndex].Cells[12].Controls[0];
        cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "update commande set cin_client=@cin_client,nom_prenom=@nom_prenom,tele=@tele,nb_chambre=@nb_chambre,day=@day,date_dep=@date_dep,date_fin=@date_fin,mois=@mois,prix=@prix where( nb_commande =@nb_commande)";
            cmd.Connection = cn;
            cmd.Parameters.AddWithValue("nb_commande", t1.Text);
            cmd.Parameters.AddWithValue("cin_client", t2.Text);
            cmd.Parameters.AddWithValue("nom_prenom", t3.Text);
            cmd.Parameters.AddWithValue("tele", t4.Text);
            cmd.Parameters.AddWithValue("nb_chambre", t5.Text);
            cmd.Parameters.AddWithValue("day", t6.Text);
            cmd.Parameters.AddWithValue("date_dep", t7.Text);
            cmd.Parameters.AddWithValue("date_fin", t8.Text);
            cmd.Parameters.AddWithValue("mois", t9.Text);
            cmd.Parameters.AddWithValue("PRIX", t10.Text);
           
            cmd.ExecuteNonQuery();
            cn.Close();

            GridView2.EditIndex = -1;
            afficher();
        }

        protected void btsuprimer_tout_Click(object sender, EventArgs e)
        {

            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "delete from commande ";
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            GridView2.DataBind();
            cn.Close();
            afficher();
        }

      
    }
}