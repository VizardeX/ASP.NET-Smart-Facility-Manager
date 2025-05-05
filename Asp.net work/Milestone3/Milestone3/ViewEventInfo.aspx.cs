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
    public partial class ViewEventInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();
            SqlCommand ViewEventProc = new SqlCommand("ViewEvent", conn);
            ViewEventProc.CommandType = CommandType.StoredProcedure;
            ViewEventProc.Parameters.Add(new SqlParameter("@User_id", Convert.ToInt32(Session["viewEventID"])));
            ViewEventProc.Parameters.Add(new SqlParameter("@Event_id", Convert.ToInt32(Session["viewUserEventID"])));
            ViewEventProc.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(ViewEventProc);
            DataSet ds = new DataSet();
            da.Fill(ds);
            conn.Close();
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    EventInfoGrid.DataSource = ds.Tables[0];
                    EventInfoGrid.DataBind();
                }
            }

        }

        protected void EventInfoGrid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminEvent.aspx");
        }
    }
}