using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GudangBarangMasuk : System.Web.UI.Page
{
    private static string strConn = ConfigurationManager.ConnectionStrings["LabConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        populateBarang();
        populateVendor();
    }

    [WebMethod, ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public static DatabaseResponse BarangMasuk(int barang, double jumlah, int vendor, string keterangan, int user)
    {
        DatabaseResponse result = new DatabaseResponse();
        try
        {
            using (SqlConnection cn = new SqlConnection(strConn))
            {
                cn.Open();
                string query = "sp_barang_masuk {0}, {1}, {2}, '{3}', {4}";
                using (SqlCommand cmd = new SqlCommand(string.Format(query, barang, jumlah, vendor, keterangan, 2)))
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

    [WebMethod, ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public static DatabaseResponse GetUnit(int barang)
    {
        DatabaseResponse result = new DatabaseResponse();
        try
        {
            string query = "sp_getunit {0}";
            DataTable dt = new DataTable();
            using (SqlDataAdapter da = new SqlDataAdapter(string.Format(query, barang), strConn))
            {
                da.Fill(dt);
            }

            if (dt.Rows.Count > 0)
            {
                result.Status = true;
                result.Value = (dt.Rows[0]["SATUAN"] == DBNull.Value) ? string.Empty : dt.Rows[0]["SATUAN"].ToString();
            }
            else
            {
                result.Status = false;
                result.ErrorMessage = "Data barang tidak ditemukan";
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

    private void populateVendor()
    {
        string query = "sp_namavendor_list";
        DataTable dt = new DataTable();
        using (SqlDataAdapter da = new SqlDataAdapter(query, strConn))
        {
            da.Fill(dt);
        }
        lstVendor.DataSource = dt;
        lstVendor.DataBind();
    }

    public class DatabaseResponse
    {
        public bool Status;
        public string ErrorMessage;
        public string Value;
    }
}