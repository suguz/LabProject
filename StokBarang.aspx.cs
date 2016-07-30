using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StokBarang : System.Web.UI.Page
{
    private static string strConn = ConfigurationManager.ConnectionStrings["LabConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        populateBarang();
    }


    [WebMethod, ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public static DatabaseResponse Stok(int barang)
    {
        DatabaseResponse result = new DatabaseResponse();
        try
        {
            string query = "sp_stok_lab {0}";
            DataTable dt = new DataTable();
            using (SqlDataAdapter da = new SqlDataAdapter(string.Format(query, barang), strConn))
            {
                da.Fill(dt);
            }

            if (dt.Rows.Count > 0)
            {
                result.Status = true;
                result.Value = new List<StokData>();
                foreach (DataRow dr in dt.Rows)
                {
                    result.Value.Add(new StokData() { NamaLab = dr["NAMA_LAB"].ToString(), Satuan=dr["SATUAN"].ToString(), Jumlah=(double)dr["JUMLAH"] });
                }
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

    public class DatabaseResponse
    {
        public bool Status;
        public string ErrorMessage;
        public List<StokData> Value;
    }

    public class StokData
    {
        public string NamaLab;
        public double Jumlah;
        public string Satuan;
    }
}