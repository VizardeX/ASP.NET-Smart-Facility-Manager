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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void fromRegToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void registerButton_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand registerProc = new SqlCommand("UserRegister", conn);
            registerProc.CommandType = CommandType.StoredProcedure;

            string fname = fnameReg.Text;
            string lname = lnameReg.Text;
            string birth = birthReg.Text;
            string email = emailReg.Text;
            string pass = passReg.Text;
            string utype = utypeReg.Text;

            registerProc.Parameters.Add(new SqlParameter("@usertype", utype));
            registerProc.Parameters.Add(new SqlParameter("@email", email));
            registerProc.Parameters.Add(new SqlParameter("@first_name", fname));
            registerProc.Parameters.Add(new SqlParameter("@last_name", lname));
            registerProc.Parameters.Add(new SqlParameter("birth_date", birth));
            registerProc.Parameters.Add(new SqlParameter("@password", pass));

            SqlParameter id = registerProc.Parameters.Add(new SqlParameter("@user_id", SqlDbType.Int));
            id.Direction = ParameterDirection.Output;

            conn.Open();
            registerProc.ExecuteNonQuery();
            conn.Close();

            Session["userID"] = id.Value;

            if(id.Value.ToString() == "-1" && utype != "Admin")
            {
                Response.Write("The user must be an Admin");
            }

            else if(id.Value.ToString() == "-1")
            {
                Response.Write("This email is already used");
            }

            else
            {
                Response.Redirect("Profile.aspx");
            }




        }
    }
}