using System;
using System.Data;
using System.Web.UI.WebControls;

namespace WebSite.Pages
{
    public partial class MyBallPrint : System.Web.UI.Page
    {
        protected void FormatarLinha(DataGridItem dgi)
        {
            if ((dgi.FindControl("hfTipo") as HiddenField).Value == "1")
            {
                dgi.Font.Bold = true;
                dgi.Font.Size = FontUnit.Point(12);
                dgi.Font.Underline = true;

                dgi.Height = Unit.Pixel(40);
            }
            else if ((dgi.FindControl("hfTipo") as HiddenField).Value == "2")
            {
                dgi.Font.Bold = true;

                dgi.Height = Unit.Pixel(30);
            }
        }

        protected void CarregarDados()
        {
            DataTable table = DAO.Usuario.ImpressaoBolao(Classes.Navegacao.UserName);

            DataTable tLeft = new DataTable();
            DataTable tRight = new DataTable();

            foreach (DataColumn dc in table.Columns)
            {
                tLeft.Columns.Add(dc.ColumnName, dc.DataType);
                tRight.Columns.Add(dc.ColumnName, dc.DataType);
            }

            DataRow row;

            while ((table.Rows.Count > 0) && (tLeft.Rows.Count < table.Rows.Count))
            {
                row = tLeft.NewRow();
                row["DESCRICAO"] = table.Rows[0]["DESCRICAO"];
                row["TIPO"] = table.Rows[0]["TIPO"];

                tLeft.Rows.Add(row);
                table.Rows.Remove(table.Rows[0]);
            }

            while (table.Rows.Count > 0)
            {
                row = tRight.NewRow();
                row["DESCRICAO"] = table.Rows[0]["DESCRICAO"];
                row["TIPO"] = table.Rows[0]["TIPO"];

                tRight.Rows.Add(row);
                table.Rows.Remove(table.Rows[0]);
            }

            this.dgLeft.DataSource = tLeft;
            this.dgLeft.DataBind();

            foreach (DataGridItem dgi in this.dgLeft.Items)
                this.FormatarLinha(dgi);

            this.dgRight.DataSource = tRight;
            this.dgRight.DataBind();

            foreach (DataGridItem dgi in this.dgRight.Items)
                this.FormatarLinha(dgi);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.lblNome.Text = "Nome: " + Classes.Navegacao.UserFullName + " (" + Classes.Navegacao.UserName + ")";

                this.CarregarDados();
            }
        }
    }
}