using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment3.part3
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
            customize_p3.Visible = false;
            computerDrowDownList_p3.Visible = false;
            outputLabel_p3.Text = "You had had been issued.";
            outputLabel_p3.Visible = true;
        }

        protected void initial()
        {
            computerLabel_p3.Text = computerDrowDownList_p3.SelectedItem.Text;
            ramLabel_p3.Text = ramRadioButtonList_p3.SelectedItem.Text;
            hdLabel_p3.Text = hdRadioButtonList_p3.SelectedItem.Text;
            cpuLabel_p3.Text = cpuRadioButtonList_p3.SelectedItem.Text;
            displayLabel_p3.Text = displayRadioButtonList_p3.SelectedItem.Text;
            osLabel_p3.Text = osRadioButtonList_p3.SelectedItem.Text;
            soundcardLabel_p3.Text = soundcardRadioButtonList_p3.SelectedItem.Text;

        }

        protected void totalPrice()
        {
            double computer = Convert.ToDouble(computerDrowDownList_p3.SelectedItem.Value);
            double ram = Convert.ToDouble(ramRadioButtonList_p3.SelectedItem.Value);
            double hd = Convert.ToDouble(hdRadioButtonList_p3.SelectedItem.Value);
            double cpu = Convert.ToDouble(cpuRadioButtonList_p3.SelectedItem.Value);
            double display = Convert.ToDouble(displayRadioButtonList_p3.SelectedItem.Value);
            double os = Convert.ToDouble(osRadioButtonList_p3.SelectedItem.Value);
            double soundcard = Convert.ToDouble(soundcardRadioButtonList_p3.SelectedItem.Value);
            double total = computer + ram + hd + cpu + display + os + soundcard;
            totalpriceLabel_p3.Text = "$: " + total.ToString();
        }

        protected void updateComputer(object sender, EventArgs e)
        {
            computerLabel_p3.Text = computerDrowDownList_p3.SelectedItem.Text;
            totalPrice();
        }
        protected void updateRam(object sender, EventArgs e)
        {
            ramLabel_p3.Text = ramRadioButtonList_p3.SelectedItem.Text;
            totalPrice();
        }
        protected void updateHD(object sender, EventArgs e)
        {
            hdLabel_p3.Text = hdRadioButtonList_p3.SelectedItem.Text;
            totalPrice();
        }
        protected void updateCPU(object sender, EventArgs e)
        {
            cpuLabel_p3.Text = cpuRadioButtonList_p3.SelectedItem.Text;
            totalPrice();
        }
        protected void updateDisplay(object sender, EventArgs e)
        {
            displayLabel_p3.Text = displayRadioButtonList_p3.SelectedItem.Text;
            totalPrice();
        }
        protected void updateOS(object sender, EventArgs e)
        {
            osLabel_p3.Text = osRadioButtonList_p3.SelectedItem.Text;
            totalPrice();
        }
        protected void updateSoundcard(object sender, EventArgs e)
        {
            soundcardLabel_p3.Text = soundcardRadioButtonList_p3.SelectedItem.Text;
            totalPrice();
        }
    }
}