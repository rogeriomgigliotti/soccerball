<%@ Page Title="Copa do mundo 2022 - Ranking do Bolão" Language="C#" MasterPageFile="~/Base/Site.master"
    AutoEventWireup="true" CodeBehind="BallRanking.aspx.cs" Inherits="WebSite.Pages.BallRanking" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>Ranking do Bolão</h2>
    <p>
        <asp:DataGrid runat="server" ID="dgRanking" AutoGenerateColumns="false" BorderStyle="Solid"
            CellPadding="3" HeaderStyle-CssClass="headerGrid" Width="100%">
            <Columns>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        <asp:Label runat="server" ID="lblPosicao1" Text="Posição"></asp:Label>
                    </HeaderTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblPosicao2" Text='<%# Eval("POSICAO") + "º lugar" %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        <asp:Label runat="server" ID="lblPontuacao1" Text="Pontuação"></asp:Label>
                    </HeaderTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblPontuacao2" Text='<%# Eval("PONTUACAO") + " ponto(s)" %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        <asp:Label runat="server" ID="lblNomeUsuario" Text="Apostador"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblNomeUsuario" Text='<%# Bind("NOMEUSUARIO") %>'
                            Visible='<%# !this.CampeonatoIniciou %>'></asp:Label>
                        <asp:LinkButton runat="server" ID="lbNomeUsuario" Text='<%# Bind("NOMEUSUARIO") %>'
                            CommandArgument='<%# Bind("CODIGOUSUARIO") %>' OnClick="lbNomeUsuario_Click"
                            Visible='<%# this.CampeonatoIniciou %>'></asp:LinkButton>
                        <asp:HiddenField runat="server" ID="hfCodigoUsuario" Value='<%# Bind("CODIGOUSUARIO") %>' />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        <asp:Label runat="server" ID="lblPercentual1" Text="Premio (%)"></asp:Label>
                    </HeaderTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblPercentual2" Text='<%# Convert.ToDecimal(Eval("PERCENTUAL")).ToString("#,##0.00", new System.Globalization.CultureInfo("pt-BR")) %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        <asp:Label runat="server" ID="lblValor1" Text="Premio (R$)"></asp:Label>
                    </HeaderTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblValor2" Text='<%# Convert.ToDecimal(Eval("VALOR")).ToString("#,##0.00", new System.Globalization.CultureInfo("pt-BR")) %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        <asp:Label runat="server" ID="lblStatus1" Text="Status"></asp:Label>
                    </HeaderTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="middle">
                                    <asp:Image runat="server" ID="imgUp" ImageUrl="~/Images/up.png" ToolTip="Subiu no ranking"
                                        Visible='<%# (Eval("STATUS") != DBNull.Value) && (Convert.ToInt32(Eval("STATUS")) > 0) %>' />
                                    <asp:Image runat="server" ID="imgLeft" ImageUrl="~/Images/left.png" ToolTip="Se manteve no ranking"
                                        Visible='<%# (Eval("STATUS") != DBNull.Value) && (Convert.ToInt32(Eval("STATUS")) == 0) %>' />
                                    <asp:Image runat="server" ID="imgDown" ImageUrl="~/Images/down.png" ToolTip="Caiu no ranking"
                                        Visible='<%# (Eval("STATUS") != DBNull.Value) && (Convert.ToInt32(Eval("STATUS")) < 0) %>' />
                                </td>
                                <td runat="server" valign="middle" visible='<%# (Eval("STATUS") != DBNull.Value) && (Convert.ToInt32(Eval("STATUS")) != 0) %>'>
                                    <asp:Label runat="server" ID="lblStatus2" Text='<%# " " + Eval("STATUS").ToString().Replace("-", "") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateColumn>
            </Columns>
        </asp:DataGrid>
    </p>
</asp:Content>
