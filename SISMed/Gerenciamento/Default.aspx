<%@ Page Title="Gerenciamento" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SISMed.Gerenciamento.Default" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="grid">

<div class="row">
    <div class="col-6">
        <div class="card">
            <h3>Histórico de consultas e agendamentos</h3>
            <div class="center">
                <asp:Chart ID="chartAgendamentosConsultas" runat="server" Width="400px" DataSourceID="sdsAgendamentosConsultas" Palette="None" PaletteCustomColors="120, 238, 171; 51, 204, 119; 25, 182, 93">
                    <Series>
                        <asp:Series Name="Consultas" ChartType="line" XValueMember="Mes" 
                            YValueMembers="Consultas" BorderWidth="3" 
                            Legend="Consultas e Agendamentos" IsValueShownAsLabel="True">
                            <SmartLabelStyle CalloutLineAnchorCapStyle="Round" />
                        </asp:Series>
                        <asp:Series Name="Agendamentos" ChartType="line" 
                            XValueMember="Mes" YValueMembers="Agendamentos" BorderWidth="3" 
                            Legend="Consultas e Agendamentos" >
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1" AlignmentOrientation="All" 
                            BorderDashStyle="Solid" IsSameFontSizeForAllAxes="True">
                            <AxisY Title="Quantidade">
                                <MajorGrid LineColor="Gainsboro" />
                            </AxisY>
                            <AxisX Title="Mês">
                                <MajorGrid Enabled="False" />
                            </AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                    <Legends>
                        <asp:Legend DockedToChartArea="ChartArea1" Docking="Bottom" 
                            InterlacedRows="True" InterlacedRowsColor="244, 244, 244" 
                            IsDockedInsideChartArea="False" LegendItemOrder="SameAsSeriesOrder" 
                            LegendStyle="Row" Name="Consultas e Agendamentos" Alignment="Center">
                        </asp:Legend>
                    </Legends>
                    <BorderSkin BackImageWrapMode="Scaled" />
                </asp:Chart>
            </div>
            <asp:SqlDataSource ID="sdsAgendamentosConsultas" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SISMedConnectionString %>"
                        SelectCommand="
                            WITH UltimosMeses (NumMes, Mes)
                            AS
                            (
                                    SELECT TOP 5 MONTH(DATEADD(MONTH, -NUMBER, GETDATE())) AS NumMes, DATENAME(MONTH, DATEADD(MONTH, MONTH(DATEADD(MONTH, -NUMBER, GETDATE()))-1, CAST('2014-01-01' AS DATETIME))) AS Mes
                                    FROM (SELECT TOP 7 ROW_NUMBER() OVER (ORDER BY name) - 1 AS NUMBER FROM sysobjects) AS numbers
                            )
                            SELECT Mes,
                                   (SELECT COUNT(*) FROM Agendamentos WHERE MONTH(Horario) = UltimosMeses.NumMes) AS Agendamentos,
                                   (SELECT COUNT(*) FROM Consultas WHERE MONTH(DataHora) = UltimosMeses.NumMes) AS Consultas
                            FROM UltimosMeses
                        ">
            </asp:SqlDataSource>
        </div>
    </div>
    <div class="col-6">
        <div class="card">
            <h3>Relação de paciente por sexo e idade</h3>
            <div class="center">
                <asp:Chart ID="Chart1" runat="server" DataSourceID="sdsFaixaSexo" Width="400px" Palette="None" CssClass="center" PaletteCustomColors="120, 238, 171; 51, 204, 119; 25, 182, 93">
                    <Series>
                        <asp:Series ChartArea="ChartArea1" Name="Homens" IsValueShownAsLabel="True" Legend="Pacientes" XValueMember="Faixa" YValueMembers="Homens" IsXValueIndexed="True">
                            <EmptyPointStyle IsValueShownAsLabel="True" />
                        </asp:Series>
                        <asp:Series ChartArea="ChartArea1" IsValueShownAsLabel="True" Legend="Pacientes" Name="Mulheres" XValueMember="Faixa" YValueMembers="Mulheres" IsXValueIndexed="True">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1" BorderDashStyle="Solid">
                            <AxisY Title="Pacientes">
                                <MajorGrid LineColor="Gainsboro" />
                            </AxisY>
                            <AxisX Title="Faixa Etária">
                                <MajorGrid Enabled="False" />
                            </AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                    <Legends>
                        <asp:Legend Docking="Bottom" Name="Pacientes" Alignment="Center">
                        </asp:Legend>
                    </Legends>
                </asp:Chart>
            </div>
            <asp:SqlDataSource ID="sdsFaixaSexo" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SISMedConnectionString %>"
                        SelectCommand="
                            SELECT CASE
                              WHEN DATEDIFF(YEAR, DataNascimento, GETDATE()) < 12  THEN '< 12'
                              WHEN DATEDIFF(YEAR, DataNascimento, GETDATE()) BETWEEN 12 AND 24 THEN '12-24'
                              WHEN DATEDIFF(YEAR, DataNascimento, GETDATE()) BETWEEN 25 AND 36 THEN '25-36'
                              WHEN DATEDIFF(YEAR, DataNascimento, GETDATE()) BETWEEN 37 AND 48 THEN '37-48'
                              WHEN DATEDIFF(YEAR, DataNascimento, GETDATE()) BETWEEN 48 AND 60 THEN '48-60'
                              ELSE '> 60'
                            END AS Faixa,
                            SUM(CASE WHEN Sexo = 'M' THEN 1 ELSE 0 END) AS Homens,
                            SUM(CASE WHEN Sexo = 'F' THEN 1 ELSE 0 END) AS Mulheres
                            FROM Pessoas_Paciente AS Pacientes
	                             INNER JOIN Pessoas
		                            ON Pacientes.Id = Pessoas.Id
                            GROUP BY CASE
                              WHEN DATEDIFF(YEAR, DataNascimento, GETDATE()) < 12  THEN '< 12' 
                              WHEN DATEDIFF(YEAR, DataNascimento, GETDATE()) BETWEEN 12 AND 24 THEN '12-24'
                              WHEN DATEDIFF(YEAR, DataNascimento, GETDATE()) BETWEEN 25 AND 36 THEN '25-36'
                              WHEN DATEDIFF(YEAR, DataNascimento, GETDATE()) BETWEEN 37 AND 48 THEN '37-48'
                              WHEN DATEDIFF(YEAR, DataNascimento, GETDATE()) BETWEEN 48 AND 60 THEN '48-60'
                              ELSE '> 60' 
                            END
                        ">
            </asp:SqlDataSource>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-6">
        <div class="card">
            <h3>Relação de paciente por altura e peso</h3>
            <div class="center">
                <asp:Chart ID="Chart2" runat="server" DataSourceID="sdsAlturaPeso" Width="400px" Palette="None" PaletteCustomColors="120, 238, 171; 51, 204, 119; 25, 182, 93">
                    <Series>
                        <asp:Series Name="Abaixo" ChartType="StackedBar" XValueMember="altura" YValueMembers="abaixo" Legend="Pacientes" MarkerSize="2"></asp:Series>
                        <asp:Series ChartArea="ChartArea1" ChartType="StackedBar" Name="Normal" XValueMember="altura" YValueMembers="normal" Legend="Pacientes" MarkerSize="2">
                        </asp:Series>
                        <asp:Series ChartArea="ChartArea1" ChartType="StackedBar" Name="Acima" XValueMember="altura" YValueMembers="acima" Legend="Pacientes" MarkerSize="2">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1" BorderDashStyle="Solid">
                            <AxisY Title="Pacientes">
                                <MajorGrid LineColor="Gainsboro" />
                            </AxisY>
                            <AxisX Title="Altura">
                                <MajorGrid Enabled="False" />
                            </AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                    <Legends>
                        <asp:Legend Docking="Bottom" LegendStyle="Row" Name="Pacientes" Alignment="Center">
                        </asp:Legend>
                    </Legends>
                </asp:Chart>
            </div>
            <asp:SqlDataSource ID="sdsAlturaPeso" runat="server" ConnectionString="<%$ ConnectionStrings:SISMedConnectionString %>"
            SelectCommand="
                        SELECT CASE
                            WHEN altura < 1.5  THEN '< 1,50'
                            WHEN altura BETWEEN 1.5 AND 1.65 THEN '1,50 - 1,65'
                            WHEN altura BETWEEN 1.65 AND 1.80 THEN '1,65 - 1,80'
                            Else '> 1,80'
                            END AS altura,
                            SUM(CASE WHEN peso/(altura*altura) < 18.50 THEN 1 ELSE 0 END) AS Abaixo,
                            SUM(CASE WHEN peso/(altura*altura) BETWEEN 18.50 AND 24.99 THEN 1 ELSE 0 END) AS Normal,
                            SUM(CASE WHEN peso/(altura*altura) > 24.99 THEN 1 ELSE 0 END) AS Acima
                            FROM Consultas
						    WHERE DataHora IN (Select MAX(DataHora) FROM Consultas Group BY PacienteId)
                            GROUP BY CASE
							    WHEN altura < 1.5  THEN '< 1,50'
							    WHEN altura BETWEEN 1.5 AND 1.65 THEN '1,50 - 1,65'
							    WHEN altura BETWEEN 1.65 AND 1.80 THEN '1,65 - 1,80'
							    Else '> 1,80'
                            END">
            </asp:SqlDataSource>
        </div>
    </div>
    <div class="col-6">
        <div class="card">
            <asp:EntityDataSource ID="edsSolicitacoes" runat="server" ConnectionString="name=SISMedEntities" DefaultContainerName="SISMedEntities" EnableFlattening="False" EnableInsert="True" EntitySetName="Solicitacoes" EntityTypeFilter="Solicitacao" OnInserting="edsSolicitacoes_Inserting" OnInserted="edsSolicitacoes_Inserted">
                <InsertParameters>
                    <asp:SessionParameter Name="UsuarioId" SessionField="UsuarioId" Type="Int32" />
                </InsertParameters>
            </asp:EntityDataSource>
            <asp:FormView ID="fvSolicitacao" RenderOuterTable="false" runat="server" DataKeyNames="Id" DataSourceID="edsSolicitacoes" DefaultMode="Insert">
                <InsertItemTemplate>
                    <h3>Enviar Solicitação</h3>
                    <% if(!string.IsNullOrEmpty(Request.QueryString["success"])) { %>
                    <asp:Panel ID="Panel1" runat="server" CssClass="notification success no-margin">
                        <%= Encoding.UTF8.GetString(Convert.FromBase64String(Request.QueryString["success"])) %>
                    </asp:Panel>
                    <% } %>
                    <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Solicitacao" DisplayMode="SingleParagraph"
                        CssClass="notification error no-margin" runat="server" HeaderText="Informe a descrição da solicitação." />
                    <fieldset>
                        <div class="content">
                            <asp:Label ID="Label1" Text="Descrição:" CssClass="label" AssociatedControlID="DescricaoTextBox" runat="server" /><br />
                            <asp:TextBox ID="DescricaoTextBox" TextMode="MultiLine" runat="server" Width="100%" Rows="6" Text='<%# Bind("Descricao") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="" ControlToValidate="DescricaoTextBox" ValidationGroup="Solicitacao" runat="server" />
                        </div>
                    </fieldset>
                    <asp:LinkButton ID="InsertButton" runat="server" CssClass="green button block center"
                        CausesValidation="True" ValidationGroup="Solicitacao" CommandName="Insert" Text="<i class='fa fa-plus'></i> Enviar" />
                </InsertItemTemplate>
            </asp:FormView>
        </div>
    </div>
</div>

</div>
</asp:Content>
