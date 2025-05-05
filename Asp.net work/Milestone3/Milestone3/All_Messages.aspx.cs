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
    public partial class All_Messages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();
            SqlCommand allMesProc = new SqlCommand("ShowMessages", conn);
            allMesProc.CommandType = CommandType.StoredProcedure;
            allMesProc.Parameters.Add(new SqlParameter("@user_id", Convert.ToInt32(Session["userID"])));
            allMesProc.Parameters.Add(new SqlParameter("@sender_id", Convert.ToInt32(Session["senderID"])));
            SqlDataAdapter da = new SqlDataAdapter(allMesProc);
            DataSet ds = new DataSet();
            da.Fill(ds);
            conn.Close();
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    MesGrid.DataSource = ds.Tables[0];
                    MesGrid.DataBind();
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Finance_Communication.aspx");
        }

        protected void MesGrid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}