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
    public partial class Device : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void viewChargeButton_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewChargeProc = new SqlCommand("ViewMyDeviceCharge", conn);
            viewChargeProc.CommandType = CommandType.StoredProcedure;

            int viewChargeInput = Convert.ToInt32(viewChargeBox.Text);
            viewChargeProc.Parameters.Add(new SqlParameter("@device_id", viewChargeInput));

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

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void addDeviceButton_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            int device_id = Convert.ToInt32(deviceIdBox.Text);
            string device_status = deviceStatusBox.Text;
            int battery = Convert.ToInt32(deviceBatteryBox.Text);
            int room = Convert.ToInt32(deviceRoomBox.Text);
            string type = deviceTypeBox.Text;

            SqlCommand addDevice = new SqlCommand("AddDevice", conn);
            addDevice.CommandType = CommandType.StoredProcedure;
            
            SqlCommand checkIdRoom = new SqlCommand("GetIdLocation", conn);
            checkIdRoom.CommandType = CommandType.StoredProcedure;

            checkIdRoom.Parameters.Add(new SqlParameter("@device_id_test", device_id));
            checkIdRoom.Parameters.Add(new SqlParameter("@room_id_test", room));
            SqlParameter roomFound = checkIdRoom.Parameters.Add(new SqlParameter("@location", SqlDbType.Int));
            SqlParameter idFound = checkIdRoom.Parameters.Add(new SqlParameter("@id_found", SqlDbType.Int));

            roomFound.Direction = ParameterDirection.Output;
            idFound.Direction = ParameterDirection.Output;

            conn.Open();
            checkIdRoom.ExecuteNonQuery();
            conn.Close();

            if(idFound.Value.ToString() == "1")
            {
                Response.Write("This device already exists");
            }

            else if(roomFound.Value.ToString() == "0")
            {
                Response.Write("This room does not exist");
            }

            else
            {
                addDevice.Parameters.Add(new SqlParameter("@device_id", device_id));
                addDevice.Parameters.Add(new SqlParameter("@status", device_status));
                addDevice.Parameters.Add(new SqlParameter("@battery", battery));
                addDevice.Parameters.Add(new SqlParameter("@location", room));
                addDevice.Parameters.Add(new SqlParameter("@type", type));
                conn.Open();
                addDevice.ExecuteNonQuery();
                conn.Close();
                Response.Write("The device has been added successfully");
            }

        }

        protected void outofBatteryButon_Click(object sender, EventArgs e)
        {
            Response.Redirect("OutOfbatteryDevicesPage.aspx");
        }

        protected void setToChargingButton_Click(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["M2"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand setStatusProc = new SqlCommand("Charging", conn);
            setStatusProc.CommandType = CommandType.StoredProcedure;

            conn.Open();
            setStatusProc.ExecuteNonQuery();
            conn.Close();
            Response.Write("The devices' status have been set successfully");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("TwoOutOfBattery.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }
    }
}