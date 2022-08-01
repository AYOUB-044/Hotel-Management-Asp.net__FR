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
    public partial class chambres : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=MOB\SQLEXPRESS;Initial Catalog=gestion_hotele;Integrated Security=True");
        SqlCommand cmd;
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            HyperLink2chambre.BackColor = System.Drawing.Color.DodgerBlue;

            

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

            colorbuton();
        }

        // design les button 
        void colorbuton()
        {

            cn.Open();
            cmd = new SqlCommand("SELECT numero,open_close FROM chambre where open_close='close' ", cn);
            dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i][0].ToString() == "1")
                {
                    Button1.Text = "close";
                    Button1.BackColor = System.Drawing.Color.Red;
                }
                else if (dt.Rows[i][0].ToString() == "2")
                {
                    Button2.Text = "close";
                    Button2.BackColor = System.Drawing.Color.Red;
                }
                else if (dt.Rows[i][0].ToString() == "3")
                {
                    Button3.Text = "close";
                    Button3.BackColor = System.Drawing.Color.Red;
                }
                else if (dt.Rows[i][0].ToString() == "4")
                {
                    Button4.Text = "close";
                    Button4.BackColor = System.Drawing.Color.Red;
                }
                else if (dt.Rows[i][0].ToString() == "5")
                {
                    Button5.Text = "close";
                    Button5.BackColor = System.Drawing.Color.Red;
                }
                else if (dt.Rows[i][0].ToString() == "6")
                {
                    Button6.Text = "close";
                    Button6.BackColor = System.Drawing.Color.Red;
                }
                else if (dt.Rows[i][0].ToString() == "7")
                {
                    Button7.Text = "close";
                    Button7.BackColor = System.Drawing.Color.Red;
                }
                else if (dt.Rows[i][0].ToString() == "8")
                {
                    Button8.Text = "close";
                    Button8.BackColor = System.Drawing.Color.Red;
                }
                else if (dt.Rows[i][0].ToString() == "9")
                {
                    Button9.Text = "close";
                    Button9.BackColor = System.Drawing.Color.Red;
                }
                else if (dt.Rows[i][0].ToString() == "10")
                {
                    Button10.Text = "close";
                    Button10.BackColor = System.Drawing.Color.Red;
                }
            }


            dr.Close();
            cn.Close();
        }
     

        //----------affichher tout les chambres dans grid view --------------------//
        void afficher()
        {

            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from chambre";
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
            afficher();
        }

        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;
            afficher();
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox t1 = (TextBox)GridView2.Rows[e.RowIndex].Cells[1].Controls[0];
            TextBox t2 = (TextBox)GridView2.Rows[e.RowIndex].Cells[2].Controls[0];
            TextBox t3 = (TextBox)GridView2.Rows[e.RowIndex].Cells[3].Controls[0];
            TextBox t4 = (TextBox)GridView2.Rows[e.RowIndex].Cells[4].Controls[0];
            TextBox t5 = (TextBox)GridView2.Rows[e.RowIndex].Cells[5].Controls[0];
            TextBox t6 = (TextBox)GridView2.Rows[e.RowIndex].Cells[6].Controls[0];
            TextBox t7 = (TextBox)GridView2.Rows[e.RowIndex].Cells[7].Controls[0];
    
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "update chambre set size=@size,capasitiy=@capasitiy,services=@services,prix=@prix,open_close=@open_close,cin_reception=@cin_reception where( numero =@numero)";
            cmd.Connection = cn;
            cmd.Parameters.AddWithValue("numero", t1.Text);
            cmd.Parameters.AddWithValue("size", t2.Text);
            cmd.Parameters.AddWithValue("capasitiy", t3.Text);
            cmd.Parameters.AddWithValue("services", t4.Text);
            cmd.Parameters.AddWithValue("prix", t5.Text);
            cmd.Parameters.AddWithValue("open_close", t6.Text);
            cmd.Parameters.AddWithValue("cin_reception", t7.Text);
       

            cmd.ExecuteNonQuery();
            cn.Close();

            GridView2.EditIndex = -1;

            colorbuton();
            afficher();
        }

        protected void GridView2_RowEditing1(object sender, GridViewEditEventArgs e)
        {

            GridView2.EditIndex = e.NewEditIndex;

            afficher();
        }
    }
}