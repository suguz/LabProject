using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Services;
using System.Web.Services;

public partial class GudangTambahBarang : System.Web.UI.Page
{
    private static string strConn = ConfigurationManager.ConnectionStrings["LabConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        populateSatuan();
        populateKemasan();

        string kode = Request.Form["kode-barang"];
        string nama = Request.Form["nama-barang"];
        string lain = Request.Form["nama-lain"];
        string jenis = Request.Form["jenis-barang"];
        string satuan = Request.Form["satuan-barang"];
        string keterangan = Request.Form["keterangan"];

        if (!
            (string.IsNullOrEmpty(kode) ||
            string.IsNullOrEmpty(nama) ||
            string.IsNullOrEmpty(lain) ||
            string.IsNullOrEmpty(jenis) ||
            string.IsNullOrEmpty(satuan) ||
            string.IsNullOrEmpty(keterangan))
            )
        {
            using (SqlConnection cn = new SqlConnection(strConn))
            {
                cn.Open();
                string query = "INSERT INTO MST_BARANG (KODE_BARANG, NAMA_BARANG, NAMA_LAIN, SATUAN_BARANG, JENIS_BARANG, KETERANGAN) SELECT '{0}', '{1}', '{2}', {3}, {4}, '{5}'";
                using (SqlCommand cmd = new SqlCommand(string.Format(query, kode, nama, lain, jenis, satuan, keterangan)))
                {
                    cmd.Connection = cn;
                    int ra = cmd.ExecuteNonQuery();
                    if (ra > 0)
                    {
                        Response.Redirect("GudangMasterBarang.aspx");
                    }
                }
            }
        }
    }

    private void populateSatuan()
    {
        DataTable dt = new DataTable();
        using (SqlDataAdapter da = new SqlDataAdapter("sp_list_satuan", strConn))
        {
            da.Fill(dt);
        }
        lstSatuan.DataSource = dt;
        lstSatuan.DataBind();
    }

    private void populateKemasan()
    {
        DataTable dt = new DataTable();
        using (SqlDataAdapter da = new SqlDataAdapter("sp_kemasan_list", strConn))
        {
            da.Fill(dt);
        }
        listKemasan.DataSource = dt;
        listKemasan.DataBind();
    }

    [WebMethod, ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public static DatabaseResponse GetUnit(int satuan)
    {
        DatabaseResponse result = new DatabaseResponse();
        try
        {
            string query = "sp_get_satuan_unit {0}";
            DataTable dt = new DataTable();
            using (SqlDataAdapter da = new SqlDataAdapter(string.Format(query, satuan), strConn))
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
                result.ErrorMessage = "Data satuan terkecil ditemukan";
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
    public static DatabaseResponse TambahBarang(string kode, string nama, string spesifikasi, int satuan, string keterangan, string kemasan)
    {
        DatabaseResponse result = new DatabaseResponse();
        try
        {
            using (SqlConnection cn = new SqlConnection(strConn))
            {
                cn.Open();
                string query = "sp_tambah_barang '{0}', '{1}', '{2}', {3}, '{4}', '{5}'";
                query = string.Format(query, kode, nama, spesifikasi, satuan, keterangan, kemasan);
                using (SqlCommand cmd = new SqlCommand(query))
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

    public class DatabaseResponse
    {
        public bool Status;
        public string ErrorMessage;
        public string Value;
    }
}