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
    public partial class symptom_checker : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT symptom FROM Symptoms"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        symptomsLB.DataSource = cmd.ExecuteReader();
                        symptomsLB.DataTextField = "symptom";
                        symptomsLB.DataBind();
                        con.Close();
                    }
                }
            }
           
        }



        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            int[] indexes = this.symptomsLB.GetSelectedIndices();
            string[] symptoms = new string[4];

            for (int i = 0; i < indexes.Length; i++)

                    symptoms[i] = this.symptomsLB.Items[indexes[i]].Text;


            Response.Redirect("symptom_checker_result.aspx?s1=" + symptoms[0] + "&s2=" + symptoms[1] + "&s3=" + symptoms[2] + "&s4=" + symptoms[3]);
        }
    }
}