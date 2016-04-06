using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class MasterKemasan : System.Web.UI.Page
{
    private static string strConn = ConfigurationManager.ConnectionStrings["LabConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        populateData();
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
    }

    private void populateData()
    {
        DataTable dt = new DataTable();
        using (SqlDataAdapter da = new SqlDataAdapter("sp_kemasan_list", strConn))
        {
            da.Fill(dt);
        }
        userList.DataSource = dt;
        userList.DataBind();
    }

    private void tambahKemasan(string kemasan)
    {
        using (SqlConnection cn = new SqlConnection(strConn))
        {
            cn.Open();
            using (SqlCommand cmd = new SqlCommand("sp_tambah_kemasan '" + kemasan + "'", cn))
            {
                try
                {
                    int ra = cmd.ExecuteNonQuery();
                    if (ra > 0)
                    {
                        this.kemasan.Value = string.Empty;
                        showMessage("Sukses Menambahkan Kemasan", "Kemasan <b>" + kemasan + "</b> berhasil ditambahkan.", "success");
                        populateData();
                    }
                    else
                    {
                        showMessage("Gagal Menambahkan Kemasan", "Tidak ada data yang ditambahkan", "error");
                    }
                }
                catch (Exception ex)
                {
                    string msg = ex.Message;
                    if (msg.Contains("Cannot insert duplicate key"))
                    {
                        msg = "Kemasan '" + kemasan + "' sudah pernah terdaftar.";
                    }
                    showMessage("Gagal Menambahkan Kemasan", msg, "error");
                }
            }
        }
    }

    private void showMessage(string caption, string message, string type)
    {
        message = message.Replace("'", "&apos;");
        message = message.Replace(Environment.NewLine, "<br />");
        string clientScript = "$(document).ready(function(){ new PNotify({ title: '" + caption + "', text: '" + message + "', type: '" + type + "',styling: 'bootstrap3' }); });";
        ScriptManager.RegisterStartupScript(Page, this.GetType(), "ShowMessage", clientScript, true);
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        tambahKemasan(kemasan.Value);
    }
}