<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutOfBatteryDevicesPage.aspx.cs" Inherits="Milestone3.OutOfBatteryDevicesPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <br />
        <asp:Button ID="OutOfBatteryToProfile" runat="server" Text="Return to Device Management" OnClick="OutOfBatteryToProfile_Click" />
        <br />
        <br />
        <br />
        <asp:GridView ID="OutOfBatteryGrid" runat="server" OnSelectedIndexChanged="OutOfBatteryGrid_SelectedIndexChanged">
        </asp:GridView>
        <br />
    </form>
</body>
</html>
