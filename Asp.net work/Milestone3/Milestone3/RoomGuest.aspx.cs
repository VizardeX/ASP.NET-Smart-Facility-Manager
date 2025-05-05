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
    public partial class RoomGuest : System.Web.UI.Page
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

            Response.Redirect("RoomGuest.aspx");
        }
    }
}