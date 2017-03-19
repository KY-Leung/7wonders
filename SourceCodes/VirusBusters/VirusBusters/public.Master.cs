using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirusBusters
{
    public partial class Site3 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoginView LoginView1 = Page.Master.FindControl("LoginView1") as LoginView;
            if (LoginView1 != null)
            {
                Label usernameLabel = LoginView1.FindControl("usernameLabel") as Label;
                if (usernameLabel != null)
                {
                    usernameLabel.Text = "Welcome, " + user.Username;
                }
            }
        }
    }
}