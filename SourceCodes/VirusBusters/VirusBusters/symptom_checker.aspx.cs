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
    public partial class symptom_checker : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    
                    StringBuilder comments = new StringBuilder();
                    try
                    {
                        con.Open();
                        SqlCommand cmd2 = new SqlCommand("SELECT DISTINCT symptom FROM Symptoms", con);
                        SqlDataReader commentdata = cmd2.ExecuteReader();
                        int i = 0;
                        
                        while (commentdata.Read())
                        {
                            comments.Append("<option value = '"+ commentdata.GetValue(0) + "' >"+commentdata.GetValue(0)+" </option>");
                            i++;

                        }
                        SymContainer.Controls.Add(new Literal { Text = comments.ToString() });

                    }
                    catch (SqlException ex)
                    {

                    }
                    con.Close();

                }
            }
           
        }
    }
}