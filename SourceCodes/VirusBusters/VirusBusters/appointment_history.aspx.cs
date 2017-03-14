using System;
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
            if (Session["id"] == null) this.MasterPageFile = "~/public.master";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}