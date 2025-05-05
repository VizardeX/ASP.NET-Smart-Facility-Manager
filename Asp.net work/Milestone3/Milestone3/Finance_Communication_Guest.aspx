<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Finance_Communication_Guest.aspx.cs" Inherits="Milestone3.Finance_Communication_Guest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>
            To receive a transaction, please enter the following:
        </p>
            

        <p>
              Receiver ID:
        </p>

        <p>
            <asp:TextBox ID ="recID" runat="server"></asp:TextBox>
        </p>

        <p>
              Type of Transaction:
        </p>

        <p>
             <asp:TextBox ID="typeID" runat="server"></asp:TextBox>
        </p>

         <p>
              Amount Received:
         </p>

         <p>
             <asp:TextBox ID ="amountRec" runat="server"></asp:TextBox>
     
         </p>

         <p>
             Status of Transaction:
         </p>

         <p>
             <asp:TextBox ID="statusID" runat="server"></asp:TextBox>
         </p>

          <p>
              Date:
         </p>

         <p>
              <asp:TextBox ID="dateID" runat="server"></asp:TextBox>
         </p>

         <p>
              <asp:Button ID="recTrans" runat="server" Text="Receive Transaction" OnClick="receive_Click" />
         </p>

        <p>
            To create a payment, please enter the following
        </p>

        <p>
            Sender ID:
        </p>

        <p>
            <asp:TextBox ID ="sendID" runat="server"></asp:TextBox>
        </p>

        <p>
              Receiver ID:
         </p>

         <p>
             <asp:TextBox ID ="TextBox1" runat="server"></asp:TextBox>
         </p>

         <p>
             Payment Type:
         </p>

        <p>
            <asp:TextBox ID="payType" runat="server"></asp:TextBox>
        </p>

        <p>
            Amount:
        </p>

        <p>
            <asp:TextBox ID="amnt" runat="server"></asp:TextBox>
        </p>

         <p>
             Status of Payment:
         </p>

         <p>
             <asp:TextBox ID="payStat" runat="server"></asp:TextBox>
         </p>

         <p>
             Deadline:
         </p>

         <p>
             <asp:TextBox ID="deadline" runat="server"></asp:TextBox>
         </p>

         <p>
             <asp:Button ID="creaPay" runat="server" Text="Create Payment" OnClick="create_Click" />
         </p>

        <p>
            To send a message, please enter the following:
        </p>
          <p>
              Sender ID:
         </p>

         <p>
             <asp:TextBox ID ="TextBox2" runat="server"></asp:TextBox>
         </p>
 
          <p>
             Receiver ID:
         </p>

          <p>
              <asp:TextBox ID ="TextBox3" runat="server"></asp:TextBox>
          </p>

          <p>
             Title:
         </p>

         <p>
             <asp:TextBox ID="title" runat="server"></asp:TextBox>
         </p>

         <p>
             Content of Message:
         </p>

          <p>
             <asp:TextBox ID="con" runat="server"></asp:TextBox>
         </p>

          <p>
             Time Sent:
         </p>

         <p>
             <asp:TextBox ID="ts" runat="server"></asp:TextBox>
         </p>

         <p>
             Time Received:
         </p>

          <p>
             <asp:TextBox ID="tre" runat="server"></asp:TextBox>
         </p>

         <p>
               <asp:Button ID="sendMsg" runat="server" Text="Send Message" OnClick="send_Click" />
         </p>

         <p>
             To show all messages from a certain user, please enter the following:
         </p>
        <p>
             Sender ID:
         </p>

         <p>
             <asp:TextBox ID ="senderShowMsg" runat="server"></asp:TextBox>
         </p>

          <p>
              &nbsp;</p>

          <p>
              <asp:Button ID="showMsgs" runat="server" Text="Show All Messages" OnClick="show_Click" />
         </p>
         <p>
        </div>
    </form>
</body>
</html>
