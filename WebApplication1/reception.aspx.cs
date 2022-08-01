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
    public partial class reception : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=MOB\SQLEXPRESS;Initial Catalog=gestion_hotele;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            HyperLink6recep.BackColor = System.Drawing.Color.DodgerBlue;

            if (!IsPostBack)
            {
                afficher();
            }
        }

        void afficher()
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select cin,image,nom,prenom,adresse,tele,date_dep,salaire,travau,email,pass from reception";
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


        protected void btajouter_Click(object sender, EventArgs e)
        {
            try
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "insert into reception values (@cin,@image,@nom,@prenom,@adresse,@tele,@date_dep,@salaire,@travau,@email,@pass,'CB1111')";
                cmd.Parameters.AddWithValue("cin", txtcin.Text);

                int img = FileUpload1.PostedFile.ContentLength;
                byte[] msdata = new byte[img];
                FileUpload1.PostedFile.InputStream.Read(msdata, 0, img);
                cmd.Parameters.AddWithValue("@image", msdata);

                cmd.Parameters.AddWithValue("nom", txtnom.Text);
                cmd.Parameters.AddWithValue("prenom", txtprenom.Text);
                cmd.Parameters.AddWithValue("adresse", txtadresse.Text);
                cmd.Parameters.AddWithValue("tele", txttele.Text);
                cmd.Parameters.AddWithValue("date_dep", txtdate_dep.Text);
                cmd.Parameters.AddWithValue("salaire", txtsalaire.Text);
                cmd.Parameters.AddWithValue("Travau", txttravau.Text);
                cmd.Parameters.AddWithValue("email", txtemail1.Text);
                cmd.Parameters.AddWithValue("pass", txtpass1.Text);

                cmd.Connection = cn;
                cmd.ExecuteNonQuery();
                cn.Close();
                afficher();

            }
            catch
            {
                Response.Write("<script>alert('entrez un corect valeur and jpg image')</script>");
            }
        }

        protected void btneau_Click(object sender, EventArgs e)
        {
            txtcin.Text = "";
            txtnom.Text = "";
            txtprenom.Text = "";
            txtadresse.Text = "";
            txttele.Text = "";
            txtdate_dep.Text = "";
            txtsalaire.Text = "";
            txttravau.Text = "";
            txtemail1.Text = "";
            txtpass1.Text = "";
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            try
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "delete from reception where cin =@cin";
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
            TextBox t9 = (TextBox)GridView1.Rows[e.RowIndex].Cells[11].Controls[0];
            TextBox t10 = (TextBox)GridView1.Rows[e.RowIndex].Cells[12].Controls[0];


            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "update reception set nom=@nom,prenom=@prenom,adresse=@adresse,tele=@tele,date_dep=@date_dep,salaire=@salaire,travau=@travau,email=@email,pass=@pass where (cin =@cin)";
            cmd.Connection = cn;
            cmd.Parameters.AddWithValue("cin", t1.Text);
            cmd.Parameters.AddWithValue("nom", t2.Text);
            cmd.Parameters.AddWithValue("prenom", t3.Text);
            cmd.Parameters.AddWithValue("adresse", t4.Text);
            cmd.Parameters.AddWithValue("tele", t5.Text);
            cmd.Parameters.AddWithValue("date_dep", t6.Text);
            cmd.Parameters.AddWithValue("salaire", t7.Text);
            cmd.Parameters.AddWithValue("Travau", t8.Text);
            cmd.Parameters.AddWithValue("email", t9.Text);
            cmd.Parameters.AddWithValue("pass", t10.Text);



            cmd.ExecuteNonQuery();
            cn.Close();

            GridView1.EditIndex = -1;
            afficher();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}