<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomGuest.aspx.cs" Inherits="Milestone3.RoomGuest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      <p>
<asp:Button ID="book" runat="server" OnClick="booking" Text= "Book a room" />
           
    </p>
<p>
    <asp:TextBox ID="roomID" runat="server"></asp:TextBox>
    </p>
    </form>
</body>
</html>
