<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfileGuest.aspx.cs" Inherits="Milestone3.ProfileGuest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #003399;
            font-size: x-large;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            To view the charge of a device, 
            <br />
            please
            enter its ID here:<br />
            <asp:TextBox ID="viewChargeBox" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="vewiChargeButton" runat="server" Text="View" OnClick="vewiChargeButton_Click" />
            <br />
            <br />
            <br />
            Manage events from here:<br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Events" OnClick="Button1_Click1" />
            <br />
            <br />
            <br />
            Manage Rooms from here:<br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Rooms" OnClick="Button2_Click" />
            <br />
            <br />
            <br />
            Manage Tasks from here:<br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" Text="Tasks" OnClick="Button4_Click" />
            <br />
            <br />
            <br />
        Manage Finance &amp; Communication:<br />
            <br />
            <asp:Button ID="Button3" runat="server" Text="Finance & Communication" OnClick="Button3_Click" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="profileToLogin" runat="server" OnClick="Button1_Click" Text="Return to Login Page" />
            <br />
            <br />
            _______________________<br />
            <br />
            <span class="auto-style1"><strong>User Information:</strong></span><br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
