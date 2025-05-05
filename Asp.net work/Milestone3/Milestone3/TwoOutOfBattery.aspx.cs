using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace Milestone3
{
    public partial class TwoOutOfBattery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();
            SqlCommand TwoNoBatteryProc = new SqlCommand("NeedCharge", conn);
            TwoNoBatteryProc.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(TwoNoBatteryProc);

            DataSet ds = new DataSet();
            da.Fill(ds);
            conn.Close();
            if (ds.Tables.Count > 0)
            {

                if (ds.Tables[0].Rows.Count > 0)
                {
                    TwoOutOfBatteryGrid.DataSource = ds.Tables[0];
                    TwoOutOfBatteryGrid.DataBind();
                }

            }
            


        }

        protected void toProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Device.aspx");
        }

        protected void TwoOutOfBatteryGrid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}