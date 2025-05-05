using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class Room : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            int userID = Convert.ToInt32(Session["userID"]);
            SqlCommand viewRoomInfo = new SqlCommand("ViewRooms", conn);
            viewRoomInfo.CommandType = CommandType.StoredProcedure;

            viewRoomInfo.Parameters.Add(new SqlParameter("@user_id", userID));

            conn.Open();
            SqlDataReader rdr = viewRoomInfo.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string rid = rdr.GetInt32(rdr.GetOrdinal("room_id")).ToString();
                Label l1 = new Label();
                l1.Text = "RoomID: " + rid + "<br />";
                form1.Controls.Add(l1);

                string type = rdr.GetString(rdr.GetOrdinal("type"));
                Label l2 = new Label();
                l2.Text = "type: " + type + "<br />";
                form1.Controls.Add(l2);

                string floor = rdr.GetInt32(rdr.GetOrdinal("floor")).ToString();
                Label l3 = new Label();
                l3.Text = "floor: " + floor + "<br />";
                form1.Controls.Add(l3);

                string status = rdr.GetString(rdr.GetOrdinal("status"));
                Label l4 = new Label();
                l4.Text = "status: " + status + "<br />";
                form1.Controls.Add(l4);



                Session["stats"] = status.ToString();
                Session["roomid"] = Convert.ToInt32(rid);
            }
            conn.Close();
        }

        protected void booking(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            int userID = Convert.ToInt32(Session["userID"]);
            int roomid = Convert.ToInt32(roomID.Text);


            Session["roomID"] = roomid;
            SqlCommand BookRoom = new SqlCommand("AssignRoom", conn);
            BookRoom.CommandType = CommandType.StoredProcedure;

            BookRoom.Parameters.Add(new SqlParameter("@user_id", userID));
            BookRoom.Parameters.Add(new SqlParameter("@room_id", roomid));


            conn.Open();
            BookRoom.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Room.aspx");
        }

        protected void available_Click(object sender, EventArgs e)
        {
            Response.Redirect("NotUsed.aspx");
        }

        protected void stat_Change(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            string status = Session["stats"].ToString();
            if (status == "Booked")
            {

                status = "Available";

            }
            else
            {

                status = "Booked";
            }
            int roomid = Convert.ToInt32(Session["roomid"]);


            SqlCommand stat_Change = new SqlCommand("RoomAvailability", conn);
            stat_Change.CommandType = CommandType.StoredProcedure;



            stat_Change.Parameters.Add(new SqlParameter("@location", roomid));
            stat_Change.Parameters.Add(new SqlParameter("@status", status));

            conn.Open();
            stat_Change.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Room.aspx");
        }

        protected void create(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            int creatorid = Convert.ToInt32(creatr.Text);
            int roomid = Convert.ToInt32(rmid.Text);
            DateTime starttime = Convert.ToDateTime(st.Text);
            DateTime endtime = Convert.ToDateTime(nd.Text);
            string Action = action.Text;


            SqlCommand create = new SqlCommand("CreateSchedule", conn);
            create.CommandType = CommandType.StoredProcedure;

            create.Parameters.Add(new SqlParameter("@creator_id", creatorid));
            create.Parameters.Add(new SqlParameter("@room_id", roomid));
            create.Parameters.Add(new SqlParameter("@start_time", starttime));
            create.Parameters.Add(new SqlParameter("@end_time", endtime));
            create.Parameters.Add(new SqlParameter("@action", Action));

            conn.Open();
            create.ExecuteNonQuery();
            conn.Close();
        }
    }
}