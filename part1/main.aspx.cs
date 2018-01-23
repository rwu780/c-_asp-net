using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment3.part1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int countClicks = 1;
            if (Request.Cookies["user"] != null)
            {

                if (Request.Cookies["user"]["count"] != null)
                {
                    countClicks = Int32.Parse(Request.Cookies["user"]["count"]);
                }
            }
            
            numberOfTimes.Text = countClicks.ToString();
            countClicks += 1;

            HttpCookie myCookie = new HttpCookie("user");
            myCookie["count"] = countClicks.ToString();
            myCookie.Expires = DateTime.Now.AddYears(100);
            Response.Cookies.Remove("user");
            Response.Cookies.Add(myCookie);

            var host = Dns.GetHostEntry(Dns.GetHostName());
            foreach (var ip in host.AddressList)
            {
                if (ip.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork)
                {
                    ipAddress.Text = ip.ToString();
                }
            }

            TimeZoneInfo localZone = TimeZoneInfo.Local;
            timeZone.Text = localZone.DisplayName;



        }
    }
}