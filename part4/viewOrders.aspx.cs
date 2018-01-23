using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment3.part4
{
    public partial class viewOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["userID"] == null)
            {
                Response.Redirect("signIn.aspx");
            }
           

        }

        protected void deleteSelectedProducts_Clicks(object sender, EventArgs e)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();

            foreach (GridViewRow row in orderGridView.Rows)
            {
                CheckBox cb = (CheckBox)row.FindControl("cbSelect");
                if (cb != null && cb.Checked == true)
                {
                    //Delete row!
                    int id = Convert.ToInt32(row.Cells[1].Text);
                    
                    orderTable del = db.orderTables.Single(c => c.Id == id);
                    db.orderTables.DeleteOnSubmit(del);
                    db.SubmitChanges();

                    orderGridView.DataBind();

                }
            }
        }
    }
}