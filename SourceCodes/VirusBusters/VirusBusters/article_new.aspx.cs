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
    public partial class article_new : System.Web.UI.Page
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
                    Response.Redirect("noaccess.html");
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            string content = art_content.Value.ToString();
            if (content != "")
            {
                if (img_up.HasFile)
                {
                    string fileext = System.IO.Path.GetExtension(this.img_up.PostedFile.FileName);
                    string upfilename = DateTime.Now.ToString("yyyyMMddHHmmss").ToString() + fileext;
                    img_up.PostedFile.SaveAs(Server.MapPath("~/Article_Img/") + upfilename);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("insert into article(userid,content,image_upload,isApproved) values('" + HttpContext.Current.User.Identity.Name + "','" + content + "','" + upfilename + "','N')", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    msgLbl.Visible = true;
                    msgLbl.Text = "Article Has been submitted for vetting.. redirecting to article page..";
                    con.Close();
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("insert into article(userid,content,isApproved) values('" + HttpContext.Current.User.Identity.Name + "','" + content + "','N')", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    msgLbl.Visible = true;
                    msgLbl.Text = "Article Has been submitted for vetting.. redirecting to article page..";
                    con.Close();

                }
                Response.AddHeader("REFRESH", "2;URL=articles.aspx");
            }
            else
            {
                errorMsg.Text = "Please type in your articel content!";
                errorMsg.Visible = true;
            }
        }
    }
}