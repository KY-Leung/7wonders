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
    public partial class appointment_new : System.Web.UI.Page
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
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string name = Request.Form["name"];


                DropDownList1.SelectedValue = name;
            }

            Label2.Text = "1"; // put user session ID here
            string query = "SELECT MAX(Id) FROM appointment ";
            int rows = Convert.ToInt32(RunCommand(query)) + 1;
            Label1.Text = rows.ToString();


        }

        public string RunCommand(string Query)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);

            SqlCommand com = new SqlCommand(Query, con);
            con.Open();
            string res = com.ExecuteScalar().ToString();
            con.Close();
            return res;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label3.Text = DateBox.Text;
            SqlDataSource2.Insert();
            Response.Redirect("appointment_manage.aspx");
        }


    }
}