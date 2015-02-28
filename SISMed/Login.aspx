<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SISMed.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>Login · SISMed</title>
    <link href="http://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
    <link href="<%: ResolveUrl("~/content/css/normalize.css") %>" rel="stylesheet" />
    <link href="<%: ResolveUrl("~/content/css/boilerplate.css") %>" rel="stylesheet" />
    <link href="<%: ResolveUrl("~/content/css/font-awesome.css") %>" rel="stylesheet" />
    <link href="<%: ResolveUrl("~/content/css/main.css") %>" rel="stylesheet" />
    <script src="<%: ResolveUrl("~/scripts/jquery-1.10.2.min.js") %>"></script>
    <script src="<%: ResolveUrl("~/scripts/modernizr-2.6.2.min.js") %>"></script>
    <script src="<%: ResolveUrl("~/scripts/main.js") %>"></script>
    <script src="<%: ResolveUrl("~/scripts/plugins.js") %>"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="login">
        <h2>
            <span class="fa fa-lock"></span> Autenticação
        </h2>
        <fieldset>
            <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Dashboard/Default.aspx" FailureText="Usuário ou senha incorretos.">
                <LayoutTemplate>
                    <asp:Panel runat="server" CssClass="alert">
                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                    </asp:Panel>
                    <asp:Panel CssClass="field control" runat="server">
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Usuário:</asp:Label>
                        <asp:TextBox ID="UserName" runat="server"  CssClass="fill width"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                    </asp:Panel>
                    <asp:Panel CssClass="field control" runat="server">
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Senha:</asp:Label>
                        <asp:TextBox ID="Password" runat="server" TextMode="Password"  CssClass="fill width"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                    </asp:Panel>
                    
                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Entrar" ValidationGroup="Login1"  CssClass="button green"/>
                   
                </LayoutTemplate>
            </asp:Login>
        </fieldset>
    </div>
    </form>
</body>
</html>
