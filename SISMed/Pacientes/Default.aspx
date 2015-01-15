<%@ Page Title="Pacientes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SISMed.Pacientes.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <h3>Pacientes</h3>
        <asp:EntityDataSource ID="edsPacientes" runat="server"
            ConnectionString="name=SISMedEntities" DefaultContainerName="SISMedEntities"
            EnableFlattening="False" EntitySetName="Pessoas" EntityTypeFilter="Paciente"
            EnableDelete="true" Where="(it.Nome + ' ' + it.Sobrenome LIKE '%' + @Nome + '%') OR (@Nome IS NULL)">
            <WhereParameters>
                <asp:ControlParameter Type="String" ControlID="txbNome" ConvertEmptyStringToNull="true" PropertyName="Text" Name="Nome" />
            </WhereParameters>
        </asp:EntityDataSource>

        <asp:HyperLink NavigateUrl="~/Pacientes/New.aspx" Text="Novo Paciente" CssClass="button green" runat="server" />
        
        <asp:Table ID="tblFiltros" CssClass="filter table" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label Text="Nome: " AssociatedControlID="txbNome" runat="server" />
                    <asp:TextBox ID="txbNome" runat="server" />
                    <asp:Button Text="Filtrar" runat="server" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:GridView ID="gvPacientes" runat="server"
            ShowHeaderWhenEmpty="true" AutoGenerateColumns="False"
            DataSourceID="edsPacientes" DataKeyNames="Id" CssClass="table">
            <Columns>
                <asp:TemplateField HeaderText="Nome">
                    <ItemTemplate>
                        <%# Eval("Nome") + " " + Eval("Sobrenome") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CPF">
                    <ItemTemplate>
                        <%#Eval("CPF") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ações">
                    <ItemTemplate>
                        <a href='<%# Eval("Id", "./show.aspx?id={0}") %>' title="Exibir paciente">
                            <i class="action fa fa-search"></i>
                        </a>
                        <a href='<%# Eval("Id", "./edit.aspx?id={0}") %>' title="Editar paciente">
                            <i class="action fa fa-edit"></i>
                        </a>
                        <% if (!string.IsNullOrWhiteSpace(Session["TipoDeUsuarioId"].ToString()) && int.Parse(Session["TipoDeUsuarioId"].ToString()) >= 3)
                           { %>
                        <a href='<%# Eval("Id", "../consultas/new.aspx?paciente={0}") %>' title="Cadastrar consulta">
                            <i class="action fa fa-medkit"></i>
                        </a>
                        <% } %>
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="True"
                            CommandName="Delete" ToolTip="Remover paciente" Text="<i class='action fa fa-times'></i>" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                Vazio.</EmptyDataTemplate><EmptyDataRowStyle CssClass="center" />
        </asp:GridView>
    </div>
</asp:Content>
