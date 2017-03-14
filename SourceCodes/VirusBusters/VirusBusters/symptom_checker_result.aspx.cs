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
    public partial class symptom_checker_result : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["id"] != null) this.MasterPageFile = "~/admin.master";
        }

        protected string test;
        protected void Page_Load(object sender, EventArgs e)
        {
            test = Request.Form["my_multi_select2"].ToString();
            Testing.Text = test;
        }
    }
}