using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace VirusBusters
{
    public partial class login : System.Web.UI.Page
    {
        protected string sqlString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null) Response.Redirect("articles.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            sqlString = "select * from account where username='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(sqlString, ConfigurationManager.ConnectionStrings["myDB"].ConnectionString);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataTable dt = ds.Tables[0];

            if (dt.Rows.Count > 0)
            {
                Session["id"] = TextBox1.Text;
                Session["isAdmin"] = ds.Tables[0].Rows[0]["isAdmin"].ToString();
                Response.Redirect("articles.aspx");
                Session.RemoveAll();
            }
            else
            {
                Label1.Text = "You're username and password is incorrect. Please try again.";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}