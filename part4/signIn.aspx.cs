using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment3.part4
{
    public partial class signIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["userID"] != null)
            {
                signInContent.Visible = false;
                registerContent.Visible = false;
                recoverPasswordContent.Visible = false;
                Response.Redirect("viewOrders.aspx");
            }
        }

        protected void signInButtonClicked(object sender, EventArgs e)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();
            var uname = usernameTextBox.Text;
            if(uname == "" || uname == null)
            {
                signInErrorLabel.Text = "Invalide username";
                signInErrorLabel.Visible = true;
                return;
            }
            var pword = passwordTextBox.Text;
            if (pword == "" || pword == null)
            {
                signInErrorLabel.Text = "Invalide password";
                signInErrorLabel.Visible = true;
                return;
            }
            var query = from u in db.userInfos where u.username == uname && u.password == pword select u.Id; 

            if(Enumerable.Count(query) == 1)
            {        
                var q = Enumerable.First(query);
                Session["userID"] = q.ToString();
                addNewOrder();
            }
            else
            {
                signInErrorLabel.Text = "Invalid username and/or password";
                signInErrorLabel.Visible = true;
            }
        }

        protected void registerButtonClicked(object sender, EventArgs e)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();
            var uname = registerUsername.Text;
            var pword = registerPassword.Text;

            var query = from u in db.userInfos where u.username == uname select u.Id;

            if (Enumerable.Count(query) > 0)
            {
                registerErrorLabel.Text = "Username already exists";
                registerErrorLabel.Visible = true;
            }
            else
            {
                userInfo newUser = new userInfo();
                newUser.username = uname;
                newUser.password = pword;
                db.userInfos.InsertOnSubmit(newUser);
                db.SubmitChanges();

                query = from u in db.userInfos where u.username == uname select u.Id;

                var q = Enumerable.First(query);
                Session["userID"] = q.ToString();
                addNewOrder();

                registerErrorLabel.Text = "Success";
                registerErrorLabel.Visible = true;
            }
        }

        protected void recoverButtonClicked(object sender, EventArgs e)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();
            var uname = recoverUsername.Text;

            var query = from u in db.userInfos where u.username == uname select u.password;

            if(Enumerable.Count(query) > 0)
            {
                var pword = query.First();
                recoverLabel.Text = "Password: " + pword;
                recoverLabel.Visible = true; 
            }
            else
            {
                recoverLabel.Text = "Username do not exists";
                recoverLabel.Visible = true;
            }
        }

        protected void registerLinkButtonClicked(object sender, EventArgs e)
        {
            signInContent.Visible = false;
            registerContent.Visible = true;
            recoverPasswordContent.Visible = false;
        }

        protected void recoverPasswordLinkButtonClicked(object sender, EventArgs e)
        {
            signInContent.Visible = false;
            registerContent.Visible = false;
            recoverPasswordContent.Visible = true;
        }

        private void addNewOrder()
        {
            if (Request.Cookies["newOrder"] == null)
            {
                //No new order
            }
            else
            {
                HttpCookie newCookie = Request.Cookies["newOrder"];

                DataClasses1DataContext db = new DataClasses1DataContext();
                var userID = Convert.ToInt32(Session["userID"]);
                orderTable newOrder = new orderTable();
                newOrder.userID = userID;
                newOrder.computer = newCookie["computer"];
                newOrder.ram = newCookie["ram"];
                newOrder.hd = newCookie["hd"];
                newOrder.display = newCookie["display"];
                newOrder.cpu = newCookie["cpu"];
                newOrder.soundcard = newCookie["soundcard"];
                newOrder.os = newCookie["os"];
                newOrder.totalPrice = newCookie["totalPrice"];

                db.orderTables.InsertOnSubmit(newOrder);
                db.SubmitChanges();

                Response.Cookies.Remove("newOrder");
            }
            Response.Redirect("viewOrders.aspx");

        }
    }
}