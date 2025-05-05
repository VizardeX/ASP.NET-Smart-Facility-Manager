<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GuestEvent.aspx.cs" Inherits="Milestone3.GuestEvent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Please enter the required information<br />
to create an event:<br />
<br />
Event ID:<br />
<br />
<asp:TextBox ID="eventIdBox" runat="server"></asp:TextBox>
<br />
<br />
Event name:<br />
<br />
<asp:TextBox ID="eventNameBox" runat="server"></asp:TextBox>
<br />
<br />
Description:<br />
<br />
<asp:TextBox ID="descriptionBox" runat="server"></asp:TextBox>
<br />
<br />
Location:<br />
<br />
<asp:TextBox ID="locationBox" runat="server"></asp:TextBox>
<br />
<br />
Reminder date<br />
(Must be in MM/DD/YYYY format):<br />
<br />
<asp:TextBox ID="reminderBox" runat="server"></asp:TextBox>
<br />
<br />
Another user ID:<br />
<br />
<asp:TextBox ID="anotherUserBox" runat="server"></asp:TextBox>
<br />
<br />
<asp:Button ID="Button1" runat="server" Text="Create" OnClick="Button1_Click" />
<br />
<br />
<br />
Please enter the required information to<br />
assign a user to attend an event:<br />
<br />
User ID:<br />
<br />
<asp:TextBox ID="assignUserIdBox" runat="server"></asp:TextBox>
<br />
<br />
Event ID:<br />
<br />
<asp:TextBox ID="assignEvntIdBox" runat="server"></asp:TextBox>
<br />
<br />
<asp:Button ID="Button2" runat="server" Text="Assign" OnClick="Button2_Click" />
<br />
<br />
<br />
Please enter the required information to<br />
uninvite a user to an event<br />
<br />
Event ID:<br />
<br />
<asp:TextBox ID="uninviteEventBox" runat="server"></asp:TextBox>
<br />
<br />
User ID:<br />
<br />
<asp:TextBox ID="uninviteUserBox" runat="server"></asp:TextBox>
<br />
<br />
<asp:Button ID="Button3" runat="server" Text="Uninvite" OnClick="Button3_Click" />
<br />
<br />
<br />
Please enter the required information to<br />
view an event:<br />
<br />
Event ID:<br />
<br />
<asp:TextBox ID="viewEventIdBox" runat="server"></asp:TextBox>
<br />
<br />
User ID:<br />
<br />
<asp:TextBox ID="viewUserIdBox" runat="server"></asp:TextBox>
<br />
<br />
<asp:Button ID="Button4" runat="server" Text="View" OnClick="Button4_Click" />
            <br />
            <br />
            <br />
            <asp:Button ID="Button5" runat="server" Text="Retrun to your Profile" OnClick="Button5_Click" />
<br />
<br />
        </div>
    </form>
</body>
</html>
