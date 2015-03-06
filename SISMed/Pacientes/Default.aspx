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
                    <asp:TextBox ID="txbNome" runat="server" OnTextChanged="txbNome_OnTextChanged" />
                    <asp:UpdatePanel runat="server" ID="Filtro" RenderMode="Inline" UpdateMode="Conditional" ClientIDMode="Static">
                        <ContentTemplate>                            
                            <asp:SqlDataSource runat="server" ID="sdsFiltro" ConnectionString="Data Source=.\SQLEXPRESS;Initial Catalog=SISMed;User ID=sa;Password=senha" ProviderName="System.Data.SqlClient" SelectCommand="SELECT Pessoas.Nome + ' ' + Pessoas.Sobrenome AS Nome, Pessoas.Id As ID FROM Pessoas_Paciente INNER JOIN Pessoas ON Pessoas_Paciente.Id = Pessoas.Id WHERE (Pessoas.Nome+' '+Pessoas.Sobrenome LIKE  '%'+@Pesquisa+'%')">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txbNome" DbType="String" DefaultValue="null" Name="Pesquisa" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>                    
                            <asp:ListBox ID="listaSugerida" runat="server" CssClass="lista" Visible="False" DataSourceID="sdsFiltro" DataTextField="Nome" DataValueField="ID"></asp:ListBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="txbNome" EventName="TextChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:Button Text="Filtrar" runat="server" />
                </asp:TableCell></asp:TableRow></asp:Table><asp:GridView ID="gvPacientes" runat="server"
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
                        <%// if (!string.IsNullOrWhiteSpace(Session["TipoDeUsuarioId"].ToString()) && int.Parse(Session["TipoDeUsuarioId"].ToString()) >= 3)
                           //{ %>
                        <a href='<%# Eval("Id", "../consultas/new.aspx?paciente={0}") %>' title="Cadastrar consulta">
                            <i class="action fa fa-medkit"></i>
                        </a>
                        <%// } %>
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
