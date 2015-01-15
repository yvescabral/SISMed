
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 01/15/2015 09:04:18
-- Generated from EDMX file: C:\Users\20121011110382.IFRN.000\Downloads\cglwy-sismed-08f7b9e9052c\cglwy-sismed-08f7b9e9052c\SISMed\Models\SISMed.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SISMed];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_SolicitacaoUsuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Solicitacoes] DROP CONSTRAINT [FK_SolicitacaoUsuario];
GO
IF OBJECT_ID(N'[dbo].[FK_HorarioDeAtendimentoMedico]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HorariosDeAtendimento] DROP CONSTRAINT [FK_HorarioDeAtendimentoMedico];
GO
IF OBJECT_ID(N'[dbo].[FK_TipoDeUsuarioUsuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pessoas_Usuario] DROP CONSTRAINT [FK_TipoDeUsuarioUsuario];
GO
IF OBJECT_ID(N'[dbo].[FK_MedicoUsuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Medicos] DROP CONSTRAINT [FK_MedicoUsuario];
GO
IF OBJECT_ID(N'[dbo].[FK_DiaDaSemanaHorarioDeAtendimento]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HorariosDeAtendimento] DROP CONSTRAINT [FK_DiaDaSemanaHorarioDeAtendimento];
GO
IF OBJECT_ID(N'[dbo].[FK_PessoaEstadoCivil]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pessoas] DROP CONSTRAINT [FK_PessoaEstadoCivil];
GO
IF OBJECT_ID(N'[dbo].[FK_ConsultaMedicacao]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Medicacoes] DROP CONSTRAINT [FK_ConsultaMedicacao];
GO
IF OBJECT_ID(N'[dbo].[FK_MedicoConsulta]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Consultas] DROP CONSTRAINT [FK_MedicoConsulta];
GO
IF OBJECT_ID(N'[dbo].[FK_PacienteConsulta]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Consultas] DROP CONSTRAINT [FK_PacienteConsulta];
GO
IF OBJECT_ID(N'[dbo].[FK_MedicoAgendamento]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Agendamentos] DROP CONSTRAINT [FK_MedicoAgendamento];
GO
IF OBJECT_ID(N'[dbo].[FK_PacienteAgendamento]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Agendamentos] DROP CONSTRAINT [FK_PacienteAgendamento];
GO
IF OBJECT_ID(N'[dbo].[FK_Usuario_inherits_Pessoa]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pessoas_Usuario] DROP CONSTRAINT [FK_Usuario_inherits_Pessoa];
GO
IF OBJECT_ID(N'[dbo].[FK_Paciente_inherits_Pessoa]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pessoas_Paciente] DROP CONSTRAINT [FK_Paciente_inherits_Pessoa];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Solicitacoes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Solicitacoes];
GO
IF OBJECT_ID(N'[dbo].[Pessoas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pessoas];
GO
IF OBJECT_ID(N'[dbo].[Medicos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Medicos];
GO
IF OBJECT_ID(N'[dbo].[HorariosDeAtendimento]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HorariosDeAtendimento];
GO
IF OBJECT_ID(N'[dbo].[TiposDeUsuario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TiposDeUsuario];
GO
IF OBJECT_ID(N'[dbo].[DiasDaSemana]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DiasDaSemana];
GO
IF OBJECT_ID(N'[dbo].[EstadosCivis]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EstadosCivis];
GO
IF OBJECT_ID(N'[dbo].[Consultas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Consultas];
GO
IF OBJECT_ID(N'[dbo].[Medicacoes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Medicacoes];
GO
IF OBJECT_ID(N'[dbo].[Agendamentos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Agendamentos];
GO
IF OBJECT_ID(N'[dbo].[Pessoas_Usuario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pessoas_Usuario];
GO
IF OBJECT_ID(N'[dbo].[Pessoas_Paciente]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pessoas_Paciente];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Solicitacoes'
CREATE TABLE [dbo].[Solicitacoes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DataHora] datetime  NOT NULL,
    [Descricao] nvarchar(max)  NOT NULL,
    [Resolvido] bit  NOT NULL,
    [UsuarioId] int  NOT NULL
);
GO

-- Creating table 'Pessoas'
CREATE TABLE [dbo].[Pessoas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(50)  NOT NULL,
    [Sobrenome] nvarchar(50)  NOT NULL,
    [CPF] nchar(14)  NOT NULL,
    [RG] nchar(11)  NOT NULL,
    [Sexo] nchar(1)  NOT NULL,
    [TelefoneCelular] nvarchar(15)  NOT NULL,
    [TelefoneResidencial] nvarchar(15)  NOT NULL,
    [EstadoCivilId] int  NOT NULL,
    [DataNascimento] datetime  NOT NULL
);
GO

-- Creating table 'Medicos'
CREATE TABLE [dbo].[Medicos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Usuario_Id] int  NOT NULL
);
GO

-- Creating table 'HorariosDeAtendimento'
CREATE TABLE [dbo].[HorariosDeAtendimento] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [HoraInicio] time  NOT NULL,
    [HoraFim] time  NOT NULL,
    [MedicoId] int  NOT NULL,
    [DiaDaSemanaId] int  NOT NULL
);
GO

-- Creating table 'TiposDeUsuario'
CREATE TABLE [dbo].[TiposDeUsuario] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(25)  NOT NULL
);
GO

-- Creating table 'DiasDaSemana'
CREATE TABLE [dbo].[DiasDaSemana] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'EstadosCivis'
CREATE TABLE [dbo].[EstadosCivis] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Consultas'
CREATE TABLE [dbo].[Consultas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Queixas] nvarchar(max)  NOT NULL,
    [Diagnostico] nvarchar(max)  NOT NULL,
    [DataHora] datetime  NOT NULL,
    [MedicoId] int  NOT NULL,
    [PacienteId] int  NOT NULL,
    [Peso] decimal(5,2)  NOT NULL,
    [Altura] decimal(3,2)  NOT NULL
);
GO

-- Creating table 'Medicacoes'
CREATE TABLE [dbo].[Medicacoes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(40)  NOT NULL,
    [Quantidade] nvarchar(15)  NOT NULL,
    [ConsultaId] int  NOT NULL
);
GO

-- Creating table 'Agendamentos'
CREATE TABLE [dbo].[Agendamentos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Horario] datetime  NOT NULL,
    [MedicoId] int  NOT NULL,
    [PacienteId] int  NOT NULL,
    [Ativo] bit  NOT NULL
);
GO

-- Creating table 'Pessoas_Usuario'
CREATE TABLE [dbo].[Pessoas_Usuario] (
    [Email] nvarchar(50)  NOT NULL,
    [Senha] nchar(128)  NOT NULL,
    [TipoDeUsuarioId] int  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Pessoas_Paciente'
CREATE TABLE [dbo].[Pessoas_Paciente] (
    [TipoSanguineo] nvarchar(2)  NOT NULL,
    [FatorRh] bit  NOT NULL,
    [Alergias] nvarchar(max)  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Solicitacoes'
ALTER TABLE [dbo].[Solicitacoes]
ADD CONSTRAINT [PK_Solicitacoes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pessoas'
ALTER TABLE [dbo].[Pessoas]
ADD CONSTRAINT [PK_Pessoas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Medicos'
ALTER TABLE [dbo].[Medicos]
ADD CONSTRAINT [PK_Medicos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'HorariosDeAtendimento'
ALTER TABLE [dbo].[HorariosDeAtendimento]
ADD CONSTRAINT [PK_HorariosDeAtendimento]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TiposDeUsuario'
ALTER TABLE [dbo].[TiposDeUsuario]
ADD CONSTRAINT [PK_TiposDeUsuario]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DiasDaSemana'
ALTER TABLE [dbo].[DiasDaSemana]
ADD CONSTRAINT [PK_DiasDaSemana]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EstadosCivis'
ALTER TABLE [dbo].[EstadosCivis]
ADD CONSTRAINT [PK_EstadosCivis]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Consultas'
ALTER TABLE [dbo].[Consultas]
ADD CONSTRAINT [PK_Consultas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Medicacoes'
ALTER TABLE [dbo].[Medicacoes]
ADD CONSTRAINT [PK_Medicacoes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Agendamentos'
ALTER TABLE [dbo].[Agendamentos]
ADD CONSTRAINT [PK_Agendamentos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pessoas_Usuario'
ALTER TABLE [dbo].[Pessoas_Usuario]
ADD CONSTRAINT [PK_Pessoas_Usuario]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pessoas_Paciente'
ALTER TABLE [dbo].[Pessoas_Paciente]
ADD CONSTRAINT [PK_Pessoas_Paciente]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UsuarioId] in table 'Solicitacoes'
ALTER TABLE [dbo].[Solicitacoes]
ADD CONSTRAINT [FK_SolicitacaoUsuario]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[Pessoas_Usuario]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SolicitacaoUsuario'
CREATE INDEX [IX_FK_SolicitacaoUsuario]
ON [dbo].[Solicitacoes]
    ([UsuarioId]);
GO

-- Creating foreign key on [MedicoId] in table 'HorariosDeAtendimento'
ALTER TABLE [dbo].[HorariosDeAtendimento]
ADD CONSTRAINT [FK_HorarioDeAtendimentoMedico]
    FOREIGN KEY ([MedicoId])
    REFERENCES [dbo].[Medicos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_HorarioDeAtendimentoMedico'
CREATE INDEX [IX_FK_HorarioDeAtendimentoMedico]
ON [dbo].[HorariosDeAtendimento]
    ([MedicoId]);
GO

-- Creating foreign key on [TipoDeUsuarioId] in table 'Pessoas_Usuario'
ALTER TABLE [dbo].[Pessoas_Usuario]
ADD CONSTRAINT [FK_TipoDeUsuarioUsuario]
    FOREIGN KEY ([TipoDeUsuarioId])
    REFERENCES [dbo].[TiposDeUsuario]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TipoDeUsuarioUsuario'
CREATE INDEX [IX_FK_TipoDeUsuarioUsuario]
ON [dbo].[Pessoas_Usuario]
    ([TipoDeUsuarioId]);
GO

-- Creating foreign key on [Usuario_Id] in table 'Medicos'
ALTER TABLE [dbo].[Medicos]
ADD CONSTRAINT [FK_MedicoUsuario]
    FOREIGN KEY ([Usuario_Id])
    REFERENCES [dbo].[Pessoas_Usuario]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MedicoUsuario'
CREATE INDEX [IX_FK_MedicoUsuario]
ON [dbo].[Medicos]
    ([Usuario_Id]);
GO

-- Creating foreign key on [DiaDaSemanaId] in table 'HorariosDeAtendimento'
ALTER TABLE [dbo].[HorariosDeAtendimento]
ADD CONSTRAINT [FK_DiaDaSemanaHorarioDeAtendimento]
    FOREIGN KEY ([DiaDaSemanaId])
    REFERENCES [dbo].[DiasDaSemana]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DiaDaSemanaHorarioDeAtendimento'
CREATE INDEX [IX_FK_DiaDaSemanaHorarioDeAtendimento]
ON [dbo].[HorariosDeAtendimento]
    ([DiaDaSemanaId]);
GO

-- Creating foreign key on [EstadoCivilId] in table 'Pessoas'
ALTER TABLE [dbo].[Pessoas]
ADD CONSTRAINT [FK_PessoaEstadoCivil]
    FOREIGN KEY ([EstadoCivilId])
    REFERENCES [dbo].[EstadosCivis]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PessoaEstadoCivil'
CREATE INDEX [IX_FK_PessoaEstadoCivil]
ON [dbo].[Pessoas]
    ([EstadoCivilId]);
GO

-- Creating foreign key on [ConsultaId] in table 'Medicacoes'
ALTER TABLE [dbo].[Medicacoes]
ADD CONSTRAINT [FK_ConsultaMedicacao]
    FOREIGN KEY ([ConsultaId])
    REFERENCES [dbo].[Consultas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ConsultaMedicacao'
CREATE INDEX [IX_FK_ConsultaMedicacao]
ON [dbo].[Medicacoes]
    ([ConsultaId]);
GO

-- Creating foreign key on [MedicoId] in table 'Consultas'
ALTER TABLE [dbo].[Consultas]
ADD CONSTRAINT [FK_MedicoConsulta]
    FOREIGN KEY ([MedicoId])
    REFERENCES [dbo].[Medicos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MedicoConsulta'
CREATE INDEX [IX_FK_MedicoConsulta]
ON [dbo].[Consultas]
    ([MedicoId]);
GO

-- Creating foreign key on [PacienteId] in table 'Consultas'
ALTER TABLE [dbo].[Consultas]
ADD CONSTRAINT [FK_PacienteConsulta]
    FOREIGN KEY ([PacienteId])
    REFERENCES [dbo].[Pessoas_Paciente]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PacienteConsulta'
CREATE INDEX [IX_FK_PacienteConsulta]
ON [dbo].[Consultas]
    ([PacienteId]);
GO

-- Creating foreign key on [MedicoId] in table 'Agendamentos'
ALTER TABLE [dbo].[Agendamentos]
ADD CONSTRAINT [FK_MedicoAgendamento]
    FOREIGN KEY ([MedicoId])
    REFERENCES [dbo].[Medicos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MedicoAgendamento'
CREATE INDEX [IX_FK_MedicoAgendamento]
ON [dbo].[Agendamentos]
    ([MedicoId]);
GO

-- Creating foreign key on [PacienteId] in table 'Agendamentos'
ALTER TABLE [dbo].[Agendamentos]
ADD CONSTRAINT [FK_PacienteAgendamento]
    FOREIGN KEY ([PacienteId])
    REFERENCES [dbo].[Pessoas_Paciente]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PacienteAgendamento'
CREATE INDEX [IX_FK_PacienteAgendamento]
ON [dbo].[Agendamentos]
    ([PacienteId]);
GO

-- Creating foreign key on [Id] in table 'Pessoas_Usuario'
ALTER TABLE [dbo].[Pessoas_Usuario]
ADD CONSTRAINT [FK_Usuario_inherits_Pessoa]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Pessoas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Pessoas_Paciente'
ALTER TABLE [dbo].[Pessoas_Paciente]
ADD CONSTRAINT [FK_Paciente_inherits_Pessoa]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Pessoas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------