using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirusBusters
{
    public partial class Manage_Illness_Predictor : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            switch (user.role)
            {
                case "admin":
                    this.MasterPageFile = "~/admin.master";
                    break;
                case "mprof":
                    this.MasterPageFile = "~/mprof.master";
                    break;
                default:
                    this.MasterPageFile = "~/public.master";
                    Response.Redirect("noaccess.html");
                    break;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            StringBuilder diseases = new StringBuilder();
            string connectionString = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            diseases.Append("<table  class=\"table table-striped table-bordered table-hover\" id=\"sample_2\">");
            diseases.Append("<tr><th>Dieases</th></tr> ");

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT disease FROM SymptomToDisease", con);
                SqlDataReader dieasesdata = cmd.ExecuteReader();
                while (dieasesdata.Read())
                {
                    diseases.Append("<tr>");
                    diseases.Append("<td>" + dieasesdata.GetValue(0).ToString() + "</td>");
                    diseases.Append("</tr>");
                }
                diseases.Append("</table>");
                DiseasesContainer.Controls.Add(new Literal { Text = diseases.ToString() });

            }
            catch (SqlException ex)
            {

            }
            con.Close();

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string diesease = DiseaseTB.Text;
            string[] symptoms = new string[4];
            symptoms[0] = sym1TB.Text;
            symptoms[1] = sym2TB.Text;
            symptoms[2] = sym3TB.Text;
            symptoms[3] = sym4TB.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT into SymptomToDisease(disease) VALUES ('" + diesease +"');", con);
            cmd.ExecuteNonQuery();
            cmd.CommandText = "SELECT MAX(SymptomSet) FROM SymptomToDisease";
            string setid = cmd.ExecuteScalar().ToString();

            for(int i = 0; i < 4; i++)
            {
                cmd.CommandText = "INSERT INTO Symptoms VALUES ('" + setid + "','" + symptoms[i] + "')";
                cmd.ExecuteNonQuery();
            }
            con.Close();
            msglbl.Visible = true;
            msglbl.Text = "Article approved! redirecting to validation page...";
            Response.AddHeader("REFRESH", "2;URL=Manage_Illness_Predictor.aspx");


        }
    }
}