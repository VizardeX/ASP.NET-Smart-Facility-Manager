<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Device.aspx.cs" Inherits="Milestone3.Device" %>

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
            To view the charge of a device, 
            <br />
            please
            enter its ID here:<br />
            <br />
            <asp:TextBox ID="viewChargeBox" runat="server"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="viewChargeButton" runat="server" Text="View" OnClick="viewChargeButton_Click" />
            <br />
            <br />
        ___________________________<br />
            <br />
            To add a new device, please<br />
            enter the required information:<br />
            <br />
            Device ID:<br />
            <br />
            <asp:TextBox ID="deviceIdBox" runat="server"></asp:TextBox>
            <br />
            <br />
            Device status:<br />
            <br />
            <asp:TextBox ID="deviceStatusBox" runat="server" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
            <br />
            <br />
            Device battery percentage:<br />
            <br />
            <asp:TextBox ID="deviceBatteryBox" runat="server"></asp:TextBox>
            <br />
            <br />
            Device location (room ID):<br />
            <br />
            <asp:TextBox ID="deviceRoomBox" runat="server"></asp:TextBox>
            <br />
            <br />
            Device type:<br />
            <br />
            <asp:TextBox ID="deviceTypeBox" runat="server"></asp:TextBox>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Button ID="addDeviceButton" runat="server" Text="Add" OnClick="addDeviceButton_Click" />
            <br />
            <br />
        ___________________________<br />
            <br />
            Please press this button to get the
            <br />
            location of all the devices that are<br />
            out of battery:<br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Button ID="outofBatteryButon" runat="server" Text="View" OnClick="outofBatteryButon_Click" />
            <br />
            <br />
        ___________________________<br />
            <br />
            Please press this button to set the<br />
            status of all devices out of battery<br />
            to charging:<br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Button ID="setToChargingButton" runat="server" Text="Set" OnClick="setToChargingButton_Click" />
            <br />
            <br />
            ___________________________<br />
            <br />
            Please press this button to get the<br />
            location where more than two<br />
            devices have a dead battery:<br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Button ID="Button1" runat="server" Text="View" OnClick="Button1_Click" />
            <br />
            <br />
            ___________________________<br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Return to your Profile" OnClick="Button2_Click" />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
