using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class etat
    {
        public static DataSet1.commandeDataTable imprimer()
        {
            SqlConnection cn = new SqlConnection(@"Data Source=MOB\SQLEXPRESS;Initial Catalog=gestion_hotele;Integrated Security=True");
            DataSet1.commandeDataTable dt = new DataSet1.commandeDataTable();

            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from commande";

            cmd.Connection = cn;
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            dt.Load(dr);
            return dt;
        }
    }
}