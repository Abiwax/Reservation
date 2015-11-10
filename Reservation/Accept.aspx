<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Accept.aspx.cs" Inherits="Reservation.Accept" %>

<!DOCTYPE html>
<script runat="server">

</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        h1   {background-color:linen;
            height: 40px;
        }
        body {background-color:white}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>&nbsp;ABET HOTEL &amp; SUITES</h1>
        <p class="lead">&nbsp; ABET Hotel &amp; Suites&nbsp; is dedicated to customers satisfaction at all times. Book one of our rooms today for an unforgettable experience.</p>
    <div>
    
    </div>
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 17px; top: 115px; position: absolute; height: 191px; width: 909px" Text="Label" Font-Bold="True" Font-Italic="False" Font-Size="X-Large" ForeColor="#003366"></asp:Label>
        <%@ PreviousPageType VirtualPath="~/Online.aspx" %>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="z-index: 1; left: 23px; top: 343px; position: absolute" Text="Exit" CommandName="submit" Font-Bold="True" Font-Size="Large" />
    </form>
</body>
</html>
