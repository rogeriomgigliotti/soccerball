using System;
using System.Web.UI.WebControls;

namespace WebSite.Manager
{
    public partial class UserControl : System.Web.UI.Page
    {
        protected void CarregarDados()
        {
            this.dgUsuario.DataSource = DAO.Consulta.CampeonatoU();
            this.dgUsuario.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((!Classes.Navegacao.IsAuthenticated) || (!Classes.Navegacao.IsAdministrator))
            {
                base.Response.Redirect("~/Account/Login.aspx?ReturnUrl=~/Manager/UserControl.aspx");
                return;
            }

            if (!base.IsPostBack)
                this.CarregarDados();
        }

        protected void imgDelete_Click(object sender, EventArgs e)
        {
            ImageButton imgDelete = (sender as ImageButton);
            DAO.Usuario.ExcluirUsuario(imgDelete.CommandArgument);

            this.CarregarDados();
        }

        protected void txtNomeUsuario_TextChanged(object sender, EventArgs e)
        {
            TextBox txtNomeUsuario;

            foreach (DataGridItem dgi in this.dgUsuario.Items)
            {
                txtNomeUsuario = (dgi.FindControl("txtNomeUsuario") as TextBox);

                if (txtNomeUsuario == sender)
                {
                    DAO.Usuario.AlterarUsuario((dgi.FindControl("lblCodigoUsuario2") as Label).Text, txtNomeUsuario.Text);
                    break;
                }
            }
        }

        protected void cbPagouAposta_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox cbPagouAposta;

            foreach (DataGridItem dgi in this.dgUsuario.Items)
            {
                cbPagouAposta = (dgi.FindControl("cbPagouAposta") as CheckBox);

                if (cbPagouAposta == sender)
                {
                    DAO.Usuario.PagarAposta((dgi.FindControl("lblCodigoUsuario2") as Label).Text, cbPagouAposta.Checked);
                    break;
                }
            }
        }
    }
}