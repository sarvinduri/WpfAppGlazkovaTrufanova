USE [master]
GO
/****** Object:  Database [GlazkovaTrufanova]    Script Date: 11.11.2024 15:07:10 ******/
CREATE DATABASE [GlazkovaTrufanova]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GlazkovaTrufanova', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\GlazkovaTrufanova.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GlazkovaTrufanova_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\GlazkovaTrufanova_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GlazkovaTrufanova] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GlazkovaTrufanova].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GlazkovaTrufanova] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GlazkovaTrufanova] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GlazkovaTrufanova] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GlazkovaTrufanova] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GlazkovaTrufanova] SET ARITHABORT OFF 
GO
ALTER DATABASE [GlazkovaTrufanova] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GlazkovaTrufanova] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GlazkovaTrufanova] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GlazkovaTrufanova] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GlazkovaTrufanova] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GlazkovaTrufanova] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GlazkovaTrufanova] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GlazkovaTrufanova] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GlazkovaTrufanova] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GlazkovaTrufanova] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GlazkovaTrufanova] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GlazkovaTrufanova] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GlazkovaTrufanova] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GlazkovaTrufanova] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GlazkovaTrufanova] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GlazkovaTrufanova] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GlazkovaTrufanova] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GlazkovaTrufanova] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GlazkovaTrufanova] SET  MULTI_USER 
GO
ALTER DATABASE [GlazkovaTrufanova] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GlazkovaTrufanova] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GlazkovaTrufanova] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GlazkovaTrufanova] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GlazkovaTrufanova] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GlazkovaTrufanova] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GlazkovaTrufanova] SET QUERY_STORE = ON
GO
ALTER DATABASE [GlazkovaTrufanova] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [GlazkovaTrufanova]
GO
/****** Object:  Table [dbo].[Dictionary]    Script Date: 11.11.2024 15:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dictionary](
	[id_Dictionary] [int] NOT NULL,
	[UserSurname] [nchar](10) NULL,
	[UserName] [nchar](10) NULL,
	[UserLogin] [nvarchar](255) NULL,
	[UserPassword] [nvarchar](255) NULL,
 CONSTRAINT [PK_Dictionary] PRIMARY KEY CLUSTERED 
(
	[id_Dictionary] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11.11.2024 15:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[IDOrder] [int] NOT NULL,
	[IDProducts] [int] NOT NULL,
	[id_Dictionary] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[IDOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11.11.2024 15:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[IDProducts] [int] NOT NULL,
	[ProductsName] [nvarchar](255) NOT NULL,
	[ProductsPrice] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[IDProducts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Dictionary] ([id_Dictionary], [UserSurname], [UserName], [UserLogin], [UserPassword]) VALUES (1, N'Глазкова  ', N'Александра', N'Glaz', N'Glaz')
INSERT [dbo].[Dictionary] ([id_Dictionary], [UserSurname], [UserName], [UserLogin], [UserPassword]) VALUES (2, N'Труфанова ', N'Яна       ', N'Truf', N'Truf')
INSERT [dbo].[Dictionary] ([id_Dictionary], [UserSurname], [UserName], [UserLogin], [UserPassword]) VALUES (3, N'Девяткин  ', N'Эдуард    ', N'Dev', N'Dev')
INSERT [dbo].[Dictionary] ([id_Dictionary], [UserSurname], [UserName], [UserLogin], [UserPassword]) VALUES (4, N'Калинин   ', N'Владислав ', N'Kalin', N'Kalin')
GO
INSERT [dbo].[Order] ([IDOrder], [IDProducts], [id_Dictionary]) VALUES (1, 1, 1)
INSERT [dbo].[Order] ([IDOrder], [IDProducts], [id_Dictionary]) VALUES (2, 2, 2)
INSERT [dbo].[Order] ([IDOrder], [IDProducts], [id_Dictionary]) VALUES (3, 3, 3)
INSERT [dbo].[Order] ([IDOrder], [IDProducts], [id_Dictionary]) VALUES (4, 4, 4)
INSERT [dbo].[Order] ([IDOrder], [IDProducts], [id_Dictionary]) VALUES (5, 5, 4)
GO
INSERT [dbo].[Products] ([IDProducts], [ProductsName], [ProductsPrice]) VALUES (1, N'Брюки', N'2500')
INSERT [dbo].[Products] ([IDProducts], [ProductsName], [ProductsPrice]) VALUES (2, N'Рубашка', N'1500')
INSERT [dbo].[Products] ([IDProducts], [ProductsName], [ProductsPrice]) VALUES (3, N'Кроссовки', N'3400')
INSERT [dbo].[Products] ([IDProducts], [ProductsName], [ProductsPrice]) VALUES (4, N'Худи', N'4400')
INSERT [dbo].[Products] ([IDProducts], [ProductsName], [ProductsPrice]) VALUES (5, N'Джинсы', N'2450')
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Dictionary] FOREIGN KEY([id_Dictionary])
REFERENCES [dbo].[Dictionary] ([id_Dictionary])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Dictionary]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Products] FOREIGN KEY([IDProducts])
REFERENCES [dbo].[Products] ([IDProducts])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Products]
GO
USE [master]
GO
ALTER DATABASE [GlazkovaTrufanova] SET  READ_WRITE 
GO
