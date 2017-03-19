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
using System.Configuration;
using System.Data;
using System.Text;

namespace VirusBusters
{
    public partial class article_details : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            bool isLoggedIn = (System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            if (isLoggedIn)
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
                        break;
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
                if(articledata.GetValue(3).ToString() != "")
                {
                    ArticleImg.ImageUrl = "../Article_img/" + articledata.GetValue(3).ToString();
                    ArticleImg.Visible = true;
                }
                
                ArticleDesc.InnerHtml = articledata.GetValue(2).ToString();
                ArticleDate.InnerHtml = articledata.GetValue(6).ToString().ToString();

            }
            articledata.Close();

            StringBuilder comments = new StringBuilder();
            try
            {
                SqlCommand cmd2 = new SqlCommand("SELECT * FROM comments WHERE a_id = '" + a_id +"';", con);
                SqlDataReader commentdata = cmd2.ExecuteReader();
                while (commentdata.Read())
                {
                    comments.Append("<div class=\"c-comment-list\">");
                    comments.Append("<div class=\"media\">");
                    comments.Append("<div class=\"media-body\">");
                    comments.Append("<h4 class=\"media-heading\">" + commentdata.GetValue(3).ToString() + " on " + commentdata.GetValue(4).ToString() + "</h4>");
                    comments.Append(commentdata.GetValue(2).ToString());
                    comments.Append("</div></div></div><br/>");
                    
                }
                CommentConatiner.Controls.Add(new Literal { Text = comments.ToString() });

            }
            catch (SqlException ex)
            {

            }

            con.Close();

        }

        protected void submit_btn_Click(object sender, EventArgs e)
        {
            string a_id = Request.QueryString["aid"];
            string name = nameTB.Value;
            string comment = msgTB.Value;
            string datetime = DateTime.Now.ToString("D");
            string connectionString = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO comments(a_id,comment,submitby,dateime) VALUES ('" + a_id + "','" + comment + "','" + name + "','" + datetime +"')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Page_Load(null, null);
            //Response.Redirect("article_details.aspx?a_id=" + a_id);
        }
    }
}