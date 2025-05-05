using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class OutOfBatteryDevicesPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();
            SqlCommand OutOfBatteryProc = new SqlCommand("OutOfBattery", conn);
            OutOfBatteryProc.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(OutOfBatteryProc);
            DataSet ds = new DataSet();
            da.Fill(ds);
            conn.Close();
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    OutOfBatteryGrid.DataSource = ds.Tables[0];
                    OutOfBatteryGrid.DataBind();
                }
            }
        }

        protected void OutOfBatteryToProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Device.aspx");
        }

        protected void OutOfBatteryGrid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}