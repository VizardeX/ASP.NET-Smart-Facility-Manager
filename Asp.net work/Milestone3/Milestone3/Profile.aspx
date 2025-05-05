<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Milestone3.Profile" %>

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
        <p>
            Set the number of allowed guests:</p>
        <p>
            <asp:TextBox ID="setNumGuestsBox" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="setAllowedGuests" runat="server" Text="Set" OnClick="setAllowedGuests_Click" style="height: 35px" />
        </p>
        <p>
            Remove a Guest from the system:</p>
        <p>
            &nbsp;<asp:TextBox ID="removeGuestBox" runat="server"></asp:TextBox>
        </p>
        <p>
            &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="removeGuest" runat="server" Text="Remove" OnClick="removeGuest_Click" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            Manage Devices:</p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="toDevices" runat="server" Text="Devices" OnClick="toDevices_Click" />
        <br />
        <br />
        <br />
        Manage Events:<br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Events " OnClick="Button1_Click" />
        <br />
        <br />
        <br />
        Manage Rooms:<br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Rooms" OnClick="Button2_Click" />
        <br />
        <br />
        <br />
        Manage Tasks:<br />
        <br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="profileToLogin" runat="server" Text="Return to Login page" OnClick="profileToLogin_Click" />
        <br />
        <br />
        _______________________<br />
        <br />
        <span class="auto-style1"><strong>User Information:</strong></span><br />
        <br />
        <br />
    </form>
</body>
</html>
