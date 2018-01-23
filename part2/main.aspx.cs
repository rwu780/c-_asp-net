using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment3.part2
{
    public partial class main : System.Web.UI.Page
    {
        int picFORWARD = 0;
        int picBACKWARD = 1;
        int picSEQUENTIAL = 0;
        int picRANDOM = 1;
        int picSTART = 1;
        int picSTOP = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            int current;
            if (ViewState["current"] != null)
            {
                current = Convert.ToInt32(ViewState["current"]);
            }
            else
            {
                //First Time, load pictures
                ViewState["current"] = 0;
                ViewState["startStop"] = picSTART;
                ViewState["sequence"] = picSEQUENTIAL;
                ViewState["movement"] = picFORWARD;
                current = 0;
            }
            displayImage(current);
         }


        protected void refresh(Object sender, EventArgs e)
        {
            int current = Convert.ToInt32(ViewState["current"]);
            int movement = Convert.ToInt32(ViewState["movement"]);
            
            if(movement == picFORWARD)
            {
                current++;
            }else if(movement == picBACKWARD)
            {
                current--;
            }

            displayImage(current);
        }

        private void displayImage(int current)
        {
            var dataFile = Server.MapPath("picArray.txt");
            Array picArray = File.ReadAllLines(dataFile);

            int totL = picArray.Length - 1;
            int sequence = Convert.ToInt32(ViewState["sequence"]);

            if (sequence == picRANDOM)
            {
                Random rnd = new Random();
                current = rnd.Next(totL);
            }
            else if (sequence == picSEQUENTIAL)
            {

                if (current < 0)
                {
                    current = totL;
                }
                else if (current == picArray.Length)
                {
                    current = 0;
                }
            }
            ViewState["current"] = current;


            string dataLine = (string)picArray.GetValue(current);
            string[] dataItem = dataLine.Split('-');

            string url = dataItem[0].Trim();
            string cap = dataItem[1].Replace('"', ' ').Trim();
           
            myImage.ImageUrl = url;
            
            caption.Text = cap;
        }

        protected void updateSequence(Object sender, EventArgs e)

        {
            int sequence = Convert.ToInt32(ViewState["sequence"]);

            if (sequence == picSEQUENTIAL)
            {
                sequence = picRANDOM;
            }else if(sequence == picRANDOM)
            {
                sequence = picSEQUENTIAL;
            }
            ViewState["sequence"] = sequence;
        }

        protected void updateMovement(Object sender, EventArgs e)
        {
            int movement = Convert.ToInt32(ViewState["movement"]);

            if (movement == picFORWARD)
            {
                movement = picBACKWARD;
            }
            else if(movement == picBACKWARD)
            {
                movement = picFORWARD;
            }
            ViewState["movement"] = movement;
        }

        protected void updateStartStop(Object sender, EventArgs e)
        {
            int startStop = Convert.ToInt32(ViewState["startStop"]);

            if (startStop == picSTART)
            {
                //Stop Timer
                startStop = picSTOP;
                Timer1.Enabled = false;
                startStopButton.Text = "Start";
            }
            else if(startStop == picSTOP)
            {
                //Start Timer
                startStop = picSTART;
                startStopButton.Text = "Stop";
                Timer1.Enabled = true;
            }
            ViewState["startStop"] = startStop;
        }

        protected void nextImage(Object sender, EventArgs e)
        {
            int current = Convert.ToInt32(ViewState["current"]);
            int sequence = Convert.ToInt32(ViewState["sequence"]);

            if (sequence == picRANDOM)
            {
                System.Windows.Forms.MessageBox.Show("You need to in SEQUENTIAL Mode");
        
            }
            current++;

            displayImage(current);
        }

        protected void previousImage(Object sender, EventArgs e)
        {
            int current = Convert.ToInt32(ViewState["current"]);
            int sequence = Convert.ToInt32(ViewState["sequence"]);
            if(sequence == picRANDOM)
            {
                System.Windows.Forms.MessageBox.Show("You need to in SEQUENTIAL Mode");
            }
            current--;

            displayImage(current);

        }

    }
}