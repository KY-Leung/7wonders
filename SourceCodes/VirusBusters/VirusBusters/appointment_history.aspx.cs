﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirusBusters
{
    public partial class appointment_history : System.Web.UI.Page
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
        }
    }
}