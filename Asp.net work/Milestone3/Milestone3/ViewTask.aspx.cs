using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace Milestone3
{
    public partial class ViewTask : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void view_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection

            SqlConnection conn = new SqlConnection(connStr);
            int userID = Convert.ToInt32(Session["userID"]);



            SqlCommand view_Click = new SqlCommand("ViewMyTask", conn);
            view_Click.CommandType = CommandType.StoredProcedure;
            view_Click.Parameters.Add(new SqlParameter("@user_id", userID));

            conn.Open();
            
            SqlDataReader rdr = view_Click.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string taskid = rdr.GetInt32(rdr.GetOrdinal("task_id")).ToString();
                Label l1 = new Label();
                l1.Text = "task id: " + taskid + "<br />";
                form1.Controls.Add(l1);
                Session["tid"] = taskid;
                string name = rdr.GetString(rdr.GetOrdinal("name"));
                Label l2 = new Label();
                l2.Text = "rdr: " + name + "<br />";
                form1.Controls.Add(l2);

                Session["title"] = name;
                string createdate = rdr.GetDateTime(rdr.GetOrdinal("creation_date")).ToString();
                Label l3 = new Label();
                l3.Text = "createdate: " + createdate + "<br />";
                form1.Controls.Add(l3);

                string duedate = rdr.GetDateTime(rdr.GetOrdinal("due_date")).ToString();
                Label l4 = new Label();
                l4.Text = "duedate: " + duedate + "<br />";
                form1.Controls.Add(l4);
                Session["deadline"] = duedate;

                string category = rdr.GetString(rdr.GetOrdinal("category"));
                Label l5 = new Label();
                l5.Text = "category: " + category + "<br />";
                form1.Controls.Add(l5);

                string creator = rdr.GetInt32(rdr.GetOrdinal("creator")).ToString();
                Label l6 = new Label();
                l6.Text = "creator: " + creator + "<br />";
                form1.Controls.Add(l6);
                Session["creator"] = creator;
                string status = rdr.GetString(rdr.GetOrdinal("status"));
                Label l7 = new Label();
                l7.Text = "status: " + status + "<br />";
                form1.Controls.Add(l7);

                string reminder_date = rdr.GetDateTime(rdr.GetOrdinal("reminder_date")).ToString();
                Label l8 = new Label();
                l8.Text = "reminderdate: " + reminder_date + "<br />";
                form1.Controls.Add(l8);
                Session["reminder"] = reminder_date;

                string priority = rdr.GetInt32(rdr.GetOrdinal("priority")).ToString();
                Label l9 = new Label();
                l9.Text = "priority: " + priority + "<br />";
                form1.Controls.Add(l9);

            }
            conn.Close();
            Response.Redirect("ViewTask.aspx");
        }

        protected void finish_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection

            SqlConnection conn = new SqlConnection(connStr);
            int userID = Convert.ToInt32(Session["userID"]);
            string Title = title.Text;

            SqlCommand finish_Click = new SqlCommand("FinishMyTask", conn);
            finish_Click.CommandType = CommandType.StoredProcedure;
            finish_Click.Parameters.Add(new SqlParameter("@user_id", userID));
            finish_Click.Parameters.Add(new SqlParameter("@title", Title));


            conn.Open();
            finish_Click.ExecuteNonQuery();
            Response.Write("The task has been finished");
            conn.Close();
        }

        protected void status_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection

            SqlConnection conn = new SqlConnection(connStr);

            Session["Useridviewstatus"] = useridviewtask.Text;
            Session["creatorviewstatus"] = creator.Text;
            Response.Redirect("viewtaskstatus.aspx");
        }

        protected void reminder_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection

            SqlConnection conn = new SqlConnection(connStr);
            int taskID = Convert.ToInt32(task.Text);
            DateTime reminderdate = DateTime.ParseExact(remindertime.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture);

            SqlCommand reminder_Click = new SqlCommand("AddReminder", conn);
            reminder_Click.CommandType = CommandType.StoredProcedure;
            reminder_Click.Parameters.Add(new SqlParameter("@task_id", taskID));
            reminder_Click.Parameters.Add(new SqlParameter("@reminder", reminderdate));


            conn.Open();
            reminder_Click.ExecuteNonQuery();
            Response.Write("the reminder has been added");
            conn.Close();
        }

        protected void dealine_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection

            SqlConnection conn = new SqlConnection(connStr);
            DateTime deadline = DateTime.ParseExact(deadlinetime.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture);
            int taskID = Convert.ToInt32(deadlinetaskid.Text);

            SqlCommand deadline_Click = new SqlCommand("UpdateTaskDeadline", conn);
            deadline_Click.CommandType = CommandType.StoredProcedure;
            deadline_Click.Parameters.Add(new SqlParameter("@deadline", deadline));
            deadline_Click.Parameters.Add(new SqlParameter("@task_id", taskID));

            conn.Open();
            deadline_Click.ExecuteNonQuery();
            Response.Write("the deadline has been updated");
            conn.Close();
        }
    }
}