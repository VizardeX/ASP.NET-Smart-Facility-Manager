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
    public partial class ProfileGuest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            int userID = Convert.ToInt32(Session["userID"]);

            SqlCommand viewProfileInfo = new SqlCommand("ViewProfile", conn);
            viewProfileInfo.CommandType = CommandType.StoredProcedure;
            viewProfileInfo.Parameters.Add(new SqlParameter("@user_id", userID));

            conn.Open();
            string userType = "";
            SqlDataReader rdr = viewProfileInfo.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string id = rdr.GetInt32(rdr.GetOrdinal("id")).ToString();
                Label l1 = new Label();
                l1.Text = "ID: " + id + "<br />";
                form1.Controls.Add(l1);

                string fName = rdr.GetString(rdr.GetOrdinal("f_Name"));
                Label l2 = new Label();
                l2.Text = "First name: " + fName + "<br />";
                form1.Controls.Add(l2);

                string lName = rdr.GetString(rdr.GetOrdinal("l_Name"));
                Label l3 = new Label();
                l3.Text = "Last name: " + lName + "<br />";
                form1.Controls.Add(l3);

                string mail = rdr.GetString(rdr.GetOrdinal("email"));
                Label l4 = new Label();
                l4.Text = "Email: " + mail + "<br />";
                form1.Controls.Add(l4);

                string pass = rdr.GetString(rdr.GetOrdinal("password"));
                Label l5 = new Label();
                l4.Text = "Password: " + pass + "<br />";
                form1.Controls.Add(l5);

                string gender = rdr.GetString(rdr.GetOrdinal("preference"));
                Label l6 = new Label();
                l6.Text = "Preference: " + gender + "<br />";
                form1.Controls.Add(l6);

                string t = rdr.GetString(rdr.GetOrdinal("type"));
                Label l7 = new Label();
                l7.Text = "User Type: " + t + "<br />";
                form1.Controls.Add(l7);
                userType = t;

                string birth = rdr.GetDateTime(rdr.GetOrdinal("birthdate")).ToString();
                Label l8 = new Label();
                l8.Text = "Birth date: " + birth + "<br />";
                form1.Controls.Add(l8);

                string age = rdr.GetInt32(rdr.GetOrdinal("age")).ToString();
                Label l9 = new Label();
                l9.Text = "Age: " + age + "<br />";
                form1.Controls.Add(l9);



            }

            conn.Close();

            SqlCommand guestInfo = new SqlCommand("GetResAddrGuestof", conn);
            guestInfo.CommandType = CommandType.StoredProcedure;

            guestInfo.Parameters.Add(new SqlParameter("@user_id", Convert.ToInt32(Session["userID"])));

            SqlParameter resindential = guestInfo.Parameters.Add(new SqlParameter("@residential", SqlDbType.VarChar, 20));
            SqlParameter address = guestInfo.Parameters.Add(new SqlParameter("@address", SqlDbType.VarChar, 50));
            SqlParameter guestOf = guestInfo.Parameters.Add(new SqlParameter("@guest_of", SqlDbType.Int));

            resindential.Direction = ParameterDirection.Output;
            address.Direction = ParameterDirection.Output;
            guestOf.Direction = ParameterDirection.Output;

            conn.Open();
            guestInfo.ExecuteNonQuery();

            Label res = new Label();
            res.Text = "Residence: " + resindential.Value.ToString() + "<br />";
            form1.Controls.Add(res);

            Label addr = new Label();
            addr.Text = "Address: " + address.Value.ToString() + "<br />";
            form1.Controls.Add(addr);

            Label gOf = new Label();
            gOf.Text = "Guest of the Admin that has the ID: " + guestOf.Value.ToString() + "<br />";
            form1.Controls.Add(gOf);

            conn.Close();




        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void vewiChargeButton_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewChargeProc = new SqlCommand("ViewMyDeviceCharge", conn);
            viewChargeProc.CommandType = CommandType.StoredProcedure;

            string viewChargeInput = viewChargeBox.Text;
            viewChargeProc.Parameters.Add(new SqlParameter("device_id", Convert.ToInt32(viewChargeInput)));


            conn.Open();

            DataTable dt = new DataTable();
            SqlDataReader reader = viewChargeProc.ExecuteReader();
            dt.Load(reader);

            if (dt.Rows.Count != 0)
            {
                string viewChargeOutput = viewChargeProc.ExecuteScalar().ToString();
                Response.Write("Device charge:  " + viewChargeOutput+"%");
            }

            else
            {
                Response.Write("This device does not exist");
            }

            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("GuestEvent.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoomGuest.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Finance_Communication_Guest.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewTask.aspx");
        }
    }
}