using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=MOB\SQLEXPRESS;Initial Catalog=gestion_hotele;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            HyperLink4emp.BackColor = System.Drawing.Color.DodgerBlue;

            if (!IsPostBack)
            {
                afficher();
            }
        }
        void afficher()
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select cin,nom,prenom,adresse,tele,travau,date_dep,salaire from employe";
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            lb1.Text = "*";
            if (txtcin.Text != "" && txtnom.Text != "" &&
         txttele.Text != "" && txttravau.Text != "" &&
         txtsalaire.Text != "")
            {
                try
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "insert into employe values (@cin,@nom,@prenom,@adresse,@tele,@travau,@date_dep,@salaire,'CB1111')";
                    cmd.Parameters.AddWithValue("cin", txtcin.Text);
                    cmd.Parameters.AddWithValue("nom", txtnom.Text);
                    cmd.Parameters.AddWithValue("prenom", txtprenom.Text);
                    cmd.Parameters.AddWithValue("adresse", txtadresse.Text);
                    cmd.Parameters.AddWithValue("tele", txttele.Text);
                    cmd.Parameters.AddWithValue("Travau", txttravau.Text);
                    cmd.Parameters.AddWithValue("date_dep", txtdate_dep.Text);
                    cmd.Parameters.AddWithValue("salaire", txtsalaire.Text);
                    cmd.Connection = cn;
                    cmd.ExecuteNonQuery();
                    cn.Close();
                    afficher();

                }
                catch
                {
                    Response.Write("<script>alert('entrez un corect valeur')</script>");
                }
            }
            else
            {
                lb1.Text = "les valeure et vide";
            }
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            txtcin.Text = "";
            txtnom.Text = "";
            txtprenom.Text = "";
            txtadresse.Text = "";
            txttele.Text = "";
            txttravau.Text = "";
            txtdate_dep.Text = "";
            txtsalaire.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "delete from employe where cin =@cin";
                cmd.Parameters.AddWithValue("cin", GridView1.Rows[e.RowIndex].Cells[3].Text);
                cmd.Connection = cn;
                cmd.ExecuteNonQuery();
                GridView1.DataBind();
                cn.Close();
                afficher();
            }
            catch (Exception ex)
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
            TextBox t7 = (TextBox)GridView1.Rows[e.RowIndex].Cells[9].Controls[0];
            TextBox t8 = (TextBox)GridView1.Rows[e.RowIndex].Cells[10].Controls[0];
       
       
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "update employe set  nom=@nom,prenom=@prenom,adresse=@adresse,tele=@tele,travau=@travau,date_dep=@date_dep,salaire=@salaire where (cin =@cin)";
        
            cmd.Parameters.AddWithValue("cin", t1.Text);
            cmd.Parameters.AddWithValue("nom", t2.Text);
            cmd.Parameters.AddWithValue("prenom", t3.Text);
            cmd.Parameters.AddWithValue("adresse", t4.Text);
            cmd.Parameters.AddWithValue("tele", t5.Text);
            cmd.Parameters.AddWithValue("Travau", t6.Text);
            cmd.Parameters.AddWithValue("date_dep", t7.Text);
            cmd.Parameters.AddWithValue("salaire", t8.Text);
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            cn.Close();

            GridView1.EditIndex = -1;
            afficher();
        }
           
    }

}
