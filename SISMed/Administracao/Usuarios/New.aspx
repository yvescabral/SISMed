<%@ Page Title="Novo Usuário" Language="C#" MasterPageFile="~/Site.Admin.Master" AutoEventWireup="true" CodeBehind="New.aspx.cs" Inherits="SISMed.Administracao.Usuarios.New" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="/scripts/jquery.maskedinput.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $(".cpf").mask("999.999.999-99");
            $(".rg").mask("999.999.999");
            $(".telefone").mask("(99) 9999-9999");
            $(".data").mask("99/99/9999");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card inline-block">
        <asp:SqlDataSource ID="SqlDataSourceRoles" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SISMedConnectionString %>" 
            SelectCommand="SELECT [RoleName] FROM [vw_aspnet_Roles]"></asp:SqlDataSource>
        <asp:EntityDataSource ID="edsEstadosCivis" runat="server" ConnectionString="name=SISMedEntities" DefaultContainerName="SISMedEntities" EnableFlattening="False" EntitySetName="EstadosCivis">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsUsuario" runat="server" ConnectionString="name=SISMedEntities" DefaultContainerName="SISMedEntities" EnableFlattening="False" EntitySetName="Pessoas" EnableInsert="True" EntityTypeFilter="Usuario" OnInserting="edsUsuario_Inserting" OnInserted="edsUsuario_Inserted">
        </asp:EntityDataSource>
        <asp:SqlDataSource ID="sdsMedico" runat="server" ConnectionString="<%$ ConnectionStrings:SISMedConnectionString %>" InsertCommand="INSERT INTO [Medicos] ([Usuario_Id]) VALUES (@Usuario_Id)">
        </asp:SqlDataSource>
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
            CreateUserButtonText="Enviar" LoginCreatedUser="False" 
            oncreateduser="CreateUserWizard1_CreatedUser">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                    <ContentTemplate>
                        <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                        <fieldset>
                        <div class="legend">
                            Conta
                        </div>
                        <div class="content">
                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" CssClass="label">Usuário:</asp:Label>
                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                ControlToValidate="UserName" ErrorMessage="Nome de usuário é necessário." 
                                ToolTip="Nome de usuário é necessário." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                           
                            <br />
                           
                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password"  CssClass="label">Senha:</asp:Label>
                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                ControlToValidate="Password" ErrorMessage="Senha é necessária." 
                                ToolTip="Senha é necessária." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                AssociatedControlID="ConfirmPassword" CssClass="label">Confirme a senha:</asp:Label>
                            <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                ControlToValidate="ConfirmPassword" 
                                ErrorMessage="Confirm Password is required." 
                                ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email" CssClass="label">E-mail:</asp:Label>
                            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                ControlToValidate="Email" ErrorMessage="E-mail is required." 
                                ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            <br />
                        <asp:Label ID="Label10" runat="server" AssociatedControlID="Email" CssClass="label">Tipo:</asp:Label>
                            <asp:DropDownList ID="TipoDeUsuarioDropdown" runat="server" 
                                DataSourceID="SqlDataSourceRoles" DataTextField="RoleName" 
                                DataValueField="RoleName">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="EmailRequired0" runat="server" 
                                ControlToValidate="TipoDeUsuarioDropdown" ErrorMessage="Tipo de usuário é necessário." 
                                ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        <br />
                            <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                Display="Dynamic" 
                                ErrorMessage="A confirmação é diferente da senha" 
                                ValidationGroup="CreateUserWizard1"></asp:CompareValidator><br />
                        </div>
                        <fieldset>
                    <div class="legend">
                        Dados Pessoais
                    </div>
                    <div class="content">
                        <asp:Label ID="Label1" Text="Nome:" AssociatedControlID="NomeTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="NomeTextBox" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Text="*" CssClass="required" ControlToValidate="NomeTextBox" runat="server" />
                        <br />
                        <asp:Label ID="Label2" Text="Sobrenome:" AssociatedControlID="SobrenomeTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="SobrenomeTextBox" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Text="*" CssClass="required" ControlToValidate="SobrenomeTextBox" runat="server" />
                        <br />
                        <asp:Label ID="Label3" Text="Data de Nascimento:" AssociatedControlID="DataNascTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="DataNascTextBox" CssClass="data" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Text="*" CssClass="required" ControlToValidate="DataNascTextBox" runat="server" />
                        <br />
                        <asp:Label ID="Label4" Text="CPF:" AssociatedControlID="CPFTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="CPFTextBox" CssClass="cpf" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Text="*" CssClass="required" ControlToValidate="CPFTextBox" runat="server" />
                        <br />
                        <asp:Label ID="Label5" Text="RG:" AssociatedControlID="RGTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="RGTextBox" CssClass="rg" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Text="*" CssClass="required" controltovalidate="RGTextBox" runat="server"/>
                        <br />
                        <asp:Label ID="Label6" Text="Sexo:" AssociatedControlID="Sexo" CssClass="label" runat="server" />
                        <asp:DropDownList ID="Sexo" runat="server">
                            <asp:ListItem Text="Masculino" Value="M" />
                            <asp:ListItem Text="Feminino" Value="F" />
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label7" Text="Estado Civil:" AssociatedControlID="EstadosCivisDropDownList" CssClass="label" runat="server" />
                        <asp:DropDownList ID="EstadosCivisDropDownList" DataSourceID="edsEstadosCivis" DataTextField="Nome" DataValueField="Id" runat="server">
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label8" Text="Telefone Celular:" AssociatedControlID="TextBox1" CssClass="label" runat="server" />
                        <asp:TextBox ID="TextBox1" CssClass="telefone" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Text="*" CssClass="required" ControlToValidate="TextBox1" runat="server" />
                        <br />
                        <asp:Label ID="Label9" Text="Telefone Residencial:" AssociatedControlID="TextBox2" CssClass="label" runat="server" />
                        <asp:TextBox ID="TextBox2" CssClass="telefone" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Text="*" CssClass="required" ControlToValidate="TextBox2" runat="server" />
                    </div>
                </fieldset>
                        </fieldset>
                    </ContentTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
    </div>
</asp:Content>
