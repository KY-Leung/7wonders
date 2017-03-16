using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
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
            //if (Session["id"] != null) Response.Redirect("articles.aspx");
            if (!this.IsPostBack)
            {
                if (this.Page.User.Identity.IsAuthenticated)
                {
                    FormsAuthentication.SignOut();
                    Response.Redirect("~/login.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //sqlString = "select * from account where username='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'";
            //SqlDataAdapter da = new SqlDataAdapter(sqlString, ConfigurationManager.ConnectionStrings["myDB"].ConnectionString);
            //DataSet ds = new DataSet();
            //da.Fill(ds);
            //DataTable dt = ds.Tables[0];

            //if (dt.Rows.Count > 0)
            //{
            //    Session["isAdmin"] = ds.Tables[0].Rows[0]["isAdmin"].ToString();
            //    FormsAuthentication.RedirectFromLoginPage(TextBox1.Text, false);
            //    Session.RemoveAll();
            //}
            //else
            //{
            //    Label1.Text = "You're username and password is incorrect. Please try again.";
            //    Label1.ForeColor = System.Drawing.Color.Red;
            //}

            int userId = 0;
            string roles = string.Empty;
            string constr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Validate_User"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Username", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@Password", TextBox2.Text);
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    reader.Read();
                    userId = Convert.ToInt32(reader["UserId"]);
                    roles = reader["Roles"].ToString();
                    con.Close();
                }
                switch (userId)
                {
                    case -1:
                        Label1.Text = "Username and/or password is incorrect.";
                        break;
                    case -2:
                        Label1.Text = "Account has not been activated.";
                        break;
                    default:
                        FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, TextBox1.Text, DateTime.Now, DateTime.Now.AddMinutes(2880), false, roles, FormsAuthentication.FormsCookiePath);
                        string hash = FormsAuthentication.Encrypt(ticket);
                        HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hash);

                        if (ticket.IsPersistent)
                        {
                            cookie.Expires = ticket.Expiration;
                        }
                        Response.Cookies.Add(cookie);
                        Response.Redirect(FormsAuthentication.GetRedirectUrl(TextBox1.Text, false));
                        break;
                }
            }
        }
    }
}