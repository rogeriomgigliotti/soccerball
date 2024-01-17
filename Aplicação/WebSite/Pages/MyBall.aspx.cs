﻿using System;
using System.Data;
using System.Web.UI.WebControls;

namespace WebSite.Pages
{
    public partial class MyBall : System.Web.UI.Page
    {
        protected void CarregarFases()
        {
            this.dgFase.DataSource = DAO.Consulta.Fases();
            this.dgFase.DataBind();

            for (int Index = 1; Index < this.dgFase.Items.Count; Index++)
                this.dgFase.Items[Index].Visible = false;

            this.lbFaseAnterior.Visible = false;
            this.lbProximaFase.Visible = (this.dgFase.Items.Count > 1);
        }

        protected string CodigoUsuario
        {
            get
            {
                if (String.IsNullOrEmpty(base.Request["UserName"]))
                    return Classes.Navegacao.UserName;
                else
                    return base.Request["UserName"];
            }
        }

        protected decimal CodigoFase
        {
            get
            {
                foreach (DataGridItem dgi in this.dgFase.Items)
                {
                    if (dgi.Visible)
                        return Convert.ToDecimal((dgi.FindControl("hfCodigoFase") as HiddenField).Value);
                }

                return 0;
            }
        }

        protected decimal TipoFase
        {
            get
            {
                foreach (DataGridItem dgi in this.dgFase.Items)
                {
                    if (dgi.Visible)
                        return Convert.ToDecimal((dgi.FindControl("hfTipoFase") as HiddenField).Value);
                }

                return 0;
            }
        }

        protected decimal CodigoRodada
        {
            get
            {
                foreach (DataGridItem dgi in this.dgRodada.Items)
                {
                    if (dgi.Visible)
                        return Convert.ToDecimal((dgi.FindControl("hfCodigoRodada") as HiddenField).Value);
                }

                return 0;
            }
        }

        protected void CarregarClassificacao(decimal CodigoFase)
        {
            this.dgClassificacao.DataSource = DAO.Consulta.ClassificacaoU(this.CodigoUsuario, CodigoFase);
            this.dgClassificacao.DataBind();

            foreach (DataGridItem dgi in this.dgClassificacao.Items)
            {
                if (String.IsNullOrEmpty((dgi.FindControl("lblDescricao") as Label).Text))
                {
                    dgi.CssClass = "groupClassification";

                    dgi.Cells[0].ColumnSpan = 2;
                    dgi.Cells[1].Visible = false;
                }
            }
        }

        protected void CarregarRodadas(decimal CodigoFase)
        {
            DataTable table = DAO.Consulta.Rodadas(CodigoFase);

            if (table.Rows.Count == 0)
            {
                DataRow row = table.NewRow();
                row["CODIGORODADA"] = 0;
                row["DESCRICAORODADA"] = "Rodada única";

                table.Rows.Add(row);
            }

            this.dgRodada.DataSource = table;
            this.dgRodada.DataBind();

            for (int Index = 1; Index < this.dgRodada.Items.Count; Index++)
                this.dgRodada.Items[Index].Visible = false;

            this.lbRodadaAnterior.Visible = false;
            this.lbProximaRodada.Visible = (this.dgRodada.Items.Count > 1);
        }

        protected void CarregarJogos(decimal CodigoFase, decimal CodigoRodada)
        {
            this.dgJogo.DataSource = DAO.Consulta.JogosU(this.CodigoUsuario, CodigoFase, CodigoRodada);
            this.dgJogo.DataBind();

            bool AlterarBolao = DAO.Usuario.AlterarBolao(this.CodigoUsuario);

            foreach (DataGridItem dgi in this.dgJogo.Items)
            {
                (dgi.FindControl("lblTotalGol1") as Label).Visible = !AlterarBolao;
                (dgi.FindControl("txtTotalGol1") as TextBox).Visible = AlterarBolao;
                (dgi.FindControl("lblTotalGol2") as Label).Visible = !AlterarBolao;
                (dgi.FindControl("txtTotalGol2") as TextBox).Visible = AlterarBolao;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (String.IsNullOrEmpty(base.Request["UserName"]))
                {
                    if (!Classes.Navegacao.IsAuthenticated)
                    {
                        base.Response.Redirect("~/Account/Login.aspx?ReturnUrl=~/Pages/MyBall.aspx");
                        return;
                    }

                    if (!Classes.Navegacao.AceitouRegulamento)
                    {
                        base.Response.Redirect("~/Pages/BallRole.aspx?ReturnUrl=~/Pages/MyBall.aspx");
                        return;
                    }

                    this.trImprimir.Visible = DAO.Usuario.BolaoCompleto(this.CodigoUsuario) && !DAO.Usuario.ImprimiuAposta(this.CodigoUsuario);
                }
                else
                {
                    string UserFullName = DAO.Usuario.UserFullName(this.CodigoUsuario);

                    base.Title = base.Title.Replace("Meu Bolão", "Bolão de " + UserFullName);
                    this.lblTitulo.Text = this.lblTitulo.Text.Replace("Meu Bolão", "Bolão de " + UserFullName);

                    this.trImprimir.Visible = false;
                }

                this.CarregarFases();
                this.CarregarClassificacao(this.CodigoFase);
                this.CarregarRodadas(this.CodigoFase);
                this.CarregarJogos(this.CodigoFase, this.CodigoRodada);
            }
        }

        protected void lbFaseAnterior_Click(object sender, EventArgs e)
        {
            foreach (DataGridItem dgi in this.dgFase.Items)
            {
                if (dgi.Visible)
                {
                    dgi.Visible = false;

                    this.dgFase.Items[dgi.ItemIndex - 1].Visible = true;

                    this.lbFaseAnterior.Visible = (dgi.ItemIndex > 1);
                    this.lbProximaFase.Visible = true;

                    this.CarregarRodadas(this.CodigoFase);
                    this.CarregarJogos(this.CodigoFase, this.CodigoRodada);

                    break;
                }
            }
        }

        protected void lbProximaFase_Click(object sender, EventArgs e)
        {
            foreach (DataGridItem dgi in this.dgFase.Items)
            {
                if (dgi.Visible)
                {
                    dgi.Visible = false;

                    this.dgFase.Items[dgi.ItemIndex + 1].Visible = true;

                    this.lbFaseAnterior.Visible = true;
                    this.lbProximaFase.Visible = (dgi.ItemIndex < this.dgFase.Items.Count - 2);

                    this.CarregarRodadas(this.CodigoFase);
                    this.CarregarJogos(this.CodigoFase, this.CodigoRodada);

                    break;
                }
            }
        }

        protected void lbRodadaAnterior_Click(object sender, EventArgs e)
        {
            foreach (DataGridItem dgi in this.dgRodada.Items)
            {
                if (dgi.Visible)
                {
                    dgi.Visible = false;

                    this.dgRodada.Items[dgi.ItemIndex - 1].Visible = true;

                    this.lbRodadaAnterior.Visible = (dgi.ItemIndex > 1);
                    this.lbProximaRodada.Visible = true;

                    this.CarregarJogos(this.CodigoFase, this.CodigoRodada);

                    break;
                }
            }
        }

        protected void lbProximaRodada_Click(object sender, EventArgs e)
        {
            foreach (DataGridItem dgi in this.dgRodada.Items)
            {
                if (dgi.Visible)
                {
                    dgi.Visible = false;

                    this.dgRodada.Items[dgi.ItemIndex + 1].Visible = true;

                    this.lbRodadaAnterior.Visible = true;
                    this.lbProximaRodada.Visible = (dgi.ItemIndex < this.dgRodada.Items.Count - 2);

                    this.CarregarJogos(this.CodigoFase, this.CodigoRodada);

                    break;
                }
            }
        }

        protected void txtTotalGol_TextChanged(object sender, EventArgs e)
        {
            if (DAO.Usuario.ImprimiuAposta(this.CodigoUsuario))
            {
                base.ClientScript.RegisterStartupScript(this.GetType(), "_Alert", "javascript:window.alert('Não é permitido alterar os resultados após a impressão!');", true);

                (sender as TextBox).Text = String.Empty;
                (sender as TextBox).Focus();

                return;
            }

            TextBox txtTotalGol1;
            TextBox txtTotalGol2;

            foreach (DataGridItem dgi in this.dgJogo.Items)
            {
                txtTotalGol1 = (dgi.FindControl("txtTotalGol1") as TextBox);
                txtTotalGol2 = (dgi.FindControl("txtTotalGol2") as TextBox);

                if ((sender == txtTotalGol1) || (sender == txtTotalGol2))
                {
                    if ((!String.IsNullOrEmpty(txtTotalGol1.Text)) &&
                        (!String.IsNullOrEmpty(txtTotalGol2.Text)) &&
                        (this.TipoFase == (decimal)DAO.TipoFase.MataMata) &&
                        (txtTotalGol1.Text == txtTotalGol2.Text))
                    {
                        base.ClientScript.RegisterStartupScript(this.GetType(), "_Alert", "javascript:window.alert('Na fase de mata-mata não é permitido informar um resultado de empate. Favor informar o resultado final contando as penalidades!');", true);

                        (sender as TextBox).Text = String.Empty;
                        (sender as TextBox).Focus();

                        return;
                    }

                    DAO.Update.ResultadoJogoU(this.CodigoUsuario, Convert.ToDecimal((dgi.FindControl("hfCodigoJogo") as HiddenField).Value), Convert.ToDecimal(String.IsNullOrEmpty(txtTotalGol1.Text) ? "-1" : txtTotalGol1.Text), Convert.ToDecimal(String.IsNullOrEmpty(txtTotalGol2.Text) ? "-1" : txtTotalGol2.Text));

                    if (this.TipoFase == (decimal)DAO.TipoFase.FaseGrupo)
                    {
                        DAO.Update.AtualizarClassificacaoU(this.CodigoUsuario, Convert.ToDecimal((dgi.FindControl("hfCodigoGrupo") as HiddenField).Value), this.CodigoFase);

                        this.CarregarClassificacao(this.CodigoFase);
                    }
                    else if (this.TipoFase == (decimal)DAO.TipoFase.MataMata)
                        DAO.Update.AtualizarMataMataU(this.CodigoUsuario);

                    if (sender == txtTotalGol1)
                        txtTotalGol2.Focus();
                    else
                    {
                        if (dgi.ItemIndex < this.dgJogo.Items.Count - 1)
                            (this.dgJogo.Items[dgi.ItemIndex + 1].FindControl("txtTotalGol1") as TextBox).Focus();
                    }

                    this.trImprimir.Visible = DAO.Usuario.BolaoCompleto(this.CodigoUsuario);
                }
            }
        }

        protected void btnImprimir_Click(object sender, EventArgs e)
        {
            DAO.Usuario.ImprimirAposta(this.CodigoUsuario);

            base.Response.Redirect("~/Pages/MyBallPrint.aspx");
        }
    }
}