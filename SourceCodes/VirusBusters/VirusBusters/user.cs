using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VirusBusters
{
    public static class user
    {
        public static string Username
        {
            get { return HttpContext.Current.User.Identity.Name; }
        }

        public static string role
        {
            get
            {
                bool isLoggedIn = (System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
                if (isLoggedIn)
                {
                    switch (Username.Substring(0, 5))
                    {
                        case "admin":
                            return "admin";
                        case "mprof":
                            return "mprof";
                        default:
                            return "user";
                    }
                }
                return "user";
            }
        }
    }
}