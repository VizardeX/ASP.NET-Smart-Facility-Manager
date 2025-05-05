<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TwoOutOfBattery.aspx.cs" Inherits="Milestone3.TwoOutOfBattery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server"> 
        <div>
            <br />
            <br />
            <asp:Button ID="toProfile" runat="server" Text="Return to Device Management" OnClick="toProfile_Click" />
            <br />
            <br />
            <asp:GridView ID="TwoOutOfBatteryGrid" runat="server" OnSelectedIndexChanged="TwoOutOfBatteryGrid_SelectedIndexChanged">
            </asp:GridView>
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
