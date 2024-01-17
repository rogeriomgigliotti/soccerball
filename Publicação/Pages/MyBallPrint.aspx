<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyBallPrint.aspx.cs" Inherits="WebSite.Pages.MyBallPrint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Copa do mundo 2022 - Impressão do Meu Bolão</title>
    <script type="text/javascript" language="javascript">
        function imprimir() {
            document.getElementById("btnImprimir").style.display = "none";
            document.getElementById("btnVoltar").style.display = "none";

            window.print();

            document.getElementById("btnImprimir").style.display = "";
            document.getElementById("btnVoltar").style.display = "";
        }
    </script>
</head>
<body>
    <form id="frmMyBallPrint" runat="server">
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <asp:Label runat="server" ID="lblNome" Text="Nome: "></asp:Label><br />
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <table border="1" cellpadding="4" cellspacing="0">
                    <tr>
                        <td valign="top">
                            <asp:DataGrid runat="server" ID="dgLeft" AutoGenerateColumns="false" BorderStyle="None"
                                CellPadding="0" CellSpacing="0" Font-Size="11pt" GridLines="None" ShowHeader="false"
                                Width="250px">
                                <Columns>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblDescricao" Text='<%# Bind("DESCRICAO") %>'></asp:Label>
                                            <asp:HiddenField runat="server" ID="hfTipo" Value='<%# Bind("TIPO") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                </Columns>
                            </asp:DataGrid>
                        </td>
                        <td valign="top">
                            <asp:DataGrid runat="server" ID="dgRight" AutoGenerateColumns="false" BorderStyle="None"
                                CellPadding="0" CellSpacing="0" Font-Size="11pt" GridLines="None" ShowHeader="false"
                                Width="250px">
                                <Columns>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblDescricao" Text='<%# Bind("DESCRICAO") %>'></asp:Label>
                                            <asp:HiddenField runat="server" ID="hfTipo" Value='<%# Bind("TIPO") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                </Columns>
                            </asp:DataGrid>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <br />
                <br />
                <input type="button" value="Imprimir" id="btnImprimir" onclick="javascript:imprimir();" />
                <input type="button" value="Voltar" id="btnVoltar" onclick="javascript:history.go(-1);" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
