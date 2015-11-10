using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Globalization;
using System.Threading;
using System.IO;
using System.Text;

namespace Reservation
{
    public partial class Online : System.Web.UI.Page
    {



        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked == true)
            {
                TextBox10.Text = TextBox4.Text + " " + TextBox3.Text;
            }
            if (CheckBox1.Checked == false)
            {
                TextBox10.Text = "";
            }
        }


        protected void Button2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/Online.aspx", true);

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                using (StreamWriter writer = new StreamWriter("C:\\Users\\Abisola Adeniran\\Desktop\\CustomerData.csv", false)) //// true to append data to the file
                {
                    writer.WriteLine("Checkin Date" + "," + "Checkout Date" + "," + "NoOfGuests" + "," +
                        "NoOfRooms" + "," + "Last Name" + "," + "First Name" + "," +  "2nd Name"
                        + "," + "Street Address" + "," + "City" + "," + "Country" + "," 
                        + "Province" + "," +"Postal Code" + "," + "Phone Number" + "," + "Email Address" + "," +
                        "Room Type" + "," + "Credit Card Type" + "," + "Name on Credit Card" + "," + 
                        "Credit Card No" + "," + "Expiration Date" + "," + "Amount"); //writer.NextLine();
                    writer.WriteLine(TextBox1.Text + "," + TextBox2.Text + "," + DropDownList1.Text + "," + DropDownList2.Text + ","
                        + TextBox3.Text + "," + TextBox4.Text + "," + TextBox13.Text + "," + TextBox5.Text + "," + TextBox6.Text
                        + "," + DropDownList3.Text + "," + DropDownList4.Text + "," + zipCode.Text + "," + TextBox8.Text + "," + 
                        TextBox9.Text + "," + DropDownList5.Text + "," + RadioButtonList1.Text + "," + TextBox10.Text + "," + 
                        TextBox11.Text + "," + TextBox12.Text + "," + Label30.Text);
                    writer.Close();
                }

                Session["name"] = TextBox4.Text;
                Session["checkin"] = TextBox1.Text;
                Session["checkout"] = TextBox2.Text;
                Session["SourceDrop"] = DropDownList1.SelectedItem;
                Session["SourceDrop2"] = DropDownList2.SelectedItem;
                Session["rate"] = Label30.Text;
                Session["email"] = TextBox9.Text;
                Server.Transfer("Accept.aspx", true);
            }
        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            Label29.Visible = false;
            Label30.Visible = false;
            DropDownList5.Items.Clear();
            if (TextBox1.Text != "")
            {
                DropDownList5.Items.Add(new ListItem("Select checkout date", "0"));
            }
        }
        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            Label29.Visible = false;
            Label30.Visible = false;
            DropDownList5.Items.Clear();
            if (TextBox1.Text != "" && TextBox2.Text != "")
            {
                DropDownList5.Items.Add(new ListItem("", "0"));
                DropDownList5.Items.Add(new ListItem("Single Room - $90", "1"));
                DropDownList5.Items.Add(new ListItem("Double Room - $120", "2"));
                DropDownList5.Items.Add(new ListItem("Superior Room - $170", "3"));
                DropDownList5.Items.Add(new ListItem("Suite - $280", "4"));
            }
        }

        protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {
            double singlerate = 90.00;
            double doublerate = 120.00;
            double superiorrate = 170.00;
            double suiterate = 280.00;
            DateTime checkin = Convert.ToDateTime(TextBox1.Text);
            DateTime checkout = Convert.ToDateTime(TextBox2.Text);
            TimeSpan t = checkout - checkin;
            double diffdate = t.TotalDays;
            double number = Convert.ToDouble(DropDownList1.SelectedValue);
            double number2 = Convert.ToDouble(DropDownList2.SelectedValue);
            if (DropDownList5.SelectedIndex == 1)
            {
                double rate = singlerate * number2 * diffdate;
                Label29.Visible = true;
                Label30.Text = "$" + rate;
                Label34.Text = " for " + diffdate + " days.";
                Label30.Visible = true; Label34.Visible = true;
            }
            if (DropDownList5.SelectedIndex == 2)
            {
                double rate = doublerate * number * number2 * diffdate;
                Label29.Visible = true;
                Label30.Text = "$" + rate;
                Label34.Text = " for " + diffdate + " days.";
                Label30.Visible = true; Label34.Visible = true;
            }
            if (DropDownList5.SelectedIndex == 3)
            {
                double rate = superiorrate * number * number2 * diffdate;
                Label29.Visible = true;
                Label30.Text = "$" + rate;
                Label34.Text = " for " + diffdate + " days.";
                Label30.Visible = true; Label34.Visible = true;
            }
            if (DropDownList5.SelectedIndex == 4)
            {
                double rate = suiterate * number * number2 * diffdate;
                Label29.Visible = true;
                Label30.Text = "$" + rate;
                Label34.Text = " for " + diffdate + " days.";
                Label30.Visible = true; Label34.Visible = true;
            }

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedIndex == 1)
            {
                Label31.Visible = true;
                Label32.Visible = true;
                TextBox13.Visible = true;
                RegularExpressionValidator12.Enabled = true;
                RequiredFieldValidator17.Enabled = true;
            }
            if (DropDownList2.SelectedIndex == 0)
            {
                Label31.Visible = false;
                Label32.Visible = false;
                TextBox13.Visible = false;
                RegularExpressionValidator12.Enabled = false;
                RequiredFieldValidator17.Enabled = false;
            }
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            CultureInfo cultureInfo = Thread.CurrentThread.CurrentCulture;
            TextInfo textInfo = cultureInfo.TextInfo;
            string upcase = TextBox3.Text;
            TextBox3.Text = (textInfo.ToTitleCase(upcase));
        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {
            CultureInfo cultureInfo = Thread.CurrentThread.CurrentCulture;
            TextInfo textInfo = cultureInfo.TextInfo;
            string upcase = TextBox4.Text;
            TextBox4.Text = (textInfo.ToTitleCase(upcase));
        }

        protected void TextBox6_TextChanged(object sender, EventArgs e)
        {
            CultureInfo cultureInfo = Thread.CurrentThread.CurrentCulture;
            TextInfo textInfo = cultureInfo.TextInfo;
            string upcase = TextBox6.Text;
            TextBox6.Text = (textInfo.ToTitleCase(upcase));
        }

        protected void TextBox8_TextChanged(object sender, EventArgs e)
        {
            string phone = TextBox8.Text;
            TextBox8.Text = string.Format("({0}) {1}-{2}", phone.Substring(0, 3), phone.Substring(3, 3), phone.Substring(6));
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList4.Items.Clear();
            if (DropDownList3.SelectedIndex == 1)
            {
                DropDownList4.Items.Add(new ListItem("", "0"));
                DropDownList4.Items.Add(new ListItem("Alberta", "AB"));
                DropDownList4.Items.Add(new ListItem("British Columbia", "BC"));
                DropDownList4.Items.Add(new ListItem("Manitoba", "MB"));
                DropDownList4.Items.Add(new ListItem("New Brunswick", "NB"));
                DropDownList4.Items.Add(new ListItem("Newfoundland and Labrador", "NL"));
                DropDownList4.Items.Add(new ListItem("Northwest Territories", "NT"));
                DropDownList4.Items.Add(new ListItem("Nova Scotia", "NS"));
                DropDownList4.Items.Add(new ListItem("Nunavut", "NU"));
                DropDownList4.Items.Add(new ListItem("Ontario", "ON"));
                DropDownList4.Items.Add(new ListItem("Prince Edward Island", "PE"));
                DropDownList4.Items.Add(new ListItem("Quebec", "QC"));
                DropDownList4.Items.Add(new ListItem("Saskatchewan", "SK"));
                DropDownList4.Items.Add(new ListItem("Yukon Territory", "YT"));

            }
            if (DropDownList3.SelectedIndex == 2)
            {
                DropDownList4.Items.Add(new ListItem("", "0"));
                DropDownList4.Items.Add(new ListItem("Alabama", "AL"));
                DropDownList4.Items.Add(new ListItem("Alaska", "AK"));
                DropDownList4.Items.Add(new ListItem("Arizona", "AL"));
                DropDownList4.Items.Add(new ListItem("Arkansas", "AR"));
                DropDownList4.Items.Add(new ListItem("California", "CA"));
                DropDownList4.Items.Add(new ListItem("Colorado", "CO"));
                DropDownList4.Items.Add(new ListItem("Connecticut", "CT"));
                DropDownList4.Items.Add(new ListItem("District of Columbia", "DC"));
                DropDownList4.Items.Add(new ListItem("Delaware", "DE"));
                DropDownList4.Items.Add(new ListItem("Florida", "FL"));
                DropDownList4.Items.Add(new ListItem("Georgia", "GA"));
                DropDownList4.Items.Add(new ListItem("Hawaii", "HI"));
                DropDownList4.Items.Add(new ListItem("Idaho", "ID"));
                DropDownList4.Items.Add(new ListItem("Illinois", "IL"));
                DropDownList4.Items.Add(new ListItem("Indiana", "14"));
                DropDownList4.Items.Add(new ListItem("Iowa", "IA"));
                DropDownList4.Items.Add(new ListItem("Kansas", "KS"));
                DropDownList4.Items.Add(new ListItem("Kentucky", "KY"));
                DropDownList4.Items.Add(new ListItem("Louisiana", "LA"));
                DropDownList4.Items.Add(new ListItem("Maine", "ME"));
                DropDownList4.Items.Add(new ListItem("Maryland", "MD"));
                DropDownList4.Items.Add(new ListItem("Massachusetts", "MA"));
                DropDownList4.Items.Add(new ListItem("Michigan", "MI"));
                DropDownList4.Items.Add(new ListItem("Minnesota", "MN"));
                DropDownList4.Items.Add(new ListItem("Mississippi", "MS"));
                DropDownList4.Items.Add(new ListItem("Missouri", "MO"));
                DropDownList4.Items.Add(new ListItem("Montana", "MT"));
                DropDownList4.Items.Add(new ListItem("Nebraska", "NE"));
                DropDownList4.Items.Add(new ListItem("Nevada", "NV"));
                DropDownList4.Items.Add(new ListItem("New Hampshire", "NH"));
                DropDownList4.Items.Add(new ListItem("New Jersey", "NJ"));
                DropDownList4.Items.Add(new ListItem("New Mexico", "NM"));
                DropDownList4.Items.Add(new ListItem("New York", "NY"));
                DropDownList4.Items.Add(new ListItem("North Carolina", "NC"));
                DropDownList4.Items.Add(new ListItem("North Dakota", "ND"));
                DropDownList4.Items.Add(new ListItem("Ohio", "OH"));
                DropDownList4.Items.Add(new ListItem("Oklahoma", "OK"));
                DropDownList4.Items.Add(new ListItem("Oregon", "OR"));
                DropDownList4.Items.Add(new ListItem("Pennsylvania", "PA"));
                DropDownList4.Items.Add(new ListItem("Rhode Island", "RI"));
                DropDownList4.Items.Add(new ListItem("South Carolina", "SC"));
                DropDownList4.Items.Add(new ListItem("South Dakota", "SD"));
                DropDownList4.Items.Add(new ListItem("Tennessee", "TN"));
                DropDownList4.Items.Add(new ListItem("Texas", "TX"));
                DropDownList4.Items.Add(new ListItem("Utah", "UT"));
                DropDownList4.Items.Add(new ListItem("Vermont", "VT"));
                DropDownList4.Items.Add(new ListItem("Virginia", "VA"));
                DropDownList4.Items.Add(new ListItem("Washington", "WA"));
                DropDownList4.Items.Add(new ListItem("West Virginia", "WV"));
                DropDownList4.Items.Add(new ListItem("Wisconsin", "WI"));
                DropDownList4.Items.Add(new ListItem("Wyoming", "WY"));
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedIndex == 0)
            {
                TextBox11.Text = "";
                TextBox11.Enabled = true;
            }
            if (RadioButtonList1.SelectedIndex == 1)
            {
                TextBox11.Text = "";
                TextBox11.Enabled = true;
            }
            if (RadioButtonList1.SelectedIndex == 2)
            {
                TextBox11.Text = "";
                TextBox11.Enabled = true;
            }
        }

        /*
        public void CreatingCsvFiles()
        {
            string filePath = "Your path of the location" + "filename.csv";
            if (!File.Exists(filePath))
            {
                File.Create(filePath).Close();
            }
            string delimiter = ",";
            string[][] output = new string[][]{
            new string[]{"Value1","Value2","Value3","Value4"} //add the values that you want inside a csv file. Mostly this function can be used in a foreach loop.
            };
            int length = output.GetLength(0);
            StringBuilder sb = new StringBuilder();
            for (int index = 0; index < length; index++)
                sb.AppendLine(string.Join(delimiter, output[index]));
            File.AppendAllText(filePath, sb.ToString());
        }*/

    }
}