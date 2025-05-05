<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Milestone3.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Please type your email and password to Log in</div>
        <p>
            Email:</p>
        <%--<p>--%>
            <asp:TextBox ID="emailLogin" runat="server"></asp:TextBox>
        <p>
            Password:</p>
        <p>
            <asp:TextBox ID="passwordLogin" runat="server"></asp:TextBox>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="loginButton" runat="server" OnClick="Button1_Click" Text="Log in" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            You don&#39;t have an account?&nbsp; Register from here:</p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="toRegisterPage" runat="server" Text="Register" OnClick="toSignIn_Click" />
        </p>
    </form>
</body>
</html>
