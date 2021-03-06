USE [master]
GO
/****** Object:  Database [UmbracoDemo]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE DATABASE [UmbracoDemo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UmbracoDemo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\UmbracoDemo.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UmbracoDemo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\UmbracoDemo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UmbracoDemo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UmbracoDemo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UmbracoDemo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UmbracoDemo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UmbracoDemo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UmbracoDemo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UmbracoDemo] SET ARITHABORT OFF 
GO
ALTER DATABASE [UmbracoDemo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UmbracoDemo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UmbracoDemo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UmbracoDemo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UmbracoDemo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UmbracoDemo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UmbracoDemo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UmbracoDemo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UmbracoDemo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UmbracoDemo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UmbracoDemo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UmbracoDemo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UmbracoDemo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UmbracoDemo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UmbracoDemo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UmbracoDemo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UmbracoDemo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UmbracoDemo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UmbracoDemo] SET  MULTI_USER 
GO
ALTER DATABASE [UmbracoDemo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UmbracoDemo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UmbracoDemo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UmbracoDemo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UmbracoDemo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UmbracoDemo] SET QUERY_STORE = OFF
GO
USE [UmbracoDemo]
GO
/****** Object:  Table [dbo].[cmsContentNu]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentNu](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[data] [ntext] NOT NULL,
	[rv] [bigint] NOT NULL,
 CONSTRAINT [PK_cmsContentNu] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[published] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentType]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType](
	[pk] [int] IDENTITY(559,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](255) NULL,
	[icon] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NOT NULL,
	[description] [nvarchar](1500) NULL,
	[isContainer] [bit] NOT NULL,
	[isElement] [bit] NOT NULL,
	[allowAtRoot] [bit] NOT NULL,
	[variations] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentType2ContentType]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType2ContentType](
	[parentContentTypeId] [int] NOT NULL,
	[childContentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY CLUSTERED 
(
	[parentContentTypeId] ASC,
	[childContentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentTypeAllowedContentType]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentTypeAllowedContentType](
	[Id] [int] NOT NULL,
	[AllowedId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[AllowedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsDictionary]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDictionary](
	[pk] [int] IDENTITY(2,1) NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[parent] [uniqueidentifier] NULL,
	[key] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_cmsDictionary] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsDocumentType]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocumentType](
	[contentTypeNodeId] [int] NOT NULL,
	[templateNodeId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY CLUSTERED 
(
	[contentTypeNodeId] ASC,
	[templateNodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsLanguageText]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsLanguageText](
	[pk] [int] IDENTITY(2,1) NOT NULL,
	[languageId] [int] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMacro]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacro](
	[id] [int] IDENTITY(2,1) NOT NULL,
	[uniqueId] [uniqueidentifier] NOT NULL,
	[macroUseInEditor] [bit] NOT NULL,
	[macroRefreshRate] [int] NOT NULL,
	[macroAlias] [nvarchar](255) NOT NULL,
	[macroName] [nvarchar](255) NULL,
	[macroCacheByPage] [bit] NOT NULL,
	[macroCachePersonalized] [bit] NOT NULL,
	[macroDontRender] [bit] NOT NULL,
	[macroSource] [nvarchar](255) NOT NULL,
	[macroType] [int] NOT NULL,
 CONSTRAINT [PK_cmsMacro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMacroProperty]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacroProperty](
	[id] [int] IDENTITY(2,1) NOT NULL,
	[uniquePropertyId] [uniqueidentifier] NOT NULL,
	[editorAlias] [nvarchar](255) NOT NULL,
	[macro] [int] NOT NULL,
	[macroPropertySortOrder] [int] NOT NULL,
	[macroPropertyAlias] [nvarchar](50) NOT NULL,
	[macroPropertyName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMember]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember](
	[nodeId] [int] NOT NULL,
	[Email] [nvarchar](1000) NOT NULL,
	[LoginName] [nvarchar](1000) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsMember] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMember2MemberGroup]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember2MemberGroup](
	[Member] [int] NOT NULL,
	[MemberGroup] [int] NOT NULL,
 CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY CLUSTERED 
(
	[Member] ASC,
	[MemberGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMemberType]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMemberType](
	[pk] [int] IDENTITY(2,1) NOT NULL,
	[NodeId] [int] NOT NULL,
	[propertytypeId] [int] NOT NULL,
	[memberCanEdit] [bit] NOT NULL,
	[viewOnProfile] [bit] NOT NULL,
	[isSensitive] [bit] NOT NULL,
 CONSTRAINT [PK_cmsMemberType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsPropertyType]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyType](
	[id] [int] IDENTITY(63,1) NOT NULL,
	[dataTypeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
	[propertyTypeGroupId] [int] NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[sortOrder] [int] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[mandatoryMessage] [nvarchar](500) NULL,
	[validationRegExp] [nvarchar](255) NULL,
	[validationRegExpMessage] [nvarchar](500) NULL,
	[Description] [nvarchar](2000) NULL,
	[variations] [int] NOT NULL,
	[UniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsPropertyTypeGroup]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyTypeGroup](
	[id] [int] IDENTITY(25,1) NOT NULL,
	[contenttypeNodeId] [int] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[sortorder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTagRelationship]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTagRelationship](
	[nodeId] [int] NOT NULL,
	[tagId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[propertyTypeId] ASC,
	[tagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTags]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTags](
	[id] [int] IDENTITY(2,1) NOT NULL,
	[group] [nvarchar](100) NOT NULL,
	[languageId] [int] NULL,
	[tag] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_cmsTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTemplate]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTemplate](
	[pk] [int] IDENTITY(13,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](100) NULL,
 CONSTRAINT [PK_cmsTemplate] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoAccess]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccess](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[loginNodeId] [int] NOT NULL,
	[noAccessNodeId] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccess] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoAccessRule]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccessRule](
	[id] [uniqueidentifier] NOT NULL,
	[accessId] [uniqueidentifier] NOT NULL,
	[ruleValue] [nvarchar](255) NOT NULL,
	[ruleType] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoAudit]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAudit](
	[id] [int] IDENTITY(49,1) NOT NULL,
	[performingUserId] [int] NOT NULL,
	[performingDetails] [nvarchar](1024) NULL,
	[performingIp] [nvarchar](64) NULL,
	[eventDateUtc] [datetime] NOT NULL,
	[affectedUserId] [int] NOT NULL,
	[affectedDetails] [nvarchar](1024) NULL,
	[eventType] [nvarchar](256) NOT NULL,
	[eventDetails] [nvarchar](1024) NULL,
 CONSTRAINT [PK_umbracoAudit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoCacheInstruction]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoCacheInstruction](
	[id] [int] IDENTITY(247,1) NOT NULL,
	[utcStamp] [datetime] NOT NULL,
	[jsonInstruction] [ntext] NOT NULL,
	[originated] [nvarchar](500) NOT NULL,
	[instructionCount] [int] NOT NULL,
 CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoConsent]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoConsent](
	[id] [int] IDENTITY(2,1) NOT NULL,
	[current] [bit] NOT NULL,
	[source] [nvarchar](512) NOT NULL,
	[context] [nvarchar](128) NOT NULL,
	[action] [nvarchar](512) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[state] [int] NOT NULL,
	[comment] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoConsent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContent]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContent](
	[nodeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_umbracoContent] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContentSchedule]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContentSchedule](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[languageId] [int] NULL,
	[date] [datetime] NOT NULL,
	[action] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoContentSchedule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContentVersion]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContentVersion](
	[id] [int] IDENTITY(46,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[versionDate] [datetime] NOT NULL,
	[userId] [int] NULL,
	[current] [bit] NOT NULL,
	[text] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoContentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContentVersionCultureVariation]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContentVersionCultureVariation](
	[id] [int] IDENTITY(72,1) NOT NULL,
	[versionId] [int] NOT NULL,
	[languageId] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[date] [datetime] NOT NULL,
	[availableUserId] [int] NULL,
 CONSTRAINT [PK_umbracoContentVersionCultureVariation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDataType]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDataType](
	[nodeId] [int] NOT NULL,
	[propertyEditorAlias] [nvarchar](255) NOT NULL,
	[dbType] [nvarchar](50) NOT NULL,
	[config] [ntext] NULL,
 CONSTRAINT [PK_umbracoDataType] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDocument]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDocument](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[edited] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoDocument] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDocumentCultureVariation]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDocumentCultureVariation](
	[id] [int] IDENTITY(51,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[languageId] [int] NOT NULL,
	[edited] [bit] NOT NULL,
	[available] [bit] NOT NULL,
	[published] [bit] NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoDocumentCultureVariation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDocumentVersion]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDocumentVersion](
	[id] [int] NOT NULL,
	[templateId] [int] NULL,
	[published] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoDocumentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDomain]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDomain](
	[id] [int] IDENTITY(2,1) NOT NULL,
	[domainDefaultLanguage] [int] NULL,
	[domainRootStructureID] [int] NULL,
	[domainName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoDomain] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoExternalLogin]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoExternalLogin](
	[id] [int] IDENTITY(2,1) NOT NULL,
	[userId] [int] NOT NULL,
	[loginProvider] [nvarchar](4000) NOT NULL,
	[providerKey] [nvarchar](4000) NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoKeyValue]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoKeyValue](
	[key] [nvarchar](256) NOT NULL,
	[value] [nvarchar](255) NULL,
	[updated] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoKeyValue] PRIMARY KEY CLUSTERED 
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoLanguage]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLanguage](
	[id] [int] IDENTITY(3,1) NOT NULL,
	[languageISOCode] [nvarchar](14) NULL,
	[languageCultureName] [nvarchar](100) NULL,
	[isDefaultVariantLang] [bit] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[fallbackLanguageId] [int] NULL,
 CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoLock]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLock](
	[id] [int] NOT NULL,
	[value] [int] NOT NULL,
	[name] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_umbracoLock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoLog]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLog](
	[id] [int] IDENTITY(255,1) NOT NULL,
	[userId] [int] NULL,
	[NodeId] [int] NOT NULL,
	[entityType] [nvarchar](50) NULL,
	[Datestamp] [datetime] NOT NULL,
	[logHeader] [nvarchar](50) NOT NULL,
	[logComment] [nvarchar](4000) NULL,
	[parameters] [nvarchar](500) NULL,
 CONSTRAINT [PK_umbracoLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoMediaVersion]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoMediaVersion](
	[id] [int] NOT NULL,
	[path] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoMediaVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoNode]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoNode](
	[id] [int] IDENTITY(1108,1) NOT NULL,
	[uniqueId] [uniqueidentifier] NOT NULL,
	[parentId] [int] NOT NULL,
	[level] [int] NOT NULL,
	[path] [nvarchar](150) NOT NULL,
	[sortOrder] [int] NOT NULL,
	[trashed] [bit] NOT NULL,
	[nodeUser] [int] NULL,
	[text] [nvarchar](255) NULL,
	[nodeObjectType] [uniqueidentifier] NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoNode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoPropertyData]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoPropertyData](
	[id] [int] IDENTITY(356,1) NOT NULL,
	[versionId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
	[languageId] [int] NULL,
	[segment] [nvarchar](256) NULL,
	[intValue] [int] NULL,
	[decimalValue] [numeric](38, 6) NULL,
	[dateValue] [datetime] NULL,
	[varcharValue] [nvarchar](512) NULL,
	[textValue] [ntext] NULL,
 CONSTRAINT [PK_umbracoPropertyData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRedirectUrl]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRedirectUrl](
	[id] [uniqueidentifier] NOT NULL,
	[contentKey] [uniqueidentifier] NOT NULL,
	[createDateUtc] [datetime] NOT NULL,
	[url] [nvarchar](255) NOT NULL,
	[culture] [nvarchar](255) NULL,
	[urlHash] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_umbracoRedirectUrl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRelation]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelation](
	[id] [int] IDENTITY(15,1) NOT NULL,
	[parentId] [int] NOT NULL,
	[childId] [int] NOT NULL,
	[relType] [int] NOT NULL,
	[datetime] [datetime] NOT NULL,
	[comment] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_umbracoRelation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRelationType]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelationType](
	[id] [int] IDENTITY(6,1) NOT NULL,
	[typeUniqueId] [uniqueidentifier] NOT NULL,
	[dual] [bit] NOT NULL,
	[parentObjectType] [uniqueidentifier] NULL,
	[childObjectType] [uniqueidentifier] NULL,
	[name] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoServer]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoServer](
	[id] [int] IDENTITY(2,1) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[computerName] [nvarchar](255) NOT NULL,
	[registeredDate] [datetime] NOT NULL,
	[lastNotifiedDate] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
	[isMaster] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoServer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser](
	[id] [int] IDENTITY(2,1) NOT NULL,
	[userDisabled] [bit] NOT NULL,
	[userNoConsole] [bit] NOT NULL,
	[userName] [nvarchar](255) NOT NULL,
	[userLogin] [nvarchar](125) NOT NULL,
	[userPassword] [nvarchar](500) NOT NULL,
	[passwordConfig] [nvarchar](500) NULL,
	[userEmail] [nvarchar](255) NOT NULL,
	[userLanguage] [nvarchar](10) NULL,
	[securityStampToken] [nvarchar](255) NULL,
	[failedLoginAttempts] [int] NULL,
	[lastLockoutDate] [datetime] NULL,
	[lastPasswordChangeDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
	[emailConfirmedDate] [datetime] NULL,
	[invitedDate] [datetime] NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[avatar] [nvarchar](500) NULL,
	[tourData] [ntext] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser2NodeNotify]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodeNotify](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[action] [nchar](1) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[action] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser2UserGroup]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2UserGroup](
	[userId] [int] NOT NULL,
	[userGroupId] [int] NOT NULL,
 CONSTRAINT [PK_user2userGroup] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[userGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserGroup]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup](
	[id] [int] IDENTITY(6,1) NOT NULL,
	[userGroupAlias] [nvarchar](200) NOT NULL,
	[userGroupName] [nvarchar](200) NOT NULL,
	[userGroupDefaultPermissions] [nvarchar](50) NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[icon] [nvarchar](255) NULL,
	[startContentId] [int] NULL,
	[startMediaId] [int] NULL,
 CONSTRAINT [PK_umbracoUserGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserGroup2App]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup2App](
	[userGroupId] [int] NOT NULL,
	[app] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_userGroup2App] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[app] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserGroup2NodePermission]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup2NodePermission](
	[userGroupId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[permission] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoUserGroup2NodePermission] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[nodeId] ASC,
	[permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserLogin]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserLogin](
	[sessionId] [uniqueidentifier] NOT NULL,
	[userId] [int] NOT NULL,
	[loggedInUtc] [datetime] NOT NULL,
	[lastValidatedUtc] [datetime] NOT NULL,
	[loggedOutUtc] [datetime] NULL,
	[ipAddress] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoUserLogin] PRIMARY KEY CLUSTERED 
(
	[sessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserStartNode]    Script Date: 4/27/2020 12:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserStartNode](
	[id] [int] IDENTITY(2,1) NOT NULL,
	[userId] [int] NOT NULL,
	[startNode] [int] NOT NULL,
	[startNodeType] [int] NOT NULL,
 CONSTRAINT [PK_userStartNode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1064, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\r\n  \"src\": \"/media/x1qhmfb1/mikhail-vasilyev-nodtncsldte-unsplash.jpg\",\r\n  \"focalPoint\": {\r\n    \"left\": 0.503604226325664,\r\n    \"top\": 0.54355898405033609\r\n  },\r\n  \"crops\": [\r\n    {\r\n      \"alias\": \"PageHeader.Large\",\r\n      \"width\": 1903,\r\n      \"height\": 532,\r\n      \"coordinates\": {\r\n        \"x1\": 0.0028123314718165177,\r\n        \"y1\": 0.24937093040050046,\r\n        \"x2\": 0,\r\n        \"y2\": 0.3020417965604642\r\n      }\r\n    },\r\n    {\r\n      \"alias\": \"PageHeader.Tiny\",\r\n      \"width\": 190,\r\n      \"height\": 53,\r\n      \"coordinates\": {\r\n        \"x1\": 0,\r\n        \"y1\": 0.24404950809266898,\r\n        \"x2\": 0,\r\n        \"y2\": 0.30959929178706846\r\n      }\r\n    }\r\n  ]\r\n}"}],"umbracoWidth":[{"culture":"","seg":"","val":5042}],"umbracoHeight":[{"culture":"","seg":"","val":3151}],"umbracoBytes":[{"culture":"","seg":"","val":"2697261"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"cat"}', 4)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1066, 0, N'{"properties":{"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[]}]}"}],"title":[{"culture":"","seg":"","val":"This is the title"}],"subtitle":[{"culture":"","seg":"","val":"This is the subtitle"}],"mainImage":[{"culture":"","seg":"","val":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96"}],"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}],"socialLinks":[{"culture":"","seg":"","val":"[{\"key\":\"25dbd8bb-b77b-4850-b9d4-6013d7ebd8c6\",\"name\":\"fab fa-twitter\",\"ncContentTypeAlias\":\"iconLinkItem\",\"iconClass\":\"fab fa-twitter\",\"link\":\"[{\\\"name\\\":\\\"https://twitter.com/explore\\\",\\\"target\\\":\\\"_blank\\\",\\\"url\\\":\\\"https://twitter.com/explore\\\"}]\"},{\"key\":\"f7c0f6e5-085b-4e7d-ab40-5884b3b573a3\",\"name\":\"fas fa-share-alt\",\"ncContentTypeAlias\":\"iconLinkItem\",\"iconClass\":\"fas fa-share-alt\",\"link\":\"[{\\\"name\\\":\\\"Share\\\",\\\"url\\\":\\\"/\\\"}]\"}]"}],"copyRight":[{"culture":"","seg":"","val":"asda"}]},"cultureData":{},"urlSegment":"home"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1066, 1, N'{"properties":{"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[]}]}"}],"title":[{"culture":"","seg":"","val":"This is the title"}],"subtitle":[{"culture":"","seg":"","val":"This is the subtitle"}],"mainImage":[{"culture":"","seg":"","val":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96"}],"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}],"socialLinks":[{"culture":"","seg":"","val":"[{\"key\":\"25dbd8bb-b77b-4850-b9d4-6013d7ebd8c6\",\"name\":\"fab fa-twitter\",\"ncContentTypeAlias\":\"iconLinkItem\",\"iconClass\":\"fab fa-twitter\",\"link\":\"[{\\\"name\\\":\\\"https://twitter.com/explore\\\",\\\"target\\\":\\\"_blank\\\",\\\"url\\\":\\\"https://twitter.com/explore\\\"}]\"},{\"key\":\"f7c0f6e5-085b-4e7d-ab40-5884b3b573a3\",\"name\":\"fas fa-share-alt\",\"ncContentTypeAlias\":\"iconLinkItem\",\"iconClass\":\"fas fa-share-alt\",\"link\":\"[{\\\"name\\\":\\\"Share\\\",\\\"url\\\":\\\"/\\\"}]\"}]"}],"copyRight":[{"culture":"","seg":"","val":"asda"}]},"cultureData":{},"urlSegment":"home"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1093, 0, N'{"properties":{"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}],"mainImage":[{"culture":"","seg":"","val":"umb://media/6dffb914df594ec7b7e33039dd42e25c"}],"title":[{"culture":"","seg":"","val":"About Us"}],"subtitle":[],"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Full\",\"id\":\"cc6750e3-976a-fc03-b701-b7ed16bf070d\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":\"<p>This is the full about content</p>\",\"editor\":{\"alias\":\"rte\",\"view\":null},\"styles\":null,\"config\":null},{\"value\":{\"id\":1064,\"udi\":\"umb://media/1466e1b8a73b4cf2a1e9177fce387b96\",\"image\":\"/media/x1qhmfb1/mikhail-vasilyev-nodtncsldte-unsplash.jpg\"},\"editor\":{\"alias\":\"media\",\"view\":null},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"about"}', 11)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1093, 1, N'{"properties":{"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}],"mainImage":[{"culture":"","seg":"","val":"umb://media/6dffb914df594ec7b7e33039dd42e25c"}],"title":[{"culture":"","seg":"","val":"About Us"}],"subtitle":[],"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Full\",\"id\":\"cc6750e3-976a-fc03-b701-b7ed16bf070d\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":\"<p>This is the full about content</p>\",\"editor\":{\"alias\":\"rte\",\"view\":\"rte\"},\"styles\":null,\"config\":null},{\"value\":{\"id\":1064,\"udi\":\"umb://media/1466e1b8a73b4cf2a1e9177fce387b96\",\"image\":\"/media/x1qhmfb1/mikhail-vasilyev-nodtncsldte-unsplash.jpg\"},\"editor\":{\"alias\":\"media\",\"view\":\"media\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"about"}', 6)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1094, 0, N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}],"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[]}]}"}],"title":[{"culture":"","seg":"","val":"Test blog"}],"subtitle":[{"culture":"","seg":"","val":"asdasdasdasd"}],"mainImage":[{"culture":"","seg":"","val":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96"}],"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}]},"cultureData":{},"urlSegment":"blog"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1094, 1, N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}],"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[]}]}"}],"title":[{"culture":"","seg":"","val":"Test blog"}],"subtitle":[{"culture":"","seg":"","val":"asdasdasdasd"}],"mainImage":[{"culture":"","seg":"","val":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96"}],"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}]},"cultureData":{},"urlSegment":"blog"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1095, 0, N'{"properties":{"successMessage":[{"culture":"","seg":"","val":"<p>Message sent</p>"}],"errorMessage":[{"culture":"","seg":"","val":"<p>There was an error sending your message</p>"}],"mainImage":[{"culture":"","seg":"","val":"umb://media/0a9a167b4ad048c5924213bb2c6ddf02"}]},"cultureData":{},"urlSegment":"contact"}', 2)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1095, 1, N'{"properties":{"successMessage":[{"culture":"","seg":"","val":"<p>Message sent</p>"}],"errorMessage":[{"culture":"","seg":"","val":"<p>There was an error sending your message</p>"}],"mainImage":[{"culture":"","seg":"","val":"umb://media/0a9a167b4ad048c5924213bb2c6ddf02"}]},"cultureData":{},"urlSegment":"contact"}', 2)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1096, 0, N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":1}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"xml-sitemap"}', 2)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1096, 1, N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":1}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"xml-sitemap"}', 2)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1097, 0, N'{"properties":{"mainImage":[{"culture":"","seg":"","val":"umb://media/6704f379f9bd4e60a31423212c57c8ec"}]},"cultureData":{},"urlSegment":"search"}', 2)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1097, 1, N'{"properties":{"mainImage":[{"culture":"","seg":"","val":"umb://media/6704f379f9bd4e60a31423212c57c8ec"}]},"cultureData":{},"urlSegment":"search"}', 2)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1098, 0, N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}],"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[]}]}"}],"articleDate":[{"culture":"","seg":"","val":"2020-04-21T12:00:00"}],"authorName":[{"culture":"","seg":"","val":"Tung"}],"title":[{"culture":"","seg":"","val":"Test"}],"subtitle":[{"culture":"","seg":"","val":"Blah bLah"}],"mainImage":[{"culture":"","seg":"","val":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96"}],"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}]},"cultureData":{},"urlSegment":"test-article"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1098, 1, N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}],"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[]}]}"}],"articleDate":[{"culture":"","seg":"","val":"2020-04-21T12:00:00"}],"authorName":[{"culture":"","seg":"","val":"Tung"}],"title":[{"culture":"","seg":"","val":"Test"}],"subtitle":[{"culture":"","seg":"","val":"Blah bLah"}],"mainImage":[{"culture":"","seg":"","val":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96"}],"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}]},"cultureData":{},"urlSegment":"test-article"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1106, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/lrrduolu/gif-image-1024-768-pixels.gif\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1024}],"umbracoHeight":[{"culture":"","seg":"","val":768}],"umbracoBytes":[{"culture":"","seg":"","val":"149996"}],"umbracoExtension":[{"culture":"","seg":"","val":"gif"}]},"cultureData":{},"urlSegment":"gif-image-1024-768-pixels"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1107, 0, N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":1}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}],"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[]}]}"}],"title":[{"culture":"","seg":"","val":"Page Not Found"}],"subtitle":[],"mainImage":[{"culture":"","seg":"","val":"umb://media/392a635ad2744d4c9ba0a09e653b203f"}],"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}]},"cultureData":{},"urlSegment":"error"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1107, 1, N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":1}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}],"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[]}]}"}],"title":[{"culture":"","seg":"","val":"Page Not Found"}],"subtitle":[],"mainImage":[{"culture":"","seg":"","val":"umb://media/392a635ad2744d4c9ba0a09e653b203f"}],"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}]},"cultureData":{},"urlSegment":"error"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1108, 0, N'{"properties":{"articleDate":[{"culture":"","seg":"","val":"2020-04-23T12:00:00"}],"authorName":[{"culture":"","seg":"","val":"Author"}],"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}],"mainImage":[{"culture":"","seg":"","val":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96"}],"title":[{"culture":"","seg":"","val":"Title "}],"subtitle":[{"culture":"","seg":"","val":"Subtitle"}],"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Full\",\"id\":\"c96965bf-032b-8c9a-51b9-966d85fe7950\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":\"Blah blah Blah Blah Blah Blah\",\"editor\":{\"alias\":\"quote\",\"view\":\"textstring\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"my-article-test-no-1"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1108, 1, N'{"properties":{"articleDate":[{"culture":"","seg":"","val":"2020-04-23T12:00:00"}],"authorName":[{"culture":"","seg":"","val":"Author"}],"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}],"mainImage":[{"culture":"","seg":"","val":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96"}],"title":[{"culture":"","seg":"","val":"Title "}],"subtitle":[{"culture":"","seg":"","val":"Subtitle"}],"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Full\",\"id\":\"c96965bf-032b-8c9a-51b9-966d85fe7950\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":\"Blah blah Blah Blah Blah Blah\",\"editor\":{\"alias\":\"quote\",\"view\":\"textstring\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"my-article-test-no-1"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1109, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\r\n  \"src\": \"/media/puljucwq/contact-bg.jpg\",\r\n  \"focalPoint\": {\r\n    \"left\": 0.5,\r\n    \"top\": 0.5\r\n  },\r\n  \"crops\": [\r\n    {\r\n      \"alias\": \"PageHeader.Large\",\r\n      \"width\": 1903,\r\n      \"height\": 532,\r\n      \"coordinates\": {\r\n        \"x1\": 0,\r\n        \"y1\": 0.14662808032973779,\r\n        \"x2\": 0,\r\n        \"y2\": 0.43414435516757227\r\n      }\r\n    },\r\n    {\r\n      \"alias\": \"PageHeader.Tiny\",\r\n      \"width\": 190,\r\n      \"height\": 53,\r\n      \"coordinates\": {\r\n        \"x1\": 0,\r\n        \"y1\": 0.11049723756906077,\r\n        \"x2\": 0,\r\n        \"y2\": 0.47119179163378061\r\n      }\r\n    }\r\n  ]\r\n}"}],"umbracoWidth":[{"culture":"","seg":"","val":1900}],"umbracoHeight":[{"culture":"","seg":"","val":1267}],"umbracoBytes":[{"culture":"","seg":"","val":"500680"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"contact-bg"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1110, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/p5zbiz33/matthew-waring-mds647i6-zm-unsplash.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":4000}],"umbracoHeight":[{"culture":"","seg":"","val":6000}],"umbracoBytes":[{"culture":"","seg":"","val":"2100721"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"matthew-waring-mds647i6-zm-unsplash"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1111, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\r\n  \"src\": \"/media/ck2p41kz/ian-schneider-tammbr4okv4-unsplash.jpg\",\r\n  \"focalPoint\": {\r\n    \"left\": 0.5,\r\n    \"top\": 0.5\r\n  },\r\n  \"crops\": [\r\n    {\r\n      \"alias\": \"PageHeader.Large\",\r\n      \"width\": 1903,\r\n      \"height\": 532,\r\n      \"coordinates\": {\r\n        \"x1\": 0,\r\n        \"y1\": 0.44156706507304117,\r\n        \"x2\": 0.0026595744680850812,\r\n        \"y2\": 0.14076571625566389\r\n      }\r\n    },\r\n    {\r\n      \"alias\": \"PageHeader.Tiny\",\r\n      \"width\": 190,\r\n      \"height\": 53,\r\n      \"coordinates\": {\r\n        \"x1\": 0,\r\n        \"y1\": 0.41786538058293138,\r\n        \"x2\": 0,\r\n        \"y2\": 0.16426923883413722\r\n      }\r\n    }\r\n  ]\r\n}"}],"umbracoWidth":[{"culture":"","seg":"","val":6016}],"umbracoHeight":[{"culture":"","seg":"","val":4016}],"umbracoBytes":[{"culture":"","seg":"","val":"6364894"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"ian-schneider-tammbr4okv4-unsplash"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1113, 0, N'{"properties":{"articleDate":[{"culture":"","seg":"","val":"2020-04-27T12:00:00"}],"authorName":[{"culture":"","seg":"","val":"Tung"}],"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}],"mainImage":[{"culture":"","seg":"","val":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96"}],"title":[{"culture":"","seg":"","val":"Blah blah 12345"}],"subtitle":[{"culture":"","seg":"","val":"Blah bLah"}],"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Full\",\"id\":\"3bd53e8c-f7d5-7a3e-3197-9c3fcac42102\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":\"<p>The quick brown fox jumps over the lazy dog</p>\",\"editor\":{\"alias\":\"rte\",\"view\":null},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"test-article-2"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1113, 1, N'{"properties":{"articleDate":[{"culture":"","seg":"","val":"2020-04-27T12:00:00"}],"authorName":[{"culture":"","seg":"","val":"Tung"}],"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}],"mainImage":[{"culture":"","seg":"","val":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96"}],"title":[{"culture":"","seg":"","val":"Blah blah 12345"}],"subtitle":[{"culture":"","seg":"","val":"Blah bLah"}],"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Full\",\"id\":\"3bd53e8c-f7d5-7a3e-3197-9c3fcac42102\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":\"<p>The quick brown fox jumps over the lazy dog</p>\",\"editor\":{\"alias\":\"rte\",\"view\":\"rte\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"test-article-2"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1117, 0, N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}],"link":[{"culture":"","seg":"","val":"[{\"name\":\"#\",\"url\":\"#\"}]"}],"isTemporaryRedirect":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"links"}', 3)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1117, 1, N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}],"link":[{"culture":"","seg":"","val":"[{\"name\":\"#\",\"url\":\"#\"}]"}],"isTemporaryRedirect":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"links"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1118, 0, N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}],"link":[{"culture":"","seg":"","val":"[{\"name\":\"Home Page\",\"url\":\"/\"}]"}],"isTemporaryRedirect":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"home-page"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1118, 1, N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}],"link":[{"culture":"","seg":"","val":"[{\"name\":\"Home Page\",\"url\":\"/\"}]"}],"isTemporaryRedirect":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"home-page"}', 0)
GO
SET IDENTITY_INSERT [dbo].[cmsContentType] ON 

INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (531, 1044, N'Member', N'icon-user', N'icon-user', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (532, 1031, N'Folder', N'icon-folder', N'icon-folder', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (533, 1032, N'Image', N'icon-picture', N'icon-picture', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (534, 1033, N'File', N'icon-document', N'icon-document', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (535, 1052, N'home', N'icon-home color-light-blue', N'folder.png', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (538, 1068, N'article', N'icon-article color-blue', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (539, 1069, N'articleList', N'icon-thumbnail-list color-blue', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (540, 1070, N'contact', N'icon-user color-blue', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (541, 1071, N'content', N'icon-umb-content color-blue', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (543, 1073, N'error', N'icon-application-error color-blue', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (544, 1074, N'search', N'icon-search color-blue', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (546, 1076, N'xMLSitemap', N'icon-sitemap color-blue', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (549, 1080, N'visibilityControls1', N'icon-defrag color-pink', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (551, 1082, N'contentControls', N'icon-defrag color-pink', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (552, 1083, N'articleControls', N'icon-defrag color-pink', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (553, 1084, N'headerControls', N'icon-defrag color-pink', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (554, 1085, N'mainPageControls', N'icon-defrag color-pink', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (555, 1086, N'sEAOControls', N'icon-defrag color-pink', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (556, 1087, N'contactFormControls', N'icon-defrag color-pink', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (557, 1088, N'footerControls', N'icon-defrag color-pink', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (558, 1091, N'iconLinkItem', N'icon-link color-light-blue', N'folder.png', NULL, 0, 1, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (559, 1114, N'redirectControls', N'icon-defrag color-pink', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (560, 1116, N'redirect', N'icon-redo color-blue', N'folder.png', NULL, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[cmsContentType] OFF
GO
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1080, 1068)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1080, 1069)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1080, 1071)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1080, 1073)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1080, 1076)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1080, 1116)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1082, 1052)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1082, 1068)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1082, 1069)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1082, 1071)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1082, 1073)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1083, 1068)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1084, 1052)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1084, 1068)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1084, 1069)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1084, 1071)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1084, 1073)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1085, 1052)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1085, 1068)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1085, 1069)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1085, 1071)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1085, 1073)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1086, 1052)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1086, 1068)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1086, 1069)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1086, 1071)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1086, 1073)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1087, 1070)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1088, 1052)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1114, 1116)
GO
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1031, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1032, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1033, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1052, 1069, 2)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1052, 1070, 1)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1052, 1071, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1052, 1073, 3)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1052, 1074, 4)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1052, 1076, 5)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1052, 1116, 6)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1069, 1068, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1116, 1116, 0)
GO
SET IDENTITY_INSERT [dbo].[cmsDictionary] ON 

INSERT [dbo].[cmsDictionary] ([pk], [id], [parent], [key]) VALUES (2, N'ab4d04ca-afbd-4ca5-b0fa-5e06ee471771', NULL, N'Blog.ViewAll')
INSERT [dbo].[cmsDictionary] ([pk], [id], [parent], [key]) VALUES (3, N'faa54f95-f6b7-4354-931a-84aeed1d7c10', NULL, N'Blog.Next')
INSERT [dbo].[cmsDictionary] ([pk], [id], [parent], [key]) VALUES (4, N'e180c3f3-739f-4930-833f-a622c4c363cd', NULL, N'Blog.Prev')
INSERT [dbo].[cmsDictionary] ([pk], [id], [parent], [key]) VALUES (5, N'e078820f-eaae-4738-8ad2-c36de2760f86', NULL, N'Search.Placeholder')
INSERT [dbo].[cmsDictionary] ([pk], [id], [parent], [key]) VALUES (6, N'8cbd0690-da46-4986-b00d-469096f14caa', NULL, N'Search.Buttontext')
INSERT [dbo].[cmsDictionary] ([pk], [id], [parent], [key]) VALUES (7, N'7a491bcf-692c-4526-98ed-661d682592b6', NULL, N'Search.ResultsText')
INSERT [dbo].[cmsDictionary] ([pk], [id], [parent], [key]) VALUES (8, N'1a466141-6d00-4c18-aab5-970e2d85bb00', NULL, N'Contact.Name')
INSERT [dbo].[cmsDictionary] ([pk], [id], [parent], [key]) VALUES (9, N'7a0e0636-25e5-427e-bcd5-518301370ac8', NULL, N'Contact.Email')
INSERT [dbo].[cmsDictionary] ([pk], [id], [parent], [key]) VALUES (10, N'09b6880c-cbeb-4d6a-9506-f6c170f85bfd', NULL, N'Contact.Message')
INSERT [dbo].[cmsDictionary] ([pk], [id], [parent], [key]) VALUES (11, N'13725cc7-4471-4db1-a348-a722f2a225e9', NULL, N'Contact.Send')
INSERT [dbo].[cmsDictionary] ([pk], [id], [parent], [key]) VALUES (12, N'6bb11c04-26ea-47c0-bf0a-d132f6d111c4', NULL, N'Site.Name')
SET IDENTITY_INSERT [dbo].[cmsDictionary] OFF
GO
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1052, 1060, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1068, 1100, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1069, 1099, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1070, 1103, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1071, 1101, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1073, 1105, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1074, 1102, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1076, 1104, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1116, 1115, 1)
GO
SET IDENTITY_INSERT [dbo].[cmsLanguageText] ON 

INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (2, 1, N'ab4d04ca-afbd-4ca5-b0fa-5e06ee471771', N'View All')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (3, 3, N'ab4d04ca-afbd-4ca5-b0fa-5e06ee471771', N'Xem Tất Cả')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (4, 1, N'faa54f95-f6b7-4354-931a-84aeed1d7c10', N'Next')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (5, 3, N'faa54f95-f6b7-4354-931a-84aeed1d7c10', N'Trang Sau')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (6, 1, N'e180c3f3-739f-4930-833f-a622c4c363cd', N'Previous')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (7, 3, N'e180c3f3-739f-4930-833f-a622c4c363cd', N'Trang Trước')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (8, 1, N'e078820f-eaae-4738-8ad2-c36de2760f86', N'Type your search here...')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (9, 3, N'e078820f-eaae-4738-8ad2-c36de2760f86', N'Nhập nội dung bạn cần tìm kiếm...')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (10, 1, N'8cbd0690-da46-4986-b00d-469096f14caa', N'Search')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (11, 3, N'8cbd0690-da46-4986-b00d-469096f14caa', N'Tìm')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (12, 1, N'7a491bcf-692c-4526-98ed-661d682592b6', N'Your search for "<strong>{0}</strong>" returned <strong>{1}</strong> result{2}')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (13, 3, N'7a491bcf-692c-4526-98ed-661d682592b6', N'Kết quả tìm kiếm cho "<strong>{0}</strong>" tìm thấy <strong>{1}</strong> kết quả')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (14, 1, N'1a466141-6d00-4c18-aab5-970e2d85bb00', N'Name...')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (15, 3, N'1a466141-6d00-4c18-aab5-970e2d85bb00', N'Tên của bạn...')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (16, 1, N'7a0e0636-25e5-427e-bcd5-518301370ac8', N'Email...')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (17, 3, N'7a0e0636-25e5-427e-bcd5-518301370ac8', N'Nhập Email của bạn...')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (18, 1, N'09b6880c-cbeb-4d6a-9506-f6c170f85bfd', N'Your Message...')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (19, 3, N'09b6880c-cbeb-4d6a-9506-f6c170f85bfd', N'Nhập nội dung bạn cần gửi đến chúng tôi...')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (20, 1, N'13725cc7-4471-4db1-a348-a722f2a225e9', N'Send')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (21, 3, N'13725cc7-4471-4db1-a348-a722f2a225e9', N'Gửi')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (22, 1, N'6bb11c04-26ea-47c0-bf0a-d132f6d111c4', N'My Blog')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (23, 3, N'6bb11c04-26ea-47c0-bf0a-d132f6d111c4', N'My Blog')
SET IDENTITY_INSERT [dbo].[cmsLanguageText] OFF
GO
SET IDENTITY_INSERT [dbo].[cmsPropertyType] ON 

INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (6, 1043, 1032, 3, N'umbracoFile', N'Upload image', 0, 1, NULL, NULL, NULL, NULL, 0, N'00000006-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (7, -91, 1032, 3, N'umbracoWidth', N'Width', 0, 0, NULL, NULL, NULL, N'in pixels', 0, N'00000007-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (8, -91, 1032, 3, N'umbracoHeight', N'Height', 0, 0, NULL, NULL, NULL, N'in pixels', 0, N'00000008-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (9, -93, 1032, 3, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, NULL, N'in bytes', 0, N'00000009-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (10, -92, 1032, 3, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, NULL, NULL, 0, N'0000000a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (24, -90, 1033, 4, N'umbracoFile', N'Upload file', 0, 1, NULL, NULL, NULL, NULL, 0, N'00000018-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (25, -92, 1033, 4, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, NULL, NULL, 0, N'00000019-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (26, -93, 1033, 4, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, NULL, N'in bytes', 0, N'0000001a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (28, -89, 1044, 11, N'umbracoMemberComments', N'Comments', 0, 0, NULL, NULL, NULL, NULL, 0, N'0000001c-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (29, -91, 1044, 11, N'umbracoMemberFailedPasswordAttempts', N'Failed Password Attempts', 1, 0, NULL, NULL, NULL, NULL, 0, N'0000001d-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (30, -49, 1044, 11, N'umbracoMemberApproved', N'Is Approved', 2, 0, NULL, NULL, NULL, NULL, 0, N'0000001e-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (31, -49, 1044, 11, N'umbracoMemberLockedOut', N'Is Locked Out', 3, 0, NULL, NULL, NULL, NULL, 0, N'0000001f-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (32, -94, 1044, 11, N'umbracoMemberLastLockoutDate', N'Last Lockout Date', 4, 0, NULL, NULL, NULL, NULL, 0, N'00000020-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (33, -94, 1044, 11, N'umbracoMemberLastLogin', N'Last Login Date', 5, 0, NULL, NULL, NULL, NULL, 0, N'00000021-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (34, -94, 1044, 11, N'umbracoMemberLastPasswordChangeDate', N'Last Password Change Date', 6, 0, NULL, NULL, NULL, NULL, 0, N'00000022-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (35, -94, 1044, 11, N'umbracoMemberPasswordRetrievalQuestion', N'Password Question', 7, 0, NULL, NULL, NULL, NULL, 0, N'00000023-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (36, -94, 1044, 11, N'umbracoMemberPasswordRetrievalAnswer', N'Password Answer', 8, 0, NULL, NULL, NULL, NULL, 0, N'00000024-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (46, -49, 1080, 15, N'umbracoNaviHide', N'Umbraco Navi Hide', 0, 0, NULL, NULL, NULL, N'Hide this page from navigation and search result', 0, N'94afa794-487c-44ba-9584-04d820cb36db')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (47, -49, 1080, 15, N'hideFromXMLSitemap', N'Hide from XMLSitemap', 1, 0, NULL, NULL, NULL, N'Hide this page from the XML Sitemap', 0, N'b92d2d3f-3406-419b-8dc4-70351f33f732')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (49, 1078, 1082, 17, N'mainContent', N'Main Content', 4, 0, NULL, NULL, NULL, NULL, 0, N'a42ece03-a834-4213-ba59-d2844d80f22f')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (50, -36, 1083, 18, N'articleDate', N'Article Date', 0, 1, NULL, NULL, NULL, N'Enter the date for the Article', 0, N'48259b48-b2a9-4091-8635-545f4390e3f5')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (51, -88, 1083, 18, N'authorName', N'Author Name', 1, 0, NULL, NULL, NULL, N'Enter the name of the Author', 0, N'c2e3e2af-bb1e-46ee-9e59-85d961e0cfae')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (52, -88, 1084, 19, N'title', N'Title', 0, 0, NULL, NULL, NULL, N'Enter the title for the page', 0, N'03dee08d-d9b7-4323-8693-3ae59e8525bb')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (53, -88, 1084, 19, N'subtitle', N'Subtitle', 1, 0, NULL, NULL, NULL, N'Enter the subtitle for this page', 0, N'baa9c46c-9046-418c-a6d6-060f22ed7a99')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (54, 1048, 1085, 20, N'mainImage', N'Main Image', 3, 0, NULL, NULL, NULL, N'Choose the image for the Main Page', 0, N'b8c0df86-3d4b-401d-b084-f25cc03af302')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (55, -88, 1086, 21, N'metaName', N'Meta Name', 0, 0, NULL, NULL, NULL, N'Enter the meta name for this page', 0, N'b69ca2be-b634-4d7d-904f-e00e9ebf106b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (56, -89, 1086, 21, N'metaDescription', N'Meta Description', 1, 0, NULL, NULL, NULL, N'Enter the meta description for this page', 0, N'14b80af3-2c16-49be-9af8-4bf3af5b896d')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (57, 1041, 1086, 21, N'metaKeywords', N'Meta Keywords', 2, 0, NULL, NULL, NULL, N'Enter the keyword for this page', 0, N'def75fff-9202-4f24-9d7f-ab32ce96efd5')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (58, -87, 1087, 22, N'successMessage', N'Success Message', 0, 0, NULL, NULL, NULL, N'Enter a success message', 0, N'dc687a77-97a9-442c-9fdd-fbaf37954329')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (59, -87, 1087, 22, N'errorMessage', N'Error Message', 1, 0, NULL, NULL, NULL, N'Enter an error message', 0, N'4af883bb-ba66-47e0-8a9b-b27d277680e7')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (60, -88, 1091, 23, N'iconClass', N'Icon Class', 0, 1, NULL, NULL, NULL, N'Enter the class name for the Icon eg "fab fa-facebook"', 0, N'050d8b96-c492-40e8-bc7c-f27fd8c4135b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (61, 1090, 1091, 23, N'link', N'Link', 1, 1, NULL, NULL, NULL, N'Enter the link for this item', 0, N'f119f8c0-8c62-49f5-b9f3-02fcd8d8dfee')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (62, 1092, 1088, 24, N'socialLinks', N'Social Links', 0, 0, NULL, NULL, NULL, N'Enter a social link for the footer', 0, N'0fce6403-1054-4b9d-9445-2dd3e36cedb2')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (65, 1048, 1070, 27, N'mainImage', N'Main Image', 2, 0, NULL, NULL, NULL, NULL, 0, N'c1614de6-a496-4087-996a-077b487752ce')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (66, 1048, 1074, 28, N'mainImage', N'Main Image', 0, 0, NULL, NULL, NULL, NULL, 0, N'7ad2eca6-85bf-4347-b62a-39b4a6ce261e')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (67, 1112, 1088, 24, N'copyRight', N'copy right', 1, 0, NULL, NULL, NULL, NULL, 0, N'25a4a744-9ded-4bd1-b266-d1dd6d964a9d')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (68, 1090, 1114, 29, N'link', N'Link', 0, 1, NULL, NULL, NULL, N'Enter the link for this redirect', 0, N'0d45bc28-2003-44e3-b77e-6fd94a7a17fc')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (69, -49, 1114, 29, N'isTemporaryRedirect', N'Is Temporary Redirect', 1, 0, NULL, NULL, NULL, NULL, 0, N'd8dabf72-d6c6-44aa-97dd-b57fe6c6935b')
SET IDENTITY_INSERT [dbo].[cmsPropertyType] OFF
GO
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] ON 

INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (3, 1032, N'Image', 1, N'79ed4d07-254a-42cf-8fa9-ebe1c116a596')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (4, 1033, N'File', 1, N'50899f9c-023a-4466-b623-aba9049885fe')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (11, 1044, N'Membership', 1, N'0756729d-d665-46e3-b84a-37aceaa614f8')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (15, 1080, N'Visibility', 5, N'6c91fbf1-dd4d-4627-9214-2d9409f72d3a')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (17, 1082, N'Content', 0, N'fa88ea61-c227-451a-a7a7-66d0153db659')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (18, 1083, N'Content', 0, N'ee58ee13-207e-448c-af7a-ecc74448eff6')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (19, 1084, N'Content', 0, N'ae2d25a8-fe37-4e78-8a10-fc02e5dfa1d0')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (20, 1085, N'Content', 0, N'c5cd3a8b-62a4-4b58-8d26-28ebfe12354e')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (21, 1086, N'SEO', 4, N'180b170b-3857-421c-a1fa-3226670924a4')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (22, 1087, N'Result Messages', 0, N'59ffb9cf-0120-4bb9-b33a-174cd3a227be')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (23, 1091, N'Content', 0, N'c2dcfcfd-5917-4691-952d-0000640de7d4')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (24, 1088, N'Footer', 4, N'144fc0b4-8b80-4214-9147-c03a8405a06d')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (27, 1070, N'Result Messages', 0, N'a4d8973c-7788-4484-9629-8115bf7d3041')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (28, 1074, N'Content', 0, N'6fe0b905-27f6-460f-bf37-3053ef09a190')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (29, 1114, N'Content', 0, N'0c12edd7-62ed-43b6-ad60-baf5313eca43')
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[cmsTemplate] ON 

INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (4, 1059, N'master')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (5, 1060, N'home')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (6, 1099, N'articleLists')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (7, 1100, N'article')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (8, 1101, N'content')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (9, 1102, N'search')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (10, 1103, N'contact')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (11, 1104, N'xMLSitemap')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (12, 1105, N'error')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (13, 1115, N'Redirect')
SET IDENTITY_INSERT [dbo].[cmsTemplate] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoAudit] ON 

INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-20T07:32:49.987' AS DateTime), -1, N'User "Administrator" ', N'umbraco/user/save', N'updating RawPasswordValue, LastPasswordChangeDate, UpdateDate, SecurityStamp')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (2, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-20T07:32:50.187' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating Email, Name, Username, UpdateDate, SecurityStamp')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (3, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-20T07:32:50.320' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (4, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-20T07:34:08.783' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (5, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-20T07:34:08.817' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (6, -1, N'User "admin" <admin@admin.com>', N'::1', CAST(N'2020-04-20T07:34:08.893' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating TourData, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (7, -1, N'User "admin" <admin@admin.com>', N'::1', CAST(N'2020-04-20T07:34:12.847' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating TourData, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (8, 0, N'User "SYTEM" ', N'127.0.0.1', CAST(N'2020-04-20T09:35:26.297' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (9, 0, N'User "SYTEM" ', N'127.0.0.1', CAST(N'2020-04-20T09:35:26.790' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (10, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-21T01:50:46.193' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (11, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-21T01:50:46.603' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (12, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-21T04:06:36.797' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (13, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-21T04:06:36.933' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (14, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-21T06:34:54.383' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (15, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-21T06:34:56.770' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (16, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-21T07:39:45.890' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (17, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-21T07:39:46.127' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (18, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-21T08:11:25.590' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (19, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-21T08:11:25.643' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (20, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-21T08:24:26.883' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/logout', N'logout success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (21, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-21T08:25:29.653' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (22, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-21T08:25:30.257' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (23, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-21T09:02:34.063' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/logout', N'logout success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (24, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-21T09:03:58.477' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (25, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-21T09:03:59.023' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (26, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-21T10:19:05.990' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (27, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-21T10:19:06.013' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (28, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-22T01:20:27.837' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (29, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-22T01:20:28.373' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (30, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-22T02:49:45.343' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (31, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-22T02:49:45.817' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (32, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-22T03:46:35.833' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (33, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-22T03:46:36.337' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (34, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-22T03:46:48.423' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/logout', N'logout success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (35, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-22T03:52:04.847' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (36, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-22T03:52:05.377' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (37, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-22T06:34:49.510' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (38, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-22T06:34:50.080' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (39, 0, N'User "SYTEM" ', N'127.0.0.1', CAST(N'2020-04-22T07:28:19.460' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (40, 0, N'User "SYTEM" ', N'127.0.0.1', CAST(N'2020-04-22T07:28:20.020' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (41, 0, N'User "SYTEM" ', N'127.0.0.1', CAST(N'2020-04-22T08:29:44.010' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (42, 0, N'User "SYTEM" ', N'127.0.0.1', CAST(N'2020-04-22T08:29:44.293' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (43, 0, N'User "SYTEM" ', N'127.0.0.1', CAST(N'2020-04-22T09:08:47.637' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (44, 0, N'User "SYTEM" ', N'127.0.0.1', CAST(N'2020-04-22T09:08:47.867' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (45, 0, N'User "SYTEM" ', N'127.0.0.1', CAST(N'2020-04-22T09:09:34.137' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (46, 0, N'User "SYTEM" ', N'127.0.0.1', CAST(N'2020-04-22T09:09:34.457' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (47, 0, N'User "SYTEM" ', N'127.0.0.1', CAST(N'2020-04-22T09:54:18.560' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (48, 0, N'User "SYTEM" ', N'127.0.0.1', CAST(N'2020-04-22T09:54:18.873' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (49, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-23T01:44:05.757' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (50, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-23T01:44:06.000' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (51, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-23T09:24:48.477' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (52, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-23T09:24:48.743' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (53, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-24T03:12:45.313' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (54, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-24T03:12:45.547' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (55, -1, N'User "admin" <admin@admin.com>', N'127.0.0.1', CAST(N'2020-04-24T03:39:56.340' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (56, 0, N'User "SYTEM" ', N'127.0.0.1', CAST(N'2020-04-24T03:39:56.383' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (57, 0, N'User "SYTEM" ', N'127.0.0.1', CAST(N'2020-04-24T04:26:48.550' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (58, 0, N'User "SYTEM" ', N'127.0.0.1', CAST(N'2020-04-24T04:26:48.627' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (59, -1, N'User "admin" <admin@admin.com>', N'127.0.0.1', CAST(N'2020-04-24T04:46:26.703' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (60, 0, N'User "SYTEM" ', N'127.0.0.1', CAST(N'2020-04-24T04:46:26.757' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (61, 0, N'User "SYTEM" ', N'127.0.0.1', CAST(N'2020-04-24T06:55:58.693' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (62, 0, N'User "SYTEM" ', N'127.0.0.1', CAST(N'2020-04-24T06:55:58.783' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (63, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-24T08:02:58.717' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (64, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-24T08:02:59.103' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (65, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-24T08:28:58.520' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (66, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-24T08:28:58.797' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (67, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-24T09:23:23.603' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (68, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-24T09:23:23.920' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (69, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-24T10:45:11.123' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (70, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-24T10:45:11.497' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (71, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-27T02:18:05.817' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (72, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-27T02:18:05.920' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (73, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-27T03:40:29.633' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (74, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-27T03:40:29.683' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (75, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-27T04:26:41.417' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (76, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-04-27T04:26:41.480' AS DateTime), -1, N'User "admin" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
SET IDENTITY_INSERT [dbo].[umbracoAudit] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] ON 

INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (291, CAST(N'2020-04-27T02:18:06.560' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D2] 84DC417951094609ADC6681CA5E13F40', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (292, CAST(N'2020-04-27T02:31:06.640' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1113,\"Key\":\"3bc217ee-5b26-41e4-b487-218d79902c33\",\"ChangeTypes\":2}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D2] 84DC417951094609ADC6681CA5E13F40', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (293, CAST(N'2020-04-27T02:31:09.413' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1113,\"Key\":\"3bc217ee-5b26-41e4-b487-218d79902c33\",\"ChangeTypes\":2}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D2] 84DC417951094609ADC6681CA5E13F40', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (294, CAST(N'2020-04-27T02:47:15.123' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[2]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (295, CAST(N'2020-04-27T02:47:21.643' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[2]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (296, CAST(N'2020-04-27T02:48:03.877' AS DateTime), N'[{"RefreshType":4,"RefresherId":"3e0f95d8-0be5-44b8-8394-2b8750b62654","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":3,\"IsoCode\":\"vi\",\"ChangeType\":3}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (297, CAST(N'2020-04-27T02:48:19.130' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[2]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (298, CAST(N'2020-04-27T02:54:47.663' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[3]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (299, CAST(N'2020-04-27T02:54:59.403' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[3]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (300, CAST(N'2020-04-27T02:55:19.127' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[4]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (301, CAST(N'2020-04-27T02:55:47.277' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[4]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (302, CAST(N'2020-04-27T02:55:54.403' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[3]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (303, CAST(N'2020-04-27T03:01:58.963' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[5]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (304, CAST(N'2020-04-27T03:02:09.897' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[5]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (305, CAST(N'2020-04-27T03:04:01.310' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[5]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (306, CAST(N'2020-04-27T03:04:14.477' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[6]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (307, CAST(N'2020-04-27T03:04:55.927' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[5]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (308, CAST(N'2020-04-27T03:05:06.207' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[6]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (309, CAST(N'2020-04-27T03:06:48.487' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[7]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (310, CAST(N'2020-04-27T03:07:03.587' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[7]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (311, CAST(N'2020-04-27T03:09:13.987' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[7]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (312, CAST(N'2020-04-27T03:12:02.750' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[7]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (313, CAST(N'2020-04-27T03:12:12.740' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[7]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (314, CAST(N'2020-04-27T03:13:13.967' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[7]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (315, CAST(N'2020-04-27T03:13:47.773' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[7]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (316, CAST(N'2020-04-27T03:14:46.370' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[7]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (317, CAST(N'2020-04-27T03:16:09.950' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[8]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (318, CAST(N'2020-04-27T03:16:22.037' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[8]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (319, CAST(N'2020-04-27T03:16:42.643' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[9]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (320, CAST(N'2020-04-27T03:16:54.997' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[9]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (321, CAST(N'2020-04-27T03:17:07.440' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[10]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (322, CAST(N'2020-04-27T03:17:30.423' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[10]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (323, CAST(N'2020-04-27T03:19:34.837' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[11]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (324, CAST(N'2020-04-27T03:19:42.793' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[11]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (325, CAST(N'2020-04-27T03:23:54.803' AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1043,\"Key\":\"1df9f033-e6d4-451f-b8d2-e0cbc50a836f\",\"Removed\":false}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (326, CAST(N'2020-04-27T03:26:30.180' AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1043,\"Key\":\"1df9f033-e6d4-451f-b8d2-e0cbc50a836f\",\"Removed\":false}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (327, CAST(N'2020-04-27T03:31:56.673' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1064,\"Key\":\"1466e1b8-a73b-4cf2-a1e9-177fce387b96\",\"ChangeTypes\":2}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D3] 7B133B085F7749CD8AD8B3D333E17459', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (328, CAST(N'2020-04-27T03:40:30.133' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D4] 4D84D17F9DFF49058096421BF1ACA184', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (329, CAST(N'2020-04-27T03:41:57.117' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1064,\"Key\":\"1466e1b8-a73b-4cf2-a1e9-177fce387b96\",\"ChangeTypes\":2}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P904/D4] 4D84D17F9DFF49058096421BF1ACA184', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (330, CAST(N'2020-04-27T04:03:54.297' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11812/D2] 9F6C7E1C8BE547098894A727257EDDD8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (331, CAST(N'2020-04-27T04:26:42.243' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (332, CAST(N'2020-04-27T04:32:31.323' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[12]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (333, CAST(N'2020-04-27T04:32:38.747' AS DateTime), N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[12]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (334, CAST(N'2020-04-27T04:37:01.873' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1114,\"ChangeTypes\":1}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (335, CAST(N'2020-04-27T04:38:31.087' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1115]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1116,\"ChangeTypes\":1}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (336, CAST(N'2020-04-27T04:38:36.010' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1114,\"ChangeTypes\":4}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (337, CAST(N'2020-04-27T04:39:34.583' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1116,\"ChangeTypes\":4}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (338, CAST(N'2020-04-27T04:40:45.483' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1116,\"ChangeTypes\":4}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (339, CAST(N'2020-04-27T04:41:29.597' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1052,\"ChangeTypes\":4}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (340, CAST(N'2020-04-27T04:42:41.573' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1117,\"Key\":\"f3e0ae11-821c-4966-b439-453daf8d5938\",\"ChangeTypes\":2}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (341, CAST(N'2020-04-27T04:42:52.637' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1117,\"Key\":\"f3e0ae11-821c-4966-b439-453daf8d5938\",\"ChangeTypes\":2}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (342, CAST(N'2020-04-27T04:43:07.487' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1117,\"Key\":\"f3e0ae11-821c-4966-b439-453daf8d5938\",\"ChangeTypes\":2}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (343, CAST(N'2020-04-27T04:48:05.757' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1115]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (344, CAST(N'2020-04-27T04:54:45.467' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1118,\"Key\":\"29a50f1d-ac67-4fc5-b9f8-cbcb4d9382e2\",\"ChangeTypes\":2}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (345, CAST(N'2020-04-27T04:54:52.920' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1117,\"Key\":\"f3e0ae11-821c-4966-b439-453daf8d5938\",\"ChangeTypes\":4}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (346, CAST(N'2020-04-27T04:54:57.123' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1118,\"Key\":\"29a50f1d-ac67-4fc5-b9f8-cbcb4d9382e2\",\"ChangeTypes\":4}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (347, CAST(N'2020-04-27T04:55:38.310' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1107,\"Key\":\"91988fc5-103a-4baa-812b-9a9f15102660\",\"ChangeTypes\":2}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (348, CAST(N'2020-04-27T04:56:03.687' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1096,\"Key\":\"b2d1c20d-996b-4511-8386-d0d631a05c5d\",\"ChangeTypes\":2}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (349, CAST(N'2020-04-27T04:56:08.230' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1096,\"Key\":\"b2d1c20d-996b-4511-8386-d0d631a05c5d\",\"ChangeTypes\":2}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (350, CAST(N'2020-04-27T04:59:38.927' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1111,\"Key\":\"6dffb914-df59-4ec7-b7e3-3039dd42e25c\",\"ChangeTypes\":2}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (351, CAST(N'2020-04-27T05:00:24.367' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1109,\"Key\":\"0a9a167b-4ad0-48c5-9242-13bb2c6ddf02\",\"ChangeTypes\":2}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (352, CAST(N'2020-04-27T05:00:29.077' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1095,\"Key\":\"3b822c8a-ad72-4bf9-b5be-4f1d7777e219\",\"ChangeTypes\":2}]"}]', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3984/D2] 552A68F197F0456983CA106B47B264B8', 1)
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] OFF
GO
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1064, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1066, 1052)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1093, 1071)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1094, 1069)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1095, 1070)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1096, 1076)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1097, 1074)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1098, 1068)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1106, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1107, 1073)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1108, 1068)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1109, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1110, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1111, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1113, 1068)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1117, 1116)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1118, 1116)
GO
SET IDENTITY_INSERT [dbo].[umbracoContentVersion] ON 

INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (15, 1064, CAST(N'2020-04-27T10:41:56.813' AS DateTime), NULL, 1, N'Cat')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (22, 1066, CAST(N'2020-04-21T11:13:18.457' AS DateTime), -1, 0, N'Home')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (23, 1066, CAST(N'2020-04-21T11:28:25.717' AS DateTime), -1, 0, N'Home')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (24, 1066, CAST(N'2020-04-21T13:38:00.203' AS DateTime), -1, 0, N'Home')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (25, 1066, CAST(N'2020-04-23T08:48:15.747' AS DateTime), -1, 0, N'Home')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (26, 1093, CAST(N'2020-04-22T11:39:03.503' AS DateTime), -1, 0, N'About')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (27, 1094, CAST(N'2020-04-21T17:46:50.307' AS DateTime), -1, 0, N'Blog')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (28, 1095, CAST(N'2020-04-22T12:00:10.050' AS DateTime), -1, 0, N'Contact')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (29, 1096, CAST(N'2020-04-21T17:36:44.297' AS DateTime), -1, 0, N'XML Sitemap')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (30, 1097, CAST(N'2020-04-22T11:53:58.557' AS DateTime), -1, 0, N'Search')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (31, 1096, CAST(N'2020-04-27T11:56:03.507' AS DateTime), -1, 0, N'XML Sitemap')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (32, 1098, CAST(N'2020-04-21T17:46:52.960' AS DateTime), -1, 0, N'Test Article')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (33, 1094, CAST(N'2020-04-22T11:13:39.917' AS DateTime), -1, 0, N'Blog')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (34, 1098, CAST(N'2020-04-22T11:28:16.517' AS DateTime), -1, 0, N'Test Article')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (35, 1094, CAST(N'2020-04-22T11:13:39.917' AS DateTime), -1, 1, N'Blog')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (36, 1098, CAST(N'2020-04-22T11:28:16.517' AS DateTime), -1, 1, N'Test Article')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (37, 1093, CAST(N'2020-04-22T14:37:06.097' AS DateTime), -1, 0, N'About')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (38, 1097, CAST(N'2020-04-24T17:06:51.827' AS DateTime), -1, 0, N'Search')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (39, 1095, CAST(N'2020-04-24T11:29:06.093' AS DateTime), -1, 0, N'Contact')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (40, 1106, CAST(N'2020-04-22T13:45:42.760' AS DateTime), NULL, 1, N'(GIF Image, 1024 × 768 Pixels)')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (41, 1107, CAST(N'2020-04-22T13:46:01.687' AS DateTime), -1, 0, N'Error')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (42, 1107, CAST(N'2020-04-27T11:55:37.803' AS DateTime), -1, 0, N'Error')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (43, 1093, CAST(N'2020-04-22T14:47:02.657' AS DateTime), -1, 0, N'About')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (44, 1093, CAST(N'2020-04-22T14:50:37.373' AS DateTime), -1, 0, N'About')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (45, 1093, CAST(N'2020-04-24T16:36:25.973' AS DateTime), -1, 0, N'About')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (46, 1066, CAST(N'2020-04-23T10:18:17.827' AS DateTime), -1, 0, N'Home')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (47, 1108, CAST(N'2020-04-23T10:07:15.157' AS DateTime), -1, 0, N'My article test no 1')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (48, 1108, CAST(N'2020-04-23T10:07:15.157' AS DateTime), -1, 1, N'My article test no 1')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (49, 1066, CAST(N'2020-04-23T10:20:27.557' AS DateTime), -1, 0, N'Home')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (50, 1066, CAST(N'2020-04-24T17:48:50.557' AS DateTime), -1, 0, N'Home')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (51, 1095, CAST(N'2020-04-24T14:05:58.130' AS DateTime), -1, 0, N'Contact')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (52, 1095, CAST(N'2020-04-24T16:58:59.073' AS DateTime), -1, 0, N'Contact')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (53, 1093, CAST(N'2020-04-24T17:10:50.093' AS DateTime), -1, 0, N'About')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (54, 1109, CAST(N'2020-04-27T12:00:24.237' AS DateTime), NULL, 1, N'Contact Bg')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (55, 1095, CAST(N'2020-04-27T12:00:28.873' AS DateTime), -1, 0, N'Contact')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (56, 1110, CAST(N'2020-04-24T17:05:20.097' AS DateTime), NULL, 1, N'Matthew Waring Mds647i6 ZM Unsplash')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (57, 1097, CAST(N'2020-04-24T17:08:22.900' AS DateTime), -1, 0, N'Search')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (58, 1097, CAST(N'2020-04-24T17:08:22.900' AS DateTime), -1, 1, N'Search')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (59, 1111, CAST(N'2020-04-27T11:59:38.767' AS DateTime), NULL, 1, N'Ian Schneider Tammbr4okv4 Unsplash')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (60, 1093, CAST(N'2020-04-24T17:13:47.043' AS DateTime), -1, 0, N'About')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (61, 1093, CAST(N'2020-04-24T17:13:48.587' AS DateTime), -1, 1, N'About')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (62, 1066, CAST(N'2020-04-24T17:48:52.670' AS DateTime), -1, 1, N'Home')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (63, 1113, CAST(N'2020-04-27T09:31:05.923' AS DateTime), -1, 0, N'Test article 2')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (64, 1113, CAST(N'2020-04-27T09:31:09.277' AS DateTime), -1, 1, N'Test article 2')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (65, 1117, CAST(N'2020-04-27T11:54:52.633' AS DateTime), -1, 0, N'Links')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (66, 1118, CAST(N'2020-04-27T11:54:57.013' AS DateTime), -1, 0, N'Home Page')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (67, 1117, CAST(N'2020-04-27T11:54:52.633' AS DateTime), -1, 1, N'Links')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (68, 1118, CAST(N'2020-04-27T11:54:57.013' AS DateTime), -1, 1, N'Home Page')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (69, 1107, CAST(N'2020-04-27T11:55:37.803' AS DateTime), -1, 1, N'Error')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (70, 1096, CAST(N'2020-04-27T11:56:08.147' AS DateTime), -1, 0, N'XML Sitemap')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (71, 1096, CAST(N'2020-04-27T11:56:08.147' AS DateTime), -1, 1, N'XML Sitemap')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (72, 1095, CAST(N'2020-04-27T12:00:28.873' AS DateTime), -1, 1, N'Contact')
SET IDENTITY_INSERT [dbo].[umbracoContentVersion] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoContentVersionCultureVariation] ON 

INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (64, 22, 1, N'Home', CAST(N'2020-04-21T11:13:18.457' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (67, 23, 1, N'Home', CAST(N'2020-04-21T11:28:25.717' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (70, 25, 1, N'Home', CAST(N'2020-04-21T13:38:00.203' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (71, 24, 1, N'Home', CAST(N'2020-04-21T13:38:00.203' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[umbracoContentVersionCultureVariation] OFF
GO
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-99, N'Umbraco.Label', N'Decimal', N'{"umbracoDataValueType":"DECIMAL"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-98, N'Umbraco.Label', N'Date', N'{"umbracoDataValueType":"TIME"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-97, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":10, "orderBy":"username", "orderDirection":"asc", "includeProperties":[{"alias":"username","isSystem":1},{"alias":"email","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-96, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":100, "orderBy":"updateDate", "orderDirection":"desc", "layouts":[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}], "includeProperties":[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-95, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":100, "orderBy":"updateDate", "orderDirection":"desc", "layouts":[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}], "includeProperties":[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-94, N'Umbraco.Label', N'Date', N'{"umbracoDataValueType":"DATETIME"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-93, N'Umbraco.Label', N'Nvarchar', N'{"umbracoDataValueType":"BIGINT"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-92, N'Umbraco.Label', N'Nvarchar', N'{"umbracoDataValueType":"STRING"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-91, N'Umbraco.Label', N'Integer', N'{"umbracoDataValueType":"INT"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-90, N'Umbraco.UploadField', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-89, N'Umbraco.TextArea', N'Ntext', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-88, N'Umbraco.TextBox', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-87, N'Umbraco.TinyMCE', N'Ntext', N'{"value":",code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-51, N'Umbraco.Integer', N'Integer', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-49, N'Umbraco.TrueFalse', N'Integer', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-43, N'Umbraco.CheckBoxList', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-42, N'Umbraco.DropDown.Flexible', N'Nvarchar', N'{"multiple":true}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-41, N'Umbraco.DateTime', N'Date', N'{"format":"YYYY-MM-DD"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-40, N'Umbraco.RadioButtonList', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-39, N'Umbraco.DropDown.Flexible', N'Nvarchar', N'{"multiple":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-37, N'Umbraco.ColorPicker', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-36, N'Umbraco.DateTime', N'Date', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1041, N'Umbraco.Tags', N'Ntext', N'{"group":"default", "storageType":"Json"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1043, N'Umbraco.ImageCropper', N'Ntext', N'{"crops":[{"alias":"PageHeader.Large","width":1903,"height":532},{"alias":"PageHeader.Tiny","width":190,"height":53}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1046, N'Umbraco.ContentPicker', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1047, N'Umbraco.MemberPicker', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1048, N'Umbraco.MediaPicker', N'Ntext', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1049, N'Umbraco.MediaPicker', N'Ntext', N'{"multiPicker":1}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1050, N'Umbraco.MultiUrlPicker', N'Ntext', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1062, N'Umbraco.TextArea', N'Ntext', N'{}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1063, N'Umbraco.DropDown.Flexible', N'Nvarchar', N'{"multiple":false,"items":[{"id":1,"value":"White"},{"id":2,"value":"Black"},{"id":3,"value":"Yellow"},{"id":4,"value":"Orange"},{"id":5,"value":"Pink"},{"id":6,"value":"Purple"}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1065, N'Umbraco.TextArea', N'Ntext', N'{}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1078, N'Umbraco.Grid', N'Ntext', N'{"items":{"styles":[{"label":"Set a background image","description":"Set a row background","key":"background-image","view":"imagepicker","modifier":"url({0})"}],"config":[{"label":"Class","description":"Set a css class","key":"class","view":"textstring"}],"columns":12,"templates":[{"name":"1 column layout","sections":[{"grid":12}]}],"layouts":[{"name":"Full","areas":[{"grid":12,"allowAll":true}],"label":"Full"},{"name":"Half","areas":[{"grid":6,"allowAll":true}],"label":"Half"},{"name":"Thirds","areas":[{"grid":4,"allowAll":true}],"label":"Thirds"}]},"rte":{"toolbar":["ace","styleselect","bold","italic","alignleft","aligncenter","alignright","bullist","numlist","outdent","indent","link","umbmediapicker","umbmacro","umbembeddialog"],"stylesheets":[],"maxImageSize":730,"mode":"classic"},"ignoreUserStartNodes":false,"mediaParentId":null}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1090, N'Umbraco.MultiUrlPicker', N'Ntext', N'{"minNumber":0,"maxNumber":1,"ignoreUserStartNodes":false,"hideAnchor":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1092, N'Umbraco.NestedContent', N'Ntext', N'{"contentTypes":[{"ncAlias":"iconLinkItem","ncTabAlias":"Content","nameTemplate":"{{iconClass}}"}],"confirmDeletes":true,"showIcons":true,"hideLabel":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1112, N'Umbraco.TextBox', N'Nvarchar', N'{"maxChars":5}')
GO
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1066, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1093, 1, 1)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1094, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1095, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1096, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1097, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1098, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1107, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1108, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1113, 1, 1)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1117, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1118, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[umbracoDocumentCultureVariation] ON 

INSERT [dbo].[umbracoDocumentCultureVariation] ([id], [nodeId], [languageId], [edited], [available], [published], [name]) VALUES (50, 1066, 1, 0, 1, 1, N'Home')
SET IDENTITY_INSERT [dbo].[umbracoDocumentCultureVariation] OFF
GO
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (22, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (23, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (24, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (25, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (26, 1101, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (27, NULL, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (28, 1103, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (29, NULL, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (30, 1102, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (31, 1104, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (32, NULL, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (33, 1099, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (34, 1100, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (35, 1099, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (36, 1100, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (37, 1101, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (38, 1102, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (39, 1103, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (41, 1105, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (42, 1105, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (43, 1101, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (44, 1101, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (45, 1101, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (46, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (47, 1100, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (48, 1100, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (49, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (50, 1060, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (51, 1103, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (52, 1103, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (53, 1101, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (55, 1103, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (57, 1102, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (58, 1102, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (60, 1101, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (61, 1101, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (62, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (63, 1100, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (64, 1100, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (65, 1115, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (66, 1115, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (67, 1115, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (68, 1115, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (69, 1105, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (70, 1104, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (71, 1104, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (72, 1103, 0)
GO
INSERT [dbo].[umbracoKeyValue] ([key], [value], [updated]) VALUES (N'Umbraco.Core.Upgrader.State+Umbraco.Core', N'{2AB29964-02A1-474D-BD6B-72148D2A53A2}', CAST(N'2020-04-20T14:32:49.583' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[umbracoLanguage] ON 

INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName], [isDefaultVariantLang], [mandatory], [fallbackLanguageId]) VALUES (1, N'en-US', N'English (United States)', 1, 0, NULL)
INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName], [isDefaultVariantLang], [mandatory], [fallbackLanguageId]) VALUES (3, N'vi', N'Vietnamese', 0, 0, 1)
SET IDENTITY_INSERT [dbo].[umbracoLanguage] OFF
GO
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-1000, 1, N'MainDom')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-340, -1, N'Languages')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-339, 1, N'KeyValues')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-338, 1, N'Domains')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-337, 1, N'MemberTypes')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-336, 1, N'MediaTypes')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-335, 1, N'MemberTree')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-334, -1, N'MediaTree')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-333, -1, N'ContentTree')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-332, -1, N'ContentTypes')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-331, -1, N'Servers')
GO
SET IDENTITY_INSERT [dbo].[umbracoLog] ON 

INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1, -1, 1052, N'DocumentType', CAST(N'2020-04-20T14:34:57.710' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2, -1, 1052, N'DocumentType', CAST(N'2020-04-20T14:35:10.100' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (3, -1, 1053, N'Template', CAST(N'2020-04-20T16:38:33.920' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (4, -1, 1053, N'Template', CAST(N'2020-04-20T16:38:36.520' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (5, -1, 1053, N'Template', CAST(N'2020-04-20T16:40:24.430' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (6, -1, 1054, N'Template', CAST(N'2020-04-20T16:45:09.673' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (7, -1, 1054, N'Template', CAST(N'2020-04-20T16:45:29.913' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (8, -1, 1054, N'Template', CAST(N'2020-04-20T16:45:52.597' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (9, -1, 1052, N'DocumentType', CAST(N'2020-04-20T16:46:02.890' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (10, -1, 1054, N'Template', CAST(N'2020-04-20T16:47:16.260' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (11, -1, 1056, N'Template', CAST(N'2020-04-20T16:50:03.257' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (12, -1, 1057, N'DocumentType', CAST(N'2020-04-20T16:50:03.297' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (13, -1, 1052, N'DocumentType', CAST(N'2020-04-20T16:50:13.247' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (14, -1, 1057, N'DocumentType', CAST(N'2020-04-20T16:52:01.047' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (15, -1, 1052, N'DocumentType', CAST(N'2020-04-20T16:52:35.133' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (16, -1, 1057, N'DocumentType', CAST(N'2020-04-20T16:53:44.597' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (17, -1, 1052, N'DocumentType', CAST(N'2020-04-20T16:54:12.660' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (18, -1, 1058, N'Document', CAST(N'2020-04-20T16:55:37.580' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (19, -1, 1056, N'Template', CAST(N'2020-04-20T16:57:16.493' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (20, -1, 1053, N'Template', CAST(N'2020-04-20T16:57:29.330' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (21, -1, 1053, N'Template', CAST(N'2020-04-20T16:58:15.977' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (22, -1, 1052, N'DocumentType', CAST(N'2020-04-20T16:58:43.457' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (23, -1, 1052, N'DocumentType', CAST(N'2020-04-20T16:59:01.690' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (24, -1, 1053, N'Template', CAST(N'2020-04-20T16:59:25.817' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (25, -1, 1059, N'Template', CAST(N'2020-04-20T16:59:35.913' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (26, -1, 1060, N'Template', CAST(N'2020-04-20T16:59:47.497' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (27, -1, 1060, N'Template', CAST(N'2020-04-20T17:00:31.770' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (28, -1, 1052, N'DocumentType', CAST(N'2020-04-20T17:00:41.090' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (29, -1, 1061, N'Document', CAST(N'2020-04-20T17:01:47.163' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (30, -1, 1061, N'Document', CAST(N'2020-04-20T17:01:52.943' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (31, -1, 1061, N'Document', CAST(N'2020-04-20T17:02:09.140' AS DateTime), N'Unpublish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (32, -1, 1061, N'Document', CAST(N'2020-04-20T17:02:16.177' AS DateTime), N'Move', N'Moved to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (33, -1, 1061, N'Document', CAST(N'2020-04-20T17:02:16.953' AS DateTime), N'Delete', N'Trashed content with Id: 1061 related to original parent content with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (34, -1, 1058, N'Document', CAST(N'2020-04-20T17:02:22.583' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (35, -1, 1058, N'Document', CAST(N'2020-04-20T17:02:27.037' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (36, -1, 1060, N'Template', CAST(N'2020-04-20T17:03:58.707' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (37, -1, 1059, N'Template', CAST(N'2020-04-20T17:04:39.250' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (38, -1, 1060, N'Template', CAST(N'2020-04-20T17:05:11.763' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (39, -1, 1059, N'Template', CAST(N'2020-04-20T17:05:14.580' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (40, -1, 1058, N'Document', CAST(N'2020-04-20T17:05:56.787' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (41, -1, 1058, N'Document', CAST(N'2020-04-20T17:07:27.773' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (42, -1, 1058, N'Document', CAST(N'2020-04-20T17:07:32.680' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (43, -1, 1058, N'Document', CAST(N'2020-04-20T17:08:29.627' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (44, -1, 1060, N'Template', CAST(N'2020-04-20T17:08:41.560' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (45, -1, 1058, N'Document', CAST(N'2020-04-20T17:25:26.883' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (46, -1, 1058, N'Document', CAST(N'2020-04-20T17:25:31.210' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (47, -1, 1062, N'DataType', CAST(N'2020-04-20T17:37:43.063' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (48, -1, 1057, N'DocumentType', CAST(N'2020-04-20T17:37:50.797' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (49, -1, 1057, N'DocumentType', CAST(N'2020-04-20T17:38:47.337' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (50, -1, 1057, N'DocumentType', CAST(N'2020-04-20T17:40:20.700' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (51, -1, 1057, N'DocumentType', CAST(N'2020-04-20T17:40:28.890' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (52, -1, 1058, N'Document', CAST(N'2020-04-20T17:40:36.483' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (53, -1, 1058, N'Document', CAST(N'2020-04-20T17:40:41.583' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (54, -1, 1058, N'Document', CAST(N'2020-04-20T17:40:44.003' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (55, -1, 1058, N'Document', CAST(N'2020-04-20T17:41:00.203' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (56, -1, 1058, N'Document', CAST(N'2020-04-20T17:41:42.993' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (57, -1, 1058, N'Document', CAST(N'2020-04-20T17:41:47.590' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (58, -1, 1058, N'Document', CAST(N'2020-04-20T17:41:49.000' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (59, -1, 1058, N'Document', CAST(N'2020-04-20T17:41:54.260' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (60, -1, 1058, N'Document', CAST(N'2020-04-20T17:41:56.167' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (61, -1, 1060, N'Template', CAST(N'2020-04-20T17:44:36.553' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (62, -1, 1058, N'Document', CAST(N'2020-04-20T17:46:25.733' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (63, -1, 1058, N'Document', CAST(N'2020-04-20T17:46:58.997' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (64, -1, 1058, N'Document', CAST(N'2020-04-20T17:48:47.827' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (65, -1, 1058, N'Document', CAST(N'2020-04-20T17:48:48.333' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (66, -1, 1058, N'Document', CAST(N'2020-04-20T17:49:18.683' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (67, -1, 1057, N'DocumentType', CAST(N'2020-04-20T17:50:04.017' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (68, -1, 1058, N'Document', CAST(N'2020-04-20T17:50:08.480' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (69, -1, 1058, N'Document', CAST(N'2020-04-20T17:50:09.493' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (70, -1, 1059, N'Template', CAST(N'2020-04-21T08:51:04.317' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (71, -1, 1063, N'DataType', CAST(N'2020-04-21T09:03:50.750' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (72, -1, 1057, N'DocumentType', CAST(N'2020-04-21T09:04:31.273' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (73, -1, 1058, N'Document', CAST(N'2020-04-21T09:05:09.850' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (74, -1, 1060, N'Template', CAST(N'2020-04-21T09:07:31.583' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (75, -1, 1058, N'Document', CAST(N'2020-04-21T09:07:43.927' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (76, -1, 1058, N'Document', CAST(N'2020-04-21T09:15:45.720' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (77, -1, 1060, N'Template', CAST(N'2020-04-21T09:16:47.313' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (78, -1, 1060, N'Template', CAST(N'2020-04-21T09:17:07.317' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (79, -1, 1057, N'DocumentType', CAST(N'2020-04-21T09:31:09.563' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (80, -1, 1064, N'Media', CAST(N'2020-04-21T09:31:43.230' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (81, -1, 1058, N'Document', CAST(N'2020-04-21T09:37:08.660' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (82, -1, 1058, N'Document', CAST(N'2020-04-21T09:43:40.700' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (83, -1, 1058, N'Document', CAST(N'2020-04-21T09:44:18.933' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (84, -1, 1064, N'Media', CAST(N'2020-04-21T09:44:23.767' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (85, -1, 1064, N'Media', CAST(N'2020-04-21T09:44:32.277' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (86, -1, 1057, N'DocumentType', CAST(N'2020-04-21T09:48:11.337' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (87, -1, 1058, N'Document', CAST(N'2020-04-21T09:48:17.797' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (88, -1, 1058, N'Document', CAST(N'2020-04-21T09:53:54.353' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (89, -1, 1058, N'Document', CAST(N'2020-04-21T09:54:00.637' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (90, -1, 1058, N'Document', CAST(N'2020-04-21T10:15:08.537' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (91, -1, 1058, N'Document', CAST(N'2020-04-21T10:15:09.663' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (92, -1, 1058, N'Document', CAST(N'2020-04-21T10:15:41.080' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (93, -1, 1058, N'Document', CAST(N'2020-04-21T10:15:46.357' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (94, -1, 1058, N'Document', CAST(N'2020-04-21T10:16:58.593' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (95, -1, 1058, N'Document', CAST(N'2020-04-21T10:25:17.463' AS DateTime), N'Move', N'Moved to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (96, -1, 1058, N'Document', CAST(N'2020-04-21T10:25:18.903' AS DateTime), N'Delete', N'Trashed content with Id: 1058 related to original parent content with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (97, -1, 1065, N'DataType', CAST(N'2020-04-21T10:26:40.920' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (98, -1, 1057, N'DocumentType', CAST(N'2020-04-21T10:26:50.277' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (99, -1, -20, N'Document', CAST(N'2020-04-21T11:07:34.100' AS DateTime), N'Delete', N'Recycle bin emptied', NULL)
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (100, -1, 1066, N'Document', CAST(N'2020-04-21T11:13:18.550' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (101, -1, 1066, N'Document', CAST(N'2020-04-21T11:13:32.567' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (102, -1, 1060, N'Template', CAST(N'2020-04-21T11:18:25.017' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (103, -1, 1060, N'Template', CAST(N'2020-04-21T11:27:10.007' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (104, -1, 1066, N'Document', CAST(N'2020-04-21T11:28:25.800' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (105, -1, 2, N'Language', CAST(N'2020-04-21T11:59:41.350' AS DateTime), N'Save', N'Save Language', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (106, -1, 1066, N'Document', CAST(N'2020-04-21T13:35:22.203' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (107, -1, 1066, N'Document', CAST(N'2020-04-21T13:36:07.467' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (108, -1, 1066, N'Document', CAST(N'2020-04-21T13:38:00.287' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (109, -1, 1052, N'DocumentType', CAST(N'2020-04-21T13:39:30.623' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (110, -1, 2, N'Language', CAST(N'2020-04-21T13:41:21.970' AS DateTime), N'Delete', N'Delete Language', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (111, -1, 1066, N'Document', CAST(N'2020-04-21T14:45:24.277' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (112, -1, -1, N'Document', CAST(N'2020-04-21T15:14:10.977' AS DateTime), N'Delete', N'Delete content of type 1057', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (113, -1, 1057, N'DocumentType', CAST(N'2020-04-21T15:14:11.270' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (114, -1, 1067, N'DocumentType', CAST(N'2020-04-21T15:15:59.853' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (115, -1, -1, N'Document', CAST(N'2020-04-21T15:16:10.077' AS DateTime), N'Delete', N'Delete content of type 1067', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (116, -1, 1067, N'DocumentType', CAST(N'2020-04-21T15:16:10.143' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (117, -1, 1068, N'DocumentType', CAST(N'2020-04-21T15:17:37.913' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (118, -1, 1069, N'DocumentType', CAST(N'2020-04-21T15:18:08.953' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (119, -1, 1070, N'DocumentType', CAST(N'2020-04-21T15:18:46.997' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (120, -1, 1070, N'DocumentType', CAST(N'2020-04-21T15:19:00.457' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (121, -1, 1071, N'DocumentType', CAST(N'2020-04-21T15:19:20.793' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (122, -1, 1072, N'DocumentType', CAST(N'2020-04-21T15:19:36.527' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (123, -1, -1, N'Document', CAST(N'2020-04-21T15:20:23.267' AS DateTime), N'Delete', N'Delete content of type 1072', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (124, -1, 1072, N'DocumentType', CAST(N'2020-04-21T15:20:23.343' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (125, -1, 1073, N'DocumentType', CAST(N'2020-04-21T15:20:44.243' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (126, -1, 1074, N'DocumentType', CAST(N'2020-04-21T15:20:58.447' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (127, -1, 1075, N'DocumentType', CAST(N'2020-04-21T15:21:41.217' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (128, -1, -1, N'Document', CAST(N'2020-04-21T15:22:35.273' AS DateTime), N'Delete', N'Delete content of type 1075', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (129, -1, 1075, N'DocumentType', CAST(N'2020-04-21T15:22:35.347' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (130, -1, 1076, N'DocumentType', CAST(N'2020-04-21T15:22:52.063' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (131, -1, 1077, N'DocumentType', CAST(N'2020-04-21T15:26:28.787' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (132, -1, 1077, N'DocumentType', CAST(N'2020-04-21T15:32:55.777' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (133, -1, 1077, N'DocumentType', CAST(N'2020-04-21T15:33:52.133' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (134, -1, 1077, N'DocumentType', CAST(N'2020-04-21T15:33:59.763' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (135, -1, 1078, N'DataType', CAST(N'2020-04-21T15:49:02.730' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (136, -1, -1, N'Document', CAST(N'2020-04-21T15:50:43.513' AS DateTime), N'Delete', N'Delete content of type 1077', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (137, -1, 1077, N'DocumentType', CAST(N'2020-04-21T15:50:43.633' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (138, -1, 1078, N'DataType', CAST(N'2020-04-21T15:52:56.500' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (139, -1, 1078, N'DataType', CAST(N'2020-04-21T15:54:05.463' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (140, -1, 1079, N'DocumentType', CAST(N'2020-04-21T15:54:24.063' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (141, -1, 1079, N'DocumentType', CAST(N'2020-04-21T15:55:25.790' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (142, -1, 1079, N'DocumentType', CAST(N'2020-04-21T15:55:28.347' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (143, -1, 1079, N'DocumentType', CAST(N'2020-04-21T15:55:31.700' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (144, -1, 1080, N'DocumentType', CAST(N'2020-04-21T15:58:33.627' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (145, -1, 1079, N'DocumentType', CAST(N'2020-04-21T15:58:39.860' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (146, -1, -1, N'Document', CAST(N'2020-04-21T15:59:06.893' AS DateTime), N'Delete', N'Delete content of type 1079', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (147, -1, 1079, N'DocumentType', CAST(N'2020-04-21T15:59:06.967' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (148, -1, 1078, N'DataType', CAST(N'2020-04-21T16:01:08.500' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (149, -1, 1081, N'DocumentType', CAST(N'2020-04-21T16:01:22.733' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (150, -1, -1, N'Document', CAST(N'2020-04-21T16:04:17.507' AS DateTime), N'Delete', N'Delete content of type 1081', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (151, -1, 1081, N'DocumentType', CAST(N'2020-04-21T16:04:17.603' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (152, -1, 1080, N'DocumentType', CAST(N'2020-04-21T16:04:29.427' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (153, -1, 1082, N'DocumentType', CAST(N'2020-04-21T16:05:06.703' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (154, -1, 1082, N'DocumentType', CAST(N'2020-04-21T16:07:46.160' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (155, -1, 1083, N'DocumentType', CAST(N'2020-04-21T16:13:52.697' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (156, -1, 1084, N'DocumentType', CAST(N'2020-04-21T16:16:26.973' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (157, -1, 1085, N'DocumentType', CAST(N'2020-04-21T16:19:38.300' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (158, -1, 1086, N'DocumentType', CAST(N'2020-04-21T16:23:16.717' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (159, -1, 1086, N'DocumentType', CAST(N'2020-04-21T16:23:29.347' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (160, -1, 1087, N'DocumentType', CAST(N'2020-04-21T16:25:53.037' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (161, -1, 1088, N'DocumentType', CAST(N'2020-04-21T16:27:09.243' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (162, -1, 1090, N'DataType', CAST(N'2020-04-21T16:34:51.747' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (163, -1, 1091, N'DocumentType', CAST(N'2020-04-21T16:35:45.363' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (164, -1, 1092, N'DataType', CAST(N'2020-04-21T16:44:31.123' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (165, -1, 1088, N'DocumentType', CAST(N'2020-04-21T16:46:34.527' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (166, -1, 1083, N'DocumentType', CAST(N'2020-04-21T16:48:47.170' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (167, -1, 1082, N'DocumentType', CAST(N'2020-04-21T16:49:00.940' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (168, -1, 1085, N'DocumentType', CAST(N'2020-04-21T16:49:10.970' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (169, -1, 1086, N'DocumentType', CAST(N'2020-04-21T16:49:22.560' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (170, -1, 1080, N'DocumentType', CAST(N'2020-04-21T16:49:31.980' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (171, -1, 1068, N'DocumentType', CAST(N'2020-04-21T16:51:03.423' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (172, -1, 1086, N'DocumentType', CAST(N'2020-04-21T16:53:19.410' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (173, -1, 1082, N'DocumentType', CAST(N'2020-04-21T16:56:16.047' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (174, -1, 1069, N'DocumentType', CAST(N'2020-04-21T16:57:14.600' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (175, -1, 1082, N'DocumentType', CAST(N'2020-04-21T16:57:22.343' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (176, -1, 1085, N'DocumentType', CAST(N'2020-04-21T17:01:21.907' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (177, -1, 1085, N'DocumentType', CAST(N'2020-04-21T17:01:27.970' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (178, -1, 1070, N'DocumentType', CAST(N'2020-04-21T17:03:11.490' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (179, -1, 1071, N'DocumentType', CAST(N'2020-04-21T17:03:41.880' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (180, -1, 1073, N'DocumentType', CAST(N'2020-04-21T17:05:58.217' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (181, -1, 1073, N'DocumentType', CAST(N'2020-04-21T17:06:00.917' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (182, -1, 1052, N'DocumentType', CAST(N'2020-04-21T17:19:16.737' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (183, -1, 1088, N'DocumentType', CAST(N'2020-04-21T17:20:30.757' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (184, -1, 1052, N'DocumentType', CAST(N'2020-04-21T17:20:39.310' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (185, -1, 1052, N'DocumentType', CAST(N'2020-04-21T17:27:19.247' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (186, -1, 1069, N'DocumentType', CAST(N'2020-04-21T17:29:56.357' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (187, -1, 1069, N'DocumentType', CAST(N'2020-04-21T17:29:59.523' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (188, -1, 1093, N'Document', CAST(N'2020-04-21T17:33:45.587' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (189, -1, 1094, N'Document', CAST(N'2020-04-21T17:33:58.187' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (190, -1, 1095, N'Document', CAST(N'2020-04-21T17:34:40.837' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (191, -1, 1096, N'Document', CAST(N'2020-04-21T17:35:13.760' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (192, -1, 1097, N'Document', CAST(N'2020-04-21T17:35:33.050' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (193, -1, 1097, N'Document', CAST(N'2020-04-21T17:35:57.793' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (194, -1, 1076, N'DocumentType', CAST(N'2020-04-21T17:36:20.983' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (195, -1, 1096, N'Document', CAST(N'2020-04-21T17:36:44.350' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (196, -1, 1096, N'Document', CAST(N'2020-04-21T17:37:04.677' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (197, -1, 1098, N'Document', CAST(N'2020-04-21T17:46:26.487' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (198, -1, 1098, N'Document', CAST(N'2020-04-21T17:46:28.240' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (199, -1, 1094, N'Document', CAST(N'2020-04-21T17:46:50.400' AS DateTime), N'Publish', NULL, NULL)
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (200, -1, 1098, N'Document', CAST(N'2020-04-21T17:46:52.983' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (201, -1, 1099, N'Template', CAST(N'2020-04-22T11:05:45.357' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (202, -1, 1099, N'Template', CAST(N'2020-04-22T11:06:08.257' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (203, -1, 1060, N'Template', CAST(N'2020-04-22T11:06:35.017' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (204, -1, 1099, N'Template', CAST(N'2020-04-22T11:07:03.343' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (205, -1, 1100, N'Template', CAST(N'2020-04-22T11:07:12.520' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (206, -1, 1100, N'Template', CAST(N'2020-04-22T11:10:13.587' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (207, -1, 1068, N'DocumentType', CAST(N'2020-04-22T11:12:52.097' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (208, -1, 1069, N'DocumentType', CAST(N'2020-04-22T11:13:05.950' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (209, -1, 1094, N'Document', CAST(N'2020-04-22T11:13:40.513' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (210, -1, 1100, N'Template', CAST(N'2020-04-22T11:26:43.063' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (211, -1, 1098, N'Document', CAST(N'2020-04-22T11:28:16.560' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (212, -1, 1101, N'Template', CAST(N'2020-04-22T11:36:23.697' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (213, -1, 1101, N'Template', CAST(N'2020-04-22T11:36:36.120' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (214, -1, 1071, N'DocumentType', CAST(N'2020-04-22T11:36:50.843' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (215, -1, 1093, N'Document', CAST(N'2020-04-22T11:39:03.560' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (216, -1, 1101, N'Template', CAST(N'2020-04-22T11:40:32.673' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (217, -1, 1102, N'Template', CAST(N'2020-04-22T11:43:46.687' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (218, -1, 1102, N'Template', CAST(N'2020-04-22T11:52:39.147' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (219, -1, 1102, N'Template', CAST(N'2020-04-22T11:53:36.207' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (220, -1, 1074, N'DocumentType', CAST(N'2020-04-22T11:53:48.807' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (221, -1, 1097, N'Document', CAST(N'2020-04-22T11:53:58.580' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (222, -1, 1097, N'Document', CAST(N'2020-04-22T11:54:02.197' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (223, -1, 1103, N'Template', CAST(N'2020-04-22T11:58:11.567' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (224, -1, 1103, N'Template', CAST(N'2020-04-22T11:59:18.877' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (225, -1, 1070, N'DocumentType', CAST(N'2020-04-22T11:59:29.337' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (226, -1, 1070, N'DocumentType', CAST(N'2020-04-22T11:59:54.703' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (227, -1, 1070, N'DocumentType', CAST(N'2020-04-22T11:59:58.523' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (228, -1, 1095, N'Document', CAST(N'2020-04-22T12:00:10.080' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (229, -1, 1104, N'Template', CAST(N'2020-04-22T13:40:58.357' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (230, -1, 1104, N'Template', CAST(N'2020-04-22T13:41:00.043' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (231, -1, 1076, N'DocumentType', CAST(N'2020-04-22T13:41:15.417' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (232, -1, 1105, N'Template', CAST(N'2020-04-22T13:42:38.580' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (233, -1, 1105, N'Template', CAST(N'2020-04-22T13:44:06.357' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (234, -1, 1073, N'DocumentType', CAST(N'2020-04-22T13:44:15.353' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (235, -1, 1106, N'Media', CAST(N'2020-04-22T13:45:42.853' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (236, -1, 1107, N'Document', CAST(N'2020-04-22T13:46:01.787' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (237, -1, 1105, N'Template', CAST(N'2020-04-22T13:47:34.207' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (238, -1, 1100, N'Template', CAST(N'2020-04-22T13:49:37.607' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (239, -1, 1099, N'Template', CAST(N'2020-04-22T13:49:47.267' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (240, -1, 1103, N'Template', CAST(N'2020-04-22T13:49:54.427' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (241, -1, 1101, N'Template', CAST(N'2020-04-22T13:50:01.657' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (242, -1, 1105, N'Template', CAST(N'2020-04-22T13:50:10.187' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (243, -1, 1102, N'Template', CAST(N'2020-04-22T13:50:18.863' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (244, -1, 1105, N'Template', CAST(N'2020-04-22T14:00:27.117' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (245, -1, 1105, N'Template', CAST(N'2020-04-22T14:00:44.560' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (246, -1, 1105, N'Template', CAST(N'2020-04-22T14:01:19.257' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (247, -1, 1105, N'Template', CAST(N'2020-04-22T14:06:06.227' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (248, -1, 1105, N'Template', CAST(N'2020-04-22T14:06:14.280' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (249, -1, 1105, N'Template', CAST(N'2020-04-22T14:07:17.127' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (250, -1, 1105, N'Template', CAST(N'2020-04-22T14:09:46.120' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (251, -1, 1093, N'Document', CAST(N'2020-04-22T14:37:06.243' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (252, -1, 1093, N'Document', CAST(N'2020-04-22T14:47:00.537' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (253, -1, 1093, N'Document', CAST(N'2020-04-22T14:47:02.693' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (254, -1, 1093, N'Document', CAST(N'2020-04-22T14:50:37.413' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (255, -1, 1066, N'Document', CAST(N'2020-04-23T08:48:16.307' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (256, -1, 1066, N'Document', CAST(N'2020-04-23T08:48:19.927' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (257, -1, 1108, N'Document', CAST(N'2020-04-23T10:07:15.460' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (258, -1, 1066, N'Document', CAST(N'2020-04-23T10:18:17.933' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (259, -1, 1066, N'Document', CAST(N'2020-04-23T10:18:20.507' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (260, -1, 1066, N'Document', CAST(N'2020-04-23T10:20:27.690' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (261, -1, -1, N'PartialView', CAST(N'2020-04-23T16:25:19.193' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (262, -1, -1, N'PartialView', CAST(N'2020-04-23T16:33:53.607' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (263, -1, -1, N'PartialView', CAST(N'2020-04-23T16:35:59.910' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (264, -1, -1, N'PartialView', CAST(N'2020-04-23T16:36:21.707' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (265, -1, 1070, N'DocumentType', CAST(N'2020-04-24T11:27:57.827' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (266, -1, 1070, N'DocumentType', CAST(N'2020-04-24T11:28:51.080' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (267, -1, 1070, N'DocumentType', CAST(N'2020-04-24T11:28:56.307' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (268, -1, 1095, N'Document', CAST(N'2020-04-24T11:29:06.593' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (269, -1, 1070, N'DocumentType', CAST(N'2020-04-24T11:31:27.470' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (270, -1, 1095, N'Document', CAST(N'2020-04-24T14:05:58.313' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (271, -1, 1093, N'Document', CAST(N'2020-04-24T16:36:27.050' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (272, -1, 1093, N'Document', CAST(N'2020-04-24T16:36:47.777' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (273, -1, 1066, N'Document', CAST(N'2020-04-24T16:41:47.800' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (274, -1, 1070, N'DocumentType', CAST(N'2020-04-24T16:58:14.547' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (275, -1, 1109, N'Media', CAST(N'2020-04-24T16:58:53.603' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (276, -1, 1095, N'Document', CAST(N'2020-04-24T16:59:02.010' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (277, -1, 1095, N'Document', CAST(N'2020-04-24T16:59:06.003' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (278, -1, 1110, N'Media', CAST(N'2020-04-24T17:05:20.267' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (279, -1, 1074, N'DocumentType', CAST(N'2020-04-24T17:06:43.203' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (280, -1, 1097, N'Document', CAST(N'2020-04-24T17:06:54.723' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (281, -1, 1097, N'Document', CAST(N'2020-04-24T17:08:23.243' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (282, -1, 1097, N'Document', CAST(N'2020-04-24T17:08:24.153' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (283, -1, 1111, N'Media', CAST(N'2020-04-24T17:10:45.303' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (284, -1, 1093, N'Document', CAST(N'2020-04-24T17:10:52.943' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (285, -1, 1093, N'Document', CAST(N'2020-04-24T17:10:55.453' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (286, -1, 1093, N'Document', CAST(N'2020-04-24T17:13:47.397' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (287, -1, 1093, N'Document', CAST(N'2020-04-24T17:13:48.637' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (288, -1, 1112, N'DataType', CAST(N'2020-04-24T17:47:29.727' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (289, -1, 1088, N'DocumentType', CAST(N'2020-04-24T17:47:51.823' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (290, -1, -1, N'PartialView', CAST(N'2020-04-24T17:48:36.770' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (291, -1, 1066, N'Document', CAST(N'2020-04-24T17:48:51.070' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (292, -1, 1066, N'Document', CAST(N'2020-04-24T17:48:52.687' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (293, -1, -1, N'PartialView', CAST(N'2020-04-24T17:49:52.873' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (294, -1, 1113, N'Document', CAST(N'2020-04-27T09:31:06.287' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (295, -1, 1113, N'Document', CAST(N'2020-04-27T09:31:09.303' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (296, -1, 2, N'DictionaryItem', CAST(N'2020-04-27T09:47:21.633' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (297, -1, 3, N'Language', CAST(N'2020-04-27T09:48:03.513' AS DateTime), N'Save', N'Save Language', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (298, -1, 2, N'DictionaryItem', CAST(N'2020-04-27T09:48:19.123' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (299, -1, 3, N'DictionaryItem', CAST(N'2020-04-27T09:54:59.397' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (300, -1, 4, N'DictionaryItem', CAST(N'2020-04-27T09:55:47.270' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (301, -1, 3, N'DictionaryItem', CAST(N'2020-04-27T09:55:54.397' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (302, -1, 5, N'DictionaryItem', CAST(N'2020-04-27T10:02:09.890' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (303, -1, 5, N'DictionaryItem', CAST(N'2020-04-27T10:04:01.303' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (304, -1, 5, N'DictionaryItem', CAST(N'2020-04-27T10:04:55.920' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (305, -1, 6, N'DictionaryItem', CAST(N'2020-04-27T10:05:06.203' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (306, -1, 7, N'DictionaryItem', CAST(N'2020-04-27T10:07:03.583' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (307, -1, 7, N'DictionaryItem', CAST(N'2020-04-27T10:09:13.980' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (308, -1, 7, N'DictionaryItem', CAST(N'2020-04-27T10:12:02.747' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (309, -1, 7, N'DictionaryItem', CAST(N'2020-04-27T10:12:12.723' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (310, -1, 7, N'DictionaryItem', CAST(N'2020-04-27T10:13:13.960' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (311, -1, 7, N'DictionaryItem', CAST(N'2020-04-27T10:13:47.767' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (312, -1, 7, N'DictionaryItem', CAST(N'2020-04-27T10:14:46.363' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (313, -1, 8, N'DictionaryItem', CAST(N'2020-04-27T10:16:22.010' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (314, -1, 9, N'DictionaryItem', CAST(N'2020-04-27T10:16:54.993' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (315, -1, 10, N'DictionaryItem', CAST(N'2020-04-27T10:17:30.417' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (316, -1, 11, N'DictionaryItem', CAST(N'2020-04-27T10:19:42.787' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (317, -1, 1043, N'DataType', CAST(N'2020-04-27T10:23:54.613' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (318, -1, 1043, N'DataType', CAST(N'2020-04-27T10:26:30.080' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (319, -1, 1064, N'Media', CAST(N'2020-04-27T10:31:56.523' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (320, -1, 1064, N'Media', CAST(N'2020-04-27T10:41:56.900' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (321, -1, 1099, N'Template', CAST(N'2020-04-27T11:03:54.230' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (322, -1, 12, N'DictionaryItem', CAST(N'2020-04-27T11:32:38.737' AS DateTime), N'Save', N'Save DictionaryItem', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (323, -1, 1114, N'DocumentType', CAST(N'2020-04-27T11:37:01.133' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (324, -1, 1115, N'Template', CAST(N'2020-04-27T11:38:30.540' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (325, -1, 1116, N'DocumentType', CAST(N'2020-04-27T11:38:30.567' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (326, -1, 1114, N'DocumentType', CAST(N'2020-04-27T11:38:35.487' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (327, -1, 1116, N'DocumentType', CAST(N'2020-04-27T11:39:34.053' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (328, -1, 1116, N'DocumentType', CAST(N'2020-04-27T11:40:44.897' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (329, -1, 1052, N'DocumentType', CAST(N'2020-04-27T11:41:29.053' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (330, -1, 1117, N'Document', CAST(N'2020-04-27T11:42:41.273' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (331, -1, 1117, N'Document', CAST(N'2020-04-27T11:42:52.523' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (332, -1, 1117, N'Document', CAST(N'2020-04-27T11:43:07.327' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (333, -1, 1115, N'Template', CAST(N'2020-04-27T11:48:05.747' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (334, -1, 1118, N'Document', CAST(N'2020-04-27T11:54:45.303' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (335, -1, 1117, N'Document', CAST(N'2020-04-27T11:54:52.720' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (336, -1, 1118, N'Document', CAST(N'2020-04-27T11:54:57.023' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (337, -1, 1107, N'Document', CAST(N'2020-04-27T11:55:38.060' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (338, -1, 1096, N'Document', CAST(N'2020-04-27T11:56:03.553' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (339, -1, 1096, N'Document', CAST(N'2020-04-27T11:56:08.153' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (340, -1, 1111, N'Media', CAST(N'2020-04-27T11:59:38.803' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (341, -1, 1109, N'Media', CAST(N'2020-04-27T12:00:24.270' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (342, -1, 1095, N'Document', CAST(N'2020-04-27T12:00:28.940' AS DateTime), N'Publish', NULL, NULL)
SET IDENTITY_INSERT [dbo].[umbracoLog] OFF
GO
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (15, N'/media/x1qhmfb1/mikhail-vasilyev-nodtncsldte-unsplash.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (40, N'/media/lrrduolu/gif-image-1024-768-pixels.gif')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (54, N'/media/puljucwq/contact-bg.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (56, N'/media/p5zbiz33/matthew-waring-mds647i6-zm-unsplash.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (59, N'/media/ck2p41kz/ian-schneider-tammbr4okv4-unsplash.jpg')
GO
SET IDENTITY_INSERT [dbo].[umbracoNode] ON 

INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-99, N'8f1ef1e1-9de4-40d3-a072-6673f631ca64', -1, 1, N'-1,-99', 39, 0, -1, N'Label (decimal)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.133' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-98, N'a97cec69-9b71-4c30-8b12-ec398860d7e8', -1, 1, N'-1,-98', 38, 0, -1, N'Label (time)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.133' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-97, N'aa2c52a0-ce87-4e65-a47c-7df09358585d', -1, 1, N'-1,-97', 2, 0, -1, N'List View - Members', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.137' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-96, N'3a0156c4-3b8c-4803-bdc1-6871faa83fff', -1, 1, N'-1,-96', 2, 0, -1, N'List View - Media', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.137' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-95, N'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4', -1, 1, N'-1,-95', 2, 0, -1, N'List View - Content', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.137' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-94, N'0e9794eb-f9b5-4f20-a788-93acd233a7e4', -1, 1, N'-1,-94', 37, 0, -1, N'Label (datetime)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.133' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-93, N'930861bf-e262-4ead-a704-f99453565708', -1, 1, N'-1,-93', 36, 0, -1, N'Label (bigint)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.133' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-92, N'f0bc4bfb-b499-40d6-ba86-058885a5178c', -1, 1, N'-1,-92', 35, 0, -1, N'Label (string)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.130' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-91, N'8e7f995c-bd81-4627-9932-c40e568ec788', -1, 1, N'-1,-91', 36, 0, -1, N'Label (integer)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.133' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-90, N'84c6b441-31df-4ffe-b67e-67d5bc3ae65a', -1, 1, N'-1,-90', 34, 0, -1, N'Upload', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.133' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-89, N'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3', -1, 1, N'-1,-89', 33, 0, -1, N'Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.137' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-88, N'0cc0eba1-9960-42c9-bf9b-60e150b429ae', -1, 1, N'-1,-88', 32, 0, -1, N'Textstring', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.137' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-87, N'ca90c950-0aff-4e72-b976-a30b1ac57dad', -1, 1, N'-1,-87', 4, 0, -1, N'Richtext editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.137' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-51, N'2e6d3631-066e-44b8-aec4-96f09099b2b5', -1, 1, N'-1,-51', 2, 0, -1, N'Numeric', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.137' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-49, N'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49', -1, 1, N'-1,-49', 2, 0, -1, N'True/false', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.137' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-43, N'fbaf13a8-4036-41f2-93a3-974f678c312a', -1, 1, N'-1,-43', 2, 0, -1, N'Checkbox list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.137' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-42, N'f38f0ac7-1d27-439c-9f3f-089cd8825a53', -1, 1, N'-1,-42', 2, 0, -1, N'Dropdown multiple', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.137' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-41, N'5046194e-4237-453c-a547-15db3a07c4e1', -1, 1, N'-1,-41', 2, 0, -1, N'Date Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.137' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-40, N'bb5f57c9-ce2b-4bb9-b697-4caca783a805', -1, 1, N'-1,-40', 2, 0, -1, N'Radiobox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.137' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-39, N'0b6a45e7-44ba-430d-9da5-4e46060b9e03', -1, 1, N'-1,-39', 2, 0, -1, N'Dropdown', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.137' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-37, N'0225af17-b302-49cb-9176-b9f35cab9c17', -1, 1, N'-1,-37', 2, 0, -1, N'Approved Color', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.137' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-36, N'e4d66c0f-b935-4200-81f0-025f7256b89a', -1, 1, N'-1,-36', 2, 0, -1, N'Date Picker with time', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.137' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-21, N'bf7c7cbc-952f-4518-97a2-69e9c7b33842', -1, 0, N'-1,-21', 0, 0, -1, N'Recycle Bin', N'cf3d8e34-1c1c-41e9-ae56-878b57b32113', CAST(N'2020-04-20T14:32:49.130' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-20, N'0f582a79-1e41-4cf0-bfa0-76340651891a', -1, 0, N'-1,-20', 0, 0, -1, N'Recycle Bin', N'01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8', CAST(N'2020-04-20T14:32:49.130' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-1, N'916724a5-173d-4619-b97e-b9de133dd6f5', -1, 0, N'-1', 0, 0, -1, N'SYSTEM DATA: umbraco master root', N'ea7d8624-4cfe-4578-a871-24aa946bf34d', CAST(N'2020-04-20T14:32:49.127' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1031, N'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d', -1, 1, N'-1,1031', 2, 0, -1, N'Folder', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2020-04-20T14:32:49.140' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1032, N'cc07b313-0843-4aa8-bbda-871c8da728c8', -1, 1, N'-1,1032', 2, 0, -1, N'Image', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2020-04-20T14:32:49.140' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1033, N'4c52d8ab-54e6-40cd-999c-7a5f24903e4d', -1, 1, N'-1,1033', 2, 0, -1, N'File', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2020-04-20T14:32:49.140' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1041, N'b6b73142-b9c1-4bf8-a16d-e1c23320b549', -1, 1, N'-1,1041', 2, 0, -1, N'Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.140' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1043, N'1df9f033-e6d4-451f-b8d2-e0cbc50a836f', -1, 1, N'-1,1043', 2, 0, -1, N'Image Cropper', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.140' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1044, N'd59be02f-1df9-4228-aa1e-01917d806cda', -1, 1, N'-1,1044', 0, 0, -1, N'Member', N'9b5416fb-e72f-45a9-a07b-5a9a2709ce43', CAST(N'2020-04-20T14:32:49.140' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1046, N'fd1e0da5-5606-4862-b679-5d0cf3a52a59', -1, 1, N'-1,1046', 2, 0, -1, N'Content Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.140' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1047, N'1ea2e01f-ebd8-4ce1-8d71-6b1149e63548', -1, 1, N'-1,1047', 2, 0, -1, N'Member Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.140' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1048, N'135d60e0-64d9-49ed-ab08-893c9ba44ae5', -1, 1, N'-1,1048', 2, 0, -1, N'Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.140' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1049, N'9dbbcbbb-2327-434a-b355-af1b84e5010a', -1, 1, N'-1,1049', 2, 0, -1, N'Multiple Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.140' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1050, N'b4e3535a-1753-47e2-8568-602cf8cfee6f', -1, 1, N'-1,1050', 2, 0, -1, N'Multi URL Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T14:32:49.140' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1051, N'3d081146-b3f6-4071-931f-483fd926bf57', -1, 1, N'-1,1051', 0, 0, -1, N'Pages', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(N'2020-04-20T14:34:31.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1052, N'235771a7-c250-4363-82b9-0d68772dedd4', 1051, 2, N'-1,1051,1052', 0, 0, -1, N'Home', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-04-20T14:34:57.673' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1055, N'8c1eedb3-f9a0-4332-ba7e-00c8bb01e423', -1, 1, N'-1,1055', 0, 0, -1, N'Composition', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(N'2020-04-20T16:48:58.237' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1059, N'3f1fec9b-61d9-4b05-b426-a55126c67b4e', -1, 1, N'-1,1059', 0, 0, NULL, N'Master', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2020-04-20T16:59:35.890' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1060, N'b766ffda-95a3-4286-b978-a1e5c5dae5e4', 1059, 1, N'-1,1059,1060', 0, 0, NULL, N'Home', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2020-04-20T16:59:47.480' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1062, N'd1a63c4d-c972-4e65-99f1-911e37baffd6', -1, 1, N'-1,1062', 29, 0, -1, N'Basic Content Control - Title - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-20T17:37:42.987' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1063, N'623d3cbd-7d33-4a8a-bef0-bfbe34b0bd89', -1, 1, N'-1,1063', 30, 0, -1, N'Basic Content Control - Color Name - Dropdown', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-21T09:03:50.640' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1064, N'1466e1b8-a73b-4cf2-a1e9-177fce387b96', -1, 1, N'-1,1064', 0, 0, -1, N'Cat', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-04-21T09:31:43.137' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1065, N'3d321f6c-fc7d-4a72-aed3-f7fabb925f5b', -1, 1, N'-1,1065', 31, 0, -1, N'Basic Content Control - Main Content - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-21T10:26:40.873' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1066, N'094647f2-4487-4dd0-8b33-3dac3208f7a2', -1, 1, N'-1,1066', 0, 0, -1, N'Home', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-04-21T11:13:18.457' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1068, N'58650677-68f8-4b81-bf2d-932d5926b992', 1051, 2, N'-1,1051,1068', 1, 0, -1, N'Article', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-04-21T15:17:37.890' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1069, N'347c16f3-1956-48bb-ab9d-998cae8809b3', 1051, 2, N'-1,1051,1069', 2, 0, -1, N'Article List', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-04-21T15:18:08.930' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1070, N'c33477f9-f33c-41e9-911e-88463f145e4e', 1051, 2, N'-1,1051,1070', 3, 0, -1, N'Contact', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-04-21T15:18:46.973' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1071, N'61ee85c2-33cf-42c4-9254-58e9450419f1', 1051, 2, N'-1,1051,1071', 4, 0, -1, N'Content', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-04-21T15:19:20.770' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1073, N'fa695837-79ec-4055-8dfe-6a43361ea74c', 1051, 2, N'-1,1051,1073', 5, 0, -1, N'Error', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-04-21T15:20:44.223' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1074, N'fc568fc5-50b7-4b5e-a427-2d96d920b321', 1051, 2, N'-1,1051,1074', 6, 0, -1, N'Search', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-04-21T15:20:58.447' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1076, N'2b720de6-b76a-4444-af7c-859fa1f5cbf7', 1051, 2, N'-1,1051,1076', 7, 0, -1, N'XML Sitemap', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-04-21T15:22:52.047' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1078, N'df101349-b5cc-46c1-a1da-e1ac063593df', -1, 1, N'-1,1078', 32, 0, -1, N'Content Grid', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-21T15:49:02.620' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1080, N'dbbf77ae-5bb5-4833-a4d6-8d2767bb1f25', 1055, 2, N'-1,1055,1080', 1, 0, -1, N'Visibility Controls', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-04-21T15:58:33.597' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1082, N'a50c4716-5513-43b0-a5ee-dd48f0e26e30', 1055, 2, N'-1,1055,1082', 1, 0, -1, N'Content Controls', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-04-21T16:05:06.677' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1083, N'7574c82b-9e4e-4c50-a7fc-1865dd73adcc', 1055, 2, N'-1,1055,1083', 2, 0, -1, N'Article Controls', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-04-21T16:13:52.670' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1084, N'acb60269-1c45-4bb6-9bca-5b7928741875', 1055, 2, N'-1,1055,1084', 3, 0, -1, N'Header Controls', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-04-21T16:16:26.947' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1085, N'c46811f0-cca8-4518-b57b-b43f76a7284c', 1055, 2, N'-1,1055,1085', 4, 0, -1, N'Main Image Controls', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-04-21T16:19:38.263' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1086, N'79c64b58-2fb5-4249-be8a-315b6633b5ff', 1055, 2, N'-1,1055,1086', 5, 0, -1, N'SEO Controls', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-04-21T16:23:16.687' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1087, N'94cf119d-21bd-4158-850f-17bd25e44136', 1055, 2, N'-1,1055,1087', 6, 0, -1, N'Contact Form Controls', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-04-21T16:25:53.003' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1088, N'cff137cd-f961-4a3c-b581-da94cae57850', 1055, 2, N'-1,1055,1088', 7, 0, -1, N'Footer Controls', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-04-21T16:27:09.223' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1089, N'77a1420d-82ba-4c63-8318-6f52ad8ec6d3', -1, 1, N'-1,1089', 0, 0, -1, N'Elements', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(N'2020-04-21T16:27:19.540' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1090, N'5e122caf-159a-4e0b-b096-2ba775ed3269', -1, 1, N'-1,1090', 33, 0, -1, N'Single URL Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-21T16:34:51.687' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1091, N'5c4f682a-8657-4233-8b36-f11ae14f49f7', 1089, 2, N'-1,1089,1091', 0, 0, -1, N'Icon Link Item', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-04-21T16:35:45.347' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1092, N'2f12731a-8212-42f8-a60b-cb34df6a94cd', -1, 1, N'-1,1092', 34, 0, -1, N'Icon Link List', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-21T16:44:31.080' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1093, N'04f3a48a-d1db-4247-96d9-ce9c52f0a66e', 1066, 2, N'-1,1066,1093', 0, 0, -1, N'About', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-04-21T17:33:45.407' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1094, N'082105b9-5a39-4649-877c-f55785a2851a', 1066, 2, N'-1,1066,1094', 1, 0, -1, N'Blog', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-04-21T17:33:58.070' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1095, N'3b822c8a-ad72-4bf9-b5be-4f1d7777e219', 1066, 2, N'-1,1066,1095', 2, 0, -1, N'Contact', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-04-21T17:34:40.793' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1096, N'b2d1c20d-996b-4511-8386-d0d631a05c5d', 1066, 2, N'-1,1066,1096', 3, 0, -1, N'XML Sitemap', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-04-21T17:35:13.727' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1097, N'bee6aa6c-45a4-4993-9351-a43fe1cf64a1', 1066, 2, N'-1,1066,1097', 4, 0, -1, N'Search', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-04-21T17:35:33.043' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1098, N'6e790314-692d-431b-b855-e1eaa4fadd69', 1094, 3, N'-1,1066,1094,1098', 0, 0, -1, N'Test Article', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-04-21T17:46:25.873' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1099, N'b5a614ab-ba96-49e1-b0de-f18366631eea', 1059, 1, N'-1,1059,1099', 0, 0, NULL, N'Article List', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2020-04-22T11:05:45.317' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1100, N'd449410f-03b2-43b1-8227-bbfe87cf6a04', 1059, 1, N'-1,1059,1100', 0, 0, NULL, N'Article', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2020-04-22T11:07:12.513' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1101, N'03a4956b-c1c1-49da-a5a1-bf2211a3652e', 1059, 1, N'-1,1059,1101', 0, 0, NULL, N'Content', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2020-04-22T11:36:23.687' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1102, N'a60a41af-f346-4cf4-b269-7e6241790fbc', 1059, 1, N'-1,1059,1102', 0, 0, NULL, N'Search', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2020-04-22T11:43:46.680' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1103, N'820f7255-c620-4c79-a146-c56f0ae8bddb', 1059, 1, N'-1,1059,1103', 0, 0, NULL, N'Contact', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2020-04-22T11:58:11.557' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1104, N'bae5edc7-f891-4252-8d09-e552aea60053', -1, 1, N'-1,1104', 0, 0, NULL, N'XML Sitemap', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2020-04-22T13:40:58.333' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1105, N'19601b75-b8e3-463e-bf6f-adbc9e2b4ebf', 1059, 1, N'-1,1059,1105', 0, 0, NULL, N'Error', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2020-04-22T13:42:38.573' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1106, N'392a635a-d274-4d4c-9ba0-a09e653b203f', -1, 1, N'-1,1106', 1, 0, -1, N'(GIF Image, 1024 × 768 Pixels)', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-04-22T13:45:42.760' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1107, N'91988fc5-103a-4baa-812b-9a9f15102660', 1066, 2, N'-1,1066,1107', 0, 0, -1, N'Error', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-04-22T13:46:01.687' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1108, N'd7117e5a-bec8-435c-8ddc-8eb03a3769f8', 1094, 3, N'-1,1066,1094,1108', 1, 0, -1, N'My article test no 1', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-04-23T10:07:15.157' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1109, N'0a9a167b-4ad0-48c5-9242-13bb2c6ddf02', -1, 1, N'-1,1109', 2, 0, -1, N'Contact Bg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-04-24T16:58:53.113' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1110, N'6704f379-f9bd-4e60-a314-23212c57c8ec', -1, 1, N'-1,1110', 3, 0, -1, N'Matthew Waring Mds647i6 ZM Unsplash', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-04-24T17:05:20.097' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1111, N'6dffb914-df59-4ec7-b7e3-3039dd42e25c', -1, 1, N'-1,1111', 4, 0, -1, N'Ian Schneider Tammbr4okv4 Unsplash', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-04-24T17:10:45.110' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1112, N'4b03788c-6451-479e-97e9-874d230baf29', -1, 1, N'-1,1112', 35, 0, -1, N'Text custom', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-04-24T17:47:29.633' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1113, N'3bc217ee-5b26-41e4-b487-218d79902c33', 1094, 3, N'-1,1066,1094,1113', 2, 0, -1, N'Test article 2', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-04-27T09:31:05.923' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1114, N'8146f021-8d7f-4ea2-9f42-0220fbf53812', 1055, 2, N'-1,1055,1114', 8, 0, -1, N'Redirect Controls', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-04-27T11:37:01.063' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1115, N'1dab20cc-3a7d-415d-bdbc-19098c4ddd7a', -1, 1, N'-1,1115', 0, 0, NULL, N'Redirect', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2020-04-27T11:38:30.483' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1116, N'04169b8c-0c5d-42e8-987b-33063928c1ed', 1051, 2, N'-1,1051,1116', 8, 0, -1, N'Redirect', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-04-27T11:38:30.557' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1117, N'f3e0ae11-821c-4966-b439-453daf8d5938', 1066, 2, N'-1,1066,1117', 5, 0, -1, N'Links', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-04-27T11:42:41.173' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1118, N'29a50f1d-ac67-4fc5-b9f8-cbcb4d9382e2', 1117, 3, N'-1,1066,1117,1118', 0, 0, -1, N'Home Page', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-04-27T11:54:45.253' AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoNode] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoPropertyData] ON 

INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (184, 29, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (186, 29, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (208, 27, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (210, 27, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (212, 27, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (214, 27, 52, NULL, NULL, NULL, NULL, NULL, N'Test blog', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (216, 27, 53, NULL, NULL, NULL, NULL, NULL, N'asdasdasdasd', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (218, 27, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (220, 27, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (222, 32, 50, NULL, NULL, NULL, NULL, CAST(N'2020-04-21T12:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (224, 32, 51, NULL, NULL, NULL, NULL, NULL, N'Tung', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (226, 32, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (228, 32, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (230, 32, 52, NULL, NULL, NULL, NULL, NULL, N'Test', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (232, 32, 53, NULL, NULL, NULL, NULL, NULL, N'Blah bLah', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (234, 32, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (236, 32, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (238, 32, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (240, 33, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (241, 35, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (242, 33, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (243, 35, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (244, 33, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (245, 35, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (246, 33, 52, NULL, NULL, NULL, NULL, NULL, N'Test blog', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (247, 35, 52, NULL, NULL, NULL, NULL, NULL, N'Test blog', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (248, 33, 53, NULL, NULL, NULL, NULL, NULL, N'asdasdasdasd', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (249, 35, 53, NULL, NULL, NULL, NULL, NULL, N'asdasdasdasd', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (250, 33, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (251, 35, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (252, 33, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (253, 35, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (254, 34, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (255, 36, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (256, 34, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (257, 36, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (258, 34, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (259, 36, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (260, 34, 50, NULL, NULL, NULL, NULL, CAST(N'2020-04-21T12:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (261, 36, 50, NULL, NULL, NULL, NULL, CAST(N'2020-04-21T12:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (262, 34, 51, NULL, NULL, NULL, NULL, NULL, N'Tung', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (263, 36, 51, NULL, NULL, NULL, NULL, NULL, N'Tung', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (264, 34, 52, NULL, NULL, NULL, NULL, NULL, N'Test', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (265, 36, 52, NULL, NULL, NULL, NULL, NULL, N'Test', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (266, 34, 53, NULL, NULL, NULL, NULL, NULL, N'Blah bLah', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (267, 36, 53, NULL, NULL, NULL, NULL, NULL, N'Blah bLah', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (268, 34, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (269, 36, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (270, 34, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (271, 36, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (272, 26, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (274, 26, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (276, 26, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (278, 26, 52, NULL, NULL, NULL, NULL, NULL, N'About Page', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (280, 26, 53, NULL, NULL, NULL, NULL, NULL, N'Bla Blah', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (282, 26, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (284, 26, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (286, 28, 58, NULL, NULL, NULL, NULL, NULL, NULL, N'<p>Success</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (288, 28, 59, NULL, NULL, NULL, NULL, NULL, NULL, N'<p>Error</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (290, 40, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/lrrduolu/gif-image-1024-768-pixels.gif","crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (291, 40, 7, NULL, NULL, 1024, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (292, 40, 8, NULL, NULL, 768, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (293, 40, 9, NULL, NULL, NULL, NULL, NULL, N'149996', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (294, 40, 10, NULL, NULL, NULL, NULL, NULL, N'gif', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (295, 41, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (297, 41, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (299, 41, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (301, 41, 52, NULL, NULL, NULL, NULL, NULL, N'Page Not Found', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (303, 41, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/392a635ad2744d4c9ba0a09e653b203f')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (305, 41, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (307, 37, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (309, 37, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (311, 37, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Full","id":"cc6750e3-976a-fc03-b701-b7ed16bf070d","areas":[{"grid":"12","controls":[{"value":"<p>This is the full about content</p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (313, 37, 52, NULL, NULL, NULL, NULL, NULL, N'About Page', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (315, 37, 53, NULL, NULL, NULL, NULL, NULL, N'Bla Blah', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (317, 37, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (319, 37, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (328, 43, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (330, 43, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (332, 43, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Full","id":"cc6750e3-976a-fc03-b701-b7ed16bf070d","areas":[{"grid":"12","controls":[{"value":"<p>This is the full about content</p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Half","id":"536c7a04-21e3-5e73-d460-8324abd6c5f2","areas":[{"grid":"6","controls":[{"value":{"id":1064,"udi":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96","image":"/media/x1qhmfb1/mikhail-vasilyev-nodtncsldte-unsplash.jpg"},"editor":{"alias":"media","view":"media"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (334, 43, 52, NULL, NULL, NULL, NULL, NULL, N'About Page', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (336, 43, 53, NULL, NULL, NULL, NULL, NULL, N'Bla Blah', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (338, 43, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (340, 43, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (342, 44, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (344, 44, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (346, 44, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Full","id":"cc6750e3-976a-fc03-b701-b7ed16bf070d","areas":[{"grid":"12","controls":[{"value":"<p>This is the full about content</p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null},{"value":{"id":1064,"udi":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96","image":"/media/x1qhmfb1/mikhail-vasilyev-nodtncsldte-unsplash.jpg"},"editor":{"alias":"media","view":"media"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (348, 44, 52, NULL, NULL, NULL, NULL, NULL, N'About Page', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (350, 44, 53, NULL, NULL, NULL, NULL, NULL, N'Bla Blah', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (352, 44, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (354, 44, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (356, 25, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (358, 25, 52, NULL, NULL, NULL, NULL, NULL, N'This is the title', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (360, 25, 53, NULL, NULL, NULL, NULL, NULL, N'This is the subtitle', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (362, 25, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (364, 25, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (366, 25, 62, NULL, NULL, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (374, 47, 50, NULL, NULL, NULL, NULL, CAST(N'2020-04-23T12:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (375, 48, 50, NULL, NULL, NULL, NULL, CAST(N'2020-04-23T12:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (376, 47, 51, NULL, NULL, NULL, NULL, NULL, N'Author', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (377, 48, 51, NULL, NULL, NULL, NULL, NULL, N'Author', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (378, 47, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (379, 48, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (380, 47, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (381, 48, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (382, 47, 52, NULL, NULL, NULL, NULL, NULL, N'Title ', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (383, 48, 52, NULL, NULL, NULL, NULL, NULL, N'Title ', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (384, 47, 53, NULL, NULL, NULL, NULL, NULL, N'Subtitle', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (385, 48, 53, NULL, NULL, NULL, NULL, NULL, N'Subtitle', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (386, 47, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Full","id":"c96965bf-032b-8c9a-51b9-966d85fe7950","areas":[{"grid":"12","controls":[{"value":"Blah blah Blah Blah Blah Blah","editor":{"alias":"quote","view":"textstring"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (387, 48, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Full","id":"c96965bf-032b-8c9a-51b9-966d85fe7950","areas":[{"grid":"12","controls":[{"value":"Blah blah Blah Blah Blah Blah","editor":{"alias":"quote","view":"textstring"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (388, 47, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (389, 48, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (390, 47, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (391, 48, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (392, 46, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (394, 46, 52, NULL, NULL, NULL, NULL, NULL, N'This is the title', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (396, 46, 53, NULL, NULL, NULL, NULL, NULL, N'This is the subtitle', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (398, 46, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (400, 46, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (402, 46, 62, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"25dbd8bb-b77b-4850-b9d4-6013d7ebd8c6","name":"Item 1","ncContentTypeAlias":"iconLinkItem","iconClass":"fab fa-twitter","link":"[{\"name\":\"https://twitter.com/explore\",\"target\":\"_blank\",\"url\":\"https://twitter.com/explore\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (410, 49, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (412, 49, 52, NULL, NULL, NULL, NULL, NULL, N'This is the title', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (414, 49, 53, NULL, NULL, NULL, NULL, NULL, N'This is the subtitle', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (416, 49, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (418, 49, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (420, 49, 62, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"25dbd8bb-b77b-4850-b9d4-6013d7ebd8c6","name":"fab fa-twitter","ncContentTypeAlias":"iconLinkItem","iconClass":"fab fa-twitter","link":"[{\"name\":\"https://twitter.com/explore\",\"target\":\"_blank\",\"url\":\"https://twitter.com/explore\"}]"},{"key":"f7c0f6e5-085b-4e7d-ab40-5884b3b573a3","name":"Item 2","ncContentTypeAlias":"iconLinkItem","iconClass":"fas fa-share-alt","link":"[{\"name\":\"Share\",\"url\":\"/\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (422, 39, 58, NULL, NULL, NULL, NULL, NULL, NULL, N'<p>Success</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (424, 39, 59, NULL, NULL, NULL, NULL, NULL, NULL, N'<p>Error</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (430, 51, 58, NULL, NULL, NULL, NULL, NULL, NULL, N'<p>Message sent</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (432, 51, 59, NULL, NULL, NULL, NULL, NULL, NULL, N'<p>There was an error sending your message </p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (434, 45, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (436, 45, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (438, 45, 52, NULL, NULL, NULL, NULL, NULL, N'About this website', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (440, 45, 53, NULL, NULL, NULL, NULL, NULL, N'This is a test website', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (442, 45, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Full","id":"cc6750e3-976a-fc03-b701-b7ed16bf070d","areas":[{"grid":"12","controls":[{"value":"<p>This is the full about content</p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null},{"value":{"id":1064,"udi":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96","image":"/media/x1qhmfb1/mikhail-vasilyev-nodtncsldte-unsplash.jpg"},"editor":{"alias":"media","view":"media"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (444, 45, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (446, 45, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (466, 52, 58, NULL, NULL, NULL, NULL, NULL, NULL, N'<p>Message sent</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (468, 52, 59, NULL, NULL, NULL, NULL, NULL, NULL, N'<p>There was an error sending your message</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (470, 52, 65, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/0a9a167b4ad048c5924213bb2c6ddf02')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (472, 56, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/p5zbiz33/matthew-waring-mds647i6-zm-unsplash.jpg","crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (473, 56, 7, NULL, NULL, 4000, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (474, 56, 8, NULL, NULL, 6000, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (475, 56, 9, NULL, NULL, NULL, NULL, NULL, N'2100721', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (476, 56, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (477, 38, 66, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/6704f379f9bd4e60a31423212c57c8ec')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (479, 57, 66, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/6704f379f9bd4e60a31423212c57c8ec')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (480, 58, 66, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/6704f379f9bd4e60a31423212c57c8ec')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (486, 53, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (488, 53, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/6dffb914df594ec7b7e33039dd42e25c')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (490, 53, 52, NULL, NULL, NULL, NULL, NULL, N'About this website', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (492, 53, 53, NULL, NULL, NULL, NULL, NULL, N'This is a test website', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (494, 53, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Full","id":"cc6750e3-976a-fc03-b701-b7ed16bf070d","areas":[{"grid":"12","controls":[{"value":"<p>This is the full about content</p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null},{"value":{"id":1064,"udi":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96","image":"/media/x1qhmfb1/mikhail-vasilyev-nodtncsldte-unsplash.jpg"},"editor":{"alias":"media","view":"media"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (496, 53, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (498, 53, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (507, 60, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (509, 60, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/6dffb914df594ec7b7e33039dd42e25c')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (511, 60, 52, NULL, NULL, NULL, NULL, NULL, N'About Us', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (513, 60, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Full","id":"cc6750e3-976a-fc03-b701-b7ed16bf070d","areas":[{"grid":"12","controls":[{"value":"<p>This is the full about content</p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null},{"value":{"id":1064,"udi":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96","image":"/media/x1qhmfb1/mikhail-vasilyev-nodtncsldte-unsplash.jpg"},"editor":{"alias":"media","view":"media"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (515, 60, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (517, 60, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (519, 61, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (520, 61, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/6dffb914df594ec7b7e33039dd42e25c')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (521, 61, 52, NULL, NULL, NULL, NULL, NULL, N'About Us', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (522, 61, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Full","id":"cc6750e3-976a-fc03-b701-b7ed16bf070d","areas":[{"grid":"12","controls":[{"value":"<p>This is the full about content</p>","editor":{"alias":"rte","view":null},"styles":null,"config":null},{"value":{"id":1064,"udi":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96","image":"/media/x1qhmfb1/mikhail-vasilyev-nodtncsldte-unsplash.jpg"},"editor":{"alias":"media","view":null},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (523, 61, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (524, 61, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (525, 50, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (527, 50, 52, NULL, NULL, NULL, NULL, NULL, N'This is the title', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (529, 50, 53, NULL, NULL, NULL, NULL, NULL, N'This is the subtitle', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (531, 50, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (533, 50, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (535, 50, 62, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"25dbd8bb-b77b-4850-b9d4-6013d7ebd8c6","name":"fab fa-twitter","ncContentTypeAlias":"iconLinkItem","iconClass":"fab fa-twitter","link":"[{\"name\":\"https://twitter.com/explore\",\"target\":\"_blank\",\"url\":\"https://twitter.com/explore\"}]"},{"key":"f7c0f6e5-085b-4e7d-ab40-5884b3b573a3","name":"fas fa-share-alt","ncContentTypeAlias":"iconLinkItem","iconClass":"fas fa-share-alt","link":"[{\"name\":\"Share\",\"url\":\"/\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (537, 50, 67, NULL, NULL, NULL, NULL, NULL, N'asda', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (539, 62, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (540, 62, 52, NULL, NULL, NULL, NULL, NULL, N'This is the title', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (541, 62, 53, NULL, NULL, NULL, NULL, NULL, N'This is the subtitle', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (542, 62, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (543, 62, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (544, 62, 62, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"25dbd8bb-b77b-4850-b9d4-6013d7ebd8c6","name":"fab fa-twitter","ncContentTypeAlias":"iconLinkItem","iconClass":"fab fa-twitter","link":"[{\"name\":\"https://twitter.com/explore\",\"target\":\"_blank\",\"url\":\"https://twitter.com/explore\"}]"},{"key":"f7c0f6e5-085b-4e7d-ab40-5884b3b573a3","name":"fas fa-share-alt","ncContentTypeAlias":"iconLinkItem","iconClass":"fas fa-share-alt","link":"[{\"name\":\"Share\",\"url\":\"/\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (545, 62, 67, NULL, NULL, NULL, NULL, NULL, N'asda', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (546, 63, 50, NULL, NULL, NULL, NULL, CAST(N'2020-04-27T12:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (548, 63, 51, NULL, NULL, NULL, NULL, NULL, N'Tung', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (550, 63, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (552, 63, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (554, 63, 52, NULL, NULL, NULL, NULL, NULL, N'Blah blah 12345', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (556, 63, 53, NULL, NULL, NULL, NULL, NULL, N'Blah bLah', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (558, 63, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Full","id":"3bd53e8c-f7d5-7a3e-3197-9c3fcac42102","areas":[{"grid":"12","controls":[{"value":"<p>The quick brown fox jumps over the lazy dog</p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (560, 63, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (562, 63, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (564, 64, 50, NULL, NULL, NULL, NULL, CAST(N'2020-04-27T12:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (565, 64, 51, NULL, NULL, NULL, NULL, NULL, N'Tung', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (566, 64, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (567, 64, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (568, 64, 52, NULL, NULL, NULL, NULL, NULL, N'Blah blah 12345', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (569, 64, 53, NULL, NULL, NULL, NULL, NULL, N'Blah bLah', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (570, 64, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Full","id":"3bd53e8c-f7d5-7a3e-3197-9c3fcac42102","areas":[{"grid":"12","controls":[{"value":"<p>The quick brown fox jumps over the lazy dog</p>","editor":{"alias":"rte","view":null},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (571, 64, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (572, 64, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (578, 15, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "src": "/media/x1qhmfb1/mikhail-vasilyev-nodtncsldte-unsplash.jpg",
  "focalPoint": {
    "left": 0.503604226325664,
    "top": 0.54355898405033609
  },
  "crops": [
    {
      "alias": "PageHeader.Large",
      "width": 1903,
      "height": 532,
      "coordinates": {
        "x1": 0.0028123314718165177,
        "y1": 0.24937093040050046,
        "x2": 0,
        "y2": 0.3020417965604642
      }
    },
    {
      "alias": "PageHeader.Tiny",
      "width": 190,
      "height": 53,
      "coordinates": {
        "x1": 0,
        "y1": 0.24404950809266898,
        "x2": 0,
        "y2": 0.30959929178706846
      }
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (579, 15, 7, NULL, NULL, 5042, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (580, 15, 8, NULL, NULL, 3151, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (581, 15, 9, NULL, NULL, NULL, NULL, NULL, N'2697261', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (582, 15, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (599, 65, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (600, 67, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (601, 65, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (602, 67, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (603, 65, 68, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"name":"#","url":"#"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (604, 67, 68, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"name":"#","url":"#"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (605, 65, 69, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (606, 67, 69, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (607, 66, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (608, 68, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (609, 66, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (610, 68, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (611, 66, 68, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Home Page","url":"/"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (612, 68, 68, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Home Page","url":"/"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (613, 66, 69, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (614, 68, 69, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (615, 42, 46, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (616, 69, 46, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (617, 42, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (618, 69, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (619, 42, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (620, 69, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (621, 42, 52, NULL, NULL, NULL, NULL, NULL, N'Page Not Found', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (622, 69, 52, NULL, NULL, NULL, NULL, NULL, N'Page Not Found', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (623, 42, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/392a635ad2744d4c9ba0a09e653b203f')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (624, 69, 54, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/392a635ad2744d4c9ba0a09e653b203f')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (625, 42, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (626, 69, 57, NULL, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (627, 31, 46, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (629, 31, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (631, 70, 46, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (632, 71, 46, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (633, 70, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (634, 71, 47, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (635, 59, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "src": "/media/ck2p41kz/ian-schneider-tammbr4okv4-unsplash.jpg",
  "focalPoint": {
    "left": 0.5,
    "top": 0.5
  },
  "crops": [
    {
      "alias": "PageHeader.Large",
      "width": 1903,
      "height": 532,
      "coordinates": {
        "x1": 0,
        "y1": 0.44156706507304117,
        "x2": 0.0026595744680850812,
        "y2": 0.14076571625566389
      }
    },
    {
      "alias": "PageHeader.Tiny",
      "width": 190,
      "height": 53,
      "coordinates": {
        "x1": 0,
        "y1": 0.41786538058293138,
        "x2": 0,
        "y2": 0.16426923883413722
      }
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (636, 59, 7, NULL, NULL, 6016, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (637, 59, 8, NULL, NULL, 4016, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (638, 59, 9, NULL, NULL, NULL, NULL, NULL, N'6364894', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (639, 59, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (640, 54, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "src": "/media/puljucwq/contact-bg.jpg",
  "focalPoint": {
    "left": 0.5,
    "top": 0.5
  },
  "crops": [
    {
      "alias": "PageHeader.Large",
      "width": 1903,
      "height": 532,
      "coordinates": {
        "x1": 0,
        "y1": 0.14662808032973779,
        "x2": 0,
        "y2": 0.43414435516757227
      }
    },
    {
      "alias": "PageHeader.Tiny",
      "width": 190,
      "height": 53,
      "coordinates": {
        "x1": 0,
        "y1": 0.11049723756906077,
        "x2": 0,
        "y2": 0.47119179163378061
      }
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (641, 54, 7, NULL, NULL, 1900, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (642, 54, 8, NULL, NULL, 1267, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (643, 54, 9, NULL, NULL, NULL, NULL, NULL, N'500680', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (644, 54, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (645, 55, 58, NULL, NULL, NULL, NULL, NULL, NULL, N'<p>Message sent</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (646, 72, 58, NULL, NULL, NULL, NULL, NULL, NULL, N'<p>Message sent</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (647, 55, 59, NULL, NULL, NULL, NULL, NULL, NULL, N'<p>There was an error sending your message</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (648, 72, 59, NULL, NULL, NULL, NULL, NULL, NULL, N'<p>There was an error sending your message</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (649, 55, 65, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/0a9a167b4ad048c5924213bb2c6ddf02')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (650, 72, 65, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/0a9a167b4ad048c5924213bb2c6ddf02')
SET IDENTITY_INSERT [dbo].[umbracoPropertyData] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoRelation] ON 

INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (7, 1094, 1064, 4, CAST(N'2020-04-22T11:13:40.477' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (8, 1098, 1064, 4, CAST(N'2020-04-22T11:28:16.557' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (17, 1108, 1064, 4, CAST(N'2020-04-23T10:07:15.350' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (26, 1097, 1110, 4, CAST(N'2020-04-24T17:08:23.007' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (33, 1093, 1111, 4, CAST(N'2020-04-24T17:13:48.630' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (34, 1093, 1064, 4, CAST(N'2020-04-24T17:13:48.630' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (36, 1066, 1064, 4, CAST(N'2020-04-24T17:48:52.683' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (38, 1113, 1064, 4, CAST(N'2020-04-27T09:31:09.297' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (39, 1107, 1106, 4, CAST(N'2020-04-27T11:55:37.943' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (40, 1095, 1109, 4, CAST(N'2020-04-27T12:00:28.900' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[umbracoRelation] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoRelationType] ON 

INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (1, N'4cbeb612-e689-3563-b755-bf3ede295433', 1, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Document On Copy', N'relateDocumentOnCopy')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (2, N'0cc3507c-66ab-3091-8913-3d998148e423', 0, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Parent Document On Delete', N'relateParentDocumentOnDelete')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (3, N'8307994f-faf2-3844-bab9-72d34514edf2', 0, N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', N'Relate Parent Media Folder On Delete', N'relateParentMediaFolderOnDelete')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (4, N'4954ce93-3bf9-3d1e-9cd2-21bf9f9c2abf', 0, NULL, NULL, N'Related Media', N'umbMedia')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (5, N'0b93e414-5abe-36ec-a6bb-516e56f12238', 0, NULL, NULL, N'Related Document', N'umbDocument')
SET IDENTITY_INSERT [dbo].[umbracoRelationType] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoServer] ON 

INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isMaster]) VALUES (1, N'http://localhost:55940/umbraco', N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT', CAST(N'2020-04-20T14:33:30.313' AS DateTime), CAST(N'2020-04-27T12:01:48.793' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[umbracoServer] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoUser] ON 

INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userName], [userLogin], [userPassword], [passwordConfig], [userEmail], [userLanguage], [securityStampToken], [failedLoginAttempts], [lastLockoutDate], [lastPasswordChangeDate], [lastLoginDate], [emailConfirmedDate], [invitedDate], [createDate], [updateDate], [avatar], [tourData]) VALUES (-1, 0, 0, N'admin', N'admin@admin.com', N'3wOITCzIj2NJPoJWa8nFQQ==WpMyd1U3gnKln5SmPUj1V9D3fApJwtiNkuY1TNbZ7yE=', N'{"hashAlgorithm":"HMACSHA256"}', N'admin@admin.com', N'en-US', N'44344fba-b224-456d-b168-178e64a5db78', NULL, NULL, CAST(N'2020-04-20T14:32:49.953' AS DateTime), CAST(N'2020-04-27T11:26:41.323' AS DateTime), NULL, NULL, CAST(N'2020-04-20T14:32:49.070' AS DateTime), CAST(N'2020-04-27T11:26:41.343' AS DateTime), NULL, N'[{"alias":"umbIntroIntroduction","completed":false,"disabled":true},{"alias":"umbEmailMarketing","completed":false,"disabled":true}]')
SET IDENTITY_INSERT [dbo].[umbracoUser] OFF
GO
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (-1, 1)
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (-1, 5)
GO
SET IDENTITY_INSERT [dbo].[umbracoUserGroup] ON 

INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (1, N'admin', N'Administrators', N'CADMOSKTPIURZ:5F7ï', CAST(N'2020-04-20T14:32:49.507' AS DateTime), CAST(N'2020-04-20T14:32:49.507' AS DateTime), N'icon-medal', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (2, N'writer', N'Writers', N'CAH:F', CAST(N'2020-04-20T14:32:49.513' AS DateTime), CAST(N'2020-04-20T14:32:49.513' AS DateTime), N'icon-edit', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (3, N'editor', N'Editors', N'CADMOSKTPUZ:5Fï', CAST(N'2020-04-20T14:32:49.513' AS DateTime), CAST(N'2020-04-20T14:32:49.513' AS DateTime), N'icon-tools', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (4, N'translator', N'Translators', N'AF', CAST(N'2020-04-20T14:32:49.513' AS DateTime), CAST(N'2020-04-20T14:32:49.513' AS DateTime), N'icon-globe', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (5, N'sensitiveData', N'Sensitive data', N'', CAST(N'2020-04-20T14:32:49.513' AS DateTime), CAST(N'2020-04-20T14:32:49.513' AS DateTime), N'icon-lock', -1, -1)
SET IDENTITY_INSERT [dbo].[umbracoUserGroup] OFF
GO
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'forms')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'media')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'member')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'packages')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'settings')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'translation')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'users')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (2, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'forms')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'media')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (4, N'translation')
GO
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'9afac2ed-8b27-4687-bc41-013fbec70195', -1, CAST(N'2020-04-20T07:34:08.850' AS DateTime), CAST(N'2020-04-20T07:37:39.797' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'0bd1de45-afa4-46c8-8224-025fd9569de4', -1, CAST(N'2020-04-24T08:28:59.453' AS DateTime), CAST(N'2020-04-24T08:28:59.540' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'bb92138b-9a2f-4fae-ab2f-084253654692', -1, CAST(N'2020-04-24T10:45:11.963' AS DateTime), CAST(N'2020-04-24T10:49:49.213' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'6be8fd7e-e9be-4720-9374-0d9b3f4923a2', -1, CAST(N'2020-04-22T09:54:19.653' AS DateTime), CAST(N'2020-04-22T09:54:19.957' AS DateTime), NULL, N'127.0.0.1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'b1f87238-f40c-40fc-8159-1af1e1fb145b', -1, CAST(N'2020-04-24T04:46:26.823' AS DateTime), CAST(N'2020-04-24T04:46:26.823' AS DateTime), NULL, N'127.0.0.1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'20e86ba2-f940-49c9-872d-20e3d7734419', -1, CAST(N'2020-04-22T09:09:35.213' AS DateTime), CAST(N'2020-04-22T09:10:57.997' AS DateTime), NULL, N'127.0.0.1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'473d7799-409f-4206-8dd4-2237c7039790', -1, CAST(N'2020-04-27T02:18:06.583' AS DateTime), CAST(N'2020-04-27T03:31:56.167' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'9ea33a4b-3523-45d9-9e5c-2b940262e0fb', -1, CAST(N'2020-04-24T08:02:59.887' AS DateTime), CAST(N'2020-04-24T08:02:59.967' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'4c88a5af-3175-4553-b6c0-2bcfb2b7beef', -1, CAST(N'2020-04-22T06:34:51.277' AS DateTime), CAST(N'2020-04-22T07:15:57.053' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'2d5eebe4-9332-43f3-8c11-3296c2066d2d', -1, CAST(N'2020-04-20T09:35:27.617' AS DateTime), CAST(N'2020-04-20T10:51:11.967' AS DateTime), NULL, N'127.0.0.1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'd8d08e94-385a-458d-8165-388cd22f1f6b', -1, CAST(N'2020-04-24T09:23:24.697' AS DateTime), CAST(N'2020-04-24T10:23:50.347' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'fc0c298f-aa2b-4d7b-8097-3cdbc3adb994', -1, CAST(N'2020-04-24T06:55:58.803' AS DateTime), CAST(N'2020-04-24T07:05:57.993' AS DateTime), NULL, N'127.0.0.1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'c32b5bb5-920b-46b1-b990-40e832e868a1', -1, CAST(N'2020-04-21T08:11:25.663' AS DateTime), CAST(N'2020-04-21T08:24:25.973' AS DateTime), CAST(N'2020-04-21T08:24:26.987' AS DateTime), N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'c0b5bab4-dc1b-453f-ba81-413e73b28243', -1, CAST(N'2020-04-22T08:29:44.643' AS DateTime), CAST(N'2020-04-22T08:36:00.950' AS DateTime), NULL, N'127.0.0.1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'e25df579-147d-41b5-b56d-42724c1356f4', -1, CAST(N'2020-04-27T03:40:30.147' AS DateTime), CAST(N'2020-04-27T04:06:52.760' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'9f426454-e202-4db1-ae1c-4b4ea32994aa', -1, CAST(N'2020-04-21T01:50:47.387' AS DateTime), CAST(N'2020-04-21T03:37:25.617' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'f87f6c16-f3a6-4c6d-984c-629162d0466e', -1, CAST(N'2020-04-21T07:39:46.857' AS DateTime), CAST(N'2020-04-21T07:50:20.823' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'c6ae706e-b8b1-488e-a06e-6661fd660dc5', -1, CAST(N'2020-04-23T09:24:49.477' AS DateTime), CAST(N'2020-04-23T09:35:59.880' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'b1c5b730-5342-4504-87f9-806709c7e15c', -1, CAST(N'2020-04-27T04:26:42.260' AS DateTime), CAST(N'2020-04-27T05:00:07.033' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'c4fbcd05-3a92-41f3-8a6f-8ca5fe8b526d', -1, CAST(N'2020-04-21T06:34:56.783' AS DateTime), CAST(N'2020-04-21T07:19:48.223' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'b3bfe49c-1f72-4337-95bb-95f33c00d29b', -1, CAST(N'2020-04-22T03:52:06.467' AS DateTime), CAST(N'2020-04-22T04:59:18.647' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'c4e2c288-5a45-48f9-a226-96c491c190e4', -1, CAST(N'2020-04-22T07:28:21.227' AS DateTime), CAST(N'2020-04-22T07:50:11.117' AS DateTime), NULL, N'127.0.0.1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'59074788-6449-4ddd-8159-9ef52e929566', -1, CAST(N'2020-04-22T03:46:37.563' AS DateTime), CAST(N'2020-04-22T03:46:37.563' AS DateTime), CAST(N'2020-04-22T03:46:48.607' AS DateTime), N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'3d26985f-3bef-4fa4-8a49-b3380030e925', -1, CAST(N'2020-04-22T02:49:46.893' AS DateTime), CAST(N'2020-04-22T02:59:44.450' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'82c866ee-1be2-4124-a14e-c764ca6eccf3', -1, CAST(N'2020-04-21T08:25:30.970' AS DateTime), CAST(N'2020-04-21T09:02:31.233' AS DateTime), CAST(N'2020-04-21T09:02:34.073' AS DateTime), N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'dda35da3-d420-432c-905d-d1cb7001a6ce', -1, CAST(N'2020-04-21T09:03:59.687' AS DateTime), CAST(N'2020-04-21T10:06:23.477' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'af054a9e-ba44-43ab-bb58-d49bb56be09e', -1, CAST(N'2020-04-22T01:20:29.270' AS DateTime), CAST(N'2020-04-22T01:23:13.860' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'b5f45264-a419-4333-9b91-e0537495a6c5', -1, CAST(N'2020-04-24T03:12:46.357' AS DateTime), CAST(N'2020-04-24T03:39:56.100' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'e8f08297-9291-4e87-aa5e-e29f195509eb', -1, CAST(N'2020-04-23T01:44:06.597' AS DateTime), CAST(N'2020-04-23T03:55:29.560' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'59bdb822-9f48-4150-bc93-f63c03ffe311', -1, CAST(N'2020-04-21T10:19:06.020' AS DateTime), CAST(N'2020-04-21T10:46:17.330' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'30edf8a7-a1ca-450b-b650-f72366b47dcc', -1, CAST(N'2020-04-21T04:06:36.957' AS DateTime), CAST(N'2020-04-21T05:00:44.127' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'bb98dbdb-e792-4d2e-baac-f783169b76e1', -1, CAST(N'2020-04-24T03:39:57.947' AS DateTime), CAST(N'2020-04-24T03:41:00.757' AS DateTime), NULL, N'127.0.0.1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'36a2603a-7e7b-4f87-915e-fa61afd46166', -1, CAST(N'2020-04-24T04:26:49.227' AS DateTime), CAST(N'2020-04-24T04:46:08.910' AS DateTime), NULL, N'127.0.0.1')
GO
/****** Object:  Index [IX_cmsContentType]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [IX_cmsContentType] UNIQUE NONCLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsContentType_icon]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsContentType_icon] ON [dbo].[cmsContentType]
(
	[icon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDictionary_id]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[cmsDictionary] ADD  CONSTRAINT [IX_cmsDictionary_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsDictionary_key]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsDictionary_key] ON [dbo].[cmsDictionary]
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsMacro_UniqueId]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [IX_cmsMacro_UniqueId] UNIQUE NONCLUSTERED 
(
	[uniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsMacroPropertyAlias]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [IX_cmsMacroPropertyAlias] UNIQUE NONCLUSTERED 
(
	[macroAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsMacroProperty_Alias]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[cmsMacroProperty] ADD  CONSTRAINT [IX_cmsMacroProperty_Alias] UNIQUE NONCLUSTERED 
(
	[macro] ASC,
	[macroPropertyAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsMacroProperty_UniquePropertyId]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[cmsMacroProperty] ADD  CONSTRAINT [IX_cmsMacroProperty_UniquePropertyId] UNIQUE NONCLUSTERED 
(
	[uniquePropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsMember_LoginName]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsMember_LoginName] ON [dbo].[cmsMember]
(
	[LoginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyTypeUniqueID]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [IX_cmsPropertyTypeUniqueID] UNIQUE NONCLUSTERED 
(
	[UniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsPropertyTypeAlias]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsPropertyTypeAlias] ON [dbo].[cmsPropertyType]
(
	[Alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyTypeGroupUniqueID]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[cmsPropertyTypeGroup] ADD  CONSTRAINT [IX_cmsPropertyTypeGroupUniqueID] UNIQUE NONCLUSTERED 
(
	[uniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsTags]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[cmsTags] ADD  CONSTRAINT [IX_cmsTags] UNIQUE NONCLUSTERED 
(
	[group] ASC,
	[tag] ASC,
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsTags_LanguageId]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsTags_LanguageId] ON [dbo].[cmsTags]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsTemplate_nodeId]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[cmsTemplate] ADD  CONSTRAINT [IX_cmsTemplate_nodeId] UNIQUE NONCLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoAccess_nodeId]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [IX_umbracoAccess_nodeId] UNIQUE NONCLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoAccessRule]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [IX_umbracoAccessRule] UNIQUE NONCLUSTERED 
(
	[ruleValue] ASC,
	[ruleType] ASC,
	[accessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoContentVersion_NodeId]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoContentVersion_NodeId] ON [dbo].[umbracoContentVersion]
(
	[nodeId] ASC,
	[current] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoContentVersionCultureVariation_VersionId]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] ADD  CONSTRAINT [IX_umbracoContentVersionCultureVariation_VersionId] UNIQUE NONCLUSTERED 
(
	[versionId] ASC,
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoContentVersionCultureVariation_LanguageId]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoContentVersionCultureVariation_LanguageId] ON [dbo].[umbracoContentVersionCultureVariation]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoDocument_Published]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoDocument_Published] ON [dbo].[umbracoDocument]
(
	[published] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoDocumentCultureVariation_NodeId]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[umbracoDocumentCultureVariation] ADD  CONSTRAINT [IX_umbracoDocumentCultureVariation_NodeId] UNIQUE NONCLUSTERED 
(
	[nodeId] ASC,
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoDocumentCultureVariation_LanguageId]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoDocumentCultureVariation_LanguageId] ON [dbo].[umbracoDocumentCultureVariation]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoLanguage_languageISOCode]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[umbracoLanguage] ADD  CONSTRAINT [IX_umbracoLanguage_languageISOCode] UNIQUE NONCLUSTERED 
(
	[languageISOCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoLanguage_fallbackLanguageId]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoLanguage_fallbackLanguageId] ON [dbo].[umbracoLanguage]
(
	[fallbackLanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoLog]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoLog] ON [dbo].[umbracoLog]
(
	[NodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoMediaVersion]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[umbracoMediaVersion] ADD  CONSTRAINT [IX_umbracoMediaVersion] UNIQUE NONCLUSTERED 
(
	[id] ASC,
	[path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_UniqueId]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [IX_umbracoNode_UniqueId] UNIQUE NONCLUSTERED 
(
	[uniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_ObjectType]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_ObjectType] ON [dbo].[umbracoNode]
(
	[nodeObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_ParentId]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_ParentId] ON [dbo].[umbracoNode]
(
	[parentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoNode_Path]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_Path] ON [dbo].[umbracoNode]
(
	[path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_Trashed]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_Trashed] ON [dbo].[umbracoNode]
(
	[trashed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoPropertyData_VersionId]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[umbracoPropertyData] ADD  CONSTRAINT [IX_umbracoPropertyData_VersionId] UNIQUE NONCLUSTERED 
(
	[versionId] ASC,
	[propertyTypeId] ASC,
	[languageId] ASC,
	[segment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoPropertyData_LanguageId]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoPropertyData_LanguageId] ON [dbo].[umbracoPropertyData]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoPropertyData_PropertyTypeId]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoPropertyData_PropertyTypeId] ON [dbo].[umbracoPropertyData]
(
	[propertyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoPropertyData_Segment]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoPropertyData_Segment] ON [dbo].[umbracoPropertyData]
(
	[segment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoRedirectUrl]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[umbracoRedirectUrl] ADD  CONSTRAINT [IX_umbracoRedirectUrl] UNIQUE NONCLUSTERED 
(
	[urlHash] ASC,
	[contentKey] ASC,
	[culture] ASC,
	[createDateUtc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoRelation_parentChildType]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[umbracoRelation] ADD  CONSTRAINT [IX_umbracoRelation_parentChildType] UNIQUE NONCLUSTERED 
(
	[parentId] ASC,
	[childId] ASC,
	[relType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoRelationType_alias]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[umbracoRelationType] ADD  CONSTRAINT [IX_umbracoRelationType_alias] UNIQUE NONCLUSTERED 
(
	[alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoRelationType_name]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[umbracoRelationType] ADD  CONSTRAINT [IX_umbracoRelationType_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoRelationType_UniqueId]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[umbracoRelationType] ADD  CONSTRAINT [IX_umbracoRelationType_UniqueId] UNIQUE NONCLUSTERED 
(
	[typeUniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_computerName]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[umbracoServer] ADD  CONSTRAINT [IX_computerName] UNIQUE NONCLUSTERED 
(
	[computerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoServer_isActive]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoServer_isActive] ON [dbo].[umbracoServer]
(
	[isActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoUser_userLogin]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUser_userLogin] ON [dbo].[umbracoUser]
(
	[userLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoUserGroup_userGroupAlias]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[umbracoUserGroup] ADD  CONSTRAINT [IX_umbracoUserGroup_userGroupAlias] UNIQUE NONCLUSTERED 
(
	[userGroupAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoUserGroup_userGroupName]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[umbracoUserGroup] ADD  CONSTRAINT [IX_umbracoUserGroup_userGroupName] UNIQUE NONCLUSTERED 
(
	[userGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoUser2NodePermission_nodeId]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUser2NodePermission_nodeId] ON [dbo].[umbracoUserGroup2NodePermission]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoUserLogin_lastValidatedUtc]    Script Date: 4/27/2020 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUserLogin_lastValidatedUtc] ON [dbo].[umbracoUserLogin]
(
	[lastValidatedUtc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoUserStartNode_startNodeType]    Script Date: 4/27/2020 12:02:46 PM ******/
ALTER TABLE [dbo].[umbracoUserStartNode] ADD  CONSTRAINT [IX_umbracoUserStartNode_startNodeType] UNIQUE NONCLUSTERED 
(
	[startNodeType] ASC,
	[startNode] ASC,
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  DEFAULT ('folder.png') FOR [thumbnail]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  DEFAULT ('0') FOR [isContainer]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  DEFAULT ('0') FOR [isElement]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  DEFAULT ('0') FOR [allowAtRoot]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  DEFAULT ('1') FOR [variations]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] ADD  DEFAULT ('0') FOR [SortOrder]
GO
ALTER TABLE [dbo].[cmsDocumentType] ADD  DEFAULT ('0') FOR [IsDefault]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  DEFAULT ('0') FOR [macroUseInEditor]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  DEFAULT ('0') FOR [macroRefreshRate]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  DEFAULT ('1') FOR [macroCacheByPage]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  DEFAULT ('0') FOR [macroCachePersonalized]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  DEFAULT ('0') FOR [macroDontRender]
GO
ALTER TABLE [dbo].[cmsMacroProperty] ADD  DEFAULT ('0') FOR [macroPropertySortOrder]
GO
ALTER TABLE [dbo].[cmsMember] ADD  DEFAULT ('''') FOR [Email]
GO
ALTER TABLE [dbo].[cmsMember] ADD  DEFAULT ('''') FOR [LoginName]
GO
ALTER TABLE [dbo].[cmsMember] ADD  DEFAULT ('''') FOR [Password]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  DEFAULT ('0') FOR [memberCanEdit]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  DEFAULT ('0') FOR [viewOnProfile]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  DEFAULT ('0') FOR [isSensitive]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  DEFAULT ('0') FOR [mandatory]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  DEFAULT ('1') FOR [variations]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  DEFAULT (newid()) FOR [UniqueID]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] ADD  DEFAULT (newid()) FOR [uniqueID]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAudit] ADD  DEFAULT (getdate()) FOR [eventDateUtc]
GO
ALTER TABLE [dbo].[umbracoCacheInstruction] ADD  DEFAULT ('1') FOR [instructionCount]
GO
ALTER TABLE [dbo].[umbracoConsent] ADD  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoContentVersion] ADD  DEFAULT (getdate()) FOR [versionDate]
GO
ALTER TABLE [dbo].[umbracoExternalLogin] ADD  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoKeyValue] ADD  DEFAULT (getdate()) FOR [updated]
GO
ALTER TABLE [dbo].[umbracoLanguage] ADD  DEFAULT ('0') FOR [isDefaultVariantLang]
GO
ALTER TABLE [dbo].[umbracoLanguage] ADD  DEFAULT ('0') FOR [mandatory]
GO
ALTER TABLE [dbo].[umbracoLog] ADD  DEFAULT (getdate()) FOR [Datestamp]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  DEFAULT (newid()) FOR [uniqueId]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  DEFAULT ('0') FOR [trashed]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoRelation] ADD  DEFAULT (getdate()) FOR [datetime]
GO
ALTER TABLE [dbo].[umbracoServer] ADD  DEFAULT (getdate()) FOR [registeredDate]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  DEFAULT ('0') FOR [userDisabled]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  DEFAULT ('0') FOR [userNoConsole]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoUserGroup] ADD  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoUserGroup] ADD  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[cmsContentNu]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentNu_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cmsContentNu] CHECK CONSTRAINT [FK_cmsContentNu_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[cmsContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType] CHECK CONSTRAINT [FK_cmsContentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY([childContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY([parentContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType] FOREIGN KEY([Id])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1] FOREIGN KEY([AllowedId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1]
GO
ALTER TABLE [dbo].[cmsDictionary]  WITH CHECK ADD  CONSTRAINT [FK_cmsDictionary_cmsDictionary_id] FOREIGN KEY([parent])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsDictionary] CHECK CONSTRAINT [FK_cmsDictionary_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId] FOREIGN KEY([templateNodeId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id] FOREIGN KEY([UniqueId])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[cmsMacroProperty]  WITH CHECK ADD  CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY([macro])
REFERENCES [dbo].[cmsMacro] ([id])
GO
ALTER TABLE [dbo].[cmsMacroProperty] CHECK CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id]
GO
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY([Member])
REFERENCES [dbo].[cmsMember] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY([MemberGroup])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY([NodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY([propertyTypeGroupId])
REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_umbracoDataType_nodeId] FOREIGN KEY([dataTypeId])
REFERENCES [dbo].[umbracoDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_umbracoDataType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId] FOREIGN KEY([contenttypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] CHECK CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsContent] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsContent]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY([tagId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsTags_id]
GO
ALTER TABLE [dbo].[cmsTags]  WITH CHECK ADD  CONSTRAINT [FK_cmsTags_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[cmsTags] CHECK CONSTRAINT [FK_cmsTags_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[cmsTemplate]  WITH CHECK ADD  CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTemplate] CHECK CONSTRAINT [FK_cmsTemplate_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY([loginNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id1]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY([noAccessNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id2]
GO
ALTER TABLE [dbo].[umbracoAccessRule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY([accessId])
REFERENCES [dbo].[umbracoAccess] ([id])
GO
ALTER TABLE [dbo].[umbracoAccessRule] CHECK CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id]
GO
ALTER TABLE [dbo].[umbracoContent]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContent_cmsContentType_NodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoContent] CHECK CONSTRAINT [FK_umbracoContent_cmsContentType_NodeId]
GO
ALTER TABLE [dbo].[umbracoContent]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContent_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoContent] CHECK CONSTRAINT [FK_umbracoContent_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoContentSchedule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentSchedule_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoContentSchedule] CHECK CONSTRAINT [FK_umbracoContentSchedule_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[umbracoContentSchedule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentSchedule_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoContentSchedule] CHECK CONSTRAINT [FK_umbracoContentSchedule_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersion_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoContentVersion] CHECK CONSTRAINT [FK_umbracoContentVersion_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[umbracoContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersion_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersion] CHECK CONSTRAINT [FK_umbracoContentVersion_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoContentVersion_id] FOREIGN KEY([versionId])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoUser_id] FOREIGN KEY([availableUserId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoDataType]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDataType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDataType] CHECK CONSTRAINT [FK_umbracoDataType_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoDocument]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocument_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoDocument] CHECK CONSTRAINT [FK_umbracoDocument_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation] CHECK CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation] CHECK CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoDocumentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentVersion_cmsTemplate_nodeId] FOREIGN KEY([templateId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoDocumentVersion] CHECK CONSTRAINT [FK_umbracoDocumentVersion_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[umbracoDocumentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentVersion_umbracoContentVersion_id] FOREIGN KEY([id])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoDocumentVersion] CHECK CONSTRAINT [FK_umbracoDocumentVersion_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoDomain]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDomain_umbracoNode_id] FOREIGN KEY([domainRootStructureID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDomain] CHECK CONSTRAINT [FK_umbracoDomain_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoLanguage]  WITH CHECK ADD  CONSTRAINT [FK_umbracoLanguage_umbracoLanguage_id] FOREIGN KEY([fallbackLanguageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoLanguage] CHECK CONSTRAINT [FK_umbracoLanguage_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoLog]  WITH CHECK ADD  CONSTRAINT [FK_umbracoLog_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoLog] CHECK CONSTRAINT [FK_umbracoLog_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoMediaVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoMediaVersion_umbracoContentVersion_id] FOREIGN KEY([id])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoMediaVersion] CHECK CONSTRAINT [FK_umbracoMediaVersion_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoUser_id] FOREIGN KEY([nodeUser])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_cmsPropertyType_id] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_cmsPropertyType_id]
GO
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_umbracoContentVersion_id] FOREIGN KEY([versionId])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoRedirectUrl]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID] FOREIGN KEY([contentKey])
REFERENCES [dbo].[umbracoNode] ([uniqueId])
GO
ALTER TABLE [dbo].[umbracoRedirectUrl] CHECK CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY([childId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode1]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY([relType])
REFERENCES [dbo].[umbracoRelationType] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup] CHECK CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup] CHECK CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_startContentId_umbracoNode_id] FOREIGN KEY([startContentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup] CHECK CONSTRAINT [FK_startContentId_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_startMediaId_umbracoNode_id] FOREIGN KEY([startMediaId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup] CHECK CONSTRAINT [FK_startMediaId_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2App]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2App] CHECK CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission] CHECK CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission] CHECK CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserLogin]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUserLogin] CHECK CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUserStartNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id] FOREIGN KEY([startNode])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserStartNode] CHECK CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserStartNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUserStartNode] CHECK CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id]
GO
USE [master]
GO
ALTER DATABASE [UmbracoDemo] SET  READ_WRITE 
GO
