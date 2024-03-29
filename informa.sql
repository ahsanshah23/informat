USE [master]
GO
/****** Object:  Database [informat]    Script Date: 3/24/2023 10:56:14 PM ******/
CREATE DATABASE [informat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'informat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\informat.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'informat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\informat_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [informat] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [informat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [informat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [informat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [informat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [informat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [informat] SET ARITHABORT OFF 
GO
ALTER DATABASE [informat] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [informat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [informat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [informat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [informat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [informat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [informat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [informat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [informat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [informat] SET  ENABLE_BROKER 
GO
ALTER DATABASE [informat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [informat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [informat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [informat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [informat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [informat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [informat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [informat] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [informat] SET  MULTI_USER 
GO
ALTER DATABASE [informat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [informat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [informat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [informat] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [informat] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [informat] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [informat] SET QUERY_STORE = ON
GO
ALTER DATABASE [informat] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [informat]
GO
/****** Object:  Schema [HangFire]    Script Date: 3/24/2023 10:56:15 PM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Schema [informat_user]    Script Date: 3/24/2023 10:56:15 PM ******/
CREATE SCHEMA [informat_user]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[CompanyId] [nvarchar](450) NULL,
	[IsDummyData] [bit] NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ProfilePic] [nvarchar](450) NULL,
	[FullName] [nvarchar](max) NULL,
	[IsDummyData] [bit] NULL,
	[IsPasswordSet] [bit] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invitation]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invitation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvitationId] [nvarchar](450) NULL,
	[CoupleName] [nvarchar](max) NULL,
	[SecondCoupleName] [nvarchar](max) NULL,
	[EventTitle] [nvarchar](max) NULL,
	[EventTime] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[EventDate] [date] NULL,
	[Location] [nvarchar](max) NULL,
	[ExpiryDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UserId] [nvarchar](450) NULL,
	[UserSubscriptionId] [int] NULL,
	[SongId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvitationAttachments]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvitationAttachments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvitationId] [nvarchar](450) NULL,
	[Attachment] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[Createdby] [nvarchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshToken](
	[ApplicationUserId] [nvarchar](450) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Token] [nvarchar](max) NULL,
	[Expires] [datetime2](7) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Revoked] [datetime2](7) NULL,
 CONSTRAINT [PK_RefreshToken] PRIMARY KEY CLUSTERED 
(
	[ApplicationUserId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSVP]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSVP](
	[Id] [nvarchar](max) NULL,
	[EventId] [nvarchar](max) NULL,
	[Names] [nvarchar](max) NULL,
	[IsAttending] [bit] NULL,
	[NoOfAttendees] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Songs]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Songs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Link] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscription](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Count] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSubscription]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSubscription](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[SubscriptionId] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[BuyingDate] [datetime] NULL,
	[ExpiresOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [int] NOT NULL,
	[ExpireAt] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CX_HangFire_Counter]    Script Date: 3/24/2023 10:56:15 PM ******/
CREATE CLUSTERED INDEX [CX_HangFire_Counter] ON [HangFire].[Counter]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [bigint] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Queue] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[List]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Server]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](200) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Set]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[State]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [CompanyId], [IsDummyData]) VALUES (N'1ff1f4c3-df05-4b20-9434-898f6e46c776', N'User', N'USER', N'1d4ded99-a103-4e65-bf89-91be0a5ac77e', NULL, NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'15f81d02-2f37-40ca-8b25-edde9f86a9ff', N'1ff1f4c3-df05-4b20-9434-898f6e46c776')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'28a19fb5-1abc-4197-a1d6-d62b4070cfd6', N'1ff1f4c3-df05-4b20-9434-898f6e46c776')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3dfbd047-641d-401d-a49e-c3bb55239494', N'1ff1f4c3-df05-4b20-9434-898f6e46c776')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'71501874-054d-4c80-acd2-06a4f78853a7', N'1ff1f4c3-df05-4b20-9434-898f6e46c776')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'af075ec6-0b3b-4edc-9df6-43927533e227', N'1ff1f4c3-df05-4b20-9434-898f6e46c776')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'beca339a-1bed-49ba-a3f5-9da636baf774', N'1ff1f4c3-df05-4b20-9434-898f6e46c776')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c29b88d2-97c9-4087-9821-1ce6d68694c6', N'1ff1f4c3-df05-4b20-9434-898f6e46c776')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd56ff033-bd1b-4dee-ad74-36f3f5a50ba2', N'1ff1f4c3-df05-4b20-9434-898f6e46c776')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'eaaeab0b-20fe-4085-98cc-fa5ed26343e3', N'1ff1f4c3-df05-4b20-9434-898f6e46c776')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'eec86266-a2bf-4b2d-9012-c890b0d53cf1', N'1ff1f4c3-df05-4b20-9434-898f6e46c776')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f776c491-10b1-48d4-ad60-e678c111d4cb', N'1ff1f4c3-df05-4b20-9434-898f6e46c776')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fa34c98c-63a8-482c-af8b-abc5917c140a', N'1ff1f4c3-df05-4b20-9434-898f6e46c776')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'15f81d02-2f37-40ca-8b25-edde9f86a9ff', N'Hammad63jw', N'HAMMAD63JW', N'makk.9696242@gmail.com', N'MAKK.9696242@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEGWeECuenYuaPY4TtgKndHjEMEBIByLO6CoDCCtqEy57HudWIb2xmsxl367t0CGL7g==', N'VJMPYMECZJBVFYYS34BETNM4KE2W74SZ', N'032d69e8-5204-4bb5-b2c2-2622d3766e23', NULL, 0, 0, NULL, 0, 0, NULL, N'Hammad', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-09T20:01:13.680' AS DateTime), CAST(N'2022-10-09T20:01:13.680' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'28a19fb5-1abc-4197-a1d6-d62b4070cfd6', N'AhsanShah19yz', N'AHSANSHAH19YZ', N'ahsanshah@gmail.com', N'AHSANSHAH@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMLwgDAVmPF/IJtHR+XvEv4zA25SIxx53ZcZqbtZzouns0CSvNhbnYfp6CFHCLjFTg==', N'KJEZNHWJ4OV3OF6HOKNEQUF6PAY7NMA4', N'31121ae0-8af4-443f-82ea-24144f551d93', NULL, 0, 0, NULL, 0, 0, NULL, N'Ahsan Shah', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-08T22:47:08.377' AS DateTime), CAST(N'2022-10-08T22:47:08.377' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'3dfbd047-641d-401d-a49e-c3bb55239494', N'Marff36mj', N'MARFF36MJ', N'kmarf737104807@gmail.com', N'KMARF737104807@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIvPtOuEwimJAFQqHJChoMyNKsrTgovi9nipr8sxUUJ8yYRb6ukipvOfmCpOTXYFEA==', N'XGR4PASWQRRR5MXFOB6ZXJIQEIID5FMX', N'98bb8b55-56f5-429d-84c1-f637222ee3ce', NULL, 0, 0, NULL, 0, 0, NULL, N'Marff', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-09T20:59:52.550' AS DateTime), CAST(N'2022-10-09T20:59:52.550' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'71501874-054d-4c80-acd2-06a4f78853a7', N'Ahsan10jx', N'AHSAN10JX', N'ahsan@gmail.com', N'AHSAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEO1O2u03b5Jlg97Ge+wEhbqKXxg09t6o0VgsqAlc3QIDcTHfIcPKzskIF4WcrAh5oQ==', N'YW2OKTLW7PWFKLTHIFCBN25BZ4NTH77L', N'6cd94e6e-86bb-4705-9fd1-a1d5b41ad46a', NULL, 0, 0, NULL, 0, 0, NULL, N'Ahsan', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-19T23:56:43.133' AS DateTime), CAST(N'2022-10-19T23:56:43.133' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'7f48b6d6-0ae0-46c6-beac-0ba82a20c00e', N'Test1he', N'TEST1HE', N'test@xyz.vom', N'TEST@XYZ.VOM', 0, N'AQAAAAEAACcQAAAAEDavUT7y1MmMh8knhPPZvJZDvTkRS9gF4sPdq7rVnhz/U/5v/YlALnSoTDTfQyoepA==', N'SH6UFJKJAEHHWT5FP5FAOTFMWUZ44CTX', N'744d70cb-7734-457f-a75c-39c513407bdc', NULL, 0, 0, NULL, 0, 0, NULL, N'Test', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07T19:23:57.850' AS DateTime), CAST(N'2023-03-07T19:23:57.850' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'878cf5d7-4d03-4c77-95ec-8007a6e01d6a', N'test91fj', N'TEST91FJ', N'test@gmail.com', N'TEST@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJPxssXLE5aUpE4x1lrKCzhdxU7E7UDX/nroverxhDvmxk6xl3UlEbbkUrJNOehSsA==', N'6NLRHGOB7SLAMZPFQJA3RFT7GVKNVZPI', N'a7a8fd69-f665-4554-9cbd-e2029b65d752', NULL, 0, 0, NULL, 0, 0, NULL, N'test', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-14T13:28:42.433' AS DateTime), CAST(N'2022-10-14T13:28:42.433' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'8dd0df13-66c9-4e94-8578-d15a2f98d9d4', N'test91qn', N'TEST91QN', N'test@gmail.com', N'TEST@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEAlg+GjRVndHbTj+cSrkahCzoz+uh3izhdJWQbmLvpNsvWuGim39FGryLq94l/2Ilg==', N'7CG43QYZG2ZLMZLIVF4EW3ZBLZG6BUEU', N'2da86ee5-664d-4c92-865d-371f9c6a8ef8', NULL, 0, 0, NULL, 0, 0, NULL, N'test', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-14T13:28:42.433' AS DateTime), CAST(N'2022-10-14T13:28:42.433' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'96a51bb3-ec48-47f9-aad4-6f1174f6ee62', N'Test58lo', N'TEST58LO', N'test@xyz.vom', N'TEST@XYZ.VOM', 0, N'AQAAAAEAACcQAAAAEESk5JgvA992t7W+vOu60wZuu5kSvs1D+O1+uh6dHY+0QvOq6FaA70MgqUEj4/A2Pg==', N'MWFM76NFHCGQHOF76KJICTVCPV6TAOJ5', N'316b68b0-7580-49e2-bf2b-28891dd58e0c', NULL, 0, 0, NULL, 0, 0, NULL, N'Test', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07T19:23:57.850' AS DateTime), CAST(N'2023-03-07T19:23:57.850' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'af075ec6-0b3b-4edc-9df6-43927533e227', N'makk8hc', N'MAKK8HC', N'blabla@gmail.com', N'BLABLA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIIBfGxKxUzOvVgod+mKWq5S0Ut0hlu9wXtOvuFnkXH1TNWui47XBkFthERCx4Zr9Q==', N'7P47JNAMN7RMKSWU6LSRH57TAFNYEISR', N'f94d2729-ed80-42b4-a3a5-83ce0cf690ad', NULL, 0, 0, NULL, 0, 0, NULL, N'makk', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-20T01:18:19.980' AS DateTime), CAST(N'2022-10-20T01:18:19.980' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'b9b67936-920c-489d-aef2-d57f3cf75c7f', N'Marf22xm', N'MARF22XM', N'kh2kh3@gmail.com', N'KH2KH3@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEEEaShIFOC6xWzKzMtWr9XYmjbqqNhm0t9kVGjHFCYmpmeOx6NmV83xZu8DOnNZ3kQ==', N'SUN3UG25A5NI6UEQEOZSOBWL3HBGJUXF', N'33fea577-7abb-400d-a0e0-c90a7de479b2', NULL, 0, 0, NULL, 0, 0, NULL, N'Marf', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-09T19:58:40.247' AS DateTime), CAST(N'2022-10-09T19:58:40.247' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'bb9dc7b4-7024-438f-b59d-d6f44185d472', N'mclovin82gf', N'MCLOVIN82GF', N'haha@gmail.com', N'HAHA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEEYalAiLALpEf2DbMa0MkzFuVu9rTk/F+DgeN6xBfFu2375H+g31Dfl7dhC5Ipmc4g==', N'VP4GXDNHYBNBUVOELOWGS4RHLE6VVSBJ', N'90f77934-0497-4638-9b88-f42fde2e6e40', NULL, 0, 0, NULL, 0, 0, NULL, N'mclovin', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-20T01:24:46.380' AS DateTime), CAST(N'2022-10-20T01:24:46.380' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'beca339a-1bed-49ba-a3f5-9da636baf774', N'AhsanShah71hv', N'AHSANSHAH71HV', N'ahsanshah2398@gmail.com', N'AHSANSHAH2398@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEF23JZ6vQTnDioJvqDIzedw1cD4MZbBjIsQouizjKRKZFlQtOH8Cpt9tnpAE/ynpBQ==', N'JE4CBX42MBO3WXKQD6QNVUFGFDLVX3NW', N'14fccc8e-530d-47b3-ab07-2e8235d12357', NULL, 0, 0, NULL, 0, 0, NULL, N'Ahsan Shah', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-19T23:55:19.970' AS DateTime), CAST(N'2022-10-19T23:55:19.970' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'c29b88d2-97c9-4087-9821-1ce6d68694c6', N'Ahsan80nb', N'AHSAN80NB', N'ahsan2@gmail.com', N'AHSAN2@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBhUQqIU/R7Z1oeoBGmpeHy1qKWwOG1yB3V41Ov+Ft6LC89XuWHSn8zslpmfVhBnug==', N'CM3VICG2FL55URIX6XB6UQSWMG7DVUUQ', N'61a0f520-47cc-494b-a3d5-4381660f0f9c', NULL, 0, 0, NULL, 0, 0, NULL, N'Ahsan', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-21T02:55:43.340' AS DateTime), CAST(N'2022-10-21T02:55:43.340' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'cf6697a3-e1ec-4d73-8b7b-8916333f35f7', N'test8sg', N'TEST8SG', N'test@gmail.com', N'TEST@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEL9oAmUP0Xn+aYYDW0zTfXv6FOvGNNP0W4jFuR0yctTrF9zUg3YEAchURYeIeyM3jg==', N'5OOBVNVERWXTY7U3CSLKN2HCRSQD6YBG', N'3a36d07a-6985-4b3a-9381-4e198b2fb517', NULL, 0, 0, NULL, 0, 0, NULL, N'test', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-14T13:28:42.433' AS DateTime), CAST(N'2022-10-14T13:28:42.433' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'cf9bcd45-823f-4561-8d55-4471b6f9217f', N'mclovin73nr', N'MCLOVIN73NR', N'haha@gmail.com', N'HAHA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMwPyZuqZYIj9OTYfnW23XN9pP4J+bK/9ytlIoez/DIalssYBY0845GDidem8I/SRg==', N'QGHILXEUS4OWB7DML6NHZE2CRIBKTRZO', N'2bc43c8d-9986-4106-b959-03be2a7fd74c', NULL, 0, 0, NULL, 0, 0, NULL, N'mclovin', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-20T01:24:46.380' AS DateTime), CAST(N'2022-10-20T01:24:46.380' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'cfca7473-0b28-483a-9c6f-7e203f751aeb', N'Marf83hq', N'MARF83HQ', N'kh2kh3@gmail.com', N'KH2KH3@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOKHHe7kmm41MpN2/hH3zZ9iK+60EfihOT8o0G5ixDNG/nFEu1OlBKO31kuUUUFuUw==', N'OX6GXSR4ORTOG5JDLUFSYK56Y2TGNYZY', N'445ae80e-de83-41a5-abe1-6fad60b3384d', NULL, 0, 0, NULL, 0, 0, NULL, N'Marf', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-09T19:58:40.247' AS DateTime), CAST(N'2022-10-09T19:58:40.247' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'd56ff033-bd1b-4dee-ad74-36f3f5a50ba2', N'Ahsan61dh', N'AHSAN61DH', N'ahsan1@gmail.com', N'AHSAN1@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEGPFQjp91StB50JnLqQHGL65133HNUyotjLLZwgKg4eZbZ7QwYo6aur1QLBqKV5Jgw==', N'4H3UX24YYWA2LRKF3ZXC5QYH2PO744WH', N'70ba1f28-1f7f-4bf3-8426-c18bfcf0fdd3', NULL, 0, 0, NULL, 0, 0, NULL, N'Ahsan', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-21T02:50:18.170' AS DateTime), CAST(N'2022-10-21T02:50:18.170' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'dd4e8760-25f2-497a-9cae-b79bb9e515a9', N'test88em', N'TEST88EM', N'test@gmail.com', N'TEST@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHF0Jbx9f/Q0WXRnfma+O7BdSlUU05761pr243ZIRsJGQgS08NQLKBZ2JcRI0AkYyg==', N'YTOYONYCIW4CRC7NGUZOOXAX4IY4FYLH', N'ad70c870-0755-4ed3-92a3-fa6fbb383906', NULL, 0, 0, NULL, 0, 0, NULL, N'test', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-14T13:28:42.433' AS DateTime), CAST(N'2022-10-14T13:28:42.433' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'ddc80f5a-9956-423e-9325-e36ff426faa6', N'test10ti', N'TEST10TI', N'test@gmail.com', N'TEST@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEFMRW+8NF3GdRaSFPeXrUEnrivb2sAiKwOQ9rcbMLn84IG4/s2NNJvH9y9y6/BlX5g==', N'TIFF47YZO7CSUACQ6SJBNKE225OLWKXK', N'568d471e-1503-4aae-a705-f1041acc32e7', NULL, 0, 0, NULL, 0, 0, NULL, N'test', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-14T13:28:42.430' AS DateTime), CAST(N'2022-10-14T13:28:42.430' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'eaaeab0b-20fe-4085-98cc-fa5ed26343e3', N'hahah17im', N'HAHAH17IM', N'hsdaaha@gmail.com', N'HSDAAHA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIRDLc1nqZ0TbeatynMy4rDC+7pKuSDuwhQFqPdNimfKtdnjI1uvzv5HYEby25tVzQ==', N'AOG6MMCHEFNA64KNZBX66AIDRY2KBWET', N'43090068-ce79-42f1-bb97-590f2ef23eb7', NULL, 0, 0, NULL, 0, 0, NULL, N'hahah', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-20T01:27:23.860' AS DateTime), CAST(N'2022-10-20T01:27:23.860' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'eec86266-a2bf-4b2d-9012-c890b0d53cf1', N'Test82hx', N'TEST82HX', N'test@xyz.com', N'TEST@XYZ.COM', 0, N'AQAAAAEAACcQAAAAEGjPu9i9n17OCz2m/rwjRUON/xmMBEt1PhOmoW7XixyHU968x1+vr075THNIvQOhHw==', N'WL4H4H6VORFIUMY6T6ST63GQLCHABUYP', N'252683e9-c8bd-4d15-8cd2-1fdb4e5e851f', NULL, 0, 0, NULL, 0, 0, NULL, N'Test', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07T19:24:34.620' AS DateTime), CAST(N'2023-03-07T19:24:34.620' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'f776c491-10b1-48d4-ad60-e678c111d4cb', N'Test72eg', N'TEST72EG', N'testuser@gmail.com', N'TESTUSER@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAENktxD+2B0OhsxSbm33L8gLqjMLadLtDHhl/HVRaW+nWwUvecYV5r0gKY0h17xPyHQ==', N'NKH5UYZNGQNW2S7BVQ64KRW4F4QXHW6H', N'5c283dc8-2917-4089-907c-932e62970195', NULL, 0, 0, NULL, 0, 0, NULL, N'Test', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-21T03:20:14.200' AS DateTime), CAST(N'2022-10-21T03:20:14.200' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'fa34c98c-63a8-482c-af8b-abc5917c140a', N'user', N'USER', N'user@secureapi.com', N'USER@SECUREAPI.COM', 1, N'AQAAAAEAACcQAAAAEEDQkC2fTV3C/Cp9Q4M2lnsgSMAi34pR8tJkRIEsSv319cgqbGfxE2LBaF3QndM4qQ==', N'BI7ACEEMPDR63ZT7AUTDQ2Y73RF5QXIN', N'7413fab8-95f8-49c4-bde7-18954a2eb6f8', NULL, 1, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-08T22:46:06.873' AS DateTime), CAST(N'2022-10-08T22:46:06.873' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProfilePic], [FullName], [IsDummyData], [IsPasswordSet], [IsActive], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (N'ffe39fe9-ccf5-41c1-91ef-bcc31452921a', N'test57xz', N'TEST57XZ', N'test@gmail.com', N'TEST@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHNsGIs2IVCATJC1mk0xKQE6vbbSGJXH/lcfuPV8Zjet6gfrMX/9WUz1uH3ck7RoYQ==', N'ORYB5BKOVMRO2OCTCLNAESNL4DN7I76P', N'26c26125-90e3-4dc6-8291-10baa5d305db', NULL, 0, 0, NULL, 0, 0, NULL, N'test', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-14T13:28:42.430' AS DateTime), CAST(N'2022-10-14T13:28:42.430' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Invitation] ON 

INSERT [dbo].[Invitation] ([Id], [InvitationId], [CoupleName], [SecondCoupleName], [EventTitle], [EventTime], [Email], [PhoneNumber], [EventDate], [Location], [ExpiryDate], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [UserId], [UserSubscriptionId], [SongId]) VALUES (1, N'7be186ca-af88-46b8-8403-4aac139760e6', N'string', N'string', N'AA', N'05:09', N'ahsansahh@gmail.com', N'string', CAST(N'2022-10-06' AS Date), N'asdasd', CAST(N'2022-10-02T00:00:00.000' AS DateTime), NULL, N'28a19fb5-1abc-4197-a1d6-d62b4070cfd6', CAST(N'2022-10-09T05:05:44.480' AS DateTime), NULL, NULL, N'28a19fb5-1abc-4197-a1d6-d62b4070cfd6', 3, 1)
INSERT [dbo].[Invitation] ([Id], [InvitationId], [CoupleName], [SecondCoupleName], [EventTitle], [EventTime], [Email], [PhoneNumber], [EventDate], [Location], [ExpiryDate], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [UserId], [UserSubscriptionId], [SongId]) VALUES (2, N'4b5331e5-6352-41da-be3c-fb4b23948025', N'string', N'string', N'a', N'05:15', N'a@a.com', N'string', CAST(N'2022-10-04' AS Date), N'asd', CAST(N'2022-10-02T00:00:00.000' AS DateTime), NULL, N'28a19fb5-1abc-4197-a1d6-d62b4070cfd6', CAST(N'2022-10-09T05:12:02.057' AS DateTime), NULL, NULL, N'28a19fb5-1abc-4197-a1d6-d62b4070cfd6', 3, 1)
INSERT [dbo].[Invitation] ([Id], [InvitationId], [CoupleName], [SecondCoupleName], [EventTitle], [EventTime], [Email], [PhoneNumber], [EventDate], [Location], [ExpiryDate], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [UserId], [UserSubscriptionId], [SongId]) VALUES (3, N'9525573e-5e41-43db-b2aa-024779527e6c', N'string', N'string', N'aa', N'07:14', N'aa@a.com', N'string', CAST(N'2022-10-26' AS Date), N'asd', CAST(N'2022-10-02T00:00:00.000' AS DateTime), NULL, N'28a19fb5-1abc-4197-a1d6-d62b4070cfd6', CAST(N'2022-10-09T05:12:53.673' AS DateTime), NULL, NULL, N'28a19fb5-1abc-4197-a1d6-d62b4070cfd6', 3, 1)
INSERT [dbo].[Invitation] ([Id], [InvitationId], [CoupleName], [SecondCoupleName], [EventTitle], [EventTime], [Email], [PhoneNumber], [EventDate], [Location], [ExpiryDate], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [UserId], [UserSubscriptionId], [SongId]) VALUES (4, N'b6993c36-b9a5-49f9-9ee3-d5316de69331', N'string', N'string', N'asd', N'05:18', N'aa@aa.com', N'string', CAST(N'2022-10-19' AS Date), N'adsda', CAST(N'2022-10-02T00:00:00.000' AS DateTime), NULL, N'28a19fb5-1abc-4197-a1d6-d62b4070cfd6', CAST(N'2022-10-09T05:13:12.403' AS DateTime), NULL, NULL, N'28a19fb5-1abc-4197-a1d6-d62b4070cfd6', 3, 1)
INSERT [dbo].[Invitation] ([Id], [InvitationId], [CoupleName], [SecondCoupleName], [EventTitle], [EventTime], [Email], [PhoneNumber], [EventDate], [Location], [ExpiryDate], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [UserId], [UserSubscriptionId], [SongId]) VALUES (5, N'c0c7dbbc-c1e4-4ca2-86db-464f00221672', N'string', N'string', N'aa', N'09:26', N'a@a.com', N'string', CAST(N'2022-10-19' AS Date), N'ad', CAST(N'2022-10-02T00:00:00.000' AS DateTime), NULL, N'28a19fb5-1abc-4197-a1d6-d62b4070cfd6', CAST(N'2022-10-09T05:26:42.157' AS DateTime), NULL, NULL, N'28a19fb5-1abc-4197-a1d6-d62b4070cfd6', 4, 1)
INSERT [dbo].[Invitation] ([Id], [InvitationId], [CoupleName], [SecondCoupleName], [EventTitle], [EventTime], [Email], [PhoneNumber], [EventDate], [Location], [ExpiryDate], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [UserId], [UserSubscriptionId], [SongId]) VALUES (6, N'aee325b5-70b2-41e1-a166-ca4309d4f568', N'string', N'string', N'Test', N'17:27', N'test@abc.com', N'string', CAST(N'2023-03-15' AS Date), N'asdasdasdas', CAST(N'2022-10-02T00:00:00.000' AS DateTime), NULL, N'eec86266-a2bf-4b2d-9012-c890b0d53cf1', CAST(N'2023-03-07T19:26:04.950' AS DateTime), NULL, NULL, N'eec86266-a2bf-4b2d-9012-c890b0d53cf1', 11, 2)
INSERT [dbo].[Invitation] ([Id], [InvitationId], [CoupleName], [SecondCoupleName], [EventTitle], [EventTime], [Email], [PhoneNumber], [EventDate], [Location], [ExpiryDate], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [UserId], [UserSubscriptionId], [SongId]) VALUES (7, N'6bfd9fc8-e45e-43ef-a9f2-d6b8136e4472', N'string', N'string', N'Test', N'17:27', N'test@abc.com', N'string', CAST(N'2023-03-15' AS Date), N'asdasdasdas', CAST(N'2022-10-02T00:00:00.000' AS DateTime), NULL, N'eec86266-a2bf-4b2d-9012-c890b0d53cf1', CAST(N'2023-03-07T19:26:10.257' AS DateTime), NULL, NULL, N'eec86266-a2bf-4b2d-9012-c890b0d53cf1', 11, 2)
INSERT [dbo].[Invitation] ([Id], [InvitationId], [CoupleName], [SecondCoupleName], [EventTitle], [EventTime], [Email], [PhoneNumber], [EventDate], [Location], [ExpiryDate], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [UserId], [UserSubscriptionId], [SongId]) VALUES (8, N'200ba520-c7ec-48f0-bc71-9a91008117f9', N'string', N'string', N'asd', N'19:19', N'asd@ads.com', N'string', CAST(N'2023-03-09' AS Date), N'asd', CAST(N'2022-10-02T00:00:00.000' AS DateTime), NULL, N'eec86266-a2bf-4b2d-9012-c890b0d53cf1', CAST(N'2023-03-07T19:17:44.160' AS DateTime), NULL, NULL, N'eec86266-a2bf-4b2d-9012-c890b0d53cf1', 0, 1)
SET IDENTITY_INSERT [dbo].[Invitation] OFF
GO
SET IDENTITY_INSERT [dbo].[InvitationAttachments] ON 

INSERT [dbo].[InvitationAttachments] ([Id], [InvitationId], [Attachment], [CreatedOn], [Createdby], [UpdatedOn], [UpdatedBy], [IsActive]) VALUES (1, N'7be186ca-af88-46b8-8403-4aac139760e6', N'7f30b500-8499-4220-a000-674dddaf36de.png', CAST(N'2022-10-09T05:05:45.570' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[InvitationAttachments] ([Id], [InvitationId], [Attachment], [CreatedOn], [Createdby], [UpdatedOn], [UpdatedBy], [IsActive]) VALUES (2, N'4b5331e5-6352-41da-be3c-fb4b23948025', N'e1c419f6-510a-4a80-afda-4e962ff5a8ac.png', CAST(N'2022-10-09T05:12:02.670' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[InvitationAttachments] ([Id], [InvitationId], [Attachment], [CreatedOn], [Createdby], [UpdatedOn], [UpdatedBy], [IsActive]) VALUES (3, N'9525573e-5e41-43db-b2aa-024779527e6c', N'b02b0c0f-3c51-4418-b84d-a7aaeac55646.png', CAST(N'2022-10-09T05:12:54.270' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[InvitationAttachments] ([Id], [InvitationId], [Attachment], [CreatedOn], [Createdby], [UpdatedOn], [UpdatedBy], [IsActive]) VALUES (4, N'b6993c36-b9a5-49f9-9ee3-d5316de69331', N'60220f11-f26b-4d84-bad9-bff357415818.png', CAST(N'2022-10-09T05:13:13.017' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[InvitationAttachments] ([Id], [InvitationId], [Attachment], [CreatedOn], [Createdby], [UpdatedOn], [UpdatedBy], [IsActive]) VALUES (5, N'c0c7dbbc-c1e4-4ca2-86db-464f00221672', N'b35ae595-94dc-4613-aa15-2b777ac2d538.png', CAST(N'2022-10-09T05:26:42.767' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[InvitationAttachments] ([Id], [InvitationId], [Attachment], [CreatedOn], [Createdby], [UpdatedOn], [UpdatedBy], [IsActive]) VALUES (6, N'200ba520-c7ec-48f0-bc71-9a91008117f9', N'69b8a89f-1876-4b7b-8532-66423bdd1875.png', CAST(N'2023-03-07T19:17:44.407' AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[InvitationAttachments] OFF
GO
SET IDENTITY_INSERT [dbo].[RefreshToken] ON 

INSERT [dbo].[RefreshToken] ([ApplicationUserId], [Id], [Token], [Expires], [Created], [Revoked]) VALUES (N'15f81d02-2f37-40ca-8b25-edde9f86a9ff', 2, N'B4EL3/FDa+wjyuKVVuUV577Qc3I6mFMEPAgbuwOjoRo=', CAST(N'2022-10-16T15:01:30.7778988' AS DateTime2), CAST(N'2022-10-09T15:01:30.7779337' AS DateTime2), NULL)
INSERT [dbo].[RefreshToken] ([ApplicationUserId], [Id], [Token], [Expires], [Created], [Revoked]) VALUES (N'15f81d02-2f37-40ca-8b25-edde9f86a9ff', 4, N'VWSyll0uLM+Hdi71beUkXVeuJZZmzvNIkUL9yhGA2nU=', CAST(N'2022-10-25T20:54:05.5494051' AS DateTime2), CAST(N'2022-10-18T20:54:05.5494762' AS DateTime2), NULL)
INSERT [dbo].[RefreshToken] ([ApplicationUserId], [Id], [Token], [Expires], [Created], [Revoked]) VALUES (N'15f81d02-2f37-40ca-8b25-edde9f86a9ff', 5, N'bNNP2IbMeAEyQ3s8emjEIsaLz5r2Kii9iYSu2pAZObo=', CAST(N'2022-10-25T20:54:05.5494080' AS DateTime2), CAST(N'2022-10-18T20:54:05.5494794' AS DateTime2), NULL)
INSERT [dbo].[RefreshToken] ([ApplicationUserId], [Id], [Token], [Expires], [Created], [Revoked]) VALUES (N'28a19fb5-1abc-4197-a1d6-d62b4070cfd6', 1, N'jAfP2xDQxmHvFItAqMjGkHVwxrKrtJOg3Oz4ZZWOyj4=', CAST(N'2022-10-15T22:18:44.4990392' AS DateTime2), CAST(N'2022-10-08T22:18:44.4991829' AS DateTime2), NULL)
INSERT [dbo].[RefreshToken] ([ApplicationUserId], [Id], [Token], [Expires], [Created], [Revoked]) VALUES (N'3dfbd047-641d-401d-a49e-c3bb55239494', 3, N'ayoJQnnexGW1zAn9HWcXX+SHOjO3LolKw8SYbDbdX+s=', CAST(N'2022-10-16T16:00:06.2619766' AS DateTime2), CAST(N'2022-10-09T16:00:06.2620160' AS DateTime2), NULL)
INSERT [dbo].[RefreshToken] ([ApplicationUserId], [Id], [Token], [Expires], [Created], [Revoked]) VALUES (N'3dfbd047-641d-401d-a49e-c3bb55239494', 9, N'ezpCjm3bRXsWAmITNz9D0zIyjrMRUELBNEAsx1yka0o=', CAST(N'2022-11-07T20:58:48.1195463' AS DateTime2), CAST(N'2022-10-31T20:58:48.1195840' AS DateTime2), NULL)
INSERT [dbo].[RefreshToken] ([ApplicationUserId], [Id], [Token], [Expires], [Created], [Revoked]) VALUES (N'3dfbd047-641d-401d-a49e-c3bb55239494', 10, N'OGaaIqwLinKaHgtG/UlppvobFIOM6zqv/pooTRHLmSM=', CAST(N'2022-11-07T20:58:48.1195492' AS DateTime2), CAST(N'2022-10-31T20:58:48.1195870' AS DateTime2), NULL)
INSERT [dbo].[RefreshToken] ([ApplicationUserId], [Id], [Token], [Expires], [Created], [Revoked]) VALUES (N'3dfbd047-641d-401d-a49e-c3bb55239494', 11, N'Wx03NBGCKCx9hWEZfSqNpFy4hnZE8xkyKrPHRJuhVMQ=', CAST(N'2022-11-18T13:37:10.2655817' AS DateTime2), CAST(N'2022-11-11T13:37:10.2656137' AS DateTime2), NULL)
INSERT [dbo].[RefreshToken] ([ApplicationUserId], [Id], [Token], [Expires], [Created], [Revoked]) VALUES (N'3dfbd047-641d-401d-a49e-c3bb55239494', 12, N'7rOcMYrG1OKJS8xUq98ghpcsM4e/1ct5IDgIfjAx7qE=', CAST(N'2022-11-18T13:37:10.2655843' AS DateTime2), CAST(N'2022-11-11T13:37:10.2656165' AS DateTime2), NULL)
INSERT [dbo].[RefreshToken] ([ApplicationUserId], [Id], [Token], [Expires], [Created], [Revoked]) VALUES (N'3dfbd047-641d-401d-a49e-c3bb55239494', 13, N'J7XoEX+dXOgvlEGBKGUTbJ2i5C316Qa0f+H0Q5QLimk=', CAST(N'2022-11-29T18:43:46.0319287' AS DateTime2), CAST(N'2022-11-22T18:43:46.0319587' AS DateTime2), NULL)
INSERT [dbo].[RefreshToken] ([ApplicationUserId], [Id], [Token], [Expires], [Created], [Revoked]) VALUES (N'71501874-054d-4c80-acd2-06a4f78853a7', 6, N'9zcf69yPF3K4rnYZRyAMCFd+qSc/jpTl1B01ETH8Q3Q=', CAST(N'2022-10-26T18:57:08.1776603' AS DateTime2), CAST(N'2022-10-19T18:57:08.1776967' AS DateTime2), NULL)
INSERT [dbo].[RefreshToken] ([ApplicationUserId], [Id], [Token], [Expires], [Created], [Revoked]) VALUES (N'eaaeab0b-20fe-4085-98cc-fa5ed26343e3', 7, N'cn+fQtAa+KAef2B+qX98pG5xZHkREHaIyiJKWBVdV1o=', CAST(N'2022-10-26T20:28:59.9057809' AS DateTime2), CAST(N'2022-10-19T20:28:59.9058228' AS DateTime2), NULL)
INSERT [dbo].[RefreshToken] ([ApplicationUserId], [Id], [Token], [Expires], [Created], [Revoked]) VALUES (N'eec86266-a2bf-4b2d-9012-c890b0d53cf1', 14, N'wm7kANjFuJSeUMYgxGPtKDKkXJgEgkN9zg0iJjhnjWY=', CAST(N'2023-03-14T14:24:52.2543436' AS DateTime2), CAST(N'2023-03-07T14:24:52.2543836' AS DateTime2), NULL)
INSERT [dbo].[RefreshToken] ([ApplicationUserId], [Id], [Token], [Expires], [Created], [Revoked]) VALUES (N'f776c491-10b1-48d4-ad60-e678c111d4cb', 8, N'bdvammMJZKIz6jlIX2sHtgW/nq5HreYmrCOCH4FDcIA=', CAST(N'2022-10-27T22:20:33.2960840' AS DateTime2), CAST(N'2022-10-20T22:20:33.2961268' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[RefreshToken] OFF
GO
INSERT [dbo].[RSVP] ([Id], [EventId], [Names], [IsAttending], [NoOfAttendees]) VALUES (N'f5e8d53e-461a-456f-8d8f-33fa9d6d2ed1', N'7be186ca-af88-46b8-8403-4aac139760e6', N'Ahsan Hammad', 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Songs] ON 

INSERT [dbo].[Songs] ([Id], [Name], [Link], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'Song Option 1', N'www.google.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Songs] ([Id], [Name], [Link], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Song Option 2', N'www.google.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Songs] ([Id], [Name], [Link], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, N'Song Option 3', N'www.google.com', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Songs] OFF
GO
SET IDENTITY_INSERT [dbo].[Subscription] ON 

INSERT [dbo].[Subscription] ([Id], [Name], [Count], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'Sub 1', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Subscription] ([Id], [Name], [Count], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Sub 4', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Subscription] ([Id], [Name], [Count], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, N'Sub 16', 16, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Subscription] ([Id], [Name], [Count], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, N'Sub 32', 32, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Subscription] OFF
GO
SET IDENTITY_INSERT [dbo].[UserSubscription] ON 

INSERT [dbo].[UserSubscription] ([Id], [UserId], [SubscriptionId], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [BuyingDate], [ExpiresOn]) VALUES (3, N'28a19fb5-1abc-4197-a1d6-d62b4070cfd6', 2, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-09T04:46:09.307' AS DateTime), CAST(N'2022-11-08T04:46:09.307' AS DateTime))
INSERT [dbo].[UserSubscription] ([Id], [UserId], [SubscriptionId], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [BuyingDate], [ExpiresOn]) VALUES (4, N'28a19fb5-1abc-4197-a1d6-d62b4070cfd6', 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-09T05:20:03.003' AS DateTime), CAST(N'2022-11-08T05:20:03.003' AS DateTime))
INSERT [dbo].[UserSubscription] ([Id], [UserId], [SubscriptionId], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [BuyingDate], [ExpiresOn]) VALUES (5, N'28a19fb5-1abc-4197-a1d6-d62b4070cfd6', 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-09T05:36:15.537' AS DateTime), CAST(N'2022-11-08T05:36:15.537' AS DateTime))
INSERT [dbo].[UserSubscription] ([Id], [UserId], [SubscriptionId], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [BuyingDate], [ExpiresOn]) VALUES (6, N'15f81d02-2f37-40ca-8b25-edde9f86a9ff', 2, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-09T20:04:56.177' AS DateTime), CAST(N'2022-11-08T20:04:56.177' AS DateTime))
INSERT [dbo].[UserSubscription] ([Id], [UserId], [SubscriptionId], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [BuyingDate], [ExpiresOn]) VALUES (7, N'3dfbd047-641d-401d-a49e-c3bb55239494', 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-09T21:01:13.060' AS DateTime), CAST(N'2022-11-08T21:01:13.060' AS DateTime))
INSERT [dbo].[UserSubscription] ([Id], [UserId], [SubscriptionId], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [BuyingDate], [ExpiresOn]) VALUES (8, N'71501874-054d-4c80-acd2-06a4f78853a7', 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-19T23:57:33.000' AS DateTime), CAST(N'2022-11-18T23:57:33.000' AS DateTime))
INSERT [dbo].[UserSubscription] ([Id], [UserId], [SubscriptionId], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [BuyingDate], [ExpiresOn]) VALUES (9, N'eaaeab0b-20fe-4085-98cc-fa5ed26343e3', 4, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-10-20T01:53:32.510' AS DateTime), CAST(N'2022-11-19T01:53:32.510' AS DateTime))
INSERT [dbo].[UserSubscription] ([Id], [UserId], [SubscriptionId], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [BuyingDate], [ExpiresOn]) VALUES (10, N'3dfbd047-641d-401d-a49e-c3bb55239494', 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-11-22T23:46:02.287' AS DateTime), CAST(N'2022-12-22T23:46:02.287' AS DateTime))
INSERT [dbo].[UserSubscription] ([Id], [UserId], [SubscriptionId], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [BuyingDate], [ExpiresOn]) VALUES (11, N'eec86266-a2bf-4b2d-9012-c890b0d53cf1', 4, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07T19:25:07.040' AS DateTime), CAST(N'2023-04-06T19:25:07.040' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserSubscription] OFF
GO
INSERT [HangFire].[Schema] ([Version]) VALUES (7)
GO
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'transviti:11316:ace64d40-9469-44b3-8725-6617cb203bbb', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2023-03-24T17:30:29.8833753Z"}', CAST(N'2023-03-24T19:56:07.707' AS DateTime))
GO
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 3/24/2023 10:56:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 3/24/2023 10:56:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 3/24/2023 10:56:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_ExpireAt] ON [HangFire].[Job]
(
	[ExpireAt] ASC
)
INCLUDE([StateName]) 
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 3/24/2023 10:56:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 3/24/2023 10:56:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 3/24/2023 10:56:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 3/24/2023 10:56:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 3/24/2023 10:56:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
/****** Object:  StoredProcedure [dbo].[AddRSVP]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddRSVP]
( 
@Id nvarchar(MAX),
@EventId nvarchar(450),
@Names nvarchar(MAX),
@NoOfAttendies int,
@IsAttending bit


)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY
    
        INSERT INTO [dbo].RSVP
     VALUES
           (@Id
           ,@EventId
		   ,@Names
		   ,@IsAttending,
		   @NoOfAttendies
		   )


    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;
END


GO
/****** Object:  StoredProcedure [dbo].[Create_Invitation]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Create_Invitation]
( 
@InvitationId nvarchar(450),
@CoupleName nvarchar(max), 
@SecondCoupleName nvarchar(max), 
@EventTitle nvarchar(max),
@EventTime nvarchar(max),
@PhoneNumber nvarchar(max),
@Email nvarchar(max),
@EventDate date,
@Location nvarchar(max), 
@ExpiryDate date, 
@UserId nvarchar(450),
@UserSubscriptionId int,
@SongId int

)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY
    
        INSERT INTO [dbo].[Invitation]
           ([InvitationId]
           ,[CoupleName]
           ,[SecondCoupleName]
           ,[EventTitle]
           ,[EventTime]
           ,[Email]
           ,[PhoneNumber]
           ,[EventDate]
           ,[Location]
           ,[ExpiryDate]
		   ,[UserId]
           ,[CreatedBy]
           ,[CreatedOn]
		   ,[UserSubscriptionId]
		   ,[SongId])
     VALUES
           (@InvitationId
           ,@CoupleName
           ,@SecondCoupleName
           ,@EventTitle
           ,@EventTime
           ,@Email
           ,@PhoneNumber
           ,@EventDate
           ,@Location
           ,@ExpiryDate
		   ,@UserId
           ,@UserId
           ,SYSDATETIME()
		   ,@UserSubscriptionId,
		   @SongId)

 

		  select * from Invitation where Id = SCOPE_IDENTITY()


    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;
END


GO
/****** Object:  StoredProcedure [dbo].[Create_Invitation_Attachment]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Create_Invitation_Attachment]
(
@InvitationId nvarchar(450),
@Attachment nvarchar(max)
)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY
    
        INSERT INTO InvitationAttachments
        (
		[InvitationId],
		[Attachment],
		[CreatedOn]

			 
        )
	    VALUES 
        (
@InvitationId
,@Attachment
,SYSDATETIME()
		)

   select [Attachment] from InvitationAttachments where InvitationId = @InvitationId

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;
END


GO
/****** Object:  StoredProcedure [dbo].[Create_User_Subscription]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Create_User_Subscription]
( 
@SubscriptionId int,
@UserId nvarchar(450),
@BuyingDate datetime,
@ExpiresOn datetime


)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY
    
        INSERT INTO [dbo].UserSubscription
           ([SubscriptionId]
           ,[UserId]
		   ,[BuyingDate]
		   ,[ExpiresOn])
     VALUES
           (@SubscriptionId
           ,@UserId
		   ,@BuyingDate
		   ,@ExpiresOn)

 

		  select * from UserSubscription where Id = SCOPE_IDENTITY()


    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;
END


GO
/****** Object:  StoredProcedure [dbo].[Get_All_Songs]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_All_Songs]

AS
BEGIN
    SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY
    
        select * from Songs


    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;
END


GO
/****** Object:  StoredProcedure [dbo].[Get_Invitation_Attachments]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Get_Invitation_Attachments]
( 
@InvitationId nvarchar(450)

)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY
    
        select * from InvitationAttachments where InvitationId=@InvitationId


    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;
END


GO
/****** Object:  StoredProcedure [dbo].[Get_Invitation_By_Id]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Get_Invitation_By_Id]
( 
@InvitationId nvarchar(450)

)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY
    
        select * from Invitation where InvitationId=@InvitationId


    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;
END


GO
/****** Object:  StoredProcedure [dbo].[Is_Exist_Subscription]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Is_Exist_Subscription]
( 

@UserId nvarchar(450)

)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY
    
        select top(1) UserSubscription.Id as UserSubscriptionId, (select Name from Subscription where Id = UserSubscription.SubscriptionId) as Name,
		(select count(Id) from Invitation where UserSubscriptionId = UserSubscription.Id) as ConsumedCount,
		(select Count from Subscription where Id = UserSubscription.SubscriptionId) as OriginalCount,
		UserSubscription.ExpiresOn
		from UserSubscription
		where UserSubscription.UserId = @UserId
		order by UserSubscription.Id desc
		--SYSDATETIME() BETWEEN UserSubscription.BuyingDate AND UserSubscription.ExpiresOn AND
		--(select count(Id) from Invitation where UserSubscriptionId = UserSubscription.Id) < (select Count from Subscription where Id = UserSubscription.SubscriptionId)
		--AND 

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;
END


GO
/****** Object:  StoredProcedure [dbo].[Refresh_DB]    Script Date: 3/24/2023 10:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Refresh_DB]

AS
BEGIN
    SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY
    
        Delete from AspNetUsers
		Delete from AspNetRoles
		Delete from AspNetUserRoles
		Delete from Invitation
		Delete from InvitationAttachments

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;
END


GO
USE [master]
GO
ALTER DATABASE [informat] SET  READ_WRITE 
GO
