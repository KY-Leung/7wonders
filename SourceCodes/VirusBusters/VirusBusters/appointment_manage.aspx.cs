using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirusBusters
{
    public partial class appointment_manage : System.Web.UI.Page
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
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string userId = "1"; //insert session userId here
            Label1.Text = userId;
        }
    }
}