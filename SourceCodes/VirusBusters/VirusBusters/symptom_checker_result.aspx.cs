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
using System.Text;

namespace VirusBusters
{
    public partial class symptom_checker_result : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            bool isLoggedIn = (System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            if (isLoggedIn)
            {
                if (string.Equals(HttpContext.Current.User.Identity.Name, "admin", StringComparison.CurrentCultureIgnoreCase)) //to be changed to role
                {
                    this.MasterPageFile = "~/admin.master";
                }
                else
                {
                    this.MasterPageFile = "~/public.master";
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string s1 = Request.QueryString["s1"];
            string s2 = Request.QueryString["s2"];
            string s3 = Request.QueryString["s3"];
            string s4 = Request.QueryString["s4"];
            string connectionString = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT COUNT(SymptomSet) FROM SymptomToDisease", con);
            int rows = Int32.Parse(cmd.ExecuteScalar().ToString());
            string[,] symtompstable = new string[rows, 6];
            symtompstable = symptoms(rows);
            string[] inputs = new string[4];
            inputs[0] = s1;
            inputs[1] = s2;
            inputs[2] = s3;
            inputs[3] = s4;
            compareresult(symtompstable,inputs,rows);
        }

        public string[,] symptoms(int rows)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string[,] symptoms = new string[rows, 6];

            for (int i = 0; i < rows; i++)
            {
                int counter = 0;
                int sympid = i + 1;
                SqlCommand cmd2 = new SqlCommand("SELECT disease FROM SymptomToDisease WHERE SymptomSet = '" + sympid + "';", con);
                string disease = cmd2.ExecuteScalar().ToString();
                symptoms[i, 4] = disease;
                SqlCommand cmd3 = new SqlCommand("SELECT * FROM Symptoms WHERE id = '" + sympid + "';", con);
                SqlDataReader symptomdata = cmd3.ExecuteReader();
                while (symptomdata.Read())
                {
                    symptoms[i, counter] = symptomdata.GetValue(1).ToString();
                    if (counter == 3)
                        counter = 0;
                    else
                        counter++;
                }
                symptomdata.Close();
            }
            con.Close();
            return symptoms;
        }

        public string[,]compareresult(string[,] symptomtable, string[] input, int rows)
        {
            string[,] result = new string[rows, 2];
            int score = 0;
            int total = 0;

            for (int i=0;i<rows;i++)
            {
                for(int j = 0; j<4; j++)
                {
                    for(int k = 0; k<4; k++)
                    {
                        if (symptomtable[i, j] == input[k]) score++;
                    }
                    
                }
                symptomtable[i, 5] = score.ToString();
                total += score;
                score = 0;
            }

            StringBuilder resulttable = new StringBuilder();
            resulttable.Append("<table  class=\"table table-striped table-bordered table-hover\" id=\"sample_2\">");

            for(int i = 0; i<rows; i++)
            {
                int rowscore = Int32.Parse(symptomtable[i, 5]);
                float percentage = ((float)rowscore / (float)total) * 100;
                resulttable.Append("<tr>");
                resulttable.Append("<td>" + symptomtable[i, 4].ToString() + "</td>");
                resulttable.Append("<td>" + percentage.ToString("0.00") + "%</td>");
                resulttable.Append("</tr>");
            }

            resulttable.Append("</table>");
            resulttableContainer.Controls.Add(new Literal { Text = resulttable.ToString() });
            return result;
        }
    }
}