<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Room.aspx.cs" Inherits="Milestone3.Room" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            <asp:Label ID="Label1" runat="server" Text="Click on this button to check the available rooms:"></asp:Label>
            </p>
        <p>
            <asp:Button ID="available" runat="server" Text="Available Rooms" OnClick="available_Click" />
                   
            </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Click to Book a room of your choice:"></asp:Label>
                   
            </p>
        <p>
        <asp:Button ID="book" runat="server" OnClick="booking" Text= "Book a room" />
                   
            </p>
        <p>
            <asp:TextBox ID="roomID" runat="server"></asp:TextBox>
            </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Click to change the status of your room:"></asp:Label>
            </p>
        <p>
            <asp:Button ID="cs"    runat="server" OnClick="stat_Change" Text="Change Status" />
            </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Input your content and Click to create your schedule:"></asp:Label>
            </p>
        <asp:Button ID="Create" runat="server" OnClick="create" Text="Create Schedule" />
        <p>
            <asp:Label ID="Creator" runat="server" Text="Creator ID:"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="creatr" runat="server"></asp:TextBox>
        </p>
        <p>
    <asp:Label ID="rid" runat="server" Text="Room ID:"></asp:Label>
</p>
<p>
    <asp:TextBox ID="rmid" runat="server"></asp:TextBox>
</p><p>
    <asp:Label ID="Start" runat="server" Text="Start Time:"></asp:Label>
</p>
<p>
    <asp:TextBox ID="st" runat="server"></asp:TextBox>
</p><p>
    <asp:Label ID="End" runat="server" Text="End Time:"></asp:Label>
</p>
<p>
    <asp:TextBox ID="nd" runat="server"></asp:TextBox>
</p><p>
    <asp:Label ID="Act" runat="server" Text="Action:"></asp:Label>
</p>
<p>
    <asp:TextBox ID="action" runat="server"></asp:TextBox>
</p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
