<%@ Page Title="Novo Paciente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="New.aspx.cs" Inherits="SISMed.Pacientes.New" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="/scripts/jquery.maskedinput.min.js"></script>
    <script>
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
        <asp:EntityDataSource ID="edsPaciente" runat="server" ConnectionString="name=SISMedEntities" DefaultContainerName="SISMedEntities" EnableFlattening="False" EnableInsert="True" EntitySetName="Pessoas" EntityTypeFilter="Paciente" OnInserted="edsPaciente_Inserted">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsEstadosCivis" runat="server" ConnectionString="name=SISMedEntities" DefaultContainerName="SISMedEntities" EnableFlattening="False" EntitySetName="EstadosCivis">
        </asp:EntityDataSource>
        <asp:FormView ID="fvPaciente" runat="server" RenderOuterTable="false" DataKeyNames="Id" DataSourceID="edsPaciente" DefaultMode="Insert">
            <InsertItemTemplate>
                <asp:ValidationSummary ID="ValidationSummary1" DisplayMode="SingleParagraph" CssClass="notification error no-margin"
                    runat="server" HeaderText="Preencha os campos corretamente." />
                <fieldset>
                    <div class="legend">
                        Dados Pessoais
                    </div>
                    <div class="content">
                        <asp:Label ID="Label1" Text="Nome:" AssociatedControlID="NomeTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Text="*" CssClass="required" ControlToValidate="NomeTextBox" runat="server" />
                        <br />
                        <asp:Label ID="Label2" Text="Sobrenome:" AssociatedControlID="SobrenomeTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="SobrenomeTextBox" runat="server" Text='<%# Bind("Sobrenome") %>'/>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Text="*" CssClass="required" ControlToValidate="SobrenomeTextBox" runat="server" />
                        <br />
                        <asp:Label ID="Label3" Text="Data de Nascimento:" AssociatedControlID="DataNascTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="DataNascTextBox" CssClass="data" runat="server" Text='<%# Bind("DataNascimento") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Text="*" CssClass="required" ControlToValidate="DataNascTextBox" runat="server" />
                        <br />
                        <asp:Label ID="Label4" Text="CPF:" AssociatedControlID="CPFTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="CPFTextBox" CssClass="cpf" runat="server" Text='<%# Bind("CPF") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Text="*" CssClass="required" ControlToValidate="CPFTextBox" runat="server" />
                        <br />
                        <asp:Label ID="Label5" Text="RG:" AssociatedControlID="RGTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="RGTextBox" CssClass="rg" runat="server" Text='<%# Bind("RG") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Text="*" CssClass="required" ControlToValidate="RGTextBox" runat="server" />
                        <br />
                        <asp:Label ID="Label6" Text="Sexo:" AssociatedControlID="Sexo" CssClass="label" runat="server" />
                        <asp:DropDownList ID="Sexo" SelectedValue='<%# Bind("Sexo") %>' runat="server">
                            <asp:ListItem Text="Masculino" Value="M" />
                            <asp:ListItem Text="Feminino" Value="F" />
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label7" Text="Estado Civil:" AssociatedControlID="EstadosCivisDropDownList" CssClass="label" runat="server" />
                        <asp:DropDownList ID="EstadosCivisDropDownList" SelectedValue='<%# Bind("EstadoCivilId") %>' DataSourceID="edsEstadosCivis" DataTextField="Nome" DataValueField="Id" runat="server">
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label8" Text="Telefone Celular:" AssociatedControlID="TelefoneCelularTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="TelefoneCelularTextBox" CssClass="telefone" runat="server" Text='<%# Bind("TelefoneCelular") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Text="*" CssClass="required" ControlToValidate="TelefoneCelularTextBox" runat="server" />
                        <br />
                        <asp:Label ID="Label9" Text="Telefone Residencial:" AssociatedControlID="TelefoneResidencialTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="TelefoneResidencialTextBox" CssClass="telefone" runat="server" Text='<%# Bind("TelefoneResidencial") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Text="*" CssClass="required" ControlToValidate="TelefoneResidencialTextBox" runat="server" />
                    </div>
                </fieldset>
                <fieldset>
                    <div class="legend">
                        Informações Hospitalares
                    </div>
                    <div class="content">
                        <asp:Label ID="Label10" Text="Tipo Sanguíneo:" AssociatedControlID="DropDownList1" CssClass="label" runat="server" />
                        <asp:DropDownList ID="DropDownList1" SelectedValue='<%# Bind("TipoSanguineo") %>' runat="server">
                            <asp:ListItem Text="A" Value="A" />
                            <asp:ListItem Text="B" Value="B" />
                            <asp:ListItem Text="O" Value="O" />
                            <asp:ListItem Text="AB" Value="AB" />
                        </asp:DropDownList>
                        <asp:Label ID="Label11" Text="Fator Rh:" AssociatedControlID="DropDownList2" CssClass="label" runat="server" />
                        <asp:DropDownList ID="DropDownList2" SelectedValue='<%# Bind("FatorRh") %>' runat="server">
                            <asp:ListItem Text="+" Value="True" />
                            <asp:ListItem Text="-" Value="False" />
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label12" Text="Alergias:" AssociatedControlID="AlergiasTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="AlergiasTextBox" TextMode="MultiLine" runat="server" Text='<%# Bind("Alergias") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Text="*" CssClass="required" ControlToValidate="AlergiasTextBox" runat="server" />
                    </div>
                </fieldset>
                <asp:LinkButton ID="InsertButton" CssClass="green button block center" runat="server" CausesValidation="True" CommandName="Insert" Text="<i class='fa fa-plus'></i> Cadastrar" />
            </InsertItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>
