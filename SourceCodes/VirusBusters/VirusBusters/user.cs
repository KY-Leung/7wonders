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
        }
    }
}