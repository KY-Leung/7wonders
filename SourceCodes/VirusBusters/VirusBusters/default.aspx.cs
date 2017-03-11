using FireSharp.Config;
using FireSharp.Interfaces;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Entity.Validation;
using System.Configuration;
using System.Data;

namespace VirusBusters
{
    public partial class WebForm1 : System.Web.UI.Page
    {


        protected string lat;
        protected string lng;


        protected void Page_Load(object sender, EventArgs e)
        {

              lat = "1.3521";
            lng = "103.8198";

            SqlDataAdapter da = new SqlDataAdapter("Select * from clinic", ConfigurationManager
        .ConnectionStrings["myDB"].ConnectionString);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();

            DataTable dt = ds.Tables[0];
            TextBox1.Text = ds.Tables[0].Rows[0]["lat"].ToString();
           


        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
         
                }

        public string RunCommand(string Query)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);

            SqlCommand com = new SqlCommand(Query, con);
            con.Open();
            string res = com.ExecuteScalar().ToString(); 
            con.Close();
            return res;
        }


        public void runReader(string query)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string query = "SELECT lat FROM clinic WHERE Id = 1";
           string results = RunCommand(query);
            TextBox1.Text = results;

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
       
    }
    }
}