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
    public partial class acceuil : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=MOB\SQLEXPRESS;Initial Catalog=gestion_hotele;Integrated Security=True");



        protected void Page_Load(object sender, EventArgs e)
        {
            accueil.BackColor = System.Drawing.Color.DodgerBlue;

            if (Session["email_directeur"] != null)
            {
                Labelemail.Text = Session["email_directeur"].ToString();
                Session["email_reception"] = null;

                afficher_directeur();

            }
            else if(Session["email_reception"] != null)
            {

                Labelemail.Text = Session["email_reception"].ToString();
                Session["email_directeur"] = null;
                HyperLink4emp.Visible = false;
                HyperLink5fact.Visible = false;
                HyperLink6recep.Visible = false;
                HyperLink7total.Visible = false;


                afficher_reception();
             
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }


        void afficher_reception()
        {

            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select cin,image,nom,prenom,adresse,tele,date_dep,salaire,travau from reception where (email=@email)";
            cmd.Parameters.AddWithValue("email", Labelemail.Text);

            cmd.Connection = cn;
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            labelcin.Text = dt.Rows[0][0].ToString();

            byte[] byts = (byte[])dt.Rows[0][1];
            string img = Convert.ToBase64String(byts);
            Image1.ImageUrl = String.Format("data:images/jpg;base64," + img);

            labelnom.Text = dt.Rows[0][2].ToString();
            Labelprenom.Text = dt.Rows[0][3].ToString();
            Labeladress.Text = dt.Rows[0][4].ToString();
            Labeltele.Text = dt.Rows[0][5].ToString();
            Labeldate_dep.Text = dt.Rows[0][6].ToString();
            Labelsalaire.Text = dt.Rows[0][7].ToString();
            Labeltraveau.Text = dt.Rows[0][8].ToString();


            dr.Close();
            cn.Close();
        }

        void afficher_directeur()
        {

            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select cin,image,nom,prenom,tele from directeur where (email=@email)";
            cmd.Parameters.AddWithValue("email", Labelemail.Text);

            cmd.Connection = cn;
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            labelcin.Text = dt.Rows[0][0].ToString();

            byte [] byts = (byte[])dt.Rows[0][1];
            string img = Convert.ToBase64String(byts);
            Image1.ImageUrl = String.Format("data:images/jpg;base64,"+ img);

            labelnom.Text = dt.Rows[0][2].ToString();
            Labelprenom.Text = dt.Rows[0][3].ToString();
            Labeltele.Text = dt.Rows[0][4].ToString();

            
            Labeladress.Visible = false;
            Labeldate_dep.Visible = false;
            Labelsalaire.Visible = false;
            Labeltraveau.Visible = false;


            dr.Close();
            cn.Close();
        }
    }
}