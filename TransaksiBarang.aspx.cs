using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class TransaksiBarang : System.Web.UI.Page
{
    private static string strConn = ConfigurationManager.ConnectionStrings["LabConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        string dateStart = Request.Form["single_cal1"];
        string dateEnd = Request.Form["single_cal2"];

        if (!string.IsNullOrEmpty(dateStart) && !string.IsNullOrEmpty(dateEnd))
        {
            string query = "sp_laporan_raw '"+ dateStart + "', '"+ dateEnd + "'";
            DataTable dt = new DataTable();
            using (SqlDataAdapter da = new SqlDataAdapter(query, strConn))
            {
                da.Fill(dt);
            }
            trxBarang.DataSource = dt;
            trxBarang.DataBind();
        }
    }
}