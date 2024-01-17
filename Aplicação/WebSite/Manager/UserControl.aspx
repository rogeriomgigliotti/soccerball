<%@ Page Title="Copa do mundo 2022 - Controle de Usuários" Language="C#" MasterPageFile="~/Base/Site.master"
    AutoEventWireup="true" CodeBehind="UserControl.aspx.cs" Inherits="WebSite.Manager.UserControl" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Controle de Usuários
    </h2>
    <p>
        <asp:DataGrid runat="server" ID="dgUsuario" AutoGenerateColumns="false" BorderStyle="Solid"
            CellPadding="3" HeaderStyle-CssClass="headerGrid" Width="100%">
            <Columns>
                <asp:TemplateColumn>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" ID="imgDelete" ImageUrl="~/images/delete.gif" CommandArgument='<%# Bind("CODIGOUSUARIO") %>'
                            OnClientClick="return confirm('Confirma a exclusão do usuário?');" OnClick="imgDelete_Click" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        <asp:Label runat="server" ID="lblCodigoUsuario1" Text="Código Usuário"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblCodigoUsuario2" Text='<%# Bind("CODIGOUSUARIO") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        <asp:Label runat="server" ID="lblNomeUsuario" Text="Nome Usuário"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:TextBox runat="server" ID="txtNomeUsuario" AutoPostBack="true" BorderStyle="None"
                            Text='<%# Bind("NOMEUSUARIO") %>' MaxLength="50" Width="240px" OnTextChanged="txtNomeUsuario_TextChanged"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        <asp:Label runat="server" ID="lblAceitouRegulamento" Text="Aceitou Regulamento"></asp:Label>
                    </HeaderTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:CheckBox runat="server" ID="cbAceitouRegulamento" Enabled="false" Checked='<%# Bind("USUARIOACEITOUREGULAMENTO") %>'>
                        </asp:CheckBox>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        <asp:Label runat="server" ID="lblTotalJogoPendente1" Text="Total Jogo Pendente"></asp:Label>
                    </HeaderTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblTotalJogoPendente2" Text='<%# Bind("TOTALJOGOPENDENTE") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        <asp:Label runat="server" ID="lblImprimiuAposta" Text="Confirmou Aposta"></asp:Label>
                    </HeaderTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:CheckBox runat="server" ID="cbImprimiuAposta" Enabled="false" Checked='<%# Bind("USUARIOIMPRIMIUAPOSTA") %>'>
                        </asp:CheckBox>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        <asp:Label runat="server" ID="lblPagouAposta" Text="Pagou Aposta"></asp:Label>
                    </HeaderTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:CheckBox runat="server" ID="cbPagouAposta" AutoPostBack="true" Checked='<%# Bind("USUARIOPAGOUAPOSTA") %>'
                            OnCheckedChanged="cbPagouAposta_CheckedChanged"></asp:CheckBox>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateColumn>
            </Columns>
        </asp:DataGrid>
    </p>
</asp:Content>
