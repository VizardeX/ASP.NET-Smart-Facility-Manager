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
    public partial class viewtaskstatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();
            SqlCommand viewstatusproc = new SqlCommand("ViewTask", conn);

            viewstatusproc.CommandType = CommandType.StoredProcedure;
            viewstatusproc.Parameters.Add(new SqlParameter("@user_id", Convert.ToInt32(Session["Useridviewstatus"])));
            viewstatusproc.Parameters.Add(new SqlParameter("@creator", Convert.ToInt32(Session["creatorviewstatus"])));
            viewstatusproc.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(viewstatusproc);
            DataSet ds = new DataSet();
            da.Fill(ds);
            conn.Close();
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    viewstatus.DataSource = ds.Tables[0];
                    viewstatus.DataBind();
                }
            }
        }

        protected void Unnamed1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}