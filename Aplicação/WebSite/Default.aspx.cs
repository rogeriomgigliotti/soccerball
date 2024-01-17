using System;

namespace WebSite
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Response.Redirect("~/Pages/Game.aspx");
        }
    }
}