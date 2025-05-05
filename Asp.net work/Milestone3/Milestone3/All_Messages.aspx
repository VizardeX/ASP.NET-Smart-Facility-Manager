<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="All_Messages.aspx.cs" Inherits="Milestone3.All_Messages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Return to Managing" OnClick="Button1_Click" />
            <br />
            <br />
            <asp:GridView ID="MesGrid" runat="server" OnSelectedIndexChanged="MesGrid_SelectedIndexChanged">
            </asp:GridView>
            <br />
        </div>
    </form>
</body>
</html>
