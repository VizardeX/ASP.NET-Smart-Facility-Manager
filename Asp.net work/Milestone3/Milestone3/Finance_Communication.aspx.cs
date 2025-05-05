using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class Finance_Communication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



        }

        protected void receive_Click(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand receiveTransaction = new SqlCommand("ReceiveMoney", conn);
            receiveTransaction.CommandType = System.Data.CommandType.StoredProcedure;
            receiveTransaction.Parameters.Add(new SqlParameter("@receiver_id", Convert.ToInt32(Session["userID"])));

            string t = typeID.Text;
            receiveTransaction.Parameters.Add(new SqlParameter("@type", t));

            double amountRecinput = Double.Parse(amountRec.Text);
            receiveTransaction.Parameters.Add(new SqlParameter("@amount", amountRecinput));

            string status = statusID.Text;
            receiveTransaction.Parameters.Add(new SqlParameter("@status", status));

            DateTime date = DateTime.ParseExact(dateID.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture);
            receiveTransaction.Parameters.Add(new SqlParameter("@date", date));

            conn.Open();
            receiveTransaction.ExecuteNonQuery();
            conn.Close();
            Response.Write("Transaction received successfully");

        }

        protected void create_Click(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand makePayment = new SqlCommand("PlanPayment", conn);
            int sendID = Convert.ToInt32(Session["sendID"]);
            makePayment.CommandType = System.Data.CommandType.StoredProcedure;
            makePayment.Parameters.Add(new SqlParameter("@sender_id", Convert.ToInt32(Session["userID"])));

            int recID = Convert.ToInt32(Session["userID"]);
            makePayment.Parameters.Add(new SqlParameter("@reciever_id", Convert.ToInt32(Session["userID"])));

            string t = typeID.Text;
            makePayment.Parameters.Add(new SqlParameter("@type", t));

            double amount = Double.Parse(amountRec.Text);
            makePayment.Parameters.Add(new SqlParameter("@amount", amount));

            string status = statusID.Text;
            makePayment.Parameters.Add(new SqlParameter("@status", status));

            DateTime deadline = DateTime.ParseExact(dateID.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture);
            makePayment.Parameters.Add(new SqlParameter("@deadline", deadline));

            conn.Open();
            makePayment.ExecuteNonQuery();
            conn.Close();
            Response.Write("Payment successfully added");

        }

        protected void send_Click(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand sendMsg = new SqlCommand("SendMessage", conn);
            sendMsg.CommandType = System.Data.CommandType.StoredProcedure;
            sendMsg.Parameters.Add(new SqlParameter("@sender_id", Convert.ToInt32(Session["userID"])));

            sendMsg.Parameters.Add(new SqlParameter("@receiver_id", Convert.ToInt32(Session["userID"])));

            string ttl = title.Text;
            sendMsg.Parameters.Add(new SqlParameter("@title", ttl));

            string cntnt = con.Text;
            sendMsg.Parameters.Add(new SqlParameter("@content", cntnt));

            TimeSpan sent = TimeSpan.FromMinutes(10);
            sendMsg.Parameters.Add(new SqlParameter("@timesent", sent));

            TimeSpan receive = TimeSpan.FromMinutes(10);
            sendMsg.Parameters.Add(new SqlParameter("@timereceived", receive));

            conn.Open();
            sendMsg.ExecuteNonQuery();
            conn.Close();
            Response.Write("Message sent successfully");

        }

        protected void show_Click(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Session["senderID"] = Convert.ToInt32(showMesBox.Text);

            Response.Redirect("All_Messages.aspx");

        }

        protected void delete_Click(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand deleteMsg = new SqlCommand("DeleteMsg", conn);
            deleteMsg.CommandType = System.Data.CommandType.StoredProcedure;
            int sendID = Convert.ToInt32(Session["userID"]);
            deleteMsg.Parameters.Add(new SqlParameter("@sender_id", Convert.ToInt32(Session["userID"])));

            conn.Open();
            deleteMsg.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("Profile.aspx");
            Response.Write("Message successfully deleted");

        }

        protected void recID_TextChanged(object sender, EventArgs e)
        {

        }
    }
}