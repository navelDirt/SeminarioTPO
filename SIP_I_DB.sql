USE [master]
GO
/****** Object:  Database [centro_odontologico]    Script Date: 13/12/2017 19:28:25 ******/
CREATE DATABASE [centro_odontologico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'centro_odontologico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\centro_odontologico.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'centro_odontologico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\centro_odontologico_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [centro_odontologico] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [centro_odontologico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [centro_odontologico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [centro_odontologico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [centro_odontologico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [centro_odontologico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [centro_odontologico] SET ARITHABORT OFF 
GO
ALTER DATABASE [centro_odontologico] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [centro_odontologico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [centro_odontologico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [centro_odontologico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [centro_odontologico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [centro_odontologico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [centro_odontologico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [centro_odontologico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [centro_odontologico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [centro_odontologico] SET  DISABLE_BROKER 
GO
ALTER DATABASE [centro_odontologico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [centro_odontologico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [centro_odontologico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [centro_odontologico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [centro_odontologico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [centro_odontologico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [centro_odontologico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [centro_odontologico] SET RECOVERY FULL 
GO
ALTER DATABASE [centro_odontologico] SET  MULTI_USER 
GO
ALTER DATABASE [centro_odontologico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [centro_odontologico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [centro_odontologico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [centro_odontologico] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'centro_odontologico', N'ON'
GO
USE [centro_odontologico]
GO
/****** Object:  Table [dbo].[ConsentimientoTratamiento]    Script Date: 13/12/2017 19:28:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsentimientoTratamiento](
	[nroConsentimiento] [int] NOT NULL,
	[observaciones] [varchar](255) NULL,
	[historiaClinica_nroHistoriaClinica] [int] NULL,
	[odontologo_usuarioId] [int] NULL,
	[paciente_usuarioId] [int] NULL,
	[planTratamiento_nroTratamiento] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nroConsentimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FichaOdontologica]    Script Date: 13/12/2017 19:28:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FichaOdontologica](
	[nroFichaOdontologica] [int] NOT NULL,
	[fechaCreacionFicha] [datetime] NULL,
	[fechaModificacionFicha] [datetime] NULL,
	[observaciones] [varchar](255) NULL,
	[historiaClinica_nroHistoriaClinica] [int] NULL,
	[paciente_usuarioId] [int] NULL,
	[puntosMarcados_id_nro_marcado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nroFichaOdontologica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hibernate_sequence]    Script Date: 13/12/2017 19:28:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hibernate_sequence](
	[next_val] [numeric](19, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HistoriaClinica]    Script Date: 13/12/2017 19:28:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoriaClinica](
	[nroHistoriaClinica] [int] NOT NULL,
	[observaciones] [varchar](255) NULL,
	[paciente_usuarioId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nroHistoriaClinica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PlanTratamiento]    Script Date: 13/12/2017 19:28:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanTratamiento](
	[nroTratamiento] [int] NOT NULL,
	[activo] [bit] NOT NULL,
	[detallePlanTratamiento] [varchar](255) NULL,
	[fechaCreacionPlanTratamiento] [datetime] NULL,
	[consentimientoTratamiento_nroConsentimiento] [int] NULL,
	[historiaClinica_nroHistoriaClinica] [int] NULL,
	[odontologo_usuarioId] [int] NULL,
	[paciente_usuarioId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nroTratamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PuntosMarcados]    Script Date: 13/12/2017 19:28:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PuntosMarcados](
	[id_nro_marcado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_nro_marcado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PuntosMarcados_puntosX]    Script Date: 13/12/2017 19:28:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PuntosMarcados_puntosX](
	[PuntosMarcados_id_nro_marcado] [int] NOT NULL,
	[puntosX] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PuntosMarcados_puntosY]    Script Date: 13/12/2017 19:28:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PuntosMarcados_puntosY](
	[PuntosMarcados_id_nro_marcado] [int] NOT NULL,
	[puntosY] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Radiografia]    Script Date: 13/12/2017 19:28:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Radiografia](
	[nroRadiografia] [int] NOT NULL,
	[fechaRadiografia] [datetime] NULL,
	[imagen] [image] NULL,
	[historiaClinica_nroHistoriaClinica] [int] NULL,
	[paciente_usuarioId] [int] NULL,
	[radiologo_usuarioId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nroRadiografia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Turno]    Script Date: 13/12/2017 19:28:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[nroTurno] [int] NOT NULL,
	[emergencia] [bit] NOT NULL,
	[fechaTurno] [datetime] NULL,
	[horaTurno] [int] NOT NULL,
	[minutoTurno] [int] NOT NULL,
	[odontologo_usuarioId] [int] NULL,
	[paciente_usuarioId] [int] NULL,
	[radiologo_usuarioId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nroTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 13/12/2017 19:28:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[DTYPE] [varchar](31) NOT NULL,
	[usuarioId] [int] NOT NULL,
	[apellido] [varchar](255) NULL,
	[contrasenia] [varchar](255) NULL,
	[domicilio] [varchar](255) NULL,
	[fechaNac] [datetime] NULL,
	[funcion] [varchar](255) NULL,
	[nombre] [varchar](255) NULL,
	[nroDocumento] [int] NOT NULL,
	[sexo] [char](1) NOT NULL,
	[telefono] [int] NOT NULL,
	[tipoDocumento] [varchar](255) NULL,
	[usuario] [varchar](255) NULL,
	[nroOsPaciente] [int] NULL,
	[osPaciente] [varchar](255) NULL,
	[nroMatricula] [int] NULL,
	[historiaClinica_nroHistoriaClinica] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[usuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ConsentimientoTratamiento]  WITH CHECK ADD  CONSTRAINT [FK28r1atbqbsrw0h289cyhe862i] FOREIGN KEY([paciente_usuarioId])
REFERENCES [dbo].[Usuario] ([usuarioId])
GO
ALTER TABLE [dbo].[ConsentimientoTratamiento] CHECK CONSTRAINT [FK28r1atbqbsrw0h289cyhe862i]
GO
ALTER TABLE [dbo].[ConsentimientoTratamiento]  WITH CHECK ADD  CONSTRAINT [FK2vmtupmpl5ob12pt23uh8wqsl] FOREIGN KEY([planTratamiento_nroTratamiento])
REFERENCES [dbo].[PlanTratamiento] ([nroTratamiento])
GO
ALTER TABLE [dbo].[ConsentimientoTratamiento] CHECK CONSTRAINT [FK2vmtupmpl5ob12pt23uh8wqsl]
GO
ALTER TABLE [dbo].[ConsentimientoTratamiento]  WITH CHECK ADD  CONSTRAINT [FKcl4sjh9en9dkgujs029e66985] FOREIGN KEY([odontologo_usuarioId])
REFERENCES [dbo].[Usuario] ([usuarioId])
GO
ALTER TABLE [dbo].[ConsentimientoTratamiento] CHECK CONSTRAINT [FKcl4sjh9en9dkgujs029e66985]
GO
ALTER TABLE [dbo].[ConsentimientoTratamiento]  WITH CHECK ADD  CONSTRAINT [FKnrd5pqxycl8c8k7wtusevcenk] FOREIGN KEY([historiaClinica_nroHistoriaClinica])
REFERENCES [dbo].[HistoriaClinica] ([nroHistoriaClinica])
GO
ALTER TABLE [dbo].[ConsentimientoTratamiento] CHECK CONSTRAINT [FKnrd5pqxycl8c8k7wtusevcenk]
GO
ALTER TABLE [dbo].[FichaOdontologica]  WITH CHECK ADD  CONSTRAINT [FKe8x65v1nmd4fd1ss4u4s0dgrx] FOREIGN KEY([paciente_usuarioId])
REFERENCES [dbo].[Usuario] ([usuarioId])
GO
ALTER TABLE [dbo].[FichaOdontologica] CHECK CONSTRAINT [FKe8x65v1nmd4fd1ss4u4s0dgrx]
GO
ALTER TABLE [dbo].[FichaOdontologica]  WITH CHECK ADD  CONSTRAINT [FKptgmhq1njuprqnpbvlin84uh1] FOREIGN KEY([puntosMarcados_id_nro_marcado])
REFERENCES [dbo].[PuntosMarcados] ([id_nro_marcado])
GO
ALTER TABLE [dbo].[FichaOdontologica] CHECK CONSTRAINT [FKptgmhq1njuprqnpbvlin84uh1]
GO
ALTER TABLE [dbo].[FichaOdontologica]  WITH CHECK ADD  CONSTRAINT [FKsrc1p7af03p5j5vbl7d561rx8] FOREIGN KEY([historiaClinica_nroHistoriaClinica])
REFERENCES [dbo].[HistoriaClinica] ([nroHistoriaClinica])
GO
ALTER TABLE [dbo].[FichaOdontologica] CHECK CONSTRAINT [FKsrc1p7af03p5j5vbl7d561rx8]
GO
ALTER TABLE [dbo].[HistoriaClinica]  WITH CHECK ADD  CONSTRAINT [FKea5kau87md6n89gvy0bve5xp7] FOREIGN KEY([paciente_usuarioId])
REFERENCES [dbo].[Usuario] ([usuarioId])
GO
ALTER TABLE [dbo].[HistoriaClinica] CHECK CONSTRAINT [FKea5kau87md6n89gvy0bve5xp7]
GO
ALTER TABLE [dbo].[PlanTratamiento]  WITH CHECK ADD  CONSTRAINT [FK92qys2wyg32h7g2ku0tb92t9a] FOREIGN KEY([odontologo_usuarioId])
REFERENCES [dbo].[Usuario] ([usuarioId])
GO
ALTER TABLE [dbo].[PlanTratamiento] CHECK CONSTRAINT [FK92qys2wyg32h7g2ku0tb92t9a]
GO
ALTER TABLE [dbo].[PlanTratamiento]  WITH CHECK ADD  CONSTRAINT [FKbq3ngex76vojkek0p98009at4] FOREIGN KEY([consentimientoTratamiento_nroConsentimiento])
REFERENCES [dbo].[ConsentimientoTratamiento] ([nroConsentimiento])
GO
ALTER TABLE [dbo].[PlanTratamiento] CHECK CONSTRAINT [FKbq3ngex76vojkek0p98009at4]
GO
ALTER TABLE [dbo].[PlanTratamiento]  WITH CHECK ADD  CONSTRAINT [FKknjtgraufriqd3x205h8j5g7e] FOREIGN KEY([paciente_usuarioId])
REFERENCES [dbo].[Usuario] ([usuarioId])
GO
ALTER TABLE [dbo].[PlanTratamiento] CHECK CONSTRAINT [FKknjtgraufriqd3x205h8j5g7e]
GO
ALTER TABLE [dbo].[PlanTratamiento]  WITH CHECK ADD  CONSTRAINT [FKkv0dj4uq0ht9jofx5u4au1hcm] FOREIGN KEY([historiaClinica_nroHistoriaClinica])
REFERENCES [dbo].[HistoriaClinica] ([nroHistoriaClinica])
GO
ALTER TABLE [dbo].[PlanTratamiento] CHECK CONSTRAINT [FKkv0dj4uq0ht9jofx5u4au1hcm]
GO
ALTER TABLE [dbo].[PuntosMarcados_puntosX]  WITH CHECK ADD  CONSTRAINT [FKihuqyr2u0oi0f7ov54cv0sw5p] FOREIGN KEY([PuntosMarcados_id_nro_marcado])
REFERENCES [dbo].[PuntosMarcados] ([id_nro_marcado])
GO
ALTER TABLE [dbo].[PuntosMarcados_puntosX] CHECK CONSTRAINT [FKihuqyr2u0oi0f7ov54cv0sw5p]
GO
ALTER TABLE [dbo].[PuntosMarcados_puntosY]  WITH CHECK ADD  CONSTRAINT [FK99js65e1opy71rvvh315k8vh] FOREIGN KEY([PuntosMarcados_id_nro_marcado])
REFERENCES [dbo].[PuntosMarcados] ([id_nro_marcado])
GO
ALTER TABLE [dbo].[PuntosMarcados_puntosY] CHECK CONSTRAINT [FK99js65e1opy71rvvh315k8vh]
GO
ALTER TABLE [dbo].[Radiografia]  WITH CHECK ADD  CONSTRAINT [FK28a9t5rinfff9igvphpwvdsqs] FOREIGN KEY([radiologo_usuarioId])
REFERENCES [dbo].[Usuario] ([usuarioId])
GO
ALTER TABLE [dbo].[Radiografia] CHECK CONSTRAINT [FK28a9t5rinfff9igvphpwvdsqs]
GO
ALTER TABLE [dbo].[Radiografia]  WITH CHECK ADD  CONSTRAINT [FK5siahiqupip9nxhwupc9fj177] FOREIGN KEY([historiaClinica_nroHistoriaClinica])
REFERENCES [dbo].[HistoriaClinica] ([nroHistoriaClinica])
GO
ALTER TABLE [dbo].[Radiografia] CHECK CONSTRAINT [FK5siahiqupip9nxhwupc9fj177]
GO
ALTER TABLE [dbo].[Radiografia]  WITH CHECK ADD  CONSTRAINT [FKf5x4b698xvp6ju52fuakh68kf] FOREIGN KEY([paciente_usuarioId])
REFERENCES [dbo].[Usuario] ([usuarioId])
GO
ALTER TABLE [dbo].[Radiografia] CHECK CONSTRAINT [FKf5x4b698xvp6ju52fuakh68kf]
GO
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD  CONSTRAINT [FK2yh98s146sbxe1dv7mnr3boo3] FOREIGN KEY([radiologo_usuarioId])
REFERENCES [dbo].[Usuario] ([usuarioId])
GO
ALTER TABLE [dbo].[Turno] CHECK CONSTRAINT [FK2yh98s146sbxe1dv7mnr3boo3]
GO
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD  CONSTRAINT [FKcevproyx468l0vdkb6pcpu6m7] FOREIGN KEY([odontologo_usuarioId])
REFERENCES [dbo].[Usuario] ([usuarioId])
GO
ALTER TABLE [dbo].[Turno] CHECK CONSTRAINT [FKcevproyx468l0vdkb6pcpu6m7]
GO
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD  CONSTRAINT [FKro5ovxvlnlaiu85iiq19lca66] FOREIGN KEY([paciente_usuarioId])
REFERENCES [dbo].[Usuario] ([usuarioId])
GO
ALTER TABLE [dbo].[Turno] CHECK CONSTRAINT [FKro5ovxvlnlaiu85iiq19lca66]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK6d22jb0y1rgs8elw4d9wgi3s3] FOREIGN KEY([historiaClinica_nroHistoriaClinica])
REFERENCES [dbo].[HistoriaClinica] ([nroHistoriaClinica])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK6d22jb0y1rgs8elw4d9wgi3s3]
GO
USE [master]
GO
ALTER DATABASE [centro_odontologico] SET  READ_WRITE 
GO
