using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class GudangPermintaanBarang : System.Web.UI.Page
{
    private static string strConn = ConfigurationManager.ConnectionStrings["LabConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        populateData();
    }

    private void populateData()
    {
        DataTable dt = new DataTable();
        using (SqlDataAdapter da = new SqlDataAdapter("sp_permintaan_list", strConn))
        {
            da.Fill(dt);
        }
        userList.DataSource = dt;
        userList.DataBind();
    }
}