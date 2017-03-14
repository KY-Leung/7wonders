﻿using FireSharp.Config;
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
    public partial class article : System.Web.UI.Page
    {
        string username;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null) Response.Redirect("login.aspx");
            usernameLabel.Text = Session["id"].ToString();
            myLink.Attributes["href"] = "logout.aspx";
        }
    }
}