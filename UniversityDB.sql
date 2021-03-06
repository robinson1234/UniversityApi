USE [master]
GO
/****** Object:  Database [UniversityDB]    Script Date: 03/07/2020 10:25:32 ******/
CREATE DATABASE [UniversityDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\UniversityDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UniversityDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\UniversityDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UniversityDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityDB] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UniversityDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UniversityDB] SET QUERY_STORE = OFF
GO
USE [UniversityDB]
GO
/****** Object:  Table [dbo].[books]    Script Date: 03/07/2020 10:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[book_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[category] [varchar](15) NULL,
	[publication_date] [datetime] NULL,
	[author] [varchar](50) NULL,
	[date_publication_university] [datetime] NULL,
	[amount_pages] [int] NULL,
	[url] [varchar](100) NULL,
 CONSTRAINT [PK_books] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 03/07/2020 10:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[student_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[semester] [int] NULL,
	[training] [varchar](50) NULL,
	[performance] [varchar](20) NULL,
	[date_admission] [datetime] NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[books] ON 

INSERT [dbo].[books] ([book_id], [title], [category], [publication_date], [author], [date_publication_university], [amount_pages], [url]) VALUES (1, N'100 años de soledad', N'libro', CAST(N'2005-06-05T00:00:00.000' AS DateTime), N'Gabriel Garcia Marquez', CAST(N'2002-07-01T00:00:00.000' AS DateTime), 300, N'https://100años.GabrielGarcia.net')
INSERT [dbo].[books] ([book_id], [title], [category], [publication_date], [author], [date_publication_university], [amount_pages], [url]) VALUES (2, N'Crònicas De Una Muerte Anunciada', N'libro', CAST(N'2008-06-02T00:00:00.000' AS DateTime), N'Gabriel Garcia Marquez', CAST(N'2009-08-02T00:00:00.000' AS DateTime), 150, N'https://Croicas.GabrielGarcia.net')
INSERT [dbo].[books] ([book_id], [title], [category], [publication_date], [author], [date_publication_university], [amount_pages], [url]) VALUES (3, N'El espacio', N'revista', CAST(N'2000-05-01T00:00:00.000' AS DateTime), N'N/A', CAST(N'2009-09-02T00:00:00.000' AS DateTime), 15, N'https://espacio.com.co')
SET IDENTITY_INSERT [dbo].[books] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([student_id], [name], [semester], [training], [performance], [date_admission]) VALUES (1, N'Jaimito El cartero', 6, N'Sistemas', N'Regular', CAST(N'2018-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Students] ([student_id], [name], [semester], [training], [performance], [date_admission]) VALUES (2, N'Miguel Cardenas', 10, N'Psicología', N'Excelente', CAST(N'2020-04-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Students] ([student_id], [name], [semester], [training], [performance], [date_admission]) VALUES (3, N'Alirio Perdomo', 8, N'Idiomas', N'Bueno', CAST(N'2016-05-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_books] FOREIGN KEY([student_id])
REFERENCES [dbo].[books] ([book_id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_books]
GO
USE [master]
GO
ALTER DATABASE [UniversityDB] SET  READ_WRITE 
GO
