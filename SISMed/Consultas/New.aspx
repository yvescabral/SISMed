<%@ Page Title="Nova Consulta" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="New.aspx.cs" Inherits="SISMed.Consultas.New" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="/scripts/jquery.maskedinput.min.js"></script>
        <script>
            $(function () {
                $(".altura").mask("9,99");
            });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card inline-block">
        <asp:SqlDataSource ID="sdsAgendamento" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SISMedConnectionString %>" 
            UpdateCommand="UPDATE [Agendamentos] SET [Ativo] = 1 WHERE [Id] = @Id">
            <UpdateParameters>
                <asp:QueryStringParameter Name="Id" Type="Int32" QueryStringField="agendamento" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:EntityDataSource ID="edsConsulta" runat="server" 
            ConnectionString="name=SISMedEntities" DefaultContainerName="SISMedEntities" 
            EnableFlattening="False" EnableInsert="True" EntitySetName="Consultas" 
            oninserting="edsConsulta_Inserting" OnInserted="edsConsulta_Inserted">
            <InsertParameters>
                <asp:SessionParameter Name="MedicoId" Type="Int32" SessionField="UsuarioId" />
                <asp:QueryStringParameter Name="PacienteId" Type="Int32" QueryStringField="paciente" />
            </InsertParameters>
        </asp:EntityDataSource>
        <asp:FormView ID="fvConsulta" RenderOuterTable="false" runat="server" DefaultMode="Insert" DataSourceID="edsConsulta">
            <InsertItemTemplate>
                <asp:ValidationSummary DisplayMode="SingleParagraph" CssClass="notification error no-margin"
                    runat="server" HeaderText="Preencha os campos corretamente." />
                <fieldset>
                    <div class="legend">
                        Nova Consulta
                    </div>
                    <div class="content">
                        <asp:Label Text="Peso: " AssociatedControlID="PesoTextBox" CssClass="label" runat="server" />
                        <asp:TextBox ID="PesoTextBox" TextMode="Singleline"
                             runat="server" Text='<%# Bind("Peso") %>'  Width="50"/> kg
                        <br />
                        <asp:Label runat="server" AssociatedControlID="AlturaTextBox" CssClass="label" Text="Altura: " />
                        <asp:TextBox ID="AlturaTextBox" runat="server" CssClass="altura"
                             Text='<%# Bind("Altura") %>' TextMode="SingleLine" Width="70"/> m
                        <br />
                        <asp:Label Text="Queixas:" AssociatedControlID="QueixasTextBox" CssClass="label" runat="server" />
                        <br />
                        <asp:TextBox ID="QueixasTextBox" TextMode="MultiLine" Columns="40" Rows="5"
                            runat="server" Text='<%# Bind("Queixas") %>' />
                        <asp:RequiredFieldValidator Text="*" CssClass="required" ControlToValidate="QueixasTextBox" runat="server" />
                        <br />
                        <asp:Label Text="Diagnóstico:" AssociatedControlID="DiagnosticoTextBox" CssClass="label" runat="server" />
                        <br />
                        <asp:TextBox ID="DiagnosticoTextBox" TextMode="MultiLine" Columns="40" Rows="5"
                            runat="server" Text='<%# Bind("Diagnostico") %>' />
                        <asp:RequiredFieldValidator Text="*" CssClass="required" ControlToValidate="DiagnosticoTextBox" runat="server" />
                    </div>
                </fieldset>
                <asp:LinkButton ID="InsertButton" CssClass="green button block center" runat="server"
                    CausesValidation="True" CommandName="Insert" Text="<i class='fa fa-plus'></i> Cadastrar" />
            </InsertItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>
