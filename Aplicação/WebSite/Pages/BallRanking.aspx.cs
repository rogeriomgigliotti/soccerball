using System;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;

namespace WebSite.Pages
{
    public partial class BallRanking : System.Web.UI.Page
    {
        public bool CampeonatoIniciou { get; set; }

        protected void CarregarDados()
        {
            DataTable table = DAO.Consulta.Ranking();

            decimal percentual = 0;
            decimal valor = 0;

            foreach (DataRow dr in table.Rows)
            {
                percentual += Convert.ToDecimal(dr["PERCENTUAL"]);
                valor += Convert.ToDecimal(dr["VALOR"]);
            }

            DataRow row = table.NewRow();
            row["PERCENTUAL"] = percentual;
            row["VALOR"] = valor;

            table.Rows.Add(row);

            this.dgRanking.DataSource = table;
            this.dgRanking.DataBind();

            if (this.dgRanking.Items.Count > 1)
            {
                DataGridItem dgiAtual = this.dgRanking.Items[0];
                dgiAtual.Cells[0].RowSpan = 1;
                dgiAtual.Cells[1].RowSpan = 1;

                for (int Index = 1; Index < this.dgRanking.Items.Count; Index++)
                {
                    if ((dgiAtual.FindControl("lblPosicao2") as Label).Text == (this.dgRanking.Items[Index].FindControl("lblPosicao2") as Label).Text)
                    {
                        this.dgRanking.Items[Index].Cells[0].Visible = false;
                        this.dgRanking.Items[Index].Cells[1].Visible = false;

                        dgiAtual.Cells[0].RowSpan++;
                        dgiAtual.Cells[1].RowSpan++;

                        continue;
                    }

                    dgiAtual = this.dgRanking.Items[Index];
                    dgiAtual.Cells[0].RowSpan = 1;
                    dgiAtual.Cells[1].RowSpan = 1;
                }
            }

            if (Classes.Navegacao.IsAuthenticated)
            {
                foreach (DataGridItem dgi in this.dgRanking.Items)
                {
                    if ((dgi.FindControl("hfCodigoUsuario") as HiddenField).Value == Classes.Navegacao.UserName)
                    {
                        dgi.Cells[2].CssClass = "highlightsCell";
                        dgi.Cells[3].CssClass = "highlightsCell";
                        dgi.Cells[4].CssClass = "highlightsCell";
                        dgi.Cells[5].CssClass = "highlightsCell";
                    }
                }
            }

            this.dgRanking.Items[this.dgRanking.Items.Count - 1].CssClass = "footerGrid";

            this.dgRanking.Items[this.dgRanking.Items.Count - 1].Cells[0].ColumnSpan = 3;
            this.dgRanking.Items[this.dgRanking.Items.Count - 1].Cells[0].HorizontalAlign = HorizontalAlign.Right;
            this.dgRanking.Items[this.dgRanking.Items.Count - 1].Cells[1].Visible = false;
            this.dgRanking.Items[this.dgRanking.Items.Count - 1].Cells[2].Visible = false;

            (this.dgRanking.Items[this.dgRanking.Items.Count - 1].FindControl("lblPosicao2") as Label).Text = "Total:";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.CampeonatoIniciou = DAO.Consulta.CampeonatoIniciou();
                this.CarregarDados();
            }
        }

        protected void lbNomeUsuario_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("~/Pages/MyBall.aspx?UserName=" + HttpUtility.UrlEncode((sender as LinkButton).CommandArgument));
        }
    }
}