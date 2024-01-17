<%@ Page Title="Copa do mundo 2022 - Conectar-se" Language="C#" MasterPageFile="~/Base/Site.master"
    AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebSite.Account.Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Conectar-se
    </h2>
    <p>
        Por favor entre com o seu usuário e senha.
        <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">Cadastre-se</asp:HyperLink>
        caso ainda não possua uma conta.
    </p>
    <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false">
        <LayoutTemplate>
            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification"
                ValidationGroup="LoginUserValidationGroup" />
            <div class="accountInfo">
                <fieldset class="login">
                    <legend>Informações da conta</legend>
                    <p>
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Usuário:</asp:Label>
                        <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                            CssClass="failureNotification" ErrorMessage="Usuário é obrigatório." ToolTip="Usuário é obrigatório."
                            ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Senha:</asp:Label>
                        <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                            CssClass="failureNotification" ErrorMessage="Senha é obrigatória." ToolTip="Senha é obrigatória."
                            ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:CheckBox ID="RememberMe" runat="server" />
                        <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Manter-me conectado</asp:Label>
                    </p>
                </fieldset>
                <p class="submitButton">
                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Conectar" ValidationGroup="LoginUserValidationGroup" />
                </p>
            </div>
        </LayoutTemplate>
    </asp:Login>
</asp:Content>
