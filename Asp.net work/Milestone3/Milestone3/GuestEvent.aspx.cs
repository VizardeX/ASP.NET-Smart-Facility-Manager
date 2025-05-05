using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class GuestEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            int eventid = Convert.ToInt32(eventIdBox.Text);
            string name = eventNameBox.Text;
            string description = descriptionBox.Text;
            string location = locationBox.Text;
            DateTime reminder = DateTime.ParseExact(reminderBox.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture);
            int otheruserid = Convert.ToInt32(anotherUserBox.Text);

            SqlCommand newEvent = new SqlCommand("CreateEvent", conn);
            newEvent.CommandType = CommandType.StoredProcedure;

            newEvent.Parameters.Add(new SqlParameter("@event_id", eventid));
            newEvent.Parameters.Add(new SqlParameter("@user_id", Convert.ToInt32(Session["userID"])));
            newEvent.Parameters.Add(new SqlParameter("@name", name));
            newEvent.Parameters.Add(new SqlParameter("@description", description));
            newEvent.Parameters.Add(new SqlParameter("@location", location));
            newEvent.Parameters.Add(new SqlParameter("@reminder_date", reminder));
            newEvent.Parameters.Add(new SqlParameter("@other_user_id", otheruserid));

            conn.Open();
            newEvent.ExecuteNonQuery();
            Response.Write("The event has been added");
            conn.Close();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            int userId = Convert.ToInt32(assignUserIdBox.Text);
            int eventId = Convert.ToInt32(assignEvntIdBox.Text);

            SqlCommand assignUserProc = new SqlCommand("AssignUser", conn);
            assignUserProc.CommandType = CommandType.StoredProcedure;

            assignUserProc.Parameters.Add(new SqlParameter("@user_id", userId));
            assignUserProc.Parameters.Add(new SqlParameter("@event_id", eventId));

            conn.Open();
            assignUserProc.ExecuteNonQuery();
            Response.Write("The user has been assigned to the event");
            conn.Close();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            int eventId = Convert.ToInt32(uninviteEventBox.Text);
            int userId = Convert.ToInt32(assignUserIdBox.Text);

            SqlCommand UninviteProc = new SqlCommand("Uninvited", conn);
            UninviteProc.CommandType = CommandType.StoredProcedure;

            UninviteProc.Parameters.Add(new SqlParameter("@event_id", eventId));
            UninviteProc.Parameters.Add(new SqlParameter("@user_id", userId));

            conn.Open();
            UninviteProc.ExecuteNonQuery();
            Response.Write("The user has been uninvited");
            conn.Close();

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            Session["viewEventID"] = Convert.ToInt32(viewEventIdBox.Text);
            Session["viewUserEventID"] = Convert.ToInt32(viewUserIdBox.Text);

            Response.Redirect("ViewEventInfo.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProfileGuest.aspx");
        }
    }
}