<%@ Page Title="Copa do mundo 2022 - Regras da Copa" Language="C#" MasterPageFile="~/Base/Site.master"
    AutoEventWireup="true" CodeBehind="CupRole.aspx.cs" Inherits="WebSite.Pages.CupRole" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Regras da Copa
    </h2>
    <p>
        As 32 seleções da Copa do Mundo foram divididas em oito grupos de quatro times cada
        um.
    </p>
    <p>
        Estas equipes jogam entre si dentro da chave, e os dois melhores classificam-se
        para as oitavas de final.
    </p>
    <p>
        Em caso de empate no número de pontos entre uma ou mais equipes, os critérios de
        desempate serão, pela ordem:
    </p>
    <p>
        <ol type="1">
            <li>Saldo de gols.</li>
            <li>Número de gols marcados.</li>
            <li>Confronto direto.</li>
            <li>Saldo de gols no confronto direto entre os times (para o caso de empate entre mais
                de duas equipes).</li>
            <li>Maior número de gols marcados nos confrontos entre os times envolvidos (para o caso
                de empate entre mais de duas equipes).</li>
            <li>Sorteio.</li>
        </ol>
    </p>
    <p>
        A partir das oitavas de final, as equipes disputam jogos eliminatórios. Em caso
        de empate, será disputada uma prorrogação com dois tempos de 15 minutos. A persistir
        a igualdade, haverá cobrança de tiros livres da marca do pênalti.
    </p>
    <p>
        Se o empate continuar após a primeira série de cinco cobranças, as equipes continuarão
        bater os pênaltis. Se um time errar e o outro acertar, a disputa será encerrada.
    </p>
</asp:Content>
