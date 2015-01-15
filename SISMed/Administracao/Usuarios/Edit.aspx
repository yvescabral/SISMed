﻿<%@ Page Title="Editar Usuário" Language="C#" MasterPageFile="~/Site.Admin.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="SISMed.Administracao.Usuarios.Edit" %>
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
        <asp:EntityDataSource ID="edsUsuario" runat="server" ConnectionString="name=SISMedEntities" DefaultContainerName="SISMedEntities" EnableFlattening="False" EnableUpdate="True" EntitySetName="Pessoas" EntityTypeFilter="Usuario" Where="it.Id = @Id" OnUpdating="edsUsuario_Updating" OnUpdated="edsUsuario_Updated">
            <WhereParameters>
                <asp:QueryStringParameter Name="Id" Type="Int32" QueryStringField="id" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsEstadosCivis" runat="server" ConnectionString="name=SISMedEntities" DefaultContainerName="SISMedEntities" EnableFlattening="False" EntitySetName="EstadosCivis">
        </asp:EntityDataSource>
        <asp:FormView ID="fvUsuario" runat="server" RenderOuterTable="false" DataKeyNames="Id" DataSourceID="edsUsuario" DefaultMode="Edit">
            <EditItemTemplate>
                <asp:ValidationSummary DisplayMode="SingleParagraph" CssClass="notification error no-margin"
                    runat="server" HeaderText="Preencha os campos corretamente." />
                <fieldset>
                    <div class="legend">
                        Conta
                    </div>
                    <div class="content">
                        <asp:Label Text="Email:" AssociatedControlID="EmailTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                        <asp:RequiredFieldValidator Text="*" CssClass="required" ControlToValidate="EmailTextBox" runat="server" />
                        <br />
                        <asp:Label Text="Senha:" AssociatedControlID="SenhaTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="SenhaTextBox" runat="server" TextMode="Password" Text='<%# Bind("Senha") %>' />
                    </div>
                 </fieldset>
                 <fieldset>
                    <div class="legend">
                        Dados Pessoais
                    </div>
                    <div class="content">
                        <asp:Label Text="Nome:" AssociatedControlID="NomeTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
                        <asp:RequiredFieldValidator Text="*" CssClass="required" ControlToValidate="NomeTextBox" runat="server" />
                        <br />
                        <asp:Label Text="Sobrenome:" AssociatedControlID="SobrenomeTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="SobrenomeTextBox" runat="server" Text='<%# Bind("Sobrenome") %>' />
                        <asp:RequiredFieldValidator Text="*" CssClass="required" ControlToValidate="SobrenomeTextBox" runat="server" />
                        <br />
                        <asp:Label Text="Data de Nascimento:" AssociatedControlID="DataNascTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="DataNascTextBox" CssClass="data" runat="server" Text='<%# Bind("DataNascimento") %>' />
                        <asp:RequiredFieldValidator Text="*" CssClass="required" ControlToValidate="DataNascTextBox" runat="server" />
                        <br />
                        <asp:Label Text="CPF:" AssociatedControlID="CPFTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="CPFTextBox" CssClass="cpf" runat="server" Text='<%# Bind("CPF") %>' />
                        <asp:RequiredFieldValidator Text="*" CssClass="required" ControlToValidate="CPFTextBox" runat="server" />
                        <br />
                        <asp:Label Text="RG:" AssociatedControlID="RGTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="RGTextBox" CssClass="rg" runat="server" Text='<%# Bind("RG") %>' />
                        <asp:RequiredFieldValidator Text="*" CssClass="required" ControlToValidate="RGTextBox" runat="server" />
                        <br />
                        <asp:Label Text="Sexo:" AssociatedControlID="Sexo" CssClass="label" runat="server" />
                        <asp:DropDownList ID="Sexo" SelectedValue='<%# Bind("Sexo") %>' runat="server">
                            <asp:ListItem Text="Masculino" Value="M" />
                            <asp:ListItem Text="Feminino" Value="F" />
                        </asp:DropDownList>
                        <br />
                        <asp:Label Text="Estado Civil:" AssociatedControlID="EstadosCivisDropDownList" CssClass="label" runat="server" />
                        <asp:DropDownList ID="EstadosCivisDropDownList" SelectedValue='<%# Bind("EstadoCivilId") %>' DataSourceID="edsEstadosCivis" DataTextField="Nome" DataValueField="Id" runat="server">
                        </asp:DropDownList>
                        <br />
                        <asp:Label Text="Telefone Celular:" AssociatedControlID="TextBox1" CssClass="label" runat="server" />
                        <asp:TextBox ID="TextBox1" CssClass="telefone" runat="server" Text='<%# Bind("TelefoneCelular") %>' />
                        <asp:RequiredFieldValidator Text="*" CssClass="required" ControlToValidate="TextBox1" runat="server" />
                        <br />
                        <asp:Label Text="Telefone Residencial:" AssociatedControlID="TextBox2" CssClass="label" runat="server" />
                        <asp:TextBox ID="TextBox2" CssClass="telefone" runat="server" Text='<%# Bind("TelefoneResidencial") %>' />
                        <asp:RequiredFieldValidator Text="*" CssClass="required" ControlToValidate="TextBox2" runat="server" />
                    </div>
                </fieldset>
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CssClass="green button block center"
                    CommandName="Update" Text="<i class='fa fa-edit'></i> Editar" />
            </EditItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>
