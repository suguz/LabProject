using System;
using System.Web.UI;

namespace LabProject
{
    public partial class ContentContainer : UserControl
    {
        public string Title { get; set; }
        public string LiteralText { get; set; }
        public bool ShowSettings { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                lblTitle.Text = ViewState["Title"].ToString();
                literalContent.Text = ViewState["Literal"].ToString();
            }
            DisplayContent();
        }

        private void DisplayContent()
        {
            lblTitle.Text = Title;
            ViewState["Title"] = Title;
            literalContent.Text = LiteralText;
            ViewState["Literal"] = LiteralText;
            settingsDropdown.Visible = ShowSettings;
        }
    }   
}