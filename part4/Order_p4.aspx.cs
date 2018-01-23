using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment3.part4
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Retrieve info
            initial();
            totalPrice();
        }

        protected void order(object sender, EventArgs e)
        {
            customize_p4.Visible = false;
            computerDrowDownList_p4.Visible = false;
            outputLabel_p4.Text = "Your order had been issued.";
            outputLabel_p4.Visible = true;

            var computer = computerLabel_p4.Text;
            var ram = ramLabel_p4.Text;
            var hd = hdLabel_p4.Text;
            var cpu = cpuLabel_p4.Text;
            var display = displayLabel_p4.Text;
            var os = osLabel_p4.Text;
            var soundcard = soundcardLabel_p4.Text;
            var totalPrice = totalpriceLabel_p4.Text;

            if (Session["userID"] == null)
            {
                //User had not login, need to create a cooke to store order information
                //Create cookie to store order information
                if (Request.Cookies["newOrder"] != null)
                {
                    Response.Cookies.Remove("newOrder");
                }
                HttpCookie newCookie = new HttpCookie("newOrder");
                newCookie["userId"] = (-1).ToString();
                newCookie["computer"] = computer;
                newCookie["ram"] = ram;
                newCookie["hd"] = hd;
                newCookie["cpu"] = cpu;
                newCookie["display"] = display;
                newCookie["os"] = os;
                newCookie["soundcard"] = soundcard;
                newCookie["totalPrice"] = totalPrice;
                newCookie.Expires.AddMinutes(30); //Cookie expired at 30 minutes. 
                Response.Cookies.Add(newCookie);

                Response.Redirect("signIn.aspx");
            }
            else
            {
                //User already log in
                DataClasses1DataContext db = new DataClasses1DataContext();

                var userID = Convert.ToInt32(Session["userID"]);
                orderTable newOrder = new orderTable();
                newOrder.userID = userID;
                newOrder.computer = computer;
                newOrder.ram = ram;
                newOrder.hd = hd;
                newOrder.display = display;
                newOrder.cpu = cpu;
                newOrder.soundcard = soundcard;
                newOrder.os = os;
                newOrder.totalPrice = totalPrice;

                db.orderTables.InsertOnSubmit(newOrder);
                db.SubmitChanges();
                Response.Redirect("viewOrders.aspx");


            }

        }



        protected void initial()
        {
            computerLabel_p4.Text = computerDrowDownList_p4.SelectedItem.Text;
            ramLabel_p4.Text = ramRadioButtonList_p4.SelectedItem.Text;
            hdLabel_p4.Text = hdRadioButtonList_p4.SelectedItem.Text;
            cpuLabel_p4.Text = cpuRadioButtonList_p4.SelectedItem.Text;
            displayLabel_p4.Text = displayRadioButtonList_p4.SelectedItem.Text;
            osLabel_p4.Text = osRadioButtonList_p4.SelectedItem.Text;
            soundcardLabel_p4.Text = soundcardRadioButtonList_p4.SelectedItem.Text;

        }

        protected void totalPrice()
        {
            double computer = Convert.ToDouble(computerDrowDownList_p4.SelectedItem.Value);
            double ram = Convert.ToDouble(ramRadioButtonList_p4.SelectedItem.Value);
            double hd = Convert.ToDouble(hdRadioButtonList_p4.SelectedItem.Value);
            double cpu = Convert.ToDouble(cpuRadioButtonList_p4.SelectedItem.Value);
            double display = Convert.ToDouble(displayRadioButtonList_p4.SelectedItem.Value);
            double os = Convert.ToDouble(osRadioButtonList_p4.SelectedItem.Value);
            double soundcard = Convert.ToDouble(soundcardRadioButtonList_p4.SelectedItem.Value);
            double total = computer + ram + hd + cpu + display + os + soundcard;
            totalpriceLabel_p4.Text = "$: " + total.ToString();
        }

        protected void updateComputer(object sender, EventArgs e)
        {
            computerLabel_p4.Text = computerDrowDownList_p4.SelectedItem.Text;
            totalPrice();
        }
        protected void updateRam(object sender, EventArgs e)
        {
            ramLabel_p4.Text = ramRadioButtonList_p4.SelectedItem.Text;
            totalPrice();
        }
        protected void updateHD(object sender, EventArgs e)
        {
            hdLabel_p4.Text = hdRadioButtonList_p4.SelectedItem.Text;
            totalPrice();
        }
        protected void updateCPU(object sender, EventArgs e)
        {
            cpuLabel_p4.Text = cpuRadioButtonList_p4.SelectedItem.Text;
            totalPrice();
        }
        protected void updateDisplay(object sender, EventArgs e)
        {
            displayLabel_p4.Text = displayRadioButtonList_p4.SelectedItem.Text;
            totalPrice();
        }
        protected void updateOS(object sender, EventArgs e)
        {
            osLabel_p4.Text = osRadioButtonList_p4.SelectedItem.Text;
            totalPrice();
        }
        protected void updateSoundcard(object sender, EventArgs e)
        {
            soundcardLabel_p4.Text = soundcardRadioButtonList_p4.SelectedItem.Text;
            totalPrice();
        }
    }
}