using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class imprimer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            DataSet1.commandeDataTable dt = new DataSet1.commandeDataTable();

            DataSet1 ds = new DataSet1();

            SqlConnection cn = new SqlConnection(@"Data Source=MOB\SQLEXPRESS;Initial Catalog=gestion_hotele;Integrated Security=True");
           // DataSet1.commandeDataTable dt1 = new DataSet1.commandeDataTable();

            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from commande where cin_client=@cin";

            cmd.Parameters.AddWithValue("cin_client", Session["cin"].ToString());
            cmd.Connection = cn;
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            dt.Load(dr);

    
//
        }
    }
}