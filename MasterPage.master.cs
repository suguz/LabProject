using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    private static string strConn = ConfigurationManager.ConnectionStrings["LabConnectionString"].ConnectionString;
    List<MenuItem> _FirstLevelMenuItems = new List<MenuItem>();
    List<MenuItem> SecondLevelMenuItems = new List<MenuItem>();
    List<MenuItem> _SecondLevelMenuItems1 = new List<MenuItem>();
    List<MenuItem> _SecondLevelMenuItems2 = new List<MenuItem>();
    List<MenuItem> _allMenu = new List<MenuItem>();

    protected void Page_Load(object sender, EventArgs e)
    {
        constructMenu();
    }

    private void constructMenu()
    {
        DataTable dt = new DataTable();
        using (SqlDataAdapter da = new SqlDataAdapter("sp_get_menu 'Agus'", strConn))
        {
            da.Fill(dt);
        }

        _allMenu.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string id = string.Empty;
            string teks = string.Empty;
            string logo = string.Empty;
            string url = string.Empty;
            string parent = string.Empty;

            foreach (DataColumn col in dt.Columns)
            {
                if (dr[col] == DBNull.Value)
                {
                    continue;
                }

                switch (col.ColumnName)
                {
                    case "ID":
                        id = dr[col].ToString();
                        break;
                    case "TEKS":
                        teks = dr[col].ToString();
                        break;
                    case "LOGO":
                        logo = dr[col].ToString();
                        break;
                    case "URL":
                        url = dr[col].ToString();
                        break;
                    case "PARENT":
                        parent = dr[col].ToString();
                        break;
                    default:
                        break;
                }
            }
            MenuItem menuItem = new MenuItem(id, parent, teks, logo, url);
            _allMenu.Add(menuItem);

            _FirstLevelMenuItems.Clear();
            foreach (MenuItem item in _allMenu)
            {
                if (string.IsNullOrEmpty(item.Parent))
                {
                    _FirstLevelMenuItems.Add(item);
                }
            }

            //FirstLevelMenuRepeater.DataSource = _FirstLevelMenuItems;
            //FirstLevelMenuRepeater.DataBind();
        }
    }

    private void GetSubMenuItems(string id, List<MenuItem> MenuItems)
    {
        MenuItems.Clear();
        foreach (MenuItem item in _allMenu)
        {
            if (item.Parent == id)
            {
                MenuItems.Add(item);
            }
        }
    }

    protected void FirstLevelMenuRepeater_ItemDataBound1(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.DataItem != null)
        {
            string id = DataBinder.Eval(e.Item.DataItem, "Id").ToString().Trim();
            SecondLevelMenuItems.Clear();
            GetSubMenuItems(id, SecondLevelMenuItems);
            Repeater FourthLevelMenuRepeater = (Repeater)e.Item.FindControl("SecondLevelMenuRepeater");
            FourthLevelMenuRepeater.DataSource = SecondLevelMenuItems;
            FourthLevelMenuRepeater.DataBind();
        }
    }

    public class MenuItem
    {
        string _Teks;
        string _Logo;
        string _Url;
        string _Id;
        string _Parent;
        public MenuItem()
        {
        }
        public MenuItem(string id, string parent, string teks, string desc, string Url)
        {
            _Id = id;
            _Parent = parent;
            _Teks = teks;
            _Logo = desc;
            _Url = Url;
        }
        public string Teks
        {
            get { return _Teks; }
            set { _Teks = value; }
        }
        public string Logo
        {
            get { return _Logo; }
            set { _Logo = value; }
        }
        public string Url
        {
            get { return _Url; }
            set { _Url = value; }
        }
        public string Id
        {
            get { return _Id; }
            set { _Id = value; }
        }
        public string Parent
        {
            get { return _Parent; }
            set { _Parent = value; }
        }
    }
}
