USE [master]
GO
/****** Object:  Database [InventoryManagement]    Script Date: 21-11-2023 18:43:16 ******/
CREATE DATABASE [InventoryManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InventoryManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\InventoryManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InventoryManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\InventoryManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [InventoryManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InventoryManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InventoryManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InventoryManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InventoryManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InventoryManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InventoryManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [InventoryManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InventoryManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InventoryManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InventoryManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InventoryManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InventoryManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InventoryManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InventoryManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InventoryManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InventoryManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InventoryManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InventoryManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InventoryManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InventoryManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InventoryManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InventoryManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InventoryManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InventoryManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InventoryManagement] SET  MULTI_USER 
GO
ALTER DATABASE [InventoryManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InventoryManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InventoryManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InventoryManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InventoryManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InventoryManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [InventoryManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [InventoryManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [InventoryManagement]
GO
/****** Object:  User [shijin]    Script Date: 21-11-2023 18:43:16 ******/
CREATE USER [shijin] FOR LOGIN [shijin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[ItemMaster]    Script Date: 21-11-2023 18:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_ItemMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemQuantity]    Script Date: 21-11-2023 18:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemQuantity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [varchar](50) NOT NULL,
	[Quantity] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_ItemQuantity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 21-11-2023 18:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Password] [varchar](250) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ItemMaster] ADD  CONSTRAINT [DF_ItemMaster_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ItemMaster] ADD  CONSTRAINT [DF_ItemMaster_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[ItemQuantity] ADD  CONSTRAINT [DF_ItemQuantity_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[ItemQuantity] ADD  CONSTRAINT [DF_ItemQuantity_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[ItemQuantity] ADD  CONSTRAINT [DF_ItemQuantity_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ItemQuantity] ADD  CONSTRAINT [DF_ItemQuantity_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  StoredProcedure [dbo].[usp_AddItemMaster]    Script Date: 21-11-2023 18:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Shijin Thomas>
-- Create date: <21/11/2023>
-- Description:	<Add Item Master>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AddItemMaster] 
@Code  varchar(50),
@Name varchar(100),
@CreatedBy int

AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[ItemMaster]
           ([Code]
           ,[Name]          
           ,[CreatedBy]          
           )
     VALUES
           (@Code ,
			@Name ,			
			@CreatedBy 			
			)

	SELECT 'Done'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AddItemQuantity]    Script Date: 21-11-2023 18:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Shijin Thomas>
-- Create date: <21/11/2023>
-- Description:	<Add Item Quantity>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AddItemQuantity]
@ItemCode varchar(50),
@Quantity float,
@Price float,
@CreatedBy int

AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[ItemQuantity]
           ([ItemCode]
           ,[Quantity]
           ,[Price]
           ,[CreatedBy]           
           )
     VALUES
           (@ItemCode
           ,@Quantity
           ,@Price
           ,@CreatedBy)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteItemMaster]    Script Date: 21-11-2023 18:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Shijin Thomas>
-- Create date: <21/11/2023>
-- Description:	<Delete Item Master>
-- =============================================
CREATE PROCEDURE [dbo].[usp_DeleteItemMaster]
@Id Int,
@ModifiedBy int
AS
BEGIN
	
	SET NOCOUNT ON;

   UPDATE [dbo].[ItemMaster]
   SET  Status=0
      ,[ModifiedBy] = @ModifiedBy
      ,[ModifiedOn] = GetDate()
 WHERE Id=@Id
 Select 'Deleted'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteItemQuantity]    Script Date: 21-11-2023 18:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Shijin Thomas>
-- Create date: <21/11/2023>
-- Description:	<Delete Item Quantity>
-- =============================================
CREATE PROCEDURE [dbo].[usp_DeleteItemQuantity]
@Id Int,
@ModifiedBy int
AS
BEGIN
	
	SET NOCOUNT ON;

   UPDATE [dbo].[ItemQuantity]
   SET 
       [Status] =0 
      ,[ModifiedBy] = @ModifiedBy
      ,[ModifiedOn] = GetDate()
 WHERE Id=@Id
 Select 'Deleted'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetItemMaster]    Script Date: 21-11-2023 18:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Shijin Thomas>
-- Create date: <21/11/2023>
-- Description:	<Get Item Master>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetItemMaster]
@Id Int=null	
AS
BEGIN	
	SET NOCOUNT ON;

	IF(@Id is null)
	BEGIN
	  SELECT [Id]
        ,[Code]
        ,[Name]
        ,[Status]
        ,[CreatedBy]
        ,[CreatedOn]
        ,[ModifiedBy]
        ,[ModifiedOn]
     FROM [InventoryManagement].[dbo].[ItemMaster]
	 WHERE Status=1
  END
  ELSE
   BEGIN
	  SELECT [Id]
        ,[Code]
        ,[Name]
        ,[Status]
        ,[CreatedBy]
        ,[CreatedOn]
        ,[ModifiedBy]
        ,[ModifiedOn]
     FROM [InventoryManagement].[dbo].[ItemMaster]
	 WHERE Id=@Id
  END
    
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetItemQuantity]    Script Date: 21-11-2023 18:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Shijin Thomas>
-- Create date: <21/11/2023>
-- Description:	<Get Item Quanty>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetItemQuantity]
@Id Int=null	
AS
BEGIN	
	SET NOCOUNT ON;

	IF(@Id is null)
	BEGIN
	  SELECT  [Id]
      ,[ItemCode]
      ,[Quantity]
      ,[Price]
	  ,[Status]
      ,[CreatedBy]
      ,[CreatedOn]
      ,[ModifiedBy]
      ,[ModifiedOn]
    FROM [InventoryManagement].[dbo].[ItemQuantity]
	
  END
  ELSE
   BEGIN
	  SELECT  [Id]
      ,[ItemCode]
      ,[Quantity]
      ,[Price]
	  ,[Status]
      ,[CreatedBy]
      ,[CreatedOn]
      ,[ModifiedBy]
      ,[ModifiedOn]
    FROM [InventoryManagement].[dbo].[ItemQuantity]
	 WHERE Id=@Id
  END    
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserLogin]    Script Date: 21-11-2023 18:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Shijin Thomas>
-- Create date: <21/11/2023>
-- Description:	<Get User List>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetUserLogin]
	-- Add the parameters for the stored procedure here
	@UserName Varchar(100),
	@Password  Varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT [Id]
      ,[UserName]
      ,[Password]
      ,[Status]
      ,[CreatedOn]
  FROM [InventoryManagement].[dbo].[UserInfo]
  WHERE UserName=@UserName And [Password]=@Password
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateItemMaster]    Script Date: 21-11-2023 18:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Shijin Thomas>
-- Create date: <21/11/2023>
-- Description:	<Update Item Master>
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdateItemMaster]
@Id Int,
@Code  varchar(50),
@Name varchar(100),
@ModifiedBy int
AS
BEGIN
	
	SET NOCOUNT ON;

   UPDATE [dbo].[ItemMaster]
   SET [Code] = @Code
      ,[Name] = @Name 
      ,[ModifiedBy] = @ModifiedBy
      ,[ModifiedOn] = GetDate()
 WHERE Id=@Id
 select 'Updated'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateItemQuantity]    Script Date: 21-11-2023 18:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Shijin Thomas>
-- Create date: <21/11/2023>
-- Description:	<Update Item Quantity>
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdateItemQuantity]
@Id Int,
@Quantity float,
@Price float,
@ModifiedBy int
AS
BEGIN
	
	SET NOCOUNT ON;

   UPDATE [dbo].[ItemQuantity]
   SET [Quantity] = @Quantity
      ,[Price] = @Price      
      ,[ModifiedBy] = @ModifiedBy
      ,[ModifiedOn] = GetDate()
 WHERE Id=@Id
END
GO
USE [master]
GO
ALTER DATABASE [InventoryManagement] SET  READ_WRITE 
GO
