<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="Online.aspx.cs" Inherits="Reservation.Online" %>
<script runat="server">
 
    protected void Dates1Validator_Validate(object source, ServerValidateEventArgs e)
    {
        if ((TextBox1.Text != ""))
        {
            DateTime endDate = Convert.ToDateTime(TextBox1.Text);
            if (endDate < DateTime.Today)
            {
                e.IsValid = false;
            }

        }
    }
    protected void Dates2Validator_Validate(object source, ServerValidateEventArgs e)
    {
        if ((TextBox1.Text != "") && (TextBox2.Text != ""))
        {

            DateTime startDate = Convert.ToDateTime(TextBox1.Text);
            DateTime endDate = Convert.ToDateTime(TextBox2.Text);
            if (endDate < DateTime.Today)
            {

                e.IsValid = false;
                CustomValidator2.ErrorMessage = "Date cannot be less than Today's date";
            }


            if (endDate <= startDate)
            {

                e.IsValid = false;
                CustomValidator2.Visible = true;
                CustomValidator2.ErrorMessage = "Date cannot be less than Check in date";
            }

        }
    }
    protected void Dates3Validator_Validate(object source, ServerValidateEventArgs e)
    {
        if ((TextBox12.Text != ""))
        {

            DateTime last = new DateTime(2030, 12, 31);
            DateTime endDate = Convert.ToDateTime(TextBox12.Text);
            if (endDate <= DateTime.Today || endDate > last)
            {
                e.IsValid = false;
            }
        }
    }
    public void Page_Load()
    {
        TextBox1_CalendarExtender.StartDate = DateTime.Now;
        TextBox2_CalendarExtender.StartDate = DateTime.Now;
        if (DropDownList3.SelectedIndex == 1)
        {
            validZipCode.ValidationExpression = @"^[A-Za-z]\d[A-Za-z]\s*\d[a-zA-Z]\d$";
            validZipCode.ErrorMessage = "Enter a valid Canada Postal Code";
        }
        if (DropDownList3.SelectedIndex == 2)
        {
            validZipCode.ValidationExpression = @"^\d{5}(-\d{4})?$";
            validZipCode.ErrorMessage = "Enter a valid US zip Code";
        }
        if (RadioButtonList1.SelectedIndex == 0)
        {
            validCard.ValidationExpression = "^4[0-9]{12}(?:[0-9]{3})?$";
            validCard.ErrorMessage = "Enter a valid Visa Card Number";
        }
        if (RadioButtonList1.SelectedIndex == 1)
        {
            validCard.ValidationExpression = "^5[1-5][0-9]{14}$";
            validCard.ErrorMessage = "Enter a valid Master Card Number";
        }
        if (RadioButtonList1.SelectedIndex == 2)
        {
            validCard.ValidationExpression = "^3[47][0-9]{13}$";
            validCard.ErrorMessage = "Enter a valid Express Number";
        }

    }


</script>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 923px;
            width: 781px;
            border: solid;
        }

        h1 {
            background-color: linen;
            height: 40px;
        }

        body {
            background-color: white;
        }
    </style>
</head>
<body style="height: 907px; width: 783px; margin-right: 153px;">
    <form id="form1" runat="server">
        <h1>&nbsp;ABET HOTEL &amp; SUITES</h1>
        <p class="lead">&nbsp; ABET Hotel &amp; Suites&nbsp; is dedicated to customers satisfaction at all times. Book one of our rooms today for an unforgettable experience.</p>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <p>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Black" Style="z-index: 1; left: 21px; top: 138px; position: absolute" Text="Online Reservation"></asp:Label>
            <asp:Label ID="Label33" runat="server" Style="z-index: 1; left: 320px; top: 257px; position: absolute" Text="Please enter a valid date!!!" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" Visible="False"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Style="z-index: 1; left: 24px; top: 193px; position: absolute" Text="Reservation Information"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Style="z-index: 1; left: 24px; top: 225px; position: absolute; height: 19px;" Text="Check-In Date: "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Style="z-index: 1; top: 225px; position: absolute; width: 132px; height: 20px; left: 153px;" OnTextChanged="TextBox1_TextChanged" TabIndex="1" AutoPostBack="True"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" BehaviorID="TextBox1_CalendarExtender" DefaultView="Days" PopupPosition="BottomLeft" TargetControlID="TextBox1" />
            <asp:ImageButton ID="Image2" runat="server" ImageUrl="~/calendar_icon1.png" OnClientClick="$find('TextBox1_CalendarExtender').show();return false;" Style="z-index: 1; left: 289px; top: 226px; position: absolute; height: 20px; width: 17px; bottom: 247px;" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required Field!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 472px; top: 221px; position: absolute; margin-top: 5px" Font-Size="X-Small"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator1" runat="server" OnServerValidate="Dates1Validator_Validate" ErrorMessage="Please enter a valid date!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 321px; top: 226px; position: absolute; width: 201px; height: 19px;" ControlToValidate="TextBox1" Font-Size="X-Small"></asp:CustomValidator>
        </p>
        <p>
            <asp:ImageButton ID="Image3" runat="server" ImageUrl="~/calendar_icon1.png" OnClientClick="$find('TextBox2_CalendarExtender').show();return false;" Style="z-index: 1; left: 289px; top: 256px; position: absolute; height: 20px; width: 17px;" />
            <asp:TextBox ID="TextBox2" runat="server" Style="z-index: 1; left: 153px; top: 254px; position: absolute; width: 132px; height: 20px;" TabIndex="2" OnTextChanged="TextBox2_TextChanged" AutoPostBack="True"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" TargetControlID="TextBox2" />
            <asp:CustomValidator ID="CustomValidator2" runat="server" OnServerValidate="Dates2Validator_Validate" ErrorMessage="Please enter a valid date!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 320px; top: 257px; position: absolute; width: 331px" ControlToValidate="TextBox2" Font-Size="X-Small"></asp:CustomValidator>
            <asp:Label ID="Label4" runat="server" Style="z-index: 1; left: 23px; top: 256px; position: absolute" Text="Check-Out Date: "></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox2" ErrorMessage="Required Field!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 474px; top: 241px; position: absolute; width: 124px; margin-top: 15px" Font-Size="X-Small"></asp:RequiredFieldValidator>
            <asp:TextBox ID="TextBox13" runat="server" Style="z-index: 1; left: 551px; top: 357px; position: absolute; width: 221px" Visible="False"></asp:TextBox>
            <asp:Label ID="Label31" runat="server" Font-Bold="True" Style="z-index: 1; left: 476px; top: 338px; position: absolute" Text="2nd Guest Information" Visible="False"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" Style="z-index: 1; left: 23px; top: 285px; position: absolute" Text="Number of Guests: "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" Style="z-index: 1; top: 283px; position: absolute; left: 155px; bottom: 71px; height: 22px; width: 38px;" TabIndex="3" AutoPostBack="True">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="Label6" runat="server" Style="z-index: 1; left: 24px; top: 311px; position: absolute; margin-top: 2px" Text="Number of Rooms: "></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" Style="z-index: 1; top: 310px; position: absolute; left: 155px; height: 22px; width: 38px;" TabIndex="4" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="TextBox13" ErrorMessage="Required!!!" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" Style="z-index: 1; left: 688px; top: 380px; position: absolute; height: 12px" Enabled="False"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ValidationExpression="^([A-Z][a-z]*((\s)))+[A-Z][a-z]*$" ControlToValidate="TextBox13" ErrorMessage="Enter a Valid Name!!!" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" Style="z-index: 1; left: 549px; top: 380px; position: absolute" Enabled="False"></asp:RegularExpressionValidator>
        </p>
        <p>
            <asp:Label ID="Label7" runat="server" Font-Bold="True" Style="z-index: 1; left: 23px; top: 338px; position: absolute" Text="Contact Information"></asp:Label>
        </p>
        <p style="height: 21px">
            <asp:Label ID="Label10" runat="server" Style="z-index: 1; left: 23px; top: 394px; position: absolute; width: 83px;" Text="First Name: "></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" Style="z-index: 1; left: 131px; top: 395px; position: absolute; width: 221px; height: 20px;" TabIndex="6" AutoCompleteType="FirstName" AutoPostBack="True" OnTextChanged="TextBox4_TextChanged"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter a Valid name!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 131px; top: 420px; position: absolute" ControlToValidate="TextBox4" ValidationExpression="^[A-Z][a-zA-Z]*$" Font-Size="X-Small"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox4" ErrorMessage="Required Field!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 357px; top: 382px; position: absolute; width: 127px; margin-top: 15px" Font-Size="X-Small"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="Label9" runat="server" Style="z-index: 1; left: 24px; top: 359px; position: absolute; width: 97px;" Text="Last Name: "></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" Style="z-index: 1; left: 131px; top: 357px; position: absolute; width: 221px; height: 20px;" TabIndex="5" AutoPostBack="True" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Enter a Valid name!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 131px; top: 382px; position: absolute; height: 19px; margin-top: 0px;" ControlToValidate="TextBox3" ValidationExpression="^[A-Z][a-zA-Z]*$" Font-Size="X-Small"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox3" ErrorMessage="Required Field!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 359px; top: 345px; position: absolute; width: 127px; margin-top: 15px" Font-Size="X-Small"></asp:RequiredFieldValidator>
            <asp:Label ID="Label32" runat="server" Style="z-index: 1; left: 470px; top: 357px; position: absolute" Text="Full Name: " Visible="False"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label12" runat="server" Style="z-index: 1; left: 22px; top: 433px; position: absolute" Text="Street Address:"></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server" Style="z-index: 1; left: 130px; top: 433px; position: absolute; width: 343px; height: 20px;" TabIndex="7"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox5" ErrorMessage="Input an Address!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 574px; top: 435px; position: absolute; width: 163px;" Font-Size="X-Small"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ErrorMessage="Wrong Format!!!" ValidationExpression="^[\d]{1,3}[^,;]\s[a-zA-Z]{2,30}\s[^,;][a-zA-Z]{2,15}[^,;]$" Style="z-index: 1; left: 477px; top: 435px; position: absolute" ControlToValidate="TextBox5" Font-Bold="True" ForeColor="Red" Font-Size="X-Small"></asp:RegularExpressionValidator>
        </p>
        <p>
            <asp:TextBox ID="TextBox6" runat="server" Style="z-index: 1; left: 130px; top: 463px; position: absolute; width: 162px; height: 20px;" TabIndex="8" AutoPostBack="True" OnTextChanged="TextBox6_TextChanged"></asp:TextBox>
            <asp:Label ID="Label25" runat="server" Style="z-index: 1; left: 21px; top: 464px; position: absolute" Text="City:"></asp:Label>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter a Valid City name!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 303px; top: 463px; position: absolute; height: 19px;" ControlToValidate="TextBox6" ValidationExpression="^[A-Z][a-zA-Z]*$" Font-Size="X-Small"></asp:RegularExpressionValidator>
        </p>
        <p>
            <asp:Label ID="Label14" runat="server" Style="z-index: 1; left: 20px; top: 552px; position: absolute" Text="Postal/Zip Code: "></asp:Label>
            <asp:TextBox ID="zipCode" runat="server" Style="z-index: 1; left: 129px; top: 551px; position: absolute; height: 20px; width: 128px;" TabIndex="11"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="zipCode" ErrorMessage="Required Field!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 398px; top: 538px; position: absolute; width: 127px; margin-top: 15px" Font-Size="X-Small"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="validZipCode" runat="server" ControlToValidate="zipCode" ErrorMessage="Wrong Format!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 297px; top: 553px; position: absolute" Font-Size="X-Small"></asp:RegularExpressionValidator>
        </p>
        <p>
            <asp:Label ID="Label11" runat="server" Style="z-index: 1; left: 20px; top: 524px; position: absolute" Text="Province/State: "></asp:Label>
            <asp:DropDownList ID="DropDownList4" runat="server" Style="z-index: 1; left: 129px; top: 521px; position: absolute; height: 25px; width: 180px;" TabIndex="10">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>Select a Country</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Select a Province!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 373px; top: 522px; position: absolute" ControlToValidate="DropDownList4" Font-Size="X-Small"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="DropDownList5" ErrorMessage="Required!!!" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" Style="z-index: 1; left: 295px; top: 664px; position: absolute"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="Label17" runat="server" Font-Bold="True" ForeColor="Black" Style="z-index: 1; left: 19px; top: 707px; position: absolute; right: 946px; width: 234px;" Text="Credit Card Information"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label18" runat="server" Style="z-index: 1; left: 18px; top: 732px; position: absolute" Text="Credit Card: "></asp:Label>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Style="z-index: 1; top: 729px; position: absolute; height: 27px; width: 384px; left: 95px" TabIndex="14" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                <asp:ListItem>Visa</asp:ListItem>
                <asp:ListItem>MasterCard</asp:ListItem>
                <asp:ListItem>American Express</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="RequiredFieldValidator" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 446px; top: 735px; position: absolute" Font-Size="X-Small">Select a Card Type!!!</asp:RequiredFieldValidator>
            <asp:Label ID="Label34" runat="server" style="z-index: 1; left: 185px; top: 685px; position: absolute; width: 164px" Text="Days" Visible="False"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label19" runat="server" Style="z-index: 1; left: 17px; top: 756px; position: absolute" Text="Name on Credit Card: "></asp:Label>
            <asp:TextBox ID="TextBox10" runat="server" Style="z-index: 1; left: 169px; top: 755px; position: absolute; width: 270px; right: 760px;" TabIndex="15"></asp:TextBox>
            <asp:CheckBox ID="CheckBox1" runat="server" Style="z-index: 1; left: 444px; top: 756px; position: absolute; width: 236px" Text="Same as First and Last Name" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="True" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter a Valid name!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 171px; top: 776px; position: absolute; right: 885px;" ControlToValidate="TextBox10" ValidationExpression="^([A-Z][a-z]*((\s)))+[A-Z][a-z]*$" Font-Size="X-Small"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="TextBox10" ErrorMessage="Required Field!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 295px; top: 760px; position: absolute; width: 127px; margin-top: 15px" Font-Size="X-Small"></asp:RequiredFieldValidator>
        </p>
        <p style="height: 25px">
            <asp:Label ID="Label20" runat="server" Style="z-index: 1; left: 17px; top: 796px; position: absolute" Text="Credit Card Number: "></asp:Label>
            <asp:TextBox ID="TextBox11" runat="server" Style="z-index: 1; left: 169px; top: 794px; position: absolute; width: 218px; right: 812px;" TabIndex="16" Enabled="False">Select a card type</asp:TextBox>
            <asp:Label ID="Label22" runat="server" Style="z-index: 1; left: 399px; top: 795px; position: absolute; width: 221px" Text="(No space or dashes, please)"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox11" ErrorMessage="Required Field!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 347px; top: 800px; position: absolute; width: 127px; margin-top: 15px" Font-Size="X-Small"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="Label27" runat="server" Font-Bold="True" Style="z-index: 1; left: 19px; top: 638px; position: absolute; width: 204px;" Text="Room Selection"></asp:Label>
        </p>
        <p>
            <asp:DropDownList ID="DropDownList5" runat="server" Style="z-index: 1; left: 126px; top: 662px; position: absolute" AutoPostBack="True" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged">
                <asp:ListItem>Select Date</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="Label28" runat="server" Font-Bold="False" Style="z-index: 1; left: 20px; top: 663px; position: absolute; width: 93px;" Text="Room Type:"></asp:Label>
            <asp:Label ID="Label29" runat="server" Style="z-index: 1; left: 19px; top: 684px; position: absolute; width: 92px;" Text="Room Rate:" Visible="False"></asp:Label>
            <asp:Label ID="Label30" runat="server" Font-Size="Medium" Style="z-index: 1; left: 127px; top: 684px; position: absolute" Text="Rate" Font-Bold="True" Visible="False"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="TextBox12" runat="server" Style="z-index: 1; left: 169px; top: 831px; position: absolute; width: 77px" TabIndex="17"></asp:TextBox>
            <asp:Label ID="Label21" runat="server" Style="z-index: 1; left: 17px; top: 834px; position: absolute" Text="Expiration Date: "></asp:Label>
            <asp:Label ID="Label23" runat="server" Style="z-index: 1; left: 258px; top: 833px; position: absolute" Text="(MM/YYYY)"></asp:Label>
            <asp:RegularExpressionValidator ID="validCard" runat="server" ControlToValidate="TextBox11" ErrorMessage="Wrong format!!!" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" Style="z-index: 1; left: 170px; top: 815px; position: absolute"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="TextBox12" ErrorMessage="Required Field!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 352px; top: 820px; position: absolute; width: 127px; margin-top: 15px" Font-Size="X-Small"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator4" runat="server" OnServerValidate="Dates3Validator_Validate" ControlToValidate="TextBox12" ErrorMessage="Select a Valid Date!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 169px; top: 853px; position: absolute; height: 15px;" Font-Size="X-Small"></asp:CustomValidator>
        </p>
        <p>
            <asp:TextBox ID="TextBox8" runat="server" Style="z-index: 1; left: 129px; top: 583px; position: absolute; width: 178px; height: 20px; right: 892px;" TabIndex="12" AutoPostBack="True" OnTextChanged="TextBox8_TextChanged"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Enter a  Valid Phone Number!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 317px; top: 586px; position: absolute; height: 19px;" ControlToValidate="TextBox8" ValidationExpression="^\([1-9]\d{2}\)\s[1-9]\d{2}-\d{4}$" Font-Size="X-Small"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TextBox8" ErrorMessage="Required Field!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 492px; top: 571px; position: absolute; width: 127px; margin-top: 15px" Font-Size="X-Small"></asp:RequiredFieldValidator>
            <asp:Label ID="Label15" runat="server" Style="z-index: 1; left: 20px; top: 583px; position: absolute; bottom: 119px;" Text="Phone Number: "></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label16" runat="server" Style="z-index: 1; left: 20px; top: 614px; position: absolute" Text="Email Address: "></asp:Label>
            <asp:TextBox ID="TextBox9" runat="server" Style="z-index: 1; left: 129px; top: 613px; position: absolute; width: 288px; height: 20px;" TabIndex="13"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ErrorMessage="Enter a  Valid Email Address!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 428px; top: 612px; position: absolute; height: 23px; width: 206px;" ControlToValidate="TextBox9" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Font-Size="X-Small"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="TextBox9" ErrorMessage="Required Field!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 604px; top: 597px; position: absolute; width: 127px; margin-top: 15px" Font-Size="X-Small"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="Label26" runat="server" Style="z-index: 1; left: 21px; top: 494px; position: absolute; right: 1126px;" Text="Country: "></asp:Label>
            <asp:DropDownList ID="DropDownList3" runat="server" Style="z-index: 1; left: 130px; top: 493px; position: absolute; height: 23px; width: 80px;" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" TabIndex="9">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="CA">Canada</asp:ListItem>
                <asp:ListItem Value="U.S.A">U.S</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList3" ErrorMessage="Select a Country!!!" Font-Bold="True" ForeColor="Red" Style="z-index: 1; left: 255px; top: 495px; position: absolute; width: 155px;" Font-Size="X-Small"></asp:RequiredFieldValidator>
        </p>
        <p style="height: 13px">
            <asp:Button ID="Button1" runat="server" CommandName="submit" Style="z-index: 1; left: 33px; top: 876px; position: absolute; right: 1040px;" Text="Submit Form" OnClick="Button1_Click1" TabIndex="18" />
            <asp:Button ID="Button2" runat="server" Style="z-index: 1; left: 290px; top: 875px; position: absolute" Text="Clear Form" OnClick="Button2_Click1" TabIndex="19" />
        </p>

    </form>
</body>
</html>
