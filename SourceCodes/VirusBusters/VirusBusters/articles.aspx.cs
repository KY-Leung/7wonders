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
    public partial class articles : System.Web.UI.Page
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
            StringBuilder articles = new StringBuilder();
            string connectionString = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM article WHERE isApproved = 'Y'", con);
                SqlDataReader articledata = cmd.ExecuteReader();
                while (articledata.Read())
                {
                    articles.Append("<div class=\"col-lg-6\">");
                    articles.Append("<div class=\"blog-post-lg bordered blog-container\">");
                    articles.Append("<div class=\"blog-post-content\">");
                    if(articledata.GetValue(3).ToString() != "")
                        articles.Append("<img src=\"../Article_Img/" + articledata.GetValue(3).ToString() + "\" width=\"400px\" height=\"200px\"/>");
                    articles.Append("<h2 class=\"blog-title blog-post-title\"> <a href=\"article_details.aspx?aid=" + articledata.GetValue(0).ToString() +"\" class=\"nav-link\">" + articledata.GetValue(5).ToString() + "</a></h2>");
                    articles.Append("<p class=\"blog-post-desc\">"+articledata.GetValue(2).ToString() + "</p> ");
                    articles.Append("<div class=\"blog-post-meta\"><i class=\"icon-calendar font-blue\"></i>" + articledata.GetValue(6).ToString() + "</div>");
                    //articles.Append("<div class=\"blog-post-meta\"><i class=\"icon-bubble font-blue\"></i>14 Comments</div>");
                    articles.Append("</div></div></div>");
                }
                articlesContainer.Controls.Add(new Literal { Text = articles.ToString() });

            }
            catch(SqlException ex)
            {

            }
            con.Close();

        }
    }
}