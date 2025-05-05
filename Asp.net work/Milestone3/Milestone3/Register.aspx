<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Milestone3.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Welcome! Please enter the required information.<br />
            <br />
            First Name:<br />
        </div>
        <asp:TextBox ID="fnameReg" runat="server" Width="222px"></asp:TextBox>
        <p>
            Last Name:</p>
        <p>
            <asp:TextBox ID="lnameReg" runat="server" Width="222px"></asp:TextBox>
        </p>
        <p>
            Birth Date:</p>
        <p>
            <asp:TextBox ID="birthReg" runat="server" Width="222px"></asp:TextBox>
        </p>
        <p>
            Email:</p>
        <p>
            <asp:TextBox ID="emailReg" runat="server" Width="223px"></asp:TextBox>
        </p>
        <p>
            Password:</p>
        <asp:TextBox ID="passReg" runat="server" Width="223px"></asp:TextBox>
        <br />
        <br />
        User Type:<br />
        <br />
        <asp:TextBox ID="utypeReg" runat="server" Width="222px"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="registerButton" runat="server" Text="Register" OnClick="registerButton_Click" />
        <br />
        <br />
        Already have an account? Log in from here:<br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="fromRegToLogin" runat="server" Text="Go to Log in page" Width="150px" OnClick="fromRegToLogin_Click" />
    </form>
</body>
</html>
