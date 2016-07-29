using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class GudangTambahBarang : System.Web.UI.Page
{
    private static string strConn = ConfigurationManager.ConnectionStrings["LabConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
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
}