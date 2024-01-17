using System;

namespace WebSite.Pages
{
    public partial class BallRole : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ReturnUrl = base.Request["ReturnUrl"];
            this.dvBotoes.Visible = ((!String.IsNullOrEmpty(ReturnUrl)) && (Classes.Navegacao.IsAuthenticated) && (!Classes.Navegacao.AceitouRegulamento));
        }

        protected void btnAceitar_Click(object sender, EventArgs e)
        {
            DAO.Usuario.AceitarRegulamento(Classes.Navegacao.UserName);

            string ReturnUrl = base.Request["ReturnUrl"];
            base.Response.Redirect(ReturnUrl);
        }

        protected void btnNaoAceitar_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("~/Pages/Game.aspx");
        }
    }
}