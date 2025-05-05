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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection

            SqlConnection conn = new SqlConnection(connStr);
            string email = emailLogin.Text;
            string password = passwordLogin.Text;

            SqlCommand loginproc = new SqlCommand("UserLogin", conn);
            loginproc.CommandType = CommandType.StoredProcedure;
            loginproc.Parameters.Add(new SqlParameter("@email", email));
            loginproc.Parameters.Add(new SqlParameter("@password", password));

            SqlParameter success = loginproc.Parameters.Add(new SqlParameter("@success_bit", SqlDbType.Int));
            SqlParameter userId = loginproc.Parameters.Add(new SqlParameter("@user_id", SqlDbType.Int));

            success.Direction = ParameterDirection.Output;
            userId.Direction = ParameterDirection.Output;

            conn.Open();
            loginproc.ExecuteNonQuery();   
            conn.Close();

            Session["userID"] = userId.Value;

            SqlCommand typeProc = new SqlCommand("CheckType", conn);
            typeProc.CommandType = CommandType.StoredProcedure;
            typeProc.Parameters.Add(new SqlParameter("@user_id", Convert.ToInt32(Session["userID"])));
            SqlParameter uType = typeProc.Parameters.Add("@type", SqlDbType.VarChar, 50);

            uType.Direction = ParameterDirection.Output;

            conn.Open();
            typeProc.ExecuteNonQuery();
            conn.Close();

            Session["userType"] = uType.Value;

            if (success.Value.ToString() == "1" && uType.Value.ToString() == "Admin")
            {
                Response.Redirect("Profile.aspx");
            }

            else if(success.Value.ToString() == "1")
            {
                Response.Redirect("ProfileGuest.aspx");
            }

            else  
            {
                Response.Write("The email or the password is incorrect");
            }


        }

        protected void toSignIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}