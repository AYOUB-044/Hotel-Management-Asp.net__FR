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
    public partial class factures : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            HyperLink5fact.BackColor = System.Drawing.Color.DodgerBlue;
            cn.ConnectionString = @"Data Source=MOB\SQLEXPRESS;Initial Catalog=gestion_hotele;Integrated Security=True";
            if (!IsPostBack)
            {
                afficher();
            }

        }
        protected void btajouter_Click1(object sender, EventArgs e)
        {
            try
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "insert into factures values (@libelle,@date,@description,@prix,@mois,'CB1111')";
              
                cmd.Parameters.AddWithValue("libelle", txtlibelle.Text);
                cmd.Parameters.AddWithValue("date", txtdate.Text);
                cmd.Parameters.AddWithValue("description", txtdescription.Text);
                cmd.Parameters.AddWithValue("prix", txtprix.Text);
                cmd.Parameters.AddWithValue("mois", DropDownListmois.SelectedValue);

                cmd.Connection = cn;
                cmd.ExecuteNonQuery();
                cn.Close();
                afficher();

                //txtnumbre.Text = "";
                txtlibelle.Text = "";
                txtdate.Text = "";
                txtdescription.Text = "";
                txtprix.Text = "";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('entrez un corect valeur')</script>");
            }

        }

        protected void btneveau_Click1(object sender, EventArgs e)
        {

            //txtnumbre.Text = "";
            txtlibelle.Text = "";
            txtdate.Text = "";
            txtdescription.Text = "";
            txtprix.Text = "";
        }

        //------------- afficher factures dans grid view---------------//
        void afficher()
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select numero,libelle,date,description,prix,mois from factures";
            cmd.Connection = cn;
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            dr.Close();
            cn.Close();


        }
        protected void btaffcher11_Click(object sender, EventArgs e)
        {
            
        }

        //---------------        mise a jour      -----------------//

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "delete from factures where numero =@numero";
            cmd.Parameters.AddWithValue("numero", GridView1.Rows[e.RowIndex].Cells[3].Text);

            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            GridView1.DataBind();
            cn.Close();
            afficher();
              }
               catch(Exception ex)
            {
                
            }
}

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            afficher();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            afficher();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
           

            TextBox t1 = (TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0];
            TextBox t2 = (TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0];
            TextBox t3 = (TextBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0];
            TextBox t4 = (TextBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0];
            TextBox t5 = (TextBox)GridView1.Rows[e.RowIndex].Cells[7].Controls[0];
            TextBox t6 = (TextBox)GridView1.Rows[e.RowIndex].Cells[8].Controls[0];
          
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "update factures set libelle =@libelle,description=@description,prix=@prix,mois=@mois where (numero =@numero)";
         
            cmd.Parameters.AddWithValue("numero", t1.Text);
            cmd.Parameters.AddWithValue("libelle", t2.Text);
           //cmd.Parameters.AddWithValue("date", t3.Text);
            cmd.Parameters.AddWithValue("description", t4.Text);
            cmd.Parameters.AddWithValue("prix", t5.Text);
             cmd.Parameters.AddWithValue("mois", t6.Text);

            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            cn.Close();

            GridView1.EditIndex = -1;
            afficher();

        }

        protected void btsuprimer_tout_Click(object sender, EventArgs e)
        {

            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "delete from factures ";
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            GridView1.DataBind();
            cn.Close();
            afficher();
        }

      
    }
}