<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewEventInfo.aspx.cs" Inherits="Milestone3.ViewEventInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Return to Event Management" OnClick="Button1_Click" />
            <br />
            <br />
            <br />
            <asp:GridView ID="EventInfoGrid" runat="server" OnSelectedIndexChanged="EventInfoGrid_SelectedIndexChanged">
            </asp:GridView>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
