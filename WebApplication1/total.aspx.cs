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
    public partial class total : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection();
        DataTable dt = new DataTable();

        public int fac,com,emp,rec;

        protected void Page_Load(object sender, EventArgs e)
        {
            HyperLink7total.BackColor = System.Drawing.Color.DodgerBlue;

            cn.ConnectionString = @"Data Source=MOB\SQLEXPRESS;Initial Catalog=gestion_hotele;Integrated Security=True";
            charger_factures();
            charger_commande();
            charger_emp();
            charger_recep();
            
            int som, total;

            som = fac + rec + emp;
            total =  com - som;

            txttotal.Text = total.ToString();

         
          
        }

        SqlDataReader dr;
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        void charger_factures()
        {
            
                cn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "select sum(prix) from factures where mois = @mois";
                cmd.Parameters.AddWithValue("mois", DropDownList1.SelectedValue);         // if les prix ="" dans mois =3,4,5...  ===> euror!!
                cmd.Connection = cn;

                

            object o = cmd.ExecuteScalar();
            if (o == DBNull.Value)
            {
                txtfactures.Text = "0";
            }
            else
            {
                fac = Convert.ToInt32(o);

                txtfactures.Text = fac.ToString();
            }
            

            cn.Close();


        }
        void charger_commande()
        {
                cn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "select sum(prix) as prixs from commande where mois = @mois";
                cmd.Parameters.AddWithValue("mois", DropDownList1.SelectedValue);                  // if les prix ="" dans mois =3,4,5...  ===> euror!!
                cmd.Connection = cn;

            if(cmd.ExecuteScalar() == DBNull.Value)
            {
                txtcommande.Text = "0";
         
            }
            else
            {
                com = Convert.ToInt32(cmd.ExecuteScalar());
                txtcommande.Text = com.ToString();
            }

            cn.Close();
        }

        //-------------datatbale and ExecuteReader();
        //void charger_commande()
        //{


        //    cn.Open();
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandText = "select prix  from commande where mois = @mois";
        //    cmd.Parameters.AddWithValue("mois", DropDownList1.SelectedValue);                  // if mois = ""  euror ===> !!
        //    cmd.Connection = cn;
        //    SqlDataReader dr;
        //    dr = cmd.ExecuteReader();
        //    DataTable dt = new DataTable();
        //    dt.Load(dr);
        //    cn.Close();
        //    dr.Close();

        //    for (int i = 0; i < dt.Rows.Count; i++)
        //    {
        //        com = +int.Parse(dt.Rows[i][0].ToString());

        //    }
        //    if (com > 0)
        //    {
        //        txtcommande.Text = com.ToString();
        //    }
        //    else
        //        txtcommande.Text = "0";
        //}


        void charger_emp()
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select sum(salaire) from employe";
            cmd.Connection = cn;

            if (cmd.ExecuteScalar() == DBNull.Value)
            {
                txtemp.Text = "0";

            }
            else
            {
                emp = Convert.ToInt32(cmd.ExecuteScalar());
                txtemp.Text = emp.ToString();
            }
            cn.Close();


        }
        void charger_recep()
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select sum(salaire) from reception";
            cmd.Connection = cn;
            if (cmd.ExecuteScalar() == DBNull.Value)
            {
                txtreception.Text = "0";

            }
            else
            {
                rec = Convert.ToInt32(cmd.ExecuteScalar());
                txtreception.Text = rec.ToString();
            }
            cn.Close();

            
        }
        protected void btsave_Click(object sender, EventArgs e)
        {
            try
            {

                cn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "insert into totale values (@mois,@commande,@factures,@employes,@reception,@total,'CB1111')";
                cmd.Parameters.AddWithValue("mois", DropDownList1.SelectedValue);
                cmd.Parameters.AddWithValue("commande", txtcommande.Text);
                cmd.Parameters.AddWithValue("factures", txtfactures.Text);
                cmd.Parameters.AddWithValue("employes", txtemp.Text);
                cmd.Parameters.AddWithValue("reception", txtreception.Text);
                cmd.Parameters.AddWithValue("total", txttotal.Text);
                cmd.Connection = cn;
                cmd.ExecuteNonQuery();
                cn.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('mois est double')</script>");
            }


        }
        void afficher()
        {

            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select mois,commande,factures,employes,reception,total from totale";
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
        protected void btafficher_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            afficher();
        }

        protected void btsuprimer_Click(object sender, EventArgs e)
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "delete  from totale ";
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            GridView1.DataBind();
            cn.Close();
            afficher();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

            GridView1.EditIndex = e.NewEditIndex;
            afficher();
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            GridView1.EditIndex = -1;
            afficher();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            cn.Open();

            TextBox t1 = (TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0];
            TextBox t2 = (TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0];
            TextBox t3 = (TextBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0];
            TextBox t4 = (TextBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0];
            TextBox t5 = (TextBox)GridView1.Rows[e.RowIndex].Cells[7].Controls[0];
            TextBox t6 = (TextBox)GridView1.Rows[e.RowIndex].Cells[8].Controls[0];

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "update totale set commande=@commande,factures=@factures,employes=@employes,reception=@reception,total=@total where (mois =mois)";
            cmd.Parameters.AddWithValue("mois", t1.Text);
            cmd.Parameters.AddWithValue("commande", t2.Text);
            cmd.Parameters.AddWithValue("factures", t3.Text);
            cmd.Parameters.AddWithValue("employes", t4.Text);
            cmd.Parameters.AddWithValue("reception", t5.Text);
            cmd.Parameters.AddWithValue("total", t6.Text);
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            cn.Close();
            GridView1.EditIndex = -1;
            afficher();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "delete from totale where mois =@mois";
                cmd.Parameters.AddWithValue("mois", GridView1.Rows[e.RowIndex].Cells[3].Text);

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



       


    }



}