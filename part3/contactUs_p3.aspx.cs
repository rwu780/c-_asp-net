using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment3.part3
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
                    string name = nameTextBox_p3.Text;
                    string email = emailTextBox_p3.Text;
                    string phone = phoneTextBox_p3.Text;


                    outputLabel_p3.Text = "Thank you for your submission<br />" + "We received the following information:<br />";
                    outputLabel_p3.Text += String.Format("Name: {0}{1}E-mail: {2}{1}Phone:{3}", name, "<br />", email, phone);
                    outputLabel_p3.Visible = true;
                }
            }

        }
    }
}