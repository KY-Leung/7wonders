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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null) Response.Redirect("login.aspx");
            usernameLabel.Text = Session["id"].ToString();
            myLink.Attributes["href"] = "logout.aspx";
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
                    SqlCommand cmd = new SqlCommand("insert into article(userid,content,image_upload,isApproved) values('" + Session["id"].ToString() + "','" + content + "','" + upfilename + "','N')", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    msgLbl.Visible = true;
                    msgLbl.Text = "Article Has been submitted for vetting.. redirecting to article page..";
                    con.Close();
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("insert into article(userid,content,isApproved) values('" + Session["id"].ToString() + "','" + content + "',','N')", con);
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