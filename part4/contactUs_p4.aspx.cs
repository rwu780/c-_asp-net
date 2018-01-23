using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment3.part4
{
    public partial class contactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Validate();
                if (IsValid)
                {
                    string name = nameTextBox_p4.Text;
                    string email = emailTextBox_p4.Text;
                    string phone = phoneTextBox_p4.Text;


                    outputLabel_p4.Text = "Thank you for your submission<br />" + "We received the following information:<br />";
                    outputLabel_p4.Text += String.Format("Name: {0}{1}E-mail: {2}{1}Phone:{3}", name, "<br />", email, phone);
                    outputLabel_p4.Visible = true;
                }
            }

        }
    }
}