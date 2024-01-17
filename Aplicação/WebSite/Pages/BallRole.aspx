<%@ Page Title="Copa do mundo 2022 - Regras do Bolão" Language="C#" MasterPageFile="~/Base/Site.master"
    AutoEventWireup="true" CodeBehind="BallRole.aspx.cs" Inherits="WebSite.Pages.BallRole" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Regras do Bolão
    </h2>
    <p>
        Será obrigatório concluir o preenchimento de todos os jogos e fazer o pagamento da aposta até o dia <b>19/11/2022</b>.
    </p>
    <p>
        O valor da aposta será de <b>R$ 20,00</b> e o pagamennto deverá ser realizado por <b>PIX</b>, usando a chave de email <b>renangigliotti@gmail.com</b>
    </p>
    <p>
        <ol type="a">
            <li>Nome: RENAN MARTINI GIGLIOTTI</li>
            <li>Instituição: PAGSEGURO INTERNET IP S.A.</li>
        </ol>
    </p>
    <p>
        Deverá ser enviado o comprovante de pagamento para o email <b>renangigliotti@gmail.com</b>
    </p>
    <p>
        Após a confirmação do pagamento pelos administradores, seu nome aparecerá na lista de jogadores disponível no Ranking e você já estará participando do bolão.
    </p>
    <p>
        Em caso de empate nos jogos de mata-mata, será considerado o resultado final do jogo somado ao resultado das penalidades.
    </p>
    <p>
        Critérios de pontuação:
    </p>
    <p>
        <ol type="a">
            <li>Acerto exato: 3 pontos.<br />
                Exemplo: o jogador apostou que o resultado seria 2x1 e o resultado foi 2x1.</li>
            <li>Acerto parcial: 1 ponto.<br />
                Exemplo: o jogador apostou que o resultado seria 2x1 e o resultado foi 3x0 ou então
                apostou no empate de 0x0 e o resultado foi 1x1.</li>
        </ol>
    </p>
    <p>
        7-) Distribuição da premiação:
    </p>
    <p>
        <ol type="a">
            <li>70% da arrecadação para o 1º colocado.</li>
            <li>20% da arrecadação para o 2º colocado.</li>
            <li>10% da arrecadação para o 3º colocado.</li>
        </ol>
    </p>
    <p>
        8-) Em caso de empate, o prêmio será dividido entre os ganhadores seguindo as regras
        abaixo:
    </p>
    <p>
        <ol type="a">
            <li>3 pessoas ou mais empatam no primeiro lugar, então o total arrecadado das 3 colocações
                será dividido entre eles.</li>
            <li>2 pessoas empatam no primeiro lugar, então a soma da arrecadação do primeiro e segundo
                lugar será dividida entre eles.</li>
            <li>2 pessoas ou mais empatam no segundo lugar, a soma da arrecadação do segundo e terceiro
                lugar será dividida entre eles.</li>
            <li>2 pessoas ou mais empatam no terceiro lugar, a arrecadação do terceiro lugar sera
                dividida entre eles.</li>
        </ol>
    </p>
    <div runat="server" id="dvBotoes">
        <br />
        <asp:Button runat="server" ID="btnAceitar" Text="Aceito" OnClick="btnAceitar_Click" />
        <asp:Button runat="server" ID="btnNaoAceitar" Text="Não Aceito" OnClick="btnNaoAceitar_Click" />
    </div>
</asp:Content>
