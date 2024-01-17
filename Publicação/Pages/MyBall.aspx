<%@ Page Title="Copa do mundo 2022 - Meu Bolão" Language="C#" MasterPageFile="~/Base/Site.master"
    AutoEventWireup="true" CodeBehind="MyBall.aspx.cs" Inherits="WebSite.Pages.MyBall" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        <asp:Label runat="server" ID="lblTitulo" Text="Meu Bolão"></asp:Label>
    </h2>
    <table border="0" cellpadding="4" cellspacing="0" width="100%">
        <tr>
            <td colspan="2">
                <table class="navigatePhase" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td style="text-align: left; width: 100px">
                            <asp:LinkButton runat="server" ID="lbFaseAnterior" Text="<< Anterior" OnClick="lbFaseAnterior_Click"></asp:LinkButton>
                        </td>
                        <td style="text-align: center">
                            <asp:DataGrid runat="server" ID="dgFase" AutoGenerateColumns="false" GridLines="None"
                                ShowHeader="false" CellPadding="0" CellSpacing="0" Width="100%">
                                <Columns>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblDescricaoFase" CssClass="titlePhase" Text='<%# Bind("DESCRICAOFASE") %>'></asp:Label>
                                            <asp:HiddenField runat="server" ID="hfCodigoFase" Value='<%# Bind("CODIGOFASE") %>' />
                                            <asp:HiddenField runat="server" ID="hfTipoFase" Value='<%# Bind("TIPOFASE") %>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateColumn>
                                </Columns>
                            </asp:DataGrid>
                        </td>
                        <td style="text-align: right; width: 100px">
                            <asp:LinkButton runat="server" ID="lbProximaFase" Text="Próxima >>" OnClick="lbProximaFase_Click"></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table border="0" cellpadding="0" cellspacing="0" width="344px">
                    <tr>
                        <td>
                            <table class="panelClassification" border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td style="text-align: center">
                                        <asp:Label runat="server" ID="lblClassificacao" CssClass="titleClassification" Text="Classificação"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DataGrid runat="server" ID="dgClassificacao" AutoGenerateColumns="false" CellPadding="3"
                                ShowHeader="false" BorderStyle="Solid" Width="100%">
                                <Columns>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblClassificacao" Text='<%# Bind("CLASSIFICACAO") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:Image runat="server" ID="imgBandeira" ImageUrl='<%# "~/Images/Flags/" + Eval("CODIGOTIME") + ".png" %>'
                                                            Height="30px" Width="30px" Visible='<%# Eval("CODIGOTIME") != DBNull.Value %>' />
                                                    </td>
                                                    <td style="padding-left: 3px">
                                                        <asp:Label runat="server" ID="lblDescricao" Text='<%# Bind("DESCRICAO") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle Width="137px" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblPG" Text='<%# Bind("PG") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="24px" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblJ" Text='<%# Bind("J") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="24px" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblV" Text='<%# Bind("V") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="24px" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblE" Text='<%# Bind("E") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="24px" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblGP" Text='<%# Bind("GP") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="24px" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblGC" Text='<%# Bind("GC") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="24px" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblSG" Text='<%# Bind("SG") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="24px" />
                                    </asp:TemplateColumn>
                                </Columns>
                            </asp:DataGrid>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <br />
                            <asp:Label runat="server" ID="lblInfo" Text="PG - Pontos ganhos, J - Jogos, V - Vitórias, E - Empates, GP - Gols pró, GC - Gols contra, SG - Saldo de gols"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table border="0" cellpadding="0" cellspacing="0" width="400px">
                    <tr>
                        <td>
                            <table class="navigateRound" border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td style="text-align: left; width: 100px">
                                        <asp:LinkButton runat="server" ID="lbRodadaAnterior" Text="<< Anterior" OnClick="lbRodadaAnterior_Click"></asp:LinkButton>
                                    </td>
                                    <td style="text-align: center">
                                        <asp:DataGrid runat="server" ID="dgRodada" AutoGenerateColumns="false" GridLines="None"
                                            ShowHeader="false" CellPadding="0" CellSpacing="0" Width="100%">
                                            <Columns>
                                                <asp:TemplateColumn>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblDescricaoRodada" CssClass="titleRound" Text='<%# Bind("DESCRICAORODADA") %>'></asp:Label>
                                                        <asp:HiddenField runat="server" ID="hfCodigoRodada" Value='<%# Bind("CODIGORODADA") %>' />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                                    <td style="text-align: right; width: 100px">
                                        <asp:LinkButton runat="server" ID="lbProximaRodada" Text="Próxima >>" OnClick="lbProximaRodada_Click"></asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DataGrid runat="server" ID="dgJogo" AutoGenerateColumns="false" CellPadding="3"
                                ShowHeader="false" BorderStyle="Solid" Width="100%">
                                <Columns>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:HiddenField runat="server" ID="hfCodigoGrupo" Value='<%# Bind("CODIGOGRUPO") %>' />
                                            <asp:HiddenField runat="server" ID="hfCodigoJogo" Value='<%# Bind("CODIGOJOGO") %>' />
                                            <asp:Label runat="server" ID="lblCodigoJogo" Text='<%# Bind("CODIGOJOGO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="20px" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblHorario" Text='<%# Bind("HORARIO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="70px" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td style="padding-right: 3px">
                                                        <asp:Label runat="server" ID="lblNomeTime1" Text='<%# Bind("NOMETIME1") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Image runat="server" ID="imgBandeira1" ImageUrl='<%# "~/Images/Flags/" + Eval("CODIGOTIME1") + ".png" %>'
                                                            Height="30px" Width="30px" Visible='<%# Eval("CODIGOTIME1") != DBNull.Value %>' />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="118px" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblTotalGol1" Text='<%# Bind("TOTALGOL1") %>'></asp:Label>
                                            <asp:TextBox runat="server" ID="txtTotalGol1" AutoPostBack="true" BorderStyle="None"
                                                Style="text-align: center" Text='<%# Bind("TOTALGOL1") %>' MaxLength="2" Width="14px"
                                                autocomplete="off" OnTextChanged="txtTotalGol_TextChanged"></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="20px" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblTotalGol2" Text='<%# Bind("TOTALGOL2") %>'></asp:Label>
                                            <asp:TextBox runat="server" ID="txtTotalGol2" AutoPostBack="true" BorderStyle="None"
                                                Style="text-align: center" Text='<%# Bind("TOTALGOL2") %>' MaxLength="2" Width="14px"
                                                autocomplete="off" OnTextChanged="txtTotalGol_TextChanged"></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="20px" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:Image runat="server" ID="imgBandeira2" ImageUrl='<%# "~/Images/Flags/" + Eval("CODIGOTIME2") + ".png" %>'
                                                            Height="30px" Width="30px" Visible='<%# Eval("CODIGOTIME2") != DBNull.Value %>' />
                                                    </td>
                                                    <td style="padding-left: 3px">
                                                        <asp:Label runat="server" ID="lblNomeTime2" Text='<%# Bind("NOMETIME2") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle Width="118px" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:Image runat="server" ID="imgPontuacao" ImageUrl='<%# "~/Images/" + Eval("PONTUACAO") + ".png" %>'
                                                ToolTip='<%# Bind("TOOLTIP") %>' Visible='<%# Eval("PONTUACAO") != DBNull.Value %>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="28px" />
                                    </asp:TemplateColumn>
                                </Columns>
                            </asp:DataGrid>
                        </td>
                    </tr>
                    <tr runat="server" id="trImprimir" visible="false">
                        <td style="text-align: center">
                            <br />
                            <asp:Button runat="server" ID="btnImprimir" Text="Confirmar o Bolão" OnClientClick="return confirm('Após a confirmação não será mais possível alterar os resultados dos jogos. Deseja prosseguir com a confirmação?');"
                                OnClick="btnImprimir_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
