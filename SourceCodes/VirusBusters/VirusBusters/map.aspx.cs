using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirusBusters
{
    public partial class map : System.Web.UI.Page
    {

        protected string lat;
        protected string lng;
        protected int entry =1;
        protected int count;
        protected String[] latArray;
        protected String[] lngArray;
        protected String[] nameAr;

      


        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.Text = "haha";
            SqlDataAdapter da = new SqlDataAdapter("Select * from clinic", ConfigurationManager.ConnectionStrings["myDB"].ConnectionString);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataTable dt = ds.Tables[0];

            String query = "Select count(*) from clinic";
            count = Convert.ToInt32(RunCommand(query));
             latArray = new String[count];
             lngArray = new String[count];
            nameAr = new String[count];

            for (int i=0; i<count; i++)
            {
                latArray[i] = ds.Tables[0].Rows[i]["lat"].ToString();
                lngArray[i] = ds.Tables[0].Rows[i]["long"].ToString();
                nameAr[i] = ds.Tables[0].Rows[i]["cN"].ToString();

                StringBuilder name = new StringBuilder(nameAr[i]);
                name.Insert(0, "'");
                name.Append("'");
                

                Page.ClientScript.RegisterArrayDeclaration("latArray", ds.Tables[0].Rows[i]["lat"].ToString());
                Page.ClientScript.RegisterArrayDeclaration("lngArray", ds.Tables[0].Rows[i]["long"].ToString());
               Page.ClientScript.RegisterArrayDeclaration("nameAr",name.ToString() );

            }

            

           

                 lat = "1.4521";
            lng = "103.8198";

          
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

   

        protected void Button124_Click(object sender, EventArgs e)
        {
            
         
            string query = "SELECT count(*) FROM clinic ";
            string rows = RunCommand(query);
            TextBox1.Text = rows.ToString();


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string query = "SELECT count(*) FROM clinic ";
            string rows = RunCommand(query);
            TextBox1.Text = rows.ToString();
            Response.Redirect("test.aspx?value=" + rows);//sending the name to other page
        }

        protected void Button2_Click(object sender, CommandEventArgs e)
        {

            TextBox1.Text = e.CommandArgument.ToString();

        }



      

    
    }
}