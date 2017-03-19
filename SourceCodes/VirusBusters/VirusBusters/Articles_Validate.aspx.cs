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
    public partial class Articles_Validate : System.Web.UI.Page
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
                    Response.Redirect("noaccess.html");
                    break;
                default:
                    this.MasterPageFile = "~/public.master";
                    Response.Redirect("noaccess.html");
                    break;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            StringBuilder articles = new StringBuilder();
            string connectionString = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            articles.Append("<table  class=\"table table-striped table-bordered table-hover\" id=\"sample_2\">");
            articles.Append("<tr><th>Submitted By</th><th>Title</th><th>Date</th></tr> ");

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM article WHERE isApproved = 'N'", con);
                SqlDataReader articledata = cmd.ExecuteReader();
                while (articledata.Read())
                {
                    articles.Append("<tr>");
                    articles.Append("<td>" + articledata.GetValue(1).ToString() + "</td>");
                    articles.Append("<td> <a href=\"ArticleDetailsValidate.aspx?aid=" + articledata.GetValue(0).ToString() + "\" class=\"nav-link\">" + articledata.GetValue(5).ToString() + "</a></td>");
                    articles.Append("<td>" + articledata.GetValue(6).ToString() + "</td>");
                    articles.Append("</tr>");
                }
                articles.Append("</table>");
                ArticlesContainer.Controls.Add(new Literal { Text = articles.ToString() });

            }
            catch (SqlException ex)
            {

            }
            con.Close();
        }
    }
}