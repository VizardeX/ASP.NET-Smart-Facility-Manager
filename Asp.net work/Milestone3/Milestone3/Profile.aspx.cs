using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Milestone3
{
    public partial class Profile : System.Web.UI.Page
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
            string userType="";
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

                if (!String.IsNullOrEmpty(rdr["preference"].ToString()))
                {
                    string gender = rdr.GetString(rdr.GetOrdinal("preference"));
                    Label l6 = new Label();
                    l6.Text = "Preference: " + gender + "<br />";
                    form1.Controls.Add(l6);
                }

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

            SqlCommand viewAdminInfo = new SqlCommand("CheckAdmin", conn);
            viewAdminInfo.CommandType = CommandType.StoredProcedure;
            int adminID = Convert.ToInt32(Session["userID"]);
            viewAdminInfo.Parameters.Add(new SqlParameter("@admin_id", adminID));
            SqlParameter number = viewAdminInfo.Parameters.Add(new SqlParameter("@num", SqlDbType.Int));
            SqlParameter salary = viewAdminInfo.Parameters.Add(new SqlParameter("@salary", SqlDbType.Decimal));
            number.Direction = ParameterDirection.Output;
            salary.Direction = ParameterDirection.Output;

            conn.Open();
            viewAdminInfo.ExecuteNonQuery();
            Label gn = new Label();
            gn.Text = "Number of allowed guests: " + number.Value.ToString() + "<br />";
            form1.Controls.Add(gn);

            if (!String.IsNullOrEmpty(salary.Value.ToString()))
            {
                Label sal = new Label();
                sal.Text = "Salary: " + salary.Value.ToString() + "$ <br />";
                form1.Controls.Add(sal);
            }
            
            conn.Close();

            SqlCommand viewCurrentGuests = new SqlCommand("GuestNumber", conn);
            viewCurrentGuests.CommandType = CommandType.StoredProcedure;
            viewCurrentGuests.Parameters.Add(new SqlParameter("@admin_id", adminID));

            conn.Open();
            Label cg = new Label();
            cg.Text = "Number of current guests: " + viewCurrentGuests.ExecuteScalar() + "<br />";
            form1.Controls.Add(cg);
            conn.Close();






        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            

        }

        protected void setAllowedGuests_Click(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            int numOfGuests = Convert.ToInt32(setNumGuestsBox.Text);
            SqlCommand setGuestsProc = new SqlCommand("GuestsAllowed", conn);
            setGuestsProc.CommandType = CommandType.StoredProcedure;
            setGuestsProc.Parameters.Add(new SqlParameter("@admin_id", Convert.ToInt32(Session["userID"])));
            setGuestsProc.Parameters.Add(new SqlParameter("@number_of_guests", numOfGuests));

            conn.Open();
            setGuestsProc.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Profile.aspx");

        }

        protected void removeGuest_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand removeGuestProc = new SqlCommand("GuestRemove", conn);
            removeGuestProc.CommandType = CommandType.StoredProcedure;

            int guest_id = Convert.ToInt32(removeGuestBox.Text);

            SqlCommand checkValidProc = new SqlCommand("CheckGuestOfAdmin", conn);
            checkValidProc.CommandType = CommandType.StoredProcedure;

            checkValidProc.Parameters.Add(new SqlParameter("@admin_id", Convert.ToInt32(Session["userID"])));
            checkValidProc.Parameters.Add(new SqlParameter("@guest_id", guest_id));
            SqlParameter flag = checkValidProc.Parameters.Add(new SqlParameter("@bool", SqlDbType.Int));
            flag.Direction = ParameterDirection.Output;

            conn.Open();
            checkValidProc.ExecuteNonQuery();
            conn.Close();

            if (flag.Value.ToString() == "0")
            {
                Response.Write("This user is not one of your guests");
            }

            else
            {

                removeGuestProc.Parameters.Add(new SqlParameter("@guest_id", guest_id));
                removeGuestProc.Parameters.Add(new SqlParameter("admin_id", Convert.ToInt32(Session["userID"])));

                SqlParameter newNumOfGuests = removeGuestProc.Parameters.Add(new SqlParameter("@number_of_allowed_guests", SqlDbType.Int));
                newNumOfGuests.Direction = ParameterDirection.Output;

                conn.Open();
                removeGuestProc.ExecuteNonQuery();
                conn.Close();

                Response.Write("New number of allowed guests: " + newNumOfGuests.Value);

            }

        }

        protected void toDevices_Click(object sender, EventArgs e)
        {
            Response.Redirect("Device.aspx");
        }

        protected void profileToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminEvent.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Finance_Communication.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Room.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewTask.aspx");
        }
    }
}