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
    public partial class login : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=MOB\SQLEXPRESS;Initial Catalog=gestion_hotele;Integrated Security=True");

    

        protected void Page_Load(object sender, EventArgs e)
        {
            HyperLink2Login.BackColor = System.Drawing.Color.DodgerBlue;

            Session["email_directeur"] = null;
            Session["email_reception"] = null;
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
           
            if (RadioButtondirect.Checked == true)
            {

                SqlCommand cmd = new SqlCommand();
                cn.Open();
                cmd.CommandText = "select * from directeur";
                cmd.Connection = cn;
                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(dr);
                cn.Close();
                dr.Close();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (Login1.UserName == dt.Rows[i][5].ToString() && Login1.Password == dt.Rows[i][6].ToString()) // email && mod pass
                    {
                        //Response.Write("  id and passwor corect  ");
                        Session["email_directeur"] = Login1.UserName;
                        Session["type"] = RadioButtondirect.Text;
                        Response.Redirect("~/accueil.aspx");
                    
                    }



                }
                RadioButtondirect.Checked = false;

            }


            if (RadioButtonrecp.Checked == true)
            {
                SqlCommand cmd1 = new SqlCommand();
                
                cn.Open();
                cmd1.CommandText = "select * from reception";
                cmd1.Connection = cn;
                SqlDataReader dr1;
                dr1 = cmd1.ExecuteReader();
                DataTable dt1 = new DataTable();
                dt1.Load(dr1);
                cn.Close();
                dr1.Close();

                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    if (Login1.UserName == dt1.Rows[i][9].ToString() && Login1.Password == dt1.Rows[i][10].ToString()) // nom && prenom
                    {
                        //Response.Write("  id and passwor corect  ");
                        Session["email_reception"] = Login1.UserName;
                        Session["type"] = RadioButtonrecp.Text;
                        Response.Redirect("~/accueil.aspx");
                    }




                }
                RadioButtonrecp.Checked = false;


            }
        }
    }
}
