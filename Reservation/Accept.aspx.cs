using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reservation
{
    public partial class Accept : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try {
                Label1.Text = "Welcome " + Session["name"].ToString() + ",<br/>Your Reservation for " + Session["SourceDrop"].ToString() + " Guests and "
                    + Session["SourceDrop2"].ToString() + " Room(s) have been successfully booked.<br/>Your Arrival date is " + Session["checkin"].ToString() +
                    " and Departure Date is " + Session["checkout"].ToString() + "<br/> The total sum of " + Session["rate"].ToString() +
                    " has been succesfully deducted from your credit card, and your reservation details has been sent to your email address: " + Session["email"].ToString()
                    + ".<br/>We look Forward to seeing you.";
            }
            catch(Exception)
            {
                Label1.Text = "";
                Label1.Text = "<br/> Fill online form first";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Online.aspx", true);
        }
    }
}