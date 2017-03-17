using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirusBusters
{
    public partial class ArticleDetailsValidate : System.Web.UI.Page
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
            string a_id = Request.QueryString["aid"];

            string connectionString = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM article WHERE a_id = '" + a_id + "';", con);
            SqlDataReader articledata = cmd.ExecuteReader();

            while (articledata.Read())
            {
                ArticleTitle.InnerHtml = articledata.GetValue(5).ToString();
                if (articledata.GetValue(3).ToString() != "")
                {
                    ArticleImg.ImageUrl = "../Article_img/" + articledata.GetValue(3).ToString();
                    ArticleImg.Visible = true;
                }
                ArticleDesc.InnerHtml = articledata.GetValue(2).ToString();
                ArticleDate.InnerHtml = articledata.GetValue(6).ToString().ToString();

            }
            con.Close();
        }

        protected void Approve_Click(object sender, EventArgs e)
        {
            string a_id = Request.QueryString["aid"];
            string connectionString = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE article SET isApproved = 'Y' WHERE a_id = '" +a_id+"';", con);
            cmd.ExecuteNonQuery();
            msglbl.Visible = true;
            msglbl.Text = "Article approved! redirecting to validation page...";
            con.Close();
            Response.AddHeader("REFRESH", "2;URL=Articles_Validate.aspx");
        }
    }
}