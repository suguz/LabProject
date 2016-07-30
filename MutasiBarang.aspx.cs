using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Services;
using System.Web.Services;

public partial class MutasiBarang : System.Web.UI.Page
{
    private static string strConn = ConfigurationManager.ConnectionStrings["LabConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        populateBarang();
        populateLabAsal();
        populateLabTujuan();
    }

    [WebMethod, ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public static DatabaseResponse Mutasi(int barang, double jumlah, int labAsal, int labTujuan, string keterangan, int user)
    {
        DatabaseResponse result = new DatabaseResponse();
        try
        {
            using (SqlConnection cn = new SqlConnection(strConn))
            {
                cn.Open();
                string query = "sp_barang_mutasi {0}, {1}, {2}, {3}, '{4}', {5}";
                using (SqlCommand cmd = new SqlCommand(string.Format(query, barang, jumlah, labAsal, labTujuan, keterangan, 2)))
                {
                    cmd.Connection = cn;
                    int ra = cmd.ExecuteNonQuery();
                    if (ra > 0)
                    {
                        result.Status = true;
                    }
                    else
                    {
                        result.Status = false;
                        result.ErrorMessage = "Tidak ada data yang berhasil ditulis.";
                    }
                }
                cn.Close();
            }
        }
        catch (Exception ex)
        {

            result.Status = false;
            result.ErrorMessage = ex.Message;
        }
        return result;
    }

    private void populateBarang()
    {
        string query = "sp_namabarang_list";
        DataTable dt = new DataTable();
        using (SqlDataAdapter da = new SqlDataAdapter(query, strConn))
        {
            da.Fill(dt);
        }
        lstBarang.DataSource = dt;
        lstBarang.DataBind();
    }

    private void populateLabAsal()
    {
        string query = "sp_namalab_list";
        DataTable dt = new DataTable();
        using (SqlDataAdapter da = new SqlDataAdapter(query, strConn))
        {
            da.Fill(dt);
        }
        lstLabAsal.DataSource = dt;
        lstLabAsal.DataBind();
    }

    private void populateLabTujuan()
    {
        string query = "sp_namalab_list";
        DataTable dt = new DataTable();
        using (SqlDataAdapter da = new SqlDataAdapter(query, strConn))
        {
            da.Fill(dt);
        }
        lstLabTujuan.DataSource = dt;
        lstLabTujuan.DataBind();
    }

    public class DatabaseResponse
    {
        public bool Status;
        public string ErrorMessage;
        public string Value;
    }
}