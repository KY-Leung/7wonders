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
            if (Session["id"] != null)
            {
                string str = Session["isAdmin"].ToString();
                if (str == "T")
                {
                    this.MasterPageFile = "~/admin.master";
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}