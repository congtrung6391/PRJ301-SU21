USE [master]
GO
/****** Object:  Database [PRJ301_SE1511_Group01]    Script Date: 6/28/2021 12:48:36 PM ******/
CREATE DATABASE [PRJ301_SE1511_Group01]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301_SE1511_Group01', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PRJ301_SE1511_Group01.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301_SE1511_Group01_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PRJ301_SE1511_Group01_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301_SE1511_Group01].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PRJ301_SE1511_Group01]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 6/28/2021 12:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Address] [nvarchar](200) NULL,
	[TotalPrice] [float] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetail]    Script Date: 6/28/2021 12:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetail](
	[CartDetailID] [int] IDENTITY(1,1) NOT NULL,
	[LaptopID] [int] NOT NULL,
	[CartID] [int] NOT NULL,
 CONSTRAINT [PK_CartDetail] PRIMARY KEY CLUSTERED 
(
	[CartDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detail]    Script Date: 6/28/2021 12:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detail](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[LaptopID] [int] NOT NULL,
	[DetailTypeID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_Detail] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailType]    Script Date: 6/28/2021 12:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailType](
	[DetailTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_DetailType] PRIMARY KEY CLUSTERED 
(
	[DetailTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Laptop]    Script Date: 6/28/2021 12:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laptop](
	[LaptopID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [float] NULL,
	[Name] [nvarchar](50) NULL,
	[CPU] [nvarchar](50) NULL,
	[Ram] [nvarchar](50) NULL,
	[Screen] [nvarchar](50) NULL,
	[Graphic] [nvarchar](50) NULL,
	[Disk] [nvarchar](50) NULL,
	[OS] [nvarchar](50) NULL,
	[Weight] [float] NULL,
	[Region] [nvarchar](50) NULL,
	[Year] [date] NULL,
 CONSTRAINT [PK_Laptop] PRIMARY KEY CLUSTERED 
(
	[LaptopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/28/2021 12:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](200) NULL,
	[Password] [nvarchar](200) NULL,
	[Role] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartID], [UserID], [Address], [TotalPrice]) VALUES (1, 2, N'quan 2, tphcm', 20000000)
INSERT [dbo].[Cart] ([CartID], [UserID], [Address], [TotalPrice]) VALUES (2, 2, N'quan 4, tphcm', 30000000)
INSERT [dbo].[Cart] ([CartID], [UserID], [Address], [TotalPrice]) VALUES (3, 2, N'quan 5, tphcm', 40000000)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[CartDetail] ON 

INSERT [dbo].[CartDetail] ([CartDetailID], [LaptopID], [CartID]) VALUES (1, 1, 1)
INSERT [dbo].[CartDetail] ([CartDetailID], [LaptopID], [CartID]) VALUES (2, 2, 2)
INSERT [dbo].[CartDetail] ([CartDetailID], [LaptopID], [CartID]) VALUES (3, 3, 3)
SET IDENTITY_INSERT [dbo].[CartDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Detail] ON 

INSERT [dbo].[Detail] ([DetailID], [LaptopID], [DetailTypeID], [Name], [Description]) VALUES (1, 1, 1, N'detail 1', N'laptop 1')
INSERT [dbo].[Detail] ([DetailID], [LaptopID], [DetailTypeID], [Name], [Description]) VALUES (2, 2, 2, N'detail 2', N'laptop 2')
INSERT [dbo].[Detail] ([DetailID], [LaptopID], [DetailTypeID], [Name], [Description]) VALUES (3, 3, 3, N'detail 3', N'laptop 3')
SET IDENTITY_INSERT [dbo].[Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[DetailType] ON 

INSERT [dbo].[DetailType] ([DetailTypeID], [Name]) VALUES (1, N'detail 1')
INSERT [dbo].[DetailType] ([DetailTypeID], [Name]) VALUES (2, N'detail 2')
INSERT [dbo].[DetailType] ([DetailTypeID], [Name]) VALUES (3, N'detail 3')
SET IDENTITY_INSERT [dbo].[DetailType] OFF
GO
SET IDENTITY_INSERT [dbo].[Laptop] ON 

INSERT [dbo].[Laptop] ([LaptopID], [Price], [Name], [CPU], [Ram], [Screen], [Graphic], [Disk], [OS], [Weight], [Region], [Year]) VALUES (1, 20000000, N'msi', N'i7-9700h', N'8GB', N'15.6 inches', N'GTX 1650', N'256GB', N'window 10', 2.3, N'China', CAST(N'2020-01-01' AS Date))
INSERT [dbo].[Laptop] ([LaptopID], [Price], [Name], [CPU], [Ram], [Screen], [Graphic], [Disk], [OS], [Weight], [Region], [Year]) VALUES (2, 30000000, N'alienware', N'i9-9900hk', N'16GB', N'15.6 inches', N'GTX 2080', N'512GB', N'window 10', 2.7, N'USA', CAST(N'2021-01-01' AS Date))
INSERT [dbo].[Laptop] ([LaptopID], [Price], [Name], [CPU], [Ram], [Screen], [Graphic], [Disk], [OS], [Weight], [Region], [Year]) VALUES (3, 40000000, N'asus', N'i9-9900hk', N'32GB', N'15.6 inches', N'RX 5800', N'1TB', N'window 10', 2.8, N'HK', CAST(N'2021-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[Laptop] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Username], [Password], [Role], [Name], [Phone], [Address]) VALUES (1, N'admin', N'admin', 1, N'nguyen admin', N'094236482', N'quan 1, tphcm')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Role], [Name], [Phone], [Address]) VALUES (2, N'customer1', N'customer1', 2, N'nguyen customer', N'093242342', N'quan 2, tphcm')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Role], [Name], [Phone], [Address]) VALUES (3, N'staff', N'staff', 3, N'nguyen staff', N'094354354', N'quan 3, tphcm')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Role], [Name], [Phone], [Address]) VALUES (4, N'customer2', N'customer2', 2, N'nguyen customer2', N'094334543', N'quan 4, tphcm')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Role], [Name], [Phone], [Address]) VALUES (5, N'customer3', N'customer3', 2, N'nguyen customer3', N'093454343', N'quan 5, tphcm')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User1] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_User1]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_CartDetail_Cart1] FOREIGN KEY([CartID])
REFERENCES [dbo].[Cart] ([CartID])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_CartDetail_Cart1]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_CartDetail_Laptop1] FOREIGN KEY([CartDetailID])
REFERENCES [dbo].[Laptop] ([LaptopID])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_CartDetail_Laptop1]
GO
ALTER TABLE [dbo].[Detail]  WITH CHECK ADD  CONSTRAINT [FK_Detail_DetailType1] FOREIGN KEY([DetailID])
REFERENCES [dbo].[DetailType] ([DetailTypeID])
GO
ALTER TABLE [dbo].[Detail] CHECK CONSTRAINT [FK_Detail_DetailType1]
GO
ALTER TABLE [dbo].[Detail]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Laptop] FOREIGN KEY([LaptopID])
REFERENCES [dbo].[Laptop] ([LaptopID])
GO
ALTER TABLE [dbo].[Detail] CHECK CONSTRAINT [FK_Detail_Laptop]
GO
USE [master]
GO
ALTER DATABASE [PRJ301_SE1511_Group01] SET  READ_WRITE 
GO