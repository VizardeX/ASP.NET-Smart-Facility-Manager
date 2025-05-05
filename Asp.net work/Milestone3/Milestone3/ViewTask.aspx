<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewTask.aspx.cs" Inherits="Milestone3.ViewTask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="view" runat="server" Text="View Task" OnClick="view_Click" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Please type in the title of the task you have finished, then click Finish Task"></asp:Label>
            <br />
            <asp:TextBox ID="title" runat="server"></asp:TextBox>
            <br />
        </div>
        <asp:Button ID="finish" runat="server" Text="Finish Task" OnClick="finish_Click" />
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="type in the user ID and admin ID to view the status of the task "></asp:Label>
        <br />
        <asp:TextBox ID="useridviewtask" runat="server"></asp:TextBox>
        <br />
        <asp:TextBox ID="creator" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="status" runat="server" Text="View Status" OnClick="status_Click" />
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="type in the task ID and time you want to set the reminder to:"></asp:Label>
        <br />
        <asp:TextBox ID="task" runat="server"></asp:TextBox>
        <br />
        <asp:TextBox ID="remindertime" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="reminder" runat="server" Text="Add Reminder" OnClick="reminder_Click" Width="158px" />
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="type in a date to update the deadline of the task"></asp:Label>
        <br />
        <asp:TextBox ID="deadlinetime" runat="server"></asp:TextBox>
        <br />
        <asp:TextBox ID="deadlinetaskid" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="deadline" runat="server" Text="Update deadline" OnClick="dealine_Click" />
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>

