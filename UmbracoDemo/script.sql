-- Script Date: 4/22/2020 5:38 PM  - ErikEJ.SqlCeScripting version 3.5.2.86
-- Database information:
-- Locale Identifier: 1033
-- Encryption Mode: 
-- Case Sensitive: False
-- Database: C:\Users\tungnh\source\repos\UmbracoDemo\UmbracoDemo\App_Data\UmbracoDemo.sdf
-- ServerVersion: 4.0.8876.1
-- DatabaseSize: 2.25 MB
-- SpaceAvailable: 3.997 GB
-- Created: 4/22/2020 10:20 AM

-- User Table information:
-- Number of tables: 51
-- cmsContentNu: 18 row(s)
-- cmsContentType: 21 row(s)
-- cmsContentType2ContentType: 28 row(s)
-- cmsContentTypeAllowedContentType: 10 row(s)
-- cmsDictionary: 0 row(s)
-- cmsDocumentType: 8 row(s)
-- cmsLanguageText: 0 row(s)
-- cmsMacro: 0 row(s)
-- cmsMacroProperty: 0 row(s)
-- cmsMember: 0 row(s)
-- cmsMember2MemberGroup: 0 row(s)
-- cmsMemberType: 0 row(s)
-- cmsPropertyType: 33 row(s)
-- cmsPropertyTypeGroup: 12 row(s)
-- cmsTagRelationship: 0 row(s)
-- cmsTags: 0 row(s)
-- cmsTemplate: 9 row(s)
-- umbracoAccess: 0 row(s)
-- umbracoAccessRule: 0 row(s)
-- umbracoAudit: 48 row(s)
-- umbracoCacheInstruction: 196 row(s)
-- umbracoConsent: 0 row(s)
-- umbracoContent: 10 row(s)
-- umbracoContentSchedule: 0 row(s)
-- umbracoContentVersion: 25 row(s)
-- umbracoContentVersionCultureVariation: 4 row(s)
-- umbracoDataType: 35 row(s)
-- umbracoDocument: 8 row(s)
-- umbracoDocumentCultureVariation: 1 row(s)
-- umbracoDocumentVersion: 23 row(s)
-- umbracoDomain: 0 row(s)
-- umbracoExternalLogin: 0 row(s)
-- umbracoKeyValue: 1 row(s)
-- umbracoLanguage: 1 row(s)
-- umbracoLock: 11 row(s)
-- umbracoLog: 254 row(s)
-- umbracoMediaVersion: 2 row(s)
-- umbracoNode: 81 row(s)
-- umbracoPropertyData: 113 row(s)
-- umbracoRedirectUrl: 0 row(s)
-- umbracoRelation: 4 row(s)
-- umbracoRelationType: 5 row(s)
-- umbracoServer: 1 row(s)
-- umbracoUser: 1 row(s)
-- umbracoUser2NodeNotify: 0 row(s)
-- umbracoUser2UserGroup: 2 row(s)
-- umbracoUserGroup: 5 row(s)
-- umbracoUserGroup2App: 13 row(s)
-- umbracoUserGroup2NodePermission: 0 row(s)
-- umbracoUserLogin: 19 row(s)
-- umbracoUserStartNode: 0 row(s)

CREATE TABLE [umbracoUser] (
  [id] int IDENTITY (2,1) NOT NULL
, [userDisabled] bit DEFAULT (('0')) NOT NULL
, [userNoConsole] bit DEFAULT (('0')) NOT NULL
, [userName] nvarchar(255) NOT NULL
, [userLogin] nvarchar(125) NOT NULL
, [userPassword] nvarchar(500) NOT NULL
, [passwordConfig] nvarchar(500) NULL
, [userEmail] nvarchar(255) NOT NULL
, [userLanguage] nvarchar(10) NULL
, [securityStampToken] nvarchar(255) NULL
, [failedLoginAttempts] int NULL
, [lastLockoutDate] datetime NULL
, [lastPasswordChangeDate] datetime NULL
, [lastLoginDate] datetime NULL
, [emailConfirmedDate] datetime NULL
, [invitedDate] datetime NULL
, [createDate] datetime DEFAULT (((getdate()))) NOT NULL
, [updateDate] datetime DEFAULT (((getdate()))) NOT NULL
, [avatar] nvarchar(500) NULL
, [tourData] ntext NULL
);
GO
CREATE TABLE [umbracoUserLogin] (
  [sessionId] uniqueidentifier NOT NULL
, [userId] int NOT NULL
, [loggedInUtc] datetime NOT NULL
, [lastValidatedUtc] datetime NOT NULL
, [loggedOutUtc] datetime NULL
, [ipAddress] nvarchar(255) NULL
);
GO
CREATE TABLE [umbracoServer] (
  [id] int IDENTITY (2,1) NOT NULL
, [address] nvarchar(500) NOT NULL
, [computerName] nvarchar(255) NOT NULL
, [registeredDate] datetime DEFAULT (((getdate()))) NOT NULL
, [lastNotifiedDate] datetime NOT NULL
, [isActive] bit NOT NULL
, [isMaster] bit NOT NULL
);
GO
CREATE TABLE [umbracoRelationType] (
  [id] int IDENTITY (6,1) NOT NULL
, [typeUniqueId] uniqueidentifier NOT NULL
, [dual] bit NOT NULL
, [parentObjectType] uniqueidentifier NULL
, [childObjectType] uniqueidentifier NULL
, [name] nvarchar(255) NOT NULL
, [alias] nvarchar(100) NOT NULL
);
GO
CREATE TABLE [umbracoNode] (
  [id] int IDENTITY (1108,1) NOT NULL
, [uniqueId] uniqueidentifier DEFAULT (((newid()))) NOT NULL
, [parentId] int NOT NULL
, [level] int NOT NULL
, [path] nvarchar(150) NOT NULL
, [sortOrder] int NOT NULL
, [trashed] bit DEFAULT (('0')) NOT NULL
, [nodeUser] int NULL
, [text] nvarchar(255) NULL
, [nodeObjectType] uniqueidentifier NULL
, [createDate] datetime DEFAULT (((getdate()))) NOT NULL
);
GO
CREATE TABLE [umbracoUserStartNode] (
  [id] int IDENTITY (2,1) NOT NULL
, [userId] int NOT NULL
, [startNode] int NOT NULL
, [startNodeType] int NOT NULL
);
GO
CREATE TABLE [umbracoUserGroup] (
  [id] int IDENTITY (6,1) NOT NULL
, [userGroupAlias] nvarchar(200) NOT NULL
, [userGroupName] nvarchar(200) NOT NULL
, [userGroupDefaultPermissions] nvarchar(50) NULL
, [createDate] datetime DEFAULT (((getdate()))) NOT NULL
, [updateDate] datetime DEFAULT (((getdate()))) NOT NULL
, [icon] nvarchar(255) NULL
, [startContentId] int NULL
, [startMediaId] int NULL
);
GO
CREATE TABLE [umbracoUserGroup2NodePermission] (
  [userGroupId] int NOT NULL
, [nodeId] int NOT NULL
, [permission] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [umbracoUserGroup2App] (
  [userGroupId] int NOT NULL
, [app] nvarchar(50) NOT NULL
);
GO
CREATE TABLE [umbracoUser2UserGroup] (
  [userId] int NOT NULL
, [userGroupId] int NOT NULL
);
GO
CREATE TABLE [umbracoUser2NodeNotify] (
  [userId] int NOT NULL
, [nodeId] int NOT NULL
, [action] nchar(1) NOT NULL
);
GO
CREATE TABLE [umbracoRelation] (
  [id] int IDENTITY (15,1) NOT NULL
, [parentId] int NOT NULL
, [childId] int NOT NULL
, [relType] int NOT NULL
, [datetime] datetime DEFAULT (((getdate()))) NOT NULL
, [comment] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [umbracoRedirectUrl] (
  [id] uniqueidentifier NOT NULL
, [contentKey] uniqueidentifier NOT NULL
, [createDateUtc] datetime NOT NULL
, [url] nvarchar(255) NOT NULL
, [culture] nvarchar(255) NULL
, [urlHash] nvarchar(40) NOT NULL
);
GO
CREATE TABLE [umbracoLog] (
  [id] int IDENTITY (255,1) NOT NULL
, [userId] int NULL
, [NodeId] int NOT NULL
, [entityType] nvarchar(50) NULL
, [Datestamp] datetime DEFAULT (((getdate()))) NOT NULL
, [logHeader] nvarchar(50) NOT NULL
, [logComment] nvarchar(4000) NULL
, [parameters] nvarchar(500) NULL
);
GO
CREATE TABLE [umbracoLock] (
  [id] int NOT NULL
, [value] int NOT NULL
, [name] nvarchar(64) NOT NULL
);
GO
CREATE TABLE [umbracoLanguage] (
  [id] int IDENTITY (3,1) NOT NULL
, [languageISOCode] nvarchar(14) NULL
, [languageCultureName] nvarchar(100) NULL
, [isDefaultVariantLang] bit DEFAULT (('0')) NOT NULL
, [mandatory] bit DEFAULT (('0')) NOT NULL
, [fallbackLanguageId] int NULL
);
GO
CREATE TABLE [umbracoKeyValue] (
  [key] nvarchar(256) NOT NULL
, [value] nvarchar(255) NULL
, [updated] datetime DEFAULT (((getdate()))) NOT NULL
);
GO
CREATE TABLE [umbracoExternalLogin] (
  [id] int IDENTITY (2,1) NOT NULL
, [userId] int NOT NULL
, [loginProvider] nvarchar(4000) NOT NULL
, [providerKey] nvarchar(4000) NOT NULL
, [createDate] datetime DEFAULT (((getdate()))) NOT NULL
);
GO
CREATE TABLE [umbracoDomain] (
  [id] int IDENTITY (2,1) NOT NULL
, [domainDefaultLanguage] int NULL
, [domainRootStructureID] int NULL
, [domainName] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [umbracoDocumentCultureVariation] (
  [id] int IDENTITY (51,1) NOT NULL
, [nodeId] int NOT NULL
, [languageId] int NOT NULL
, [edited] bit NOT NULL
, [available] bit NOT NULL
, [published] bit NOT NULL
, [name] nvarchar(255) NULL
);
GO
CREATE TABLE [umbracoDataType] (
  [nodeId] int NOT NULL
, [propertyEditorAlias] nvarchar(255) NOT NULL
, [dbType] nvarchar(50) NOT NULL
, [config] ntext NULL
);
GO
CREATE TABLE [umbracoConsent] (
  [id] int IDENTITY (2,1) NOT NULL
, [current] bit NOT NULL
, [source] nvarchar(512) NOT NULL
, [context] nvarchar(128) NOT NULL
, [action] nvarchar(512) NOT NULL
, [createDate] datetime DEFAULT (((getdate()))) NOT NULL
, [state] int NOT NULL
, [comment] nvarchar(255) NULL
);
GO
CREATE TABLE [umbracoCacheInstruction] (
  [id] int IDENTITY (247,1) NOT NULL
, [utcStamp] datetime NOT NULL
, [jsonInstruction] ntext NOT NULL
, [originated] nvarchar(500) NOT NULL
, [instructionCount] int DEFAULT (('1')) NOT NULL
);
GO
CREATE TABLE [umbracoAudit] (
  [id] int IDENTITY (49,1) NOT NULL
, [performingUserId] int NOT NULL
, [performingDetails] nvarchar(1024) NULL
, [performingIp] nvarchar(64) NULL
, [eventDateUtc] datetime DEFAULT (((getdate()))) NOT NULL
, [affectedUserId] int NOT NULL
, [affectedDetails] nvarchar(1024) NULL
, [eventType] nvarchar(256) NOT NULL
, [eventDetails] nvarchar(1024) NULL
);
GO
CREATE TABLE [umbracoAccess] (
  [id] uniqueidentifier NOT NULL
, [nodeId] int NOT NULL
, [loginNodeId] int NOT NULL
, [noAccessNodeId] int NOT NULL
, [createDate] datetime DEFAULT (((getdate()))) NOT NULL
, [updateDate] datetime DEFAULT (((getdate()))) NOT NULL
);
GO
CREATE TABLE [umbracoAccessRule] (
  [id] uniqueidentifier NOT NULL
, [accessId] uniqueidentifier NOT NULL
, [ruleValue] nvarchar(255) NOT NULL
, [ruleType] nvarchar(255) NOT NULL
, [createDate] datetime DEFAULT (((getdate()))) NOT NULL
, [updateDate] datetime DEFAULT (((getdate()))) NOT NULL
);
GO
CREATE TABLE [cmsTemplate] (
  [pk] int IDENTITY (13,1) NOT NULL
, [nodeId] int NOT NULL
, [alias] nvarchar(100) NULL
);
GO
CREATE TABLE [cmsTags] (
  [id] int IDENTITY (2,1) NOT NULL
, [group] nvarchar(100) NOT NULL
, [languageId] int NULL
, [tag] nvarchar(200) NOT NULL
);
GO
CREATE TABLE [cmsMacro] (
  [id] int IDENTITY (2,1) NOT NULL
, [uniqueId] uniqueidentifier NOT NULL
, [macroUseInEditor] bit DEFAULT (('0')) NOT NULL
, [macroRefreshRate] int DEFAULT (('0')) NOT NULL
, [macroAlias] nvarchar(255) NOT NULL
, [macroName] nvarchar(255) NULL
, [macroCacheByPage] bit DEFAULT (('1')) NOT NULL
, [macroCachePersonalized] bit DEFAULT (('0')) NOT NULL
, [macroDontRender] bit DEFAULT (('0')) NOT NULL
, [macroSource] nvarchar(255) NOT NULL
, [macroType] int NOT NULL
);
GO
CREATE TABLE [cmsMacroProperty] (
  [id] int IDENTITY (2,1) NOT NULL
, [uniquePropertyId] uniqueidentifier NOT NULL
, [editorAlias] nvarchar(255) NOT NULL
, [macro] int NOT NULL
, [macroPropertySortOrder] int DEFAULT (('0')) NOT NULL
, [macroPropertyAlias] nvarchar(50) NOT NULL
, [macroPropertyName] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [cmsDictionary] (
  [pk] int IDENTITY (2,1) NOT NULL
, [id] uniqueidentifier NOT NULL
, [parent] uniqueidentifier NULL
, [key] nvarchar(450) NOT NULL
);
GO
CREATE TABLE [cmsLanguageText] (
  [pk] int IDENTITY (2,1) NOT NULL
, [languageId] int NOT NULL
, [UniqueId] uniqueidentifier NOT NULL
, [value] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [cmsContentType2ContentType] (
  [parentContentTypeId] int NOT NULL
, [childContentTypeId] int NOT NULL
);
GO
CREATE TABLE [cmsContentType] (
  [pk] int IDENTITY (559,1) NOT NULL
, [nodeId] int NOT NULL
, [alias] nvarchar(255) NULL
, [icon] nvarchar(255) NULL
, [thumbnail] nvarchar(255) DEFAULT (('folder.png')) NOT NULL
, [description] nvarchar(1500) NULL
, [isContainer] bit DEFAULT (('0')) NOT NULL
, [isElement] bit DEFAULT (('0')) NOT NULL
, [allowAtRoot] bit DEFAULT (('0')) NOT NULL
, [variations] int DEFAULT (('1')) NOT NULL
);
GO
CREATE TABLE [umbracoContent] (
  [nodeId] int NOT NULL
, [contentTypeId] int NOT NULL
);
GO
CREATE TABLE [umbracoDocument] (
  [nodeId] int NOT NULL
, [published] bit NOT NULL
, [edited] bit NOT NULL
);
GO
CREATE TABLE [umbracoContentVersion] (
  [id] int IDENTITY (46,1) NOT NULL
, [nodeId] int NOT NULL
, [versionDate] datetime DEFAULT (((getdate()))) NOT NULL
, [userId] int NULL
, [current] bit NOT NULL
, [text] nvarchar(255) NULL
);
GO
CREATE TABLE [umbracoMediaVersion] (
  [id] int NOT NULL
, [path] nvarchar(255) NULL
);
GO
CREATE TABLE [umbracoDocumentVersion] (
  [id] int NOT NULL
, [templateId] int NULL
, [published] bit NOT NULL
);
GO
CREATE TABLE [umbracoContentVersionCultureVariation] (
  [id] int IDENTITY (72,1) NOT NULL
, [versionId] int NOT NULL
, [languageId] int NOT NULL
, [name] nvarchar(255) NOT NULL
, [date] datetime NOT NULL
, [availableUserId] int NULL
);
GO
CREATE TABLE [umbracoContentSchedule] (
  [id] uniqueidentifier NOT NULL
, [nodeId] int NOT NULL
, [languageId] int NULL
, [date] datetime NOT NULL
, [action] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [cmsMember] (
  [nodeId] int NOT NULL
, [Email] nvarchar(1000) DEFAULT (('''')) NOT NULL
, [LoginName] nvarchar(1000) DEFAULT (('''')) NOT NULL
, [Password] nvarchar(1000) DEFAULT (('''')) NOT NULL
);
GO
CREATE TABLE [cmsMember2MemberGroup] (
  [Member] int NOT NULL
, [MemberGroup] int NOT NULL
);
GO
CREATE TABLE [cmsPropertyTypeGroup] (
  [id] int IDENTITY (25,1) NOT NULL
, [contenttypeNodeId] int NOT NULL
, [text] nvarchar(255) NOT NULL
, [sortorder] int NOT NULL
, [uniqueID] uniqueidentifier DEFAULT (((newid()))) NOT NULL
);
GO
CREATE TABLE [cmsPropertyType] (
  [id] int IDENTITY (63,1) NOT NULL
, [dataTypeId] int NOT NULL
, [contentTypeId] int NOT NULL
, [propertyTypeGroupId] int NULL
, [Alias] nvarchar(255) NOT NULL
, [Name] nvarchar(255) NULL
, [sortOrder] int DEFAULT (('0')) NOT NULL
, [mandatory] bit DEFAULT (('0')) NOT NULL
, [mandatoryMessage] nvarchar(500) NULL
, [validationRegExp] nvarchar(255) NULL
, [validationRegExpMessage] nvarchar(500) NULL
, [Description] nvarchar(2000) NULL
, [variations] int DEFAULT (('1')) NOT NULL
, [UniqueID] uniqueidentifier DEFAULT (((newid()))) NOT NULL
);
GO
CREATE TABLE [umbracoPropertyData] (
  [id] int IDENTITY (356,1) NOT NULL
, [versionId] int NOT NULL
, [propertyTypeId] int NOT NULL
, [languageId] int NULL
, [segment] nvarchar(256) NULL
, [intValue] int NULL
, [decimalValue] numeric(38,6) NULL
, [dateValue] datetime NULL
, [varcharValue] nvarchar(512) NULL
, [textValue] ntext NULL
);
GO
CREATE TABLE [cmsTagRelationship] (
  [nodeId] int NOT NULL
, [tagId] int NOT NULL
, [propertyTypeId] int NOT NULL
);
GO
CREATE TABLE [cmsMemberType] (
  [pk] int IDENTITY (2,1) NOT NULL
, [NodeId] int NOT NULL
, [propertytypeId] int NOT NULL
, [memberCanEdit] bit DEFAULT (('0')) NOT NULL
, [viewOnProfile] bit DEFAULT (('0')) NOT NULL
, [isSensitive] bit DEFAULT (('0')) NOT NULL
);
GO
CREATE TABLE [cmsDocumentType] (
  [contentTypeNodeId] int NOT NULL
, [templateNodeId] int NOT NULL
, [IsDefault] bit DEFAULT (('0')) NOT NULL
);
GO
CREATE TABLE [cmsContentTypeAllowedContentType] (
  [Id] int NOT NULL
, [AllowedId] int NOT NULL
, [SortOrder] int DEFAULT (('0')) NOT NULL
);
GO
CREATE TABLE [cmsContentNu] (
  [nodeId] int NOT NULL
, [published] bit NOT NULL
, [data] ntext NOT NULL
, [rv] bigint NOT NULL
);
GO
SET IDENTITY_INSERT [umbracoUser] ON;
GO
INSERT INTO [umbracoUser] ([id],[userDisabled],[userNoConsole],[userName],[userLogin],[userPassword],[passwordConfig],[userEmail],[userLanguage],[securityStampToken],[failedLoginAttempts],[lastLockoutDate],[lastPasswordChangeDate],[lastLoginDate],[emailConfirmedDate],[invitedDate],[createDate],[updateDate],[avatar],[tourData]) VALUES (
-1,0,0,N'admin',N'admin@admin.com',N'3wOITCzIj2NJPoJWa8nFQQ==WpMyd1U3gnKln5SmPUj1V9D3fApJwtiNkuY1TNbZ7yE=',N'{"hashAlgorithm":"HMACSHA256"}',N'admin@admin.com',N'en-US',N'44344fba-b224-456d-b168-178e64a5db78',NULL,NULL,{ts '2020-04-20 14:32:49.953'},{ts '2020-04-22 16:54:18.237'},NULL,NULL,{ts '2020-04-20 14:32:49.070'},{ts '2020-04-22 16:54:18.357'},NULL,N'[{"alias":"umbIntroIntroduction","completed":false,"disabled":true},{"alias":"umbEmailMarketing","completed":false,"disabled":true}]');
GO
SET IDENTITY_INSERT [umbracoUser] OFF;
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'9afac2ed-8b27-4687-bc41-013fbec70195',-1,{ts '2020-04-20 07:34:08.850'},{ts '2020-04-20 07:37:39.797'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'6be8fd7e-e9be-4720-9374-0d9b3f4923a2',-1,{ts '2020-04-22 09:54:19.653'},{ts '2020-04-22 09:54:19.957'},NULL,N'127.0.0.1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'20e86ba2-f940-49c9-872d-20e3d7734419',-1,{ts '2020-04-22 09:09:35.213'},{ts '2020-04-22 09:10:57.997'},NULL,N'127.0.0.1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'4c88a5af-3175-4553-b6c0-2bcfb2b7beef',-1,{ts '2020-04-22 06:34:51.277'},{ts '2020-04-22 07:15:57.053'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'2d5eebe4-9332-43f3-8c11-3296c2066d2d',-1,{ts '2020-04-20 09:35:27.617'},{ts '2020-04-20 10:51:11.967'},NULL,N'127.0.0.1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'c32b5bb5-920b-46b1-b990-40e832e868a1',-1,{ts '2020-04-21 08:11:25.663'},{ts '2020-04-21 08:24:25.973'},{ts '2020-04-21 08:24:26.987'},N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'c0b5bab4-dc1b-453f-ba81-413e73b28243',-1,{ts '2020-04-22 08:29:44.643'},{ts '2020-04-22 08:36:00.950'},NULL,N'127.0.0.1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'9f426454-e202-4db1-ae1c-4b4ea32994aa',-1,{ts '2020-04-21 01:50:47.387'},{ts '2020-04-21 03:37:25.617'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'f87f6c16-f3a6-4c6d-984c-629162d0466e',-1,{ts '2020-04-21 07:39:46.857'},{ts '2020-04-21 07:50:20.823'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'c4fbcd05-3a92-41f3-8a6f-8ca5fe8b526d',-1,{ts '2020-04-21 06:34:56.783'},{ts '2020-04-21 07:19:48.223'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'b3bfe49c-1f72-4337-95bb-95f33c00d29b',-1,{ts '2020-04-22 03:52:06.467'},{ts '2020-04-22 04:59:18.647'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'c4e2c288-5a45-48f9-a226-96c491c190e4',-1,{ts '2020-04-22 07:28:21.227'},{ts '2020-04-22 07:50:11.117'},NULL,N'127.0.0.1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'59074788-6449-4ddd-8159-9ef52e929566',-1,{ts '2020-04-22 03:46:37.563'},{ts '2020-04-22 03:46:37.563'},{ts '2020-04-22 03:46:48.607'},N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'3d26985f-3bef-4fa4-8a49-b3380030e925',-1,{ts '2020-04-22 02:49:46.893'},{ts '2020-04-22 02:59:44.450'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'82c866ee-1be2-4124-a14e-c764ca6eccf3',-1,{ts '2020-04-21 08:25:30.970'},{ts '2020-04-21 09:02:31.233'},{ts '2020-04-21 09:02:34.073'},N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'dda35da3-d420-432c-905d-d1cb7001a6ce',-1,{ts '2020-04-21 09:03:59.687'},{ts '2020-04-21 10:06:23.477'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'af054a9e-ba44-43ab-bb58-d49bb56be09e',-1,{ts '2020-04-22 01:20:29.270'},{ts '2020-04-22 01:23:13.860'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'59bdb822-9f48-4150-bc93-f63c03ffe311',-1,{ts '2020-04-21 10:19:06.020'},{ts '2020-04-21 10:46:17.330'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'30edf8a7-a1ca-450b-b650-f72366b47dcc',-1,{ts '2020-04-21 04:06:36.957'},{ts '2020-04-21 05:00:44.127'},NULL,N'::1');
GO
SET IDENTITY_INSERT [umbracoServer] ON;
GO
INSERT INTO [umbracoServer] ([id],[address],[computerName],[registeredDate],[lastNotifiedDate],[isActive],[isMaster]) VALUES (
1,N'http://localhost:55940/umbraco',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT',{ts '2020-04-20 14:33:30.313'},{ts '2020-04-22 17:38:27.010'},1,1);
GO
SET IDENTITY_INSERT [umbracoServer] OFF;
GO
SET IDENTITY_INSERT [umbracoRelationType] ON;
GO
INSERT INTO [umbracoRelationType] ([id],[typeUniqueId],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (
1,'4cbeb612-e689-3563-b755-bf3ede295433',1,'c66ba18e-eaf3-4cff-8a22-41b16d66a972','c66ba18e-eaf3-4cff-8a22-41b16d66a972',N'Relate Document On Copy',N'relateDocumentOnCopy');
GO
INSERT INTO [umbracoRelationType] ([id],[typeUniqueId],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (
2,'0cc3507c-66ab-3091-8913-3d998148e423',0,'c66ba18e-eaf3-4cff-8a22-41b16d66a972','c66ba18e-eaf3-4cff-8a22-41b16d66a972',N'Relate Parent Document On Delete',N'relateParentDocumentOnDelete');
GO
INSERT INTO [umbracoRelationType] ([id],[typeUniqueId],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (
3,'8307994f-faf2-3844-bab9-72d34514edf2',0,'b796f64c-1f99-4ffb-b886-4bf4bc011a9c','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',N'Relate Parent Media Folder On Delete',N'relateParentMediaFolderOnDelete');
GO
INSERT INTO [umbracoRelationType] ([id],[typeUniqueId],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (
4,'4954ce93-3bf9-3d1e-9cd2-21bf9f9c2abf',0,NULL,NULL,N'Related Media',N'umbMedia');
GO
INSERT INTO [umbracoRelationType] ([id],[typeUniqueId],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (
5,'0b93e414-5abe-36ec-a6bb-516e56f12238',0,NULL,NULL,N'Related Document',N'umbDocument');
GO
SET IDENTITY_INSERT [umbracoRelationType] OFF;
GO
SET IDENTITY_INSERT [umbracoNode] ON;
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-99,'8f1ef1e1-9de4-40d3-a072-6673f631ca64',-1,1,N'-1,-99',39,0,-1,N'Label (decimal)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.133'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-98,'a97cec69-9b71-4c30-8b12-ec398860d7e8',-1,1,N'-1,-98',38,0,-1,N'Label (time)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.133'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-97,'aa2c52a0-ce87-4e65-a47c-7df09358585d',-1,1,N'-1,-97',2,0,-1,N'List View - Members','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.137'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-96,'3a0156c4-3b8c-4803-bdc1-6871faa83fff',-1,1,N'-1,-96',2,0,-1,N'List View - Media','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.137'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-95,'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4',-1,1,N'-1,-95',2,0,-1,N'List View - Content','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.137'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-94,'0e9794eb-f9b5-4f20-a788-93acd233a7e4',-1,1,N'-1,-94',37,0,-1,N'Label (datetime)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.133'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-93,'930861bf-e262-4ead-a704-f99453565708',-1,1,N'-1,-93',36,0,-1,N'Label (bigint)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.133'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-92,'f0bc4bfb-b499-40d6-ba86-058885a5178c',-1,1,N'-1,-92',35,0,-1,N'Label (string)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.130'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-91,'8e7f995c-bd81-4627-9932-c40e568ec788',-1,1,N'-1,-91',36,0,-1,N'Label (integer)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.133'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-90,'84c6b441-31df-4ffe-b67e-67d5bc3ae65a',-1,1,N'-1,-90',34,0,-1,N'Upload','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.133'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-89,'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3',-1,1,N'-1,-89',33,0,-1,N'Textarea','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.137'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-88,'0cc0eba1-9960-42c9-bf9b-60e150b429ae',-1,1,N'-1,-88',32,0,-1,N'Textstring','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.137'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-87,'ca90c950-0aff-4e72-b976-a30b1ac57dad',-1,1,N'-1,-87',4,0,-1,N'Richtext editor','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.137'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-51,'2e6d3631-066e-44b8-aec4-96f09099b2b5',-1,1,N'-1,-51',2,0,-1,N'Numeric','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.137'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-49,'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49',-1,1,N'-1,-49',2,0,-1,N'True/false','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.137'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-43,'fbaf13a8-4036-41f2-93a3-974f678c312a',-1,1,N'-1,-43',2,0,-1,N'Checkbox list','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.137'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-42,'f38f0ac7-1d27-439c-9f3f-089cd8825a53',-1,1,N'-1,-42',2,0,-1,N'Dropdown multiple','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.137'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-41,'5046194e-4237-453c-a547-15db3a07c4e1',-1,1,N'-1,-41',2,0,-1,N'Date Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.137'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-40,'bb5f57c9-ce2b-4bb9-b697-4caca783a805',-1,1,N'-1,-40',2,0,-1,N'Radiobox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.137'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-39,'0b6a45e7-44ba-430d-9da5-4e46060b9e03',-1,1,N'-1,-39',2,0,-1,N'Dropdown','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.137'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-37,'0225af17-b302-49cb-9176-b9f35cab9c17',-1,1,N'-1,-37',2,0,-1,N'Approved Color','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.137'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-36,'e4d66c0f-b935-4200-81f0-025f7256b89a',-1,1,N'-1,-36',2,0,-1,N'Date Picker with time','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.137'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-21,'bf7c7cbc-952f-4518-97a2-69e9c7b33842',-1,0,N'-1,-21',0,0,-1,N'Recycle Bin','cf3d8e34-1c1c-41e9-ae56-878b57b32113',{ts '2020-04-20 14:32:49.130'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-20,'0f582a79-1e41-4cf0-bfa0-76340651891a',-1,0,N'-1,-20',0,0,-1,N'Recycle Bin','01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8',{ts '2020-04-20 14:32:49.130'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-1,'916724a5-173d-4619-b97e-b9de133dd6f5',-1,0,N'-1',0,0,-1,N'SYSTEM DATA: umbraco master root','ea7d8624-4cfe-4578-a871-24aa946bf34d',{ts '2020-04-20 14:32:49.127'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1031,'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d',-1,1,N'-1,1031',2,0,-1,N'Folder','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2020-04-20 14:32:49.140'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1032,'cc07b313-0843-4aa8-bbda-871c8da728c8',-1,1,N'-1,1032',2,0,-1,N'Image','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2020-04-20 14:32:49.140'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1033,'4c52d8ab-54e6-40cd-999c-7a5f24903e4d',-1,1,N'-1,1033',2,0,-1,N'File','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2020-04-20 14:32:49.140'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1041,'b6b73142-b9c1-4bf8-a16d-e1c23320b549',-1,1,N'-1,1041',2,0,-1,N'Tags','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.140'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1043,'1df9f033-e6d4-451f-b8d2-e0cbc50a836f',-1,1,N'-1,1043',2,0,-1,N'Image Cropper','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.140'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1044,'d59be02f-1df9-4228-aa1e-01917d806cda',-1,1,N'-1,1044',0,0,-1,N'Member','9b5416fb-e72f-45a9-a07b-5a9a2709ce43',{ts '2020-04-20 14:32:49.140'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1046,'fd1e0da5-5606-4862-b679-5d0cf3a52a59',-1,1,N'-1,1046',2,0,-1,N'Content Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.140'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1047,'1ea2e01f-ebd8-4ce1-8d71-6b1149e63548',-1,1,N'-1,1047',2,0,-1,N'Member Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.140'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1048,'135d60e0-64d9-49ed-ab08-893c9ba44ae5',-1,1,N'-1,1048',2,0,-1,N'Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.140'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1049,'9dbbcbbb-2327-434a-b355-af1b84e5010a',-1,1,N'-1,1049',2,0,-1,N'Multiple Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.140'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1050,'b4e3535a-1753-47e2-8568-602cf8cfee6f',-1,1,N'-1,1050',2,0,-1,N'Multi URL Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 14:32:49.140'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1051,'3d081146-b3f6-4071-931f-483fd926bf57',-1,1,N'-1,1051',0,0,-1,N'Pages','2f7a2769-6b0b-4468-90dd-af42d64f7f16',{ts '2020-04-20 14:34:31.327'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1052,'235771a7-c250-4363-82b9-0d68772dedd4',1051,2,N'-1,1051,1052',0,0,-1,N'Home','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-04-20 14:34:57.673'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1055,'8c1eedb3-f9a0-4332-ba7e-00c8bb01e423',-1,1,N'-1,1055',0,0,-1,N'Composition','2f7a2769-6b0b-4468-90dd-af42d64f7f16',{ts '2020-04-20 16:48:58.237'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1059,'3f1fec9b-61d9-4b05-b426-a55126c67b4e',-1,1,N'-1,1059',0,0,NULL,N'Master','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2020-04-20 16:59:35.890'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1060,'b766ffda-95a3-4286-b978-a1e5c5dae5e4',1059,1,N'-1,1059,1060',0,0,NULL,N'Home','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2020-04-20 16:59:47.480'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1062,'d1a63c4d-c972-4e65-99f1-911e37baffd6',-1,1,N'-1,1062',29,0,-1,N'Basic Content Control - Title - Textarea','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-20 17:37:42.987'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1063,'623d3cbd-7d33-4a8a-bef0-bfbe34b0bd89',-1,1,N'-1,1063',30,0,-1,N'Basic Content Control - Color Name - Dropdown','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-21 09:03:50.640'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1064,'1466e1b8-a73b-4cf2-a1e9-177fce387b96',-1,1,N'-1,1064',0,0,-1,N'Cat','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-04-21 09:31:43.137'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1065,'3d321f6c-fc7d-4a72-aed3-f7fabb925f5b',-1,1,N'-1,1065',31,0,-1,N'Basic Content Control - Main Content - Textarea','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-21 10:26:40.873'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1066,'094647f2-4487-4dd0-8b33-3dac3208f7a2',-1,1,N'-1,1066',0,0,-1,N'Home','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2020-04-21 11:13:18.457'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1068,'58650677-68f8-4b81-bf2d-932d5926b992',1051,2,N'-1,1051,1068',1,0,-1,N'Article','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-04-21 15:17:37.890'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1069,'347c16f3-1956-48bb-ab9d-998cae8809b3',1051,2,N'-1,1051,1069',2,0,-1,N'Article List','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-04-21 15:18:08.930'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1070,'c33477f9-f33c-41e9-911e-88463f145e4e',1051,2,N'-1,1051,1070',3,0,-1,N'Contact','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-04-21 15:18:46.973'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1071,'61ee85c2-33cf-42c4-9254-58e9450419f1',1051,2,N'-1,1051,1071',4,0,-1,N'Content','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-04-21 15:19:20.770'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1073,'fa695837-79ec-4055-8dfe-6a43361ea74c',1051,2,N'-1,1051,1073',5,0,-1,N'Error','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-04-21 15:20:44.223'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1074,'fc568fc5-50b7-4b5e-a427-2d96d920b321',1051,2,N'-1,1051,1074',6,0,-1,N'Search','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-04-21 15:20:58.447'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1076,'2b720de6-b76a-4444-af7c-859fa1f5cbf7',1051,2,N'-1,1051,1076',7,0,-1,N'XML Sitemap','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-04-21 15:22:52.047'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1078,'df101349-b5cc-46c1-a1da-e1ac063593df',-1,1,N'-1,1078',32,0,-1,N'Content Grid','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-21 15:49:02.620'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1080,'dbbf77ae-5bb5-4833-a4d6-8d2767bb1f25',1055,2,N'-1,1055,1080',1,0,-1,N'Visibility Controls','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-04-21 15:58:33.597'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1082,'a50c4716-5513-43b0-a5ee-dd48f0e26e30',1055,2,N'-1,1055,1082',1,0,-1,N'Content Controls','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-04-21 16:05:06.677'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1083,'7574c82b-9e4e-4c50-a7fc-1865dd73adcc',1055,2,N'-1,1055,1083',2,0,-1,N'Article Controls','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-04-21 16:13:52.670'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1084,'acb60269-1c45-4bb6-9bca-5b7928741875',1055,2,N'-1,1055,1084',3,0,-1,N'Header Controls','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-04-21 16:16:26.947'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1085,'c46811f0-cca8-4518-b57b-b43f76a7284c',1055,2,N'-1,1055,1085',4,0,-1,N'Main Image Controls','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-04-21 16:19:38.263'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1086,'79c64b58-2fb5-4249-be8a-315b6633b5ff',1055,2,N'-1,1055,1086',5,0,-1,N'SEO Controls','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-04-21 16:23:16.687'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1087,'94cf119d-21bd-4158-850f-17bd25e44136',1055,2,N'-1,1055,1087',6,0,-1,N'Contact Form Controls','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-04-21 16:25:53.003'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1088,'cff137cd-f961-4a3c-b581-da94cae57850',1055,2,N'-1,1055,1088',7,0,-1,N'Footer Controls','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-04-21 16:27:09.223'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1089,'77a1420d-82ba-4c63-8318-6f52ad8ec6d3',-1,1,N'-1,1089',0,0,-1,N'Elements','2f7a2769-6b0b-4468-90dd-af42d64f7f16',{ts '2020-04-21 16:27:19.540'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1090,'5e122caf-159a-4e0b-b096-2ba775ed3269',-1,1,N'-1,1090',33,0,-1,N'Single URL Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-21 16:34:51.687'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1091,'5c4f682a-8657-4233-8b36-f11ae14f49f7',1089,2,N'-1,1089,1091',0,0,-1,N'Icon Link Item','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-04-21 16:35:45.347'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1092,'2f12731a-8212-42f8-a60b-cb34df6a94cd',-1,1,N'-1,1092',34,0,-1,N'Icon Link List','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-04-21 16:44:31.080'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1093,'04f3a48a-d1db-4247-96d9-ce9c52f0a66e',1066,2,N'-1,1066,1093',0,0,-1,N'About','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2020-04-21 17:33:45.407'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1094,'082105b9-5a39-4649-877c-f55785a2851a',1066,2,N'-1,1066,1094',1,0,-1,N'Blog','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2020-04-21 17:33:58.070'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1095,'3b822c8a-ad72-4bf9-b5be-4f1d7777e219',1066,2,N'-1,1066,1095',2,0,-1,N'Contact','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2020-04-21 17:34:40.793'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1096,'b2d1c20d-996b-4511-8386-d0d631a05c5d',1066,2,N'-1,1066,1096',3,0,-1,N'XML Sitemap','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2020-04-21 17:35:13.727'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1097,'bee6aa6c-45a4-4993-9351-a43fe1cf64a1',1066,2,N'-1,1066,1097',4,0,-1,N'Search','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2020-04-21 17:35:33.043'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1098,'6e790314-692d-431b-b855-e1eaa4fadd69',1094,3,N'-1,1066,1094,1098',0,0,-1,N'Test Article','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2020-04-21 17:46:25.873'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1099,'b5a614ab-ba96-49e1-b0de-f18366631eea',1059,1,N'-1,1059,1099',0,0,NULL,N'Article List','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2020-04-22 11:05:45.317'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1100,'d449410f-03b2-43b1-8227-bbfe87cf6a04',1059,1,N'-1,1059,1100',0,0,NULL,N'Article','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2020-04-22 11:07:12.513'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1101,'03a4956b-c1c1-49da-a5a1-bf2211a3652e',1059,1,N'-1,1059,1101',0,0,NULL,N'Content','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2020-04-22 11:36:23.687'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1102,'a60a41af-f346-4cf4-b269-7e6241790fbc',1059,1,N'-1,1059,1102',0,0,NULL,N'Search','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2020-04-22 11:43:46.680'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1103,'820f7255-c620-4c79-a146-c56f0ae8bddb',1059,1,N'-1,1059,1103',0,0,NULL,N'Contact','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2020-04-22 11:58:11.557'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1104,'bae5edc7-f891-4252-8d09-e552aea60053',-1,1,N'-1,1104',0,0,NULL,N'XML Sitemap','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2020-04-22 13:40:58.333'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1105,'19601b75-b8e3-463e-bf6f-adbc9e2b4ebf',1059,1,N'-1,1059,1105',0,0,NULL,N'Error','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2020-04-22 13:42:38.573'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1106,'392a635a-d274-4d4c-9ba0-a09e653b203f',-1,1,N'-1,1106',1,0,-1,N'(GIF Image, 1024 × 768 Pixels)','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-04-22 13:45:42.760'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1107,'91988fc5-103a-4baa-812b-9a9f15102660',1066,2,N'-1,1066,1107',0,0,-1,N'Error','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2020-04-22 13:46:01.687'});
GO
SET IDENTITY_INSERT [umbracoNode] OFF;
GO
SET IDENTITY_INSERT [umbracoUserStartNode] OFF;
GO
SET IDENTITY_INSERT [umbracoUserGroup] ON;
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (
1,N'admin',N'Administrators',N'CADMOSKTPIURZ:5F7ï',{ts '2020-04-20 14:32:49.507'},{ts '2020-04-20 14:32:49.507'},N'icon-medal',-1,-1);
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (
2,N'writer',N'Writers',N'CAH:F',{ts '2020-04-20 14:32:49.513'},{ts '2020-04-20 14:32:49.513'},N'icon-edit',-1,-1);
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (
3,N'editor',N'Editors',N'CADMOSKTPUZ:5Fï',{ts '2020-04-20 14:32:49.513'},{ts '2020-04-20 14:32:49.513'},N'icon-tools',-1,-1);
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (
4,N'translator',N'Translators',N'AF',{ts '2020-04-20 14:32:49.513'},{ts '2020-04-20 14:32:49.513'},N'icon-globe',-1,-1);
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (
5,N'sensitiveData',N'Sensitive data',N'',{ts '2020-04-20 14:32:49.513'},{ts '2020-04-20 14:32:49.513'},N'icon-lock',-1,-1);
GO
SET IDENTITY_INSERT [umbracoUserGroup] OFF;
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
1,N'content');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
1,N'forms');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
1,N'media');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
1,N'member');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
1,N'packages');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
1,N'settings');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
1,N'translation');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
1,N'users');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
2,N'content');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
3,N'content');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
3,N'forms');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
3,N'media');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
4,N'translation');
GO
INSERT INTO [umbracoUser2UserGroup] ([userId],[userGroupId]) VALUES (
-1,1);
GO
INSERT INTO [umbracoUser2UserGroup] ([userId],[userGroupId]) VALUES (
-1,5);
GO
SET IDENTITY_INSERT [umbracoRelation] ON;
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
7,1094,1064,4,{ts '2020-04-22 11:13:40.477'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
8,1098,1064,4,{ts '2020-04-22 11:28:16.557'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
10,1107,1106,4,{ts '2020-04-22 13:46:01.773'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
14,1093,1064,4,{ts '2020-04-22 14:50:37.410'},N'');
GO
SET IDENTITY_INSERT [umbracoRelation] OFF;
GO
SET IDENTITY_INSERT [umbracoLog] ON;
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
1,-1,1052,N'DocumentType',{ts '2020-04-20 14:34:57.710'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
2,-1,1052,N'DocumentType',{ts '2020-04-20 14:35:10.100'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
3,-1,1053,N'Template',{ts '2020-04-20 16:38:33.920'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
4,-1,1053,N'Template',{ts '2020-04-20 16:38:36.520'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
5,-1,1053,N'Template',{ts '2020-04-20 16:40:24.430'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
6,-1,1054,N'Template',{ts '2020-04-20 16:45:09.673'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
7,-1,1054,N'Template',{ts '2020-04-20 16:45:29.913'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
8,-1,1054,N'Template',{ts '2020-04-20 16:45:52.597'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
9,-1,1052,N'DocumentType',{ts '2020-04-20 16:46:02.890'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
10,-1,1054,N'Template',{ts '2020-04-20 16:47:16.260'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
11,-1,1056,N'Template',{ts '2020-04-20 16:50:03.257'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
12,-1,1057,N'DocumentType',{ts '2020-04-20 16:50:03.297'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
13,-1,1052,N'DocumentType',{ts '2020-04-20 16:50:13.247'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
14,-1,1057,N'DocumentType',{ts '2020-04-20 16:52:01.047'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
15,-1,1052,N'DocumentType',{ts '2020-04-20 16:52:35.133'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
16,-1,1057,N'DocumentType',{ts '2020-04-20 16:53:44.597'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
17,-1,1052,N'DocumentType',{ts '2020-04-20 16:54:12.660'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
18,-1,1058,N'Document',{ts '2020-04-20 16:55:37.580'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
19,-1,1056,N'Template',{ts '2020-04-20 16:57:16.493'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
20,-1,1053,N'Template',{ts '2020-04-20 16:57:29.330'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
21,-1,1053,N'Template',{ts '2020-04-20 16:58:15.977'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
22,-1,1052,N'DocumentType',{ts '2020-04-20 16:58:43.457'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
23,-1,1052,N'DocumentType',{ts '2020-04-20 16:59:01.690'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
24,-1,1053,N'Template',{ts '2020-04-20 16:59:25.817'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
25,-1,1059,N'Template',{ts '2020-04-20 16:59:35.913'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
26,-1,1060,N'Template',{ts '2020-04-20 16:59:47.497'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
27,-1,1060,N'Template',{ts '2020-04-20 17:00:31.770'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
28,-1,1052,N'DocumentType',{ts '2020-04-20 17:00:41.090'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
29,-1,1061,N'Document',{ts '2020-04-20 17:01:47.163'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
30,-1,1061,N'Document',{ts '2020-04-20 17:01:52.943'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
31,-1,1061,N'Document',{ts '2020-04-20 17:02:09.140'},N'Unpublish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
32,-1,1061,N'Document',{ts '2020-04-20 17:02:16.177'},N'Move',N'Moved to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
33,-1,1061,N'Document',{ts '2020-04-20 17:02:16.953'},N'Delete',N'Trashed content with Id: 1061 related to original parent content with Id: -1',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
34,-1,1058,N'Document',{ts '2020-04-20 17:02:22.583'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
35,-1,1058,N'Document',{ts '2020-04-20 17:02:27.037'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
36,-1,1060,N'Template',{ts '2020-04-20 17:03:58.707'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
37,-1,1059,N'Template',{ts '2020-04-20 17:04:39.250'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
38,-1,1060,N'Template',{ts '2020-04-20 17:05:11.763'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
39,-1,1059,N'Template',{ts '2020-04-20 17:05:14.580'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
40,-1,1058,N'Document',{ts '2020-04-20 17:05:56.787'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
41,-1,1058,N'Document',{ts '2020-04-20 17:07:27.773'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
42,-1,1058,N'Document',{ts '2020-04-20 17:07:32.680'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
43,-1,1058,N'Document',{ts '2020-04-20 17:08:29.627'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
44,-1,1060,N'Template',{ts '2020-04-20 17:08:41.560'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
45,-1,1058,N'Document',{ts '2020-04-20 17:25:26.883'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
46,-1,1058,N'Document',{ts '2020-04-20 17:25:31.210'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
47,-1,1062,N'DataType',{ts '2020-04-20 17:37:43.063'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
48,-1,1057,N'DocumentType',{ts '2020-04-20 17:37:50.797'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
49,-1,1057,N'DocumentType',{ts '2020-04-20 17:38:47.337'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
50,-1,1057,N'DocumentType',{ts '2020-04-20 17:40:20.700'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
51,-1,1057,N'DocumentType',{ts '2020-04-20 17:40:28.890'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
52,-1,1058,N'Document',{ts '2020-04-20 17:40:36.483'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
53,-1,1058,N'Document',{ts '2020-04-20 17:40:41.583'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
54,-1,1058,N'Document',{ts '2020-04-20 17:40:44.003'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
55,-1,1058,N'Document',{ts '2020-04-20 17:41:00.203'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
56,-1,1058,N'Document',{ts '2020-04-20 17:41:42.993'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
57,-1,1058,N'Document',{ts '2020-04-20 17:41:47.590'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
58,-1,1058,N'Document',{ts '2020-04-20 17:41:49.000'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
59,-1,1058,N'Document',{ts '2020-04-20 17:41:54.260'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
60,-1,1058,N'Document',{ts '2020-04-20 17:41:56.167'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
61,-1,1060,N'Template',{ts '2020-04-20 17:44:36.553'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
62,-1,1058,N'Document',{ts '2020-04-20 17:46:25.733'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
63,-1,1058,N'Document',{ts '2020-04-20 17:46:58.997'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
64,-1,1058,N'Document',{ts '2020-04-20 17:48:47.827'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
65,-1,1058,N'Document',{ts '2020-04-20 17:48:48.333'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
66,-1,1058,N'Document',{ts '2020-04-20 17:49:18.683'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
67,-1,1057,N'DocumentType',{ts '2020-04-20 17:50:04.017'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
68,-1,1058,N'Document',{ts '2020-04-20 17:50:08.480'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
69,-1,1058,N'Document',{ts '2020-04-20 17:50:09.493'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
70,-1,1059,N'Template',{ts '2020-04-21 08:51:04.317'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
71,-1,1063,N'DataType',{ts '2020-04-21 09:03:50.750'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
72,-1,1057,N'DocumentType',{ts '2020-04-21 09:04:31.273'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
73,-1,1058,N'Document',{ts '2020-04-21 09:05:09.850'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
74,-1,1060,N'Template',{ts '2020-04-21 09:07:31.583'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
75,-1,1058,N'Document',{ts '2020-04-21 09:07:43.927'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
76,-1,1058,N'Document',{ts '2020-04-21 09:15:45.720'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
77,-1,1060,N'Template',{ts '2020-04-21 09:16:47.313'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
78,-1,1060,N'Template',{ts '2020-04-21 09:17:07.317'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
79,-1,1057,N'DocumentType',{ts '2020-04-21 09:31:09.563'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
80,-1,1064,N'Media',{ts '2020-04-21 09:31:43.230'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
81,-1,1058,N'Document',{ts '2020-04-21 09:37:08.660'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
82,-1,1058,N'Document',{ts '2020-04-21 09:43:40.700'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
83,-1,1058,N'Document',{ts '2020-04-21 09:44:18.933'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
84,-1,1064,N'Media',{ts '2020-04-21 09:44:23.767'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
85,-1,1064,N'Media',{ts '2020-04-21 09:44:32.277'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
86,-1,1057,N'DocumentType',{ts '2020-04-21 09:48:11.337'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
87,-1,1058,N'Document',{ts '2020-04-21 09:48:17.797'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
88,-1,1058,N'Document',{ts '2020-04-21 09:53:54.353'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
89,-1,1058,N'Document',{ts '2020-04-21 09:54:00.637'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
90,-1,1058,N'Document',{ts '2020-04-21 10:15:08.537'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
91,-1,1058,N'Document',{ts '2020-04-21 10:15:09.663'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
92,-1,1058,N'Document',{ts '2020-04-21 10:15:41.080'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
93,-1,1058,N'Document',{ts '2020-04-21 10:15:46.357'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
94,-1,1058,N'Document',{ts '2020-04-21 10:16:58.593'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
95,-1,1058,N'Document',{ts '2020-04-21 10:25:17.463'},N'Move',N'Moved to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
96,-1,1058,N'Document',{ts '2020-04-21 10:25:18.903'},N'Delete',N'Trashed content with Id: 1058 related to original parent content with Id: -1',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
97,-1,1065,N'DataType',{ts '2020-04-21 10:26:40.920'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
98,-1,1057,N'DocumentType',{ts '2020-04-21 10:26:50.277'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
99,-1,-20,N'Document',{ts '2020-04-21 11:07:34.100'},N'Delete',N'Recycle bin emptied',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
100,-1,1066,N'Document',{ts '2020-04-21 11:13:18.550'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
101,-1,1066,N'Document',{ts '2020-04-21 11:13:32.567'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
102,-1,1060,N'Template',{ts '2020-04-21 11:18:25.017'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
103,-1,1060,N'Template',{ts '2020-04-21 11:27:10.007'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
104,-1,1066,N'Document',{ts '2020-04-21 11:28:25.800'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
105,-1,2,N'Language',{ts '2020-04-21 11:59:41.350'},N'Save',N'Save Language',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
106,-1,1066,N'Document',{ts '2020-04-21 13:35:22.203'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
107,-1,1066,N'Document',{ts '2020-04-21 13:36:07.467'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
108,-1,1066,N'Document',{ts '2020-04-21 13:38:00.287'},N'PublishVariant',N'Published languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
109,-1,1052,N'DocumentType',{ts '2020-04-21 13:39:30.623'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
110,-1,2,N'Language',{ts '2020-04-21 13:41:21.970'},N'Delete',N'Delete Language',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
111,-1,1066,N'Document',{ts '2020-04-21 14:45:24.277'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
112,-1,-1,N'Document',{ts '2020-04-21 15:14:10.977'},N'Delete',N'Delete content of type 1057',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
113,-1,1057,N'DocumentType',{ts '2020-04-21 15:14:11.270'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
114,-1,1067,N'DocumentType',{ts '2020-04-21 15:15:59.853'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
115,-1,-1,N'Document',{ts '2020-04-21 15:16:10.077'},N'Delete',N'Delete content of type 1067',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
116,-1,1067,N'DocumentType',{ts '2020-04-21 15:16:10.143'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
117,-1,1068,N'DocumentType',{ts '2020-04-21 15:17:37.913'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
118,-1,1069,N'DocumentType',{ts '2020-04-21 15:18:08.953'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
119,-1,1070,N'DocumentType',{ts '2020-04-21 15:18:46.997'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
120,-1,1070,N'DocumentType',{ts '2020-04-21 15:19:00.457'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
121,-1,1071,N'DocumentType',{ts '2020-04-21 15:19:20.793'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
122,-1,1072,N'DocumentType',{ts '2020-04-21 15:19:36.527'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
123,-1,-1,N'Document',{ts '2020-04-21 15:20:23.267'},N'Delete',N'Delete content of type 1072',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
124,-1,1072,N'DocumentType',{ts '2020-04-21 15:20:23.343'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
125,-1,1073,N'DocumentType',{ts '2020-04-21 15:20:44.243'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
126,-1,1074,N'DocumentType',{ts '2020-04-21 15:20:58.447'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
127,-1,1075,N'DocumentType',{ts '2020-04-21 15:21:41.217'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
128,-1,-1,N'Document',{ts '2020-04-21 15:22:35.273'},N'Delete',N'Delete content of type 1075',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
129,-1,1075,N'DocumentType',{ts '2020-04-21 15:22:35.347'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
130,-1,1076,N'DocumentType',{ts '2020-04-21 15:22:52.063'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
131,-1,1077,N'DocumentType',{ts '2020-04-21 15:26:28.787'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
132,-1,1077,N'DocumentType',{ts '2020-04-21 15:32:55.777'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
133,-1,1077,N'DocumentType',{ts '2020-04-21 15:33:52.133'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
134,-1,1077,N'DocumentType',{ts '2020-04-21 15:33:59.763'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
135,-1,1078,N'DataType',{ts '2020-04-21 15:49:02.730'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
136,-1,-1,N'Document',{ts '2020-04-21 15:50:43.513'},N'Delete',N'Delete content of type 1077',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
137,-1,1077,N'DocumentType',{ts '2020-04-21 15:50:43.633'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
138,-1,1078,N'DataType',{ts '2020-04-21 15:52:56.500'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
139,-1,1078,N'DataType',{ts '2020-04-21 15:54:05.463'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
140,-1,1079,N'DocumentType',{ts '2020-04-21 15:54:24.063'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
141,-1,1079,N'DocumentType',{ts '2020-04-21 15:55:25.790'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
142,-1,1079,N'DocumentType',{ts '2020-04-21 15:55:28.347'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
143,-1,1079,N'DocumentType',{ts '2020-04-21 15:55:31.700'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
144,-1,1080,N'DocumentType',{ts '2020-04-21 15:58:33.627'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
145,-1,1079,N'DocumentType',{ts '2020-04-21 15:58:39.860'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
146,-1,-1,N'Document',{ts '2020-04-21 15:59:06.893'},N'Delete',N'Delete content of type 1079',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
147,-1,1079,N'DocumentType',{ts '2020-04-21 15:59:06.967'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
148,-1,1078,N'DataType',{ts '2020-04-21 16:01:08.500'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
149,-1,1081,N'DocumentType',{ts '2020-04-21 16:01:22.733'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
150,-1,-1,N'Document',{ts '2020-04-21 16:04:17.507'},N'Delete',N'Delete content of type 1081',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
151,-1,1081,N'DocumentType',{ts '2020-04-21 16:04:17.603'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
152,-1,1080,N'DocumentType',{ts '2020-04-21 16:04:29.427'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
153,-1,1082,N'DocumentType',{ts '2020-04-21 16:05:06.703'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
154,-1,1082,N'DocumentType',{ts '2020-04-21 16:07:46.160'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
155,-1,1083,N'DocumentType',{ts '2020-04-21 16:13:52.697'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
156,-1,1084,N'DocumentType',{ts '2020-04-21 16:16:26.973'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
157,-1,1085,N'DocumentType',{ts '2020-04-21 16:19:38.300'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
158,-1,1086,N'DocumentType',{ts '2020-04-21 16:23:16.717'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
159,-1,1086,N'DocumentType',{ts '2020-04-21 16:23:29.347'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
160,-1,1087,N'DocumentType',{ts '2020-04-21 16:25:53.037'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
161,-1,1088,N'DocumentType',{ts '2020-04-21 16:27:09.243'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
162,-1,1090,N'DataType',{ts '2020-04-21 16:34:51.747'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
163,-1,1091,N'DocumentType',{ts '2020-04-21 16:35:45.363'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
164,-1,1092,N'DataType',{ts '2020-04-21 16:44:31.123'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
165,-1,1088,N'DocumentType',{ts '2020-04-21 16:46:34.527'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
166,-1,1083,N'DocumentType',{ts '2020-04-21 16:48:47.170'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
167,-1,1082,N'DocumentType',{ts '2020-04-21 16:49:00.940'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
168,-1,1085,N'DocumentType',{ts '2020-04-21 16:49:10.970'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
169,-1,1086,N'DocumentType',{ts '2020-04-21 16:49:22.560'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
170,-1,1080,N'DocumentType',{ts '2020-04-21 16:49:31.980'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
171,-1,1068,N'DocumentType',{ts '2020-04-21 16:51:03.423'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
172,-1,1086,N'DocumentType',{ts '2020-04-21 16:53:19.410'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
173,-1,1082,N'DocumentType',{ts '2020-04-21 16:56:16.047'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
174,-1,1069,N'DocumentType',{ts '2020-04-21 16:57:14.600'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
175,-1,1082,N'DocumentType',{ts '2020-04-21 16:57:22.343'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
176,-1,1085,N'DocumentType',{ts '2020-04-21 17:01:21.907'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
177,-1,1085,N'DocumentType',{ts '2020-04-21 17:01:27.970'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
178,-1,1070,N'DocumentType',{ts '2020-04-21 17:03:11.490'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
179,-1,1071,N'DocumentType',{ts '2020-04-21 17:03:41.880'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
180,-1,1073,N'DocumentType',{ts '2020-04-21 17:05:58.217'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
181,-1,1073,N'DocumentType',{ts '2020-04-21 17:06:00.917'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
182,-1,1052,N'DocumentType',{ts '2020-04-21 17:19:16.737'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
183,-1,1088,N'DocumentType',{ts '2020-04-21 17:20:30.757'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
184,-1,1052,N'DocumentType',{ts '2020-04-21 17:20:39.310'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
185,-1,1052,N'DocumentType',{ts '2020-04-21 17:27:19.247'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
186,-1,1069,N'DocumentType',{ts '2020-04-21 17:29:56.357'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
187,-1,1069,N'DocumentType',{ts '2020-04-21 17:29:59.523'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
188,-1,1093,N'Document',{ts '2020-04-21 17:33:45.587'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
189,-1,1094,N'Document',{ts '2020-04-21 17:33:58.187'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
190,-1,1095,N'Document',{ts '2020-04-21 17:34:40.837'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
191,-1,1096,N'Document',{ts '2020-04-21 17:35:13.760'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
192,-1,1097,N'Document',{ts '2020-04-21 17:35:33.050'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
193,-1,1097,N'Document',{ts '2020-04-21 17:35:57.793'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
194,-1,1076,N'DocumentType',{ts '2020-04-21 17:36:20.983'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
195,-1,1096,N'Document',{ts '2020-04-21 17:36:44.350'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
196,-1,1096,N'Document',{ts '2020-04-21 17:37:04.677'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
197,-1,1098,N'Document',{ts '2020-04-21 17:46:26.487'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
198,-1,1098,N'Document',{ts '2020-04-21 17:46:28.240'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
199,-1,1094,N'Document',{ts '2020-04-21 17:46:50.400'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
200,-1,1098,N'Document',{ts '2020-04-21 17:46:52.983'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
201,-1,1099,N'Template',{ts '2020-04-22 11:05:45.357'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
202,-1,1099,N'Template',{ts '2020-04-22 11:06:08.257'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
203,-1,1060,N'Template',{ts '2020-04-22 11:06:35.017'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
204,-1,1099,N'Template',{ts '2020-04-22 11:07:03.343'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
205,-1,1100,N'Template',{ts '2020-04-22 11:07:12.520'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
206,-1,1100,N'Template',{ts '2020-04-22 11:10:13.587'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
207,-1,1068,N'DocumentType',{ts '2020-04-22 11:12:52.097'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
208,-1,1069,N'DocumentType',{ts '2020-04-22 11:13:05.950'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
209,-1,1094,N'Document',{ts '2020-04-22 11:13:40.513'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
210,-1,1100,N'Template',{ts '2020-04-22 11:26:43.063'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
211,-1,1098,N'Document',{ts '2020-04-22 11:28:16.560'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
212,-1,1101,N'Template',{ts '2020-04-22 11:36:23.697'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
213,-1,1101,N'Template',{ts '2020-04-22 11:36:36.120'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
214,-1,1071,N'DocumentType',{ts '2020-04-22 11:36:50.843'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
215,-1,1093,N'Document',{ts '2020-04-22 11:39:03.560'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
216,-1,1101,N'Template',{ts '2020-04-22 11:40:32.673'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
217,-1,1102,N'Template',{ts '2020-04-22 11:43:46.687'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
218,-1,1102,N'Template',{ts '2020-04-22 11:52:39.147'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
219,-1,1102,N'Template',{ts '2020-04-22 11:53:36.207'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
220,-1,1074,N'DocumentType',{ts '2020-04-22 11:53:48.807'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
221,-1,1097,N'Document',{ts '2020-04-22 11:53:58.580'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
222,-1,1097,N'Document',{ts '2020-04-22 11:54:02.197'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
223,-1,1103,N'Template',{ts '2020-04-22 11:58:11.567'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
224,-1,1103,N'Template',{ts '2020-04-22 11:59:18.877'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
225,-1,1070,N'DocumentType',{ts '2020-04-22 11:59:29.337'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
226,-1,1070,N'DocumentType',{ts '2020-04-22 11:59:54.703'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
227,-1,1070,N'DocumentType',{ts '2020-04-22 11:59:58.523'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
228,-1,1095,N'Document',{ts '2020-04-22 12:00:10.080'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
229,-1,1104,N'Template',{ts '2020-04-22 13:40:58.357'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
230,-1,1104,N'Template',{ts '2020-04-22 13:41:00.043'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
231,-1,1076,N'DocumentType',{ts '2020-04-22 13:41:15.417'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
232,-1,1105,N'Template',{ts '2020-04-22 13:42:38.580'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
233,-1,1105,N'Template',{ts '2020-04-22 13:44:06.357'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
234,-1,1073,N'DocumentType',{ts '2020-04-22 13:44:15.353'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
235,-1,1106,N'Media',{ts '2020-04-22 13:45:42.853'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
236,-1,1107,N'Document',{ts '2020-04-22 13:46:01.787'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
237,-1,1105,N'Template',{ts '2020-04-22 13:47:34.207'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
238,-1,1100,N'Template',{ts '2020-04-22 13:49:37.607'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
239,-1,1099,N'Template',{ts '2020-04-22 13:49:47.267'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
240,-1,1103,N'Template',{ts '2020-04-22 13:49:54.427'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
241,-1,1101,N'Template',{ts '2020-04-22 13:50:01.657'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
242,-1,1105,N'Template',{ts '2020-04-22 13:50:10.187'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
243,-1,1102,N'Template',{ts '2020-04-22 13:50:18.863'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
244,-1,1105,N'Template',{ts '2020-04-22 14:00:27.117'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
245,-1,1105,N'Template',{ts '2020-04-22 14:00:44.560'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
246,-1,1105,N'Template',{ts '2020-04-22 14:01:19.257'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
247,-1,1105,N'Template',{ts '2020-04-22 14:06:06.227'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
248,-1,1105,N'Template',{ts '2020-04-22 14:06:14.280'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
249,-1,1105,N'Template',{ts '2020-04-22 14:07:17.127'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
250,-1,1105,N'Template',{ts '2020-04-22 14:09:46.120'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
251,-1,1093,N'Document',{ts '2020-04-22 14:37:06.243'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
252,-1,1093,N'Document',{ts '2020-04-22 14:47:00.537'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
253,-1,1093,N'Document',{ts '2020-04-22 14:47:02.693'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
254,-1,1093,N'Document',{ts '2020-04-22 14:50:37.413'},N'Publish',NULL,NULL);
GO
SET IDENTITY_INSERT [umbracoLog] OFF;
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-1000,1,N'MainDom');
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-340,1,N'Languages');
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-339,1,N'KeyValues');
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-338,1,N'Domains');
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-337,1,N'MemberTypes');
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-336,1,N'MediaTypes');
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-335,1,N'MemberTree');
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-334,1,N'MediaTree');
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-333,1,N'ContentTree');
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-332,1,N'ContentTypes');
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-331,1,N'Servers');
GO
SET IDENTITY_INSERT [umbracoLanguage] ON;
GO
INSERT INTO [umbracoLanguage] ([id],[languageISOCode],[languageCultureName],[isDefaultVariantLang],[mandatory],[fallbackLanguageId]) VALUES (
1,N'en-US',N'English (United States)',1,0,NULL);
GO
SET IDENTITY_INSERT [umbracoLanguage] OFF;
GO
INSERT INTO [umbracoKeyValue] ([key],[value],[updated]) VALUES (
N'Umbraco.Core.Upgrader.State+Umbraco.Core',N'{2AB29964-02A1-474D-BD6B-72148D2A53A2}',{ts '2020-04-20 14:32:49.583'});
GO
SET IDENTITY_INSERT [umbracoExternalLogin] OFF;
GO
SET IDENTITY_INSERT [umbracoDomain] OFF;
GO
SET IDENTITY_INSERT [umbracoDocumentCultureVariation] ON;
GO
INSERT INTO [umbracoDocumentCultureVariation] ([id],[nodeId],[languageId],[edited],[available],[published],[name]) VALUES (
50,1066,1,0,1,1,N'Home');
GO
SET IDENTITY_INSERT [umbracoDocumentCultureVariation] OFF;
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-99,N'Umbraco.Label',N'Decimal',N'{"umbracoDataValueType":"DECIMAL"}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-98,N'Umbraco.Label',N'Date',N'{"umbracoDataValueType":"TIME"}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-97,N'Umbraco.ListView',N'Nvarchar',N'{"pageSize":10, "orderBy":"username", "orderDirection":"asc", "includeProperties":[{"alias":"username","isSystem":1},{"alias":"email","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-96,N'Umbraco.ListView',N'Nvarchar',N'{"pageSize":100, "orderBy":"updateDate", "orderDirection":"desc", "layouts":[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}], "includeProperties":[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-95,N'Umbraco.ListView',N'Nvarchar',N'{"pageSize":100, "orderBy":"updateDate", "orderDirection":"desc", "layouts":[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}], "includeProperties":[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-94,N'Umbraco.Label',N'Date',N'{"umbracoDataValueType":"DATETIME"}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-93,N'Umbraco.Label',N'Nvarchar',N'{"umbracoDataValueType":"BIGINT"}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-92,N'Umbraco.Label',N'Nvarchar',N'{"umbracoDataValueType":"STRING"}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-91,N'Umbraco.Label',N'Integer',N'{"umbracoDataValueType":"INT"}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-90,N'Umbraco.UploadField',N'Nvarchar',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-89,N'Umbraco.TextArea',N'Ntext',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-88,N'Umbraco.TextBox',N'Nvarchar',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-87,N'Umbraco.TinyMCE',N'Ntext',N'{"value":",code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|"}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-51,N'Umbraco.Integer',N'Integer',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-49,N'Umbraco.TrueFalse',N'Integer',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-43,N'Umbraco.CheckBoxList',N'Nvarchar',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-42,N'Umbraco.DropDown.Flexible',N'Nvarchar',N'{"multiple":true}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-41,N'Umbraco.DateTime',N'Date',N'{"format":"YYYY-MM-DD"}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-40,N'Umbraco.RadioButtonList',N'Nvarchar',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-39,N'Umbraco.DropDown.Flexible',N'Nvarchar',N'{"multiple":false}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-37,N'Umbraco.ColorPicker',N'Nvarchar',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-36,N'Umbraco.DateTime',N'Date',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1041,N'Umbraco.Tags',N'Ntext',N'{"group":"default", "storageType":"Json"}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1043,N'Umbraco.ImageCropper',N'Ntext',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1046,N'Umbraco.ContentPicker',N'Nvarchar',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1047,N'Umbraco.MemberPicker',N'Nvarchar',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1048,N'Umbraco.MediaPicker',N'Ntext',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1049,N'Umbraco.MediaPicker',N'Ntext',N'{"multiPicker":1}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1050,N'Umbraco.MultiUrlPicker',N'Ntext',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1062,N'Umbraco.TextArea',N'Ntext',N'{}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1063,N'Umbraco.DropDown.Flexible',N'Nvarchar',N'{"multiple":false,"items":[{"id":1,"value":"White"},{"id":2,"value":"Black"},{"id":3,"value":"Yellow"},{"id":4,"value":"Orange"},{"id":5,"value":"Pink"},{"id":6,"value":"Purple"}]}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1065,N'Umbraco.TextArea',N'Ntext',N'{}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1078,N'Umbraco.Grid',N'Ntext',N'{"items":{"styles":[{"label":"Set a background image","description":"Set a row background","key":"background-image","view":"imagepicker","modifier":"url({0})"}],"config":[{"label":"Class","description":"Set a css class","key":"class","view":"textstring"}],"columns":12,"templates":[{"name":"1 column layout","sections":[{"grid":12}]}],"layouts":[{"name":"Full","areas":[{"grid":12,"allowAll":true}],"label":"Full"},{"name":"Half","areas":[{"grid":6,"allowAll":true}],"label":"Half"},{"name":"Thirds","areas":[{"grid":4,"allowAll":true}],"label":"Thirds"}]},"rte":{"toolbar":["ace","styleselect","bold","italic","alignleft","aligncenter","alignright","bullist","numlist","outdent","indent","link","umbmediapicker","umbmacro","umbembeddialog"],"stylesheets":[],"maxImageSize":730,"mode":"classic"},"ignoreUserStartNodes":false,"mediaParentId":null}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1090,N'Umbraco.MultiUrlPicker',N'Ntext',N'{"minNumber":0,"maxNumber":1,"ignoreUserStartNodes":false,"hideAnchor":false}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1092,N'Umbraco.NestedContent',N'Ntext',N'{"contentTypes":[{"ncAlias":"iconLinkItem","ncTabAlias":"Content","nameTemplate":"{{iconClass}}"}],"confirmDeletes":true,"showIcons":true,"hideLabel":false}');
GO
SET IDENTITY_INSERT [umbracoConsent] OFF;
GO
SET IDENTITY_INSERT [umbracoCacheInstruction] ON;
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
51,{ts '2020-04-20 10:38:47.837'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1057,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P6844/D2] 8981808D39F1448A9E1BACEF9146C660',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
52,{ts '2020-04-20 10:40:29.510'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1057,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P6844/D2] 8981808D39F1448A9E1BACEF9146C660',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
53,{ts '2020-04-20 10:40:36.663'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P6844/D2] 8981808D39F1448A9E1BACEF9146C660',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
54,{ts '2020-04-20 10:40:41.803'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P6844/D2] 8981808D39F1448A9E1BACEF9146C660',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
55,{ts '2020-04-20 10:40:44.173'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P6844/D2] 8981808D39F1448A9E1BACEF9146C660',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
56,{ts '2020-04-20 10:41:00.403'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P6844/D2] 8981808D39F1448A9E1BACEF9146C660',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
57,{ts '2020-04-20 10:41:43.123'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P6844/D2] 8981808D39F1448A9E1BACEF9146C660',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
58,{ts '2020-04-20 10:41:47.807'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P6844/D2] 8981808D39F1448A9E1BACEF9146C660',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
59,{ts '2020-04-20 10:41:49.183'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P6844/D2] 8981808D39F1448A9E1BACEF9146C660',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
60,{ts '2020-04-20 10:41:54.407'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P6844/D2] 8981808D39F1448A9E1BACEF9146C660',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
61,{ts '2020-04-20 10:41:56.393'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P6844/D2] 8981808D39F1448A9E1BACEF9146C660',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
62,{ts '2020-04-20 10:44:36.583'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1060]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P6844/D2] 8981808D39F1448A9E1BACEF9146C660',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
63,{ts '2020-04-20 10:46:25.960'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P6844/D2] 8981808D39F1448A9E1BACEF9146C660',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
64,{ts '2020-04-20 10:46:59.107'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P6844/D2] 8981808D39F1448A9E1BACEF9146C660',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
65,{ts '2020-04-20 10:48:47.953'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P6844/D2] 8981808D39F1448A9E1BACEF9146C660',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
66,{ts '2020-04-20 10:48:48.547'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P6844/D2] 8981808D39F1448A9E1BACEF9146C660',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
67,{ts '2020-04-20 10:49:18.917'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P6844/D2] 8981808D39F1448A9E1BACEF9146C660',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
68,{ts '2020-04-20 10:50:04.657'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1057,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P6844/D2] 8981808D39F1448A9E1BACEF9146C660',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
69,{ts '2020-04-20 10:50:08.700'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P6844/D2] 8981808D39F1448A9E1BACEF9146C660',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
70,{ts '2020-04-20 10:50:09.600'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P6844/D2] 8981808D39F1448A9E1BACEF9146C660',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
71,{ts '2020-04-21 01:50:47.367'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
72,{ts '2020-04-21 01:51:04.337'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1059]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
73,{ts '2020-04-21 02:03:50.790'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1063,\"Key\":\"623d3cbd-7d33-4a8a-bef0-bfbe34b0bd89\",\"Removed\":false}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
74,{ts '2020-04-21 02:04:31.930'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1057,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
75,{ts '2020-04-21 02:05:11.107'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
76,{ts '2020-04-21 02:07:31.590'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1060]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
77,{ts '2020-04-21 02:07:44.053'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
78,{ts '2020-04-21 02:15:45.873'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
79,{ts '2020-04-21 02:16:47.323'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1060]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
80,{ts '2020-04-21 02:17:07.340'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1060]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
81,{ts '2020-04-21 02:31:10.347'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1057,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
82,{ts '2020-04-21 02:31:43.403'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1064,\"Key\":\"1466e1b8-a73b-4cf2-a1e9-177fce387b96\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
83,{ts '2020-04-21 02:37:08.803'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
84,{ts '2020-04-21 02:43:40.807'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
85,{ts '2020-04-21 02:44:19.053'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
86,{ts '2020-04-21 02:44:23.857'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1064,\"Key\":\"1466e1b8-a73b-4cf2-a1e9-177fce387b96\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
87,{ts '2020-04-21 02:44:32.360'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1064,\"Key\":\"1466e1b8-a73b-4cf2-a1e9-177fce387b96\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
88,{ts '2020-04-21 02:48:11.893'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1057,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
89,{ts '2020-04-21 02:48:17.923'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
90,{ts '2020-04-21 02:53:54.453'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
91,{ts '2020-04-21 02:54:00.717'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
92,{ts '2020-04-21 03:15:09.083'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
93,{ts '2020-04-21 03:15:09.860'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
94,{ts '2020-04-21 03:15:41.230'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
95,{ts '2020-04-21 03:15:46.543'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
96,{ts '2020-04-21 03:16:58.770'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P13056/D2] B0BA074EEE07489391905F69D2B5569A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
97,{ts '2020-04-21 03:25:19.243'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P812/D2] FA8DE748D28C4C42B1001CE34DCE12AA',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
98,{ts '2020-04-21 03:26:40.957'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1065,\"Key\":\"3d321f6c-fc7d-4a72-aed3-f7fabb925f5b\",\"Removed\":false}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P812/D2] FA8DE748D28C4C42B1001CE34DCE12AA',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
99,{ts '2020-04-21 03:26:50.890'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1057,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P812/D2] FA8DE748D28C4C42B1001CE34DCE12AA',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
100,{ts '2020-04-21 04:06:36.950'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P812/D2] FA8DE748D28C4C42B1001CE34DCE12AA',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
101,{ts '2020-04-21 04:07:34.130'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1061,\"Key\":\"c03947f6-982c-4dc4-bf8d-fb8f57cbb7f7\",\"ChangeTypes\":8},{\"Id\":1058,\"Key\":\"842a6988-e993-4259-a613-f03aac7b719e\",\"ChangeTypes\":8}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P812/D2] FA8DE748D28C4C42B1001CE34DCE12AA',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
102,{ts '2020-04-21 04:13:23.653'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1066,\"Key\":\"094647f2-4487-4dd0-8b33-3dac3208f7a2\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P812/D2] FA8DE748D28C4C42B1001CE34DCE12AA',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
103,{ts '2020-04-21 04:13:32.730'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1066,\"Key\":\"094647f2-4487-4dd0-8b33-3dac3208f7a2\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P812/D2] FA8DE748D28C4C42B1001CE34DCE12AA',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
104,{ts '2020-04-21 04:18:25.040'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1060]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P812/D2] FA8DE748D28C4C42B1001CE34DCE12AA',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
105,{ts '2020-04-21 04:27:10.053'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1060]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P812/D2] FA8DE748D28C4C42B1001CE34DCE12AA',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
106,{ts '2020-04-21 04:28:25.963'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1066,\"Key\":\"094647f2-4487-4dd0-8b33-3dac3208f7a2\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P812/D2] FA8DE748D28C4C42B1001CE34DCE12AA',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
107,{ts '2020-04-21 04:59:41.817'},N'[{"RefreshType":4,"RefresherId":"3e0f95d8-0be5-44b8-8394-2b8750b62654","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":2,\"IsoCode\":\"vi\",\"ChangeType\":3}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P9884/D2] EAF383894C8E459B86888388EC4A7A59',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
108,{ts '2020-04-21 06:34:56.770'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P9884/D2] EAF383894C8E459B86888388EC4A7A59',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
109,{ts '2020-04-21 06:35:23.330'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1066,\"Key\":\"094647f2-4487-4dd0-8b33-3dac3208f7a2\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P9884/D2] EAF383894C8E459B86888388EC4A7A59',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
110,{ts '2020-04-21 06:36:07.687'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1066,\"Key\":\"094647f2-4487-4dd0-8b33-3dac3208f7a2\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P9884/D2] EAF383894C8E459B86888388EC4A7A59',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
111,{ts '2020-04-21 06:38:00.433'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1066,\"Key\":\"094647f2-4487-4dd0-8b33-3dac3208f7a2\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P9884/D2] EAF383894C8E459B86888388EC4A7A59',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
112,{ts '2020-04-21 06:39:31.297'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1052,\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P9884/D2] EAF383894C8E459B86888388EC4A7A59',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
113,{ts '2020-04-21 06:41:22.287'},N'[{"RefreshType":4,"RefresherId":"3e0f95d8-0be5-44b8-8394-2b8750b62654","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":2,\"IsoCode\":\"vi\",\"ChangeType\":1}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P9884/D2] EAF383894C8E459B86888388EC4A7A59',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
114,{ts '2020-04-21 07:39:46.830'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3120/D2] 79F8B29430994D989CC7C149E2F63D19',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
115,{ts '2020-04-21 07:45:25.833'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1066,\"Key\":\"094647f2-4487-4dd0-8b33-3dac3208f7a2\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3120/D2] 79F8B29430994D989CC7C149E2F63D19',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
116,{ts '2020-04-21 08:11:25.660'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3120/D2] 79F8B29430994D989CC7C149E2F63D19',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
117,{ts '2020-04-21 08:14:12.253'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1057,\"ChangeTypes\":8},{\"ItemType\":\"IContentType\",\"Id\":1052,\"ChangeTypes\":6}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3120/D2] 79F8B29430994D989CC7C149E2F63D19',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
118,{ts '2020-04-21 08:16:00.350'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1067,\"ChangeTypes\":1}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3120/D2] 79F8B29430994D989CC7C149E2F63D19',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
119,{ts '2020-04-21 08:17:38.420'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1068,\"ChangeTypes\":1}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3120/D2] 79F8B29430994D989CC7C149E2F63D19',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
120,{ts '2020-04-21 08:18:09.430'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1069,\"ChangeTypes\":1}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3120/D2] 79F8B29430994D989CC7C149E2F63D19',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
121,{ts '2020-04-21 08:18:47.483'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1070,\"ChangeTypes\":1}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3120/D2] 79F8B29430994D989CC7C149E2F63D19',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
122,{ts '2020-04-21 08:19:00.937'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1070,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3120/D2] 79F8B29430994D989CC7C149E2F63D19',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
123,{ts '2020-04-21 08:19:21.377'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1071,\"ChangeTypes\":1}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3120/D2] 79F8B29430994D989CC7C149E2F63D19',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
124,{ts '2020-04-21 08:20:44.693'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":1}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3120/D2] 79F8B29430994D989CC7C149E2F63D19',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
125,{ts '2020-04-21 08:20:58.910'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1074,\"ChangeTypes\":1}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3120/D2] 79F8B29430994D989CC7C149E2F63D19',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
126,{ts '2020-04-21 08:22:35.847'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1075,\"ChangeTypes\":8}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3120/D2] 79F8B29430994D989CC7C149E2F63D19',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
127,{ts '2020-04-21 08:25:30.953'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P5028/D2] C1C2123861424D1389F4FF23F670CF13',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
128,{ts '2020-04-21 08:26:29.497'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1077,\"ChangeTypes\":1}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P5028/D2] C1C2123861424D1389F4FF23F670CF13',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
129,{ts '2020-04-21 08:32:56.323'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1077,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P5028/D2] C1C2123861424D1389F4FF23F670CF13',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
130,{ts '2020-04-21 08:34:00.270'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1077,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P5028/D2] C1C2123861424D1389F4FF23F670CF13',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
131,{ts '2020-04-21 08:49:02.760'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1078,\"Key\":\"df101349-b5cc-46c1-a1da-e1ac063593df\",\"Removed\":false}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P5028/D2] C1C2123861424D1389F4FF23F670CF13',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
132,{ts '2020-04-21 08:52:56.507'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1078,\"Key\":\"df101349-b5cc-46c1-a1da-e1ac063593df\",\"Removed\":false}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P5028/D2] C1C2123861424D1389F4FF23F670CF13',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
133,{ts '2020-04-21 08:54:05.473'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1078,\"Key\":\"df101349-b5cc-46c1-a1da-e1ac063593df\",\"Removed\":false}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P5028/D2] C1C2123861424D1389F4FF23F670CF13',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
134,{ts '2020-04-21 08:54:24.540'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1079,\"ChangeTypes\":1}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P5028/D2] C1C2123861424D1389F4FF23F670CF13',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
135,{ts '2020-04-21 08:55:32.203'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1079,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P5028/D2] C1C2123861424D1389F4FF23F670CF13',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
136,{ts '2020-04-21 08:58:34.147'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1080,\"ChangeTypes\":1}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P5028/D2] C1C2123861424D1389F4FF23F670CF13',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
137,{ts '2020-04-21 09:01:08.510'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1078,\"Key\":\"df101349-b5cc-46c1-a1da-e1ac063593df\",\"Removed\":false}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P5028/D2] C1C2123861424D1389F4FF23F670CF13',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
138,{ts '2020-04-21 09:03:59.633'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
139,{ts '2020-04-21 09:04:18.450'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1081,\"ChangeTypes\":8}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
140,{ts '2020-04-21 09:04:30.043'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1080,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
141,{ts '2020-04-21 09:05:07.137'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1082,\"ChangeTypes\":1}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
142,{ts '2020-04-21 09:07:46.690'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1082,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
143,{ts '2020-04-21 09:13:53.163'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1083,\"ChangeTypes\":1}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
144,{ts '2020-04-21 09:23:17.270'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1086,\"ChangeTypes\":1}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
145,{ts '2020-04-21 09:23:29.897'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1086,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
146,{ts '2020-04-21 09:25:53.517'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1087,\"ChangeTypes\":1}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
147,{ts '2020-04-21 09:27:09.777'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1088,\"ChangeTypes\":1}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
148,{ts '2020-04-21 09:34:51.773'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1090,\"Key\":\"5e122caf-159a-4e0b-b096-2ba775ed3269\",\"Removed\":false}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
149,{ts '2020-04-21 09:35:45.863'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1091,\"ChangeTypes\":1}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
150,{ts '2020-04-21 09:44:31.137'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1092,\"Key\":\"2f12731a-8212-42f8-a60b-cb34df6a94cd\",\"Removed\":false}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
151,{ts '2020-04-21 09:46:35.020'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1088,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
152,{ts '2020-04-21 09:49:01.483'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1082,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
153,{ts '2020-04-21 09:49:11.480'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1085,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
154,{ts '2020-04-21 09:49:23.037'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1086,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
155,{ts '2020-04-21 09:49:32.490'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1080,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
156,{ts '2020-04-21 09:51:04.077'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1068,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
157,{ts '2020-04-21 09:53:19.903'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1086,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
158,{ts '2020-04-21 09:56:16.563'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1082,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
159,{ts '2020-04-21 09:57:15.107'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1069,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
160,{ts '2020-04-21 09:57:22.843'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1082,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
161,{ts '2020-04-21 10:01:22.403'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1085,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
162,{ts '2020-04-21 10:01:28.423'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1085,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
163,{ts '2020-04-21 10:03:11.970'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1070,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
164,{ts '2020-04-21 10:03:42.570'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1071,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
165,{ts '2020-04-21 10:06:01.443'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
166,{ts '2020-04-21 10:19:06.020'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
167,{ts '2020-04-21 10:19:17.357'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1052,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
168,{ts '2020-04-21 10:20:31.260'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1088,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
169,{ts '2020-04-21 10:20:39.813'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1052,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
170,{ts '2020-04-21 10:27:19.870'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1052,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
171,{ts '2020-04-21 10:29:59.997'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1069,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
172,{ts '2020-04-21 10:33:45.867'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1093,\"Key\":\"04f3a48a-d1db-4247-96d9-ce9c52f0a66e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
173,{ts '2020-04-21 10:33:58.327'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1094,\"Key\":\"082105b9-5a39-4649-877c-f55785a2851a\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
174,{ts '2020-04-21 10:34:40.967'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1095,\"Key\":\"3b822c8a-ad72-4bf9-b5be-4f1d7777e219\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
175,{ts '2020-04-21 10:35:13.867'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1096,\"Key\":\"b2d1c20d-996b-4511-8386-d0d631a05c5d\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
176,{ts '2020-04-21 10:35:33.140'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1097,\"Key\":\"bee6aa6c-45a4-4993-9351-a43fe1cf64a1\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
177,{ts '2020-04-21 10:35:57.877'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1097,\"Key\":\"bee6aa6c-45a4-4993-9351-a43fe1cf64a1\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
178,{ts '2020-04-21 10:36:21.520'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1076,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
179,{ts '2020-04-21 10:36:51.427'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1096,\"Key\":\"b2d1c20d-996b-4511-8386-d0d631a05c5d\",\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
180,{ts '2020-04-21 10:37:04.770'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1096,\"Key\":\"b2d1c20d-996b-4511-8386-d0d631a05c5d\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
181,{ts '2020-04-21 10:46:26.653'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1098,\"Key\":\"6e790314-692d-431b-b855-e1eaa4fadd69\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
182,{ts '2020-04-21 10:46:28.417'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1098,\"Key\":\"6e790314-692d-431b-b855-e1eaa4fadd69\",\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
183,{ts '2020-04-21 10:46:50.503'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1094,\"Key\":\"082105b9-5a39-4649-877c-f55785a2851a\",\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
184,{ts '2020-04-21 10:46:53.097'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1098,\"Key\":\"6e790314-692d-431b-b855-e1eaa4fadd69\",\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P3960/D3] E971BFC0A4F9495BAB6E5E4C5260D864',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
185,{ts '2020-04-22 01:20:29.250'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P10016/D2] 42987A32C6354F9B9BA391CB40F43E7E',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
186,{ts '2020-04-22 02:49:46.837'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11800/D2] FA5F5836F8E44E548660DBEEBEB03704',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
187,{ts '2020-04-22 03:46:37.397'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P7060/D2] 00C8101F4FA14E6A8CD591534E4E8EB9',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
188,{ts '2020-04-22 03:52:06.320'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11492/D2] D422E1B0DED544AE92A0EBEC12C7AC6A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
189,{ts '2020-04-22 04:05:45.570'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
190,{ts '2020-04-22 04:06:08.473'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
191,{ts '2020-04-22 04:06:35.207'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1060]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
192,{ts '2020-04-22 04:07:03.527'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
193,{ts '2020-04-22 04:07:12.703'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1100]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
194,{ts '2020-04-22 04:10:13.600'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1100]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
195,{ts '2020-04-22 04:12:54.407'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1068,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
196,{ts '2020-04-22 04:13:08.073'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1069,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
197,{ts '2020-04-22 04:13:41.757'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1094,\"Key\":\"082105b9-5a39-4649-877c-f55785a2851a\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
198,{ts '2020-04-22 04:26:43.257'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1100]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
199,{ts '2020-04-22 04:28:17.183'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1098,\"Key\":\"6e790314-692d-431b-b855-e1eaa4fadd69\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
200,{ts '2020-04-22 04:36:23.887'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1101]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
201,{ts '2020-04-22 04:36:36.313'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1101]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
202,{ts '2020-04-22 04:36:52.150'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1071,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
203,{ts '2020-04-22 04:39:04.587'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1093,\"Key\":\"04f3a48a-d1db-4247-96d9-ce9c52f0a66e\",\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
204,{ts '2020-04-22 04:40:32.870'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1101]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
205,{ts '2020-04-22 04:43:46.897'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1102]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
206,{ts '2020-04-22 04:52:39.343'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1102]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
207,{ts '2020-04-22 04:53:36.387'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1102]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
208,{ts '2020-04-22 04:53:50.030'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1074,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
209,{ts '2020-04-22 04:53:59.927'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1097,\"Key\":\"bee6aa6c-45a4-4993-9351-a43fe1cf64a1\",\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
210,{ts '2020-04-22 04:54:03.130'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1097,\"Key\":\"bee6aa6c-45a4-4993-9351-a43fe1cf64a1\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
211,{ts '2020-04-22 04:58:11.773'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1103]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
212,{ts '2020-04-22 04:59:19.077'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1103]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
213,{ts '2020-04-22 04:59:30.630'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1070,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
214,{ts '2020-04-22 05:00:00.313'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1070,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
215,{ts '2020-04-22 05:00:11.130'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1095,\"Key\":\"3b822c8a-ad72-4bf9-b5be-4f1d7777e219\",\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P2356/D2] DB1FC25879F64F32B0D3949F2A18F60D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
216,{ts '2020-04-22 06:34:51.123'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
217,{ts '2020-04-22 06:40:58.563'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1104]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
218,{ts '2020-04-22 06:41:00.257'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1104]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
219,{ts '2020-04-22 06:41:16.840'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1076,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
220,{ts '2020-04-22 06:42:38.790'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1105]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
221,{ts '2020-04-22 06:44:06.547'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1105]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
222,{ts '2020-04-22 06:44:16.427'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":4}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
223,{ts '2020-04-22 06:45:43.343'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1106,\"Key\":\"392a635a-d274-4d4c-9ba0-a09e653b203f\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
224,{ts '2020-04-22 06:46:03.940'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1107,\"Key\":\"91988fc5-103a-4baa-812b-9a9f15102660\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
225,{ts '2020-04-22 06:47:34.393'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1105]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
226,{ts '2020-04-22 06:49:37.783'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1100]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
227,{ts '2020-04-22 06:49:47.460'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
228,{ts '2020-04-22 06:49:54.620'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1103]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
229,{ts '2020-04-22 06:50:01.850'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1101]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
230,{ts '2020-04-22 06:50:10.367'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1105]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
231,{ts '2020-04-22 06:50:19.050'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1102]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
232,{ts '2020-04-22 07:00:27.290'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1105]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
233,{ts '2020-04-22 07:00:44.737'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1105]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
234,{ts '2020-04-22 07:01:19.427'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1105]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
235,{ts '2020-04-22 07:06:06.410'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1105]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
236,{ts '2020-04-22 07:06:14.450'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1105]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
237,{ts '2020-04-22 07:07:17.323'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1105]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
238,{ts '2020-04-22 07:09:46.300'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1105]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P11856/D2] 463A12B6619B428C91D35F177EB7382D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
239,{ts '2020-04-22 07:28:21.030'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P1664/D2] C3393FD2625C44599ADD15B61D04979F',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
240,{ts '2020-04-22 07:37:08.300'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1093,\"Key\":\"04f3a48a-d1db-4247-96d9-ce9c52f0a66e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P1664/D2] C3393FD2625C44599ADD15B61D04979F',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
241,{ts '2020-04-22 07:47:01.340'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1093,\"Key\":\"04f3a48a-d1db-4247-96d9-ce9c52f0a66e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P1664/D2] C3393FD2625C44599ADD15B61D04979F',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
242,{ts '2020-04-22 07:47:03.593'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1093,\"Key\":\"04f3a48a-d1db-4247-96d9-ce9c52f0a66e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P1664/D2] C3393FD2625C44599ADD15B61D04979F',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
243,{ts '2020-04-22 07:50:38.300'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1093,\"Key\":\"04f3a48a-d1db-4247-96d9-ce9c52f0a66e\",\"ChangeTypes\":2}]"}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P1664/D2] C3393FD2625C44599ADD15B61D04979F',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
244,{ts '2020-04-22 08:29:44.493'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P1664/D2] C3393FD2625C44599ADD15B61D04979F',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
245,{ts '2020-04-22 09:09:35.047'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P1664/D8] A7A0D12409A04C1D8C71288BE0BE09E9',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
246,{ts '2020-04-22 09:54:19.540'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-CCRG921//LM/W3SVC/2/ROOT [P8600/D4] 94A50E1A7F8D4D7E8EAB3BE3C1DAC980',1);
GO
SET IDENTITY_INSERT [umbracoCacheInstruction] OFF;
GO
SET IDENTITY_INSERT [umbracoAudit] ON;
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
1,0,N'User "SYTEM" ',N'::1',{ts '2020-04-20 07:32:49.987'},-1,N'User "Administrator" ',N'umbraco/user/save',N'updating RawPasswordValue, LastPasswordChangeDate, UpdateDate, SecurityStamp');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
2,0,N'User "SYTEM" ',N'::1',{ts '2020-04-20 07:32:50.187'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating Email, Name, Username, UpdateDate, SecurityStamp');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
3,0,N'User "SYTEM" ',N'::1',{ts '2020-04-20 07:32:50.320'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
4,0,N'User "SYTEM" ',N'::1',{ts '2020-04-20 07:34:08.783'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
5,0,N'User "SYTEM" ',N'::1',{ts '2020-04-20 07:34:08.817'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
6,-1,N'User "admin" <admin@admin.com>',N'::1',{ts '2020-04-20 07:34:08.893'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating TourData, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
7,-1,N'User "admin" <admin@admin.com>',N'::1',{ts '2020-04-20 07:34:12.847'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating TourData, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
8,0,N'User "SYTEM" ',N'127.0.0.1',{ts '2020-04-20 09:35:26.297'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
9,0,N'User "SYTEM" ',N'127.0.0.1',{ts '2020-04-20 09:35:26.790'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
10,0,N'User "SYTEM" ',N'::1',{ts '2020-04-21 01:50:46.193'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
11,0,N'User "SYTEM" ',N'::1',{ts '2020-04-21 01:50:46.603'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
12,0,N'User "SYTEM" ',N'::1',{ts '2020-04-21 04:06:36.797'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
13,0,N'User "SYTEM" ',N'::1',{ts '2020-04-21 04:06:36.933'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
14,0,N'User "SYTEM" ',N'::1',{ts '2020-04-21 06:34:54.383'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
15,0,N'User "SYTEM" ',N'::1',{ts '2020-04-21 06:34:56.770'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
16,0,N'User "SYTEM" ',N'::1',{ts '2020-04-21 07:39:45.890'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
17,0,N'User "SYTEM" ',N'::1',{ts '2020-04-21 07:39:46.127'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
18,0,N'User "SYTEM" ',N'::1',{ts '2020-04-21 08:11:25.590'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
19,0,N'User "SYTEM" ',N'::1',{ts '2020-04-21 08:11:25.643'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
20,0,N'User "SYTEM" ',N'::1',{ts '2020-04-21 08:24:26.883'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/logout',N'logout success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
21,0,N'User "SYTEM" ',N'::1',{ts '2020-04-21 08:25:29.653'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
22,0,N'User "SYTEM" ',N'::1',{ts '2020-04-21 08:25:30.257'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
23,0,N'User "SYTEM" ',N'::1',{ts '2020-04-21 09:02:34.063'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/logout',N'logout success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
24,0,N'User "SYTEM" ',N'::1',{ts '2020-04-21 09:03:58.477'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
25,0,N'User "SYTEM" ',N'::1',{ts '2020-04-21 09:03:59.023'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
26,0,N'User "SYTEM" ',N'::1',{ts '2020-04-21 10:19:05.990'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
27,0,N'User "SYTEM" ',N'::1',{ts '2020-04-21 10:19:06.013'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
28,0,N'User "SYTEM" ',N'::1',{ts '2020-04-22 01:20:27.837'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
29,0,N'User "SYTEM" ',N'::1',{ts '2020-04-22 01:20:28.373'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
30,0,N'User "SYTEM" ',N'::1',{ts '2020-04-22 02:49:45.343'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
31,0,N'User "SYTEM" ',N'::1',{ts '2020-04-22 02:49:45.817'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
32,0,N'User "SYTEM" ',N'::1',{ts '2020-04-22 03:46:35.833'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
33,0,N'User "SYTEM" ',N'::1',{ts '2020-04-22 03:46:36.337'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
34,0,N'User "SYTEM" ',N'::1',{ts '2020-04-22 03:46:48.423'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/logout',N'logout success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
35,0,N'User "SYTEM" ',N'::1',{ts '2020-04-22 03:52:04.847'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
36,0,N'User "SYTEM" ',N'::1',{ts '2020-04-22 03:52:05.377'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
37,0,N'User "SYTEM" ',N'::1',{ts '2020-04-22 06:34:49.510'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
38,0,N'User "SYTEM" ',N'::1',{ts '2020-04-22 06:34:50.080'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
39,0,N'User "SYTEM" ',N'127.0.0.1',{ts '2020-04-22 07:28:19.460'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
40,0,N'User "SYTEM" ',N'127.0.0.1',{ts '2020-04-22 07:28:20.020'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
41,0,N'User "SYTEM" ',N'127.0.0.1',{ts '2020-04-22 08:29:44.010'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
42,0,N'User "SYTEM" ',N'127.0.0.1',{ts '2020-04-22 08:29:44.293'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
43,0,N'User "SYTEM" ',N'127.0.0.1',{ts '2020-04-22 09:08:47.637'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
44,0,N'User "SYTEM" ',N'127.0.0.1',{ts '2020-04-22 09:08:47.867'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
45,0,N'User "SYTEM" ',N'127.0.0.1',{ts '2020-04-22 09:09:34.137'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
46,0,N'User "SYTEM" ',N'127.0.0.1',{ts '2020-04-22 09:09:34.457'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
47,0,N'User "SYTEM" ',N'127.0.0.1',{ts '2020-04-22 09:54:18.560'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
48,0,N'User "SYTEM" ',N'127.0.0.1',{ts '2020-04-22 09:54:18.873'},-1,N'User "admin" <admin@admin.com>',N'umbraco/user/sign-in/login',N'login success');
GO
SET IDENTITY_INSERT [umbracoAudit] OFF;
GO
SET IDENTITY_INSERT [cmsTemplate] ON;
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias]) VALUES (
4,1059,N'master');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias]) VALUES (
5,1060,N'home');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias]) VALUES (
6,1099,N'articleLists');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias]) VALUES (
7,1100,N'article');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias]) VALUES (
8,1101,N'content');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias]) VALUES (
9,1102,N'search');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias]) VALUES (
10,1103,N'contact');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias]) VALUES (
11,1104,N'xMLSitemap');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias]) VALUES (
12,1105,N'error');
GO
SET IDENTITY_INSERT [cmsTemplate] OFF;
GO
SET IDENTITY_INSERT [cmsTags] OFF;
GO
SET IDENTITY_INSERT [cmsMacro] OFF;
GO
SET IDENTITY_INSERT [cmsMacroProperty] OFF;
GO
SET IDENTITY_INSERT [cmsDictionary] OFF;
GO
SET IDENTITY_INSERT [cmsLanguageText] OFF;
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1080,1068);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1080,1069);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1080,1071);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1080,1073);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1080,1076);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1082,1052);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1082,1068);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1082,1069);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1082,1071);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1082,1073);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1083,1068);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1084,1052);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1084,1068);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1084,1069);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1084,1071);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1084,1073);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1085,1052);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1085,1068);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1085,1069);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1085,1071);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1085,1073);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1086,1052);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1086,1068);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1086,1069);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1086,1071);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1086,1073);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1087,1070);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1088,1052);
GO
SET IDENTITY_INSERT [cmsContentType] ON;
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
531,1044,N'Member',N'icon-user',N'icon-user',NULL,0,0,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
532,1031,N'Folder',N'icon-folder',N'icon-folder',NULL,0,0,1,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
533,1032,N'Image',N'icon-picture',N'icon-picture',NULL,0,0,1,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
534,1033,N'File',N'icon-document',N'icon-document',NULL,0,0,1,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
535,1052,N'home',N'icon-home color-light-blue',N'folder.png',NULL,0,0,1,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
538,1068,N'article',N'icon-article color-blue',N'folder.png',NULL,0,0,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
539,1069,N'articleList',N'icon-thumbnail-list color-blue',N'folder.png',NULL,0,0,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
540,1070,N'contact',N'icon-user color-blue',N'folder.png',NULL,0,0,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
541,1071,N'content',N'icon-umb-content color-blue',N'folder.png',NULL,0,0,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
543,1073,N'error',N'icon-application-error color-blue',N'folder.png',NULL,0,0,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
544,1074,N'search',N'icon-search color-blue',N'folder.png',NULL,0,0,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
546,1076,N'xMLSitemap',N'icon-sitemap color-blue',N'folder.png',NULL,0,0,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
549,1080,N'visibilityControls1',N'icon-defrag color-pink',N'folder.png',NULL,0,0,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
551,1082,N'contentControls',N'icon-defrag color-pink',N'folder.png',NULL,0,0,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
552,1083,N'articleControls',N'icon-defrag color-pink',N'folder.png',NULL,0,0,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
553,1084,N'headerControls',N'icon-defrag color-pink',N'folder.png',NULL,0,0,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
554,1085,N'mainPageControls',N'icon-defrag color-pink',N'folder.png',NULL,0,0,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
555,1086,N'sEAOControls',N'icon-defrag color-pink',N'folder.png',NULL,0,0,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
556,1087,N'contactFormControls',N'icon-defrag color-pink',N'folder.png',NULL,0,0,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
557,1088,N'footerControls',N'icon-defrag color-pink',N'folder.png',NULL,0,0,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
558,1091,N'iconLinkItem',N'icon-link color-light-blue',N'folder.png',NULL,0,1,0,0);
GO
SET IDENTITY_INSERT [cmsContentType] OFF;
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1064,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1066,1052);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1093,1071);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1094,1069);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1095,1070);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1096,1076);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1097,1074);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1098,1068);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1106,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1107,1073);
GO
INSERT INTO [umbracoDocument] ([nodeId],[published],[edited]) VALUES (
1066,1,0);
GO
INSERT INTO [umbracoDocument] ([nodeId],[published],[edited]) VALUES (
1093,1,0);
GO
INSERT INTO [umbracoDocument] ([nodeId],[published],[edited]) VALUES (
1094,1,0);
GO
INSERT INTO [umbracoDocument] ([nodeId],[published],[edited]) VALUES (
1095,1,0);
GO
INSERT INTO [umbracoDocument] ([nodeId],[published],[edited]) VALUES (
1096,1,1);
GO
INSERT INTO [umbracoDocument] ([nodeId],[published],[edited]) VALUES (
1097,1,0);
GO
INSERT INTO [umbracoDocument] ([nodeId],[published],[edited]) VALUES (
1098,1,0);
GO
INSERT INTO [umbracoDocument] ([nodeId],[published],[edited]) VALUES (
1107,1,0);
GO
SET IDENTITY_INSERT [umbracoContentVersion] ON;
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
15,1064,{ts '2020-04-21 09:44:32.270'},NULL,1,N'Cat');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
22,1066,{ts '2020-04-21 11:13:18.457'},-1,0,N'Home');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
23,1066,{ts '2020-04-21 11:28:25.717'},-1,0,N'Home');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
24,1066,{ts '2020-04-21 13:38:00.203'},-1,0,N'Home');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
25,1066,{ts '2020-04-21 13:38:00.203'},-1,1,N'Home');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
26,1093,{ts '2020-04-22 11:39:03.503'},-1,0,N'About');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
27,1094,{ts '2020-04-21 17:46:50.307'},-1,0,N'Blog');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
28,1095,{ts '2020-04-22 12:00:10.050'},-1,0,N'Contact');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
29,1096,{ts '2020-04-21 17:36:44.297'},-1,0,N'XML Sitemap');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
30,1097,{ts '2020-04-22 11:53:58.557'},-1,0,N'Search');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
31,1096,{ts '2020-04-21 17:37:04.670'},-1,1,N'XML Sitemap');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
32,1098,{ts '2020-04-21 17:46:52.960'},-1,0,N'Test Article');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
33,1094,{ts '2020-04-22 11:13:39.917'},-1,0,N'Blog');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
34,1098,{ts '2020-04-22 11:28:16.517'},-1,0,N'Test Article');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
35,1094,{ts '2020-04-22 11:13:39.917'},-1,1,N'Blog');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
36,1098,{ts '2020-04-22 11:28:16.517'},-1,1,N'Test Article');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
37,1093,{ts '2020-04-22 14:37:06.097'},-1,0,N'About');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
38,1097,{ts '2020-04-22 11:53:58.557'},-1,1,N'Search');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
39,1095,{ts '2020-04-22 12:00:10.050'},-1,1,N'Contact');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
40,1106,{ts '2020-04-22 13:45:42.760'},NULL,1,N'(GIF Image, 1024 × 768 Pixels)');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
41,1107,{ts '2020-04-22 13:46:01.687'},-1,0,N'Error');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
42,1107,{ts '2020-04-22 13:46:01.687'},-1,1,N'Error');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
43,1093,{ts '2020-04-22 14:47:02.657'},-1,0,N'About');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
44,1093,{ts '2020-04-22 14:50:37.373'},-1,0,N'About');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
45,1093,{ts '2020-04-22 14:50:37.373'},-1,1,N'About');
GO
SET IDENTITY_INSERT [umbracoContentVersion] OFF;
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
15,N'/media/x1qhmfb1/mikhail-vasilyev-nodtncsldte-unsplash.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
40,N'/media/lrrduolu/gif-image-1024-768-pixels.gif');
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
22,1060,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
23,1060,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
24,1060,1);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
25,1060,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
26,1101,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
27,NULL,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
28,1103,1);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
29,NULL,1);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
30,1102,1);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
31,NULL,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
32,NULL,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
33,1099,1);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
34,1100,1);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
35,1099,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
36,1100,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
37,1101,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
38,1102,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
39,1103,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
41,1105,1);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
42,1105,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
43,1101,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
44,1101,1);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
45,1101,0);
GO
SET IDENTITY_INSERT [umbracoContentVersionCultureVariation] ON;
GO
INSERT INTO [umbracoContentVersionCultureVariation] ([id],[versionId],[languageId],[name],[date],[availableUserId]) VALUES (
64,22,1,N'Home',{ts '2020-04-21 11:13:18.457'},NULL);
GO
INSERT INTO [umbracoContentVersionCultureVariation] ([id],[versionId],[languageId],[name],[date],[availableUserId]) VALUES (
67,23,1,N'Home',{ts '2020-04-21 11:28:25.717'},NULL);
GO
INSERT INTO [umbracoContentVersionCultureVariation] ([id],[versionId],[languageId],[name],[date],[availableUserId]) VALUES (
70,25,1,N'Home',{ts '2020-04-21 13:38:00.203'},NULL);
GO
INSERT INTO [umbracoContentVersionCultureVariation] ([id],[versionId],[languageId],[name],[date],[availableUserId]) VALUES (
71,24,1,N'Home',{ts '2020-04-21 13:38:00.203'},NULL);
GO
SET IDENTITY_INSERT [umbracoContentVersionCultureVariation] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyTypeGroup] ON;
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
3,1032,N'Image',1,'79ed4d07-254a-42cf-8fa9-ebe1c116a596');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
4,1033,N'File',1,'50899f9c-023a-4466-b623-aba9049885fe');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
11,1044,N'Membership',1,'0756729d-d665-46e3-b84a-37aceaa614f8');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
15,1080,N'Visibility',5,'6c91fbf1-dd4d-4627-9214-2d9409f72d3a');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
17,1082,N'Content',0,'fa88ea61-c227-451a-a7a7-66d0153db659');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
18,1083,N'Content',0,'ee58ee13-207e-448c-af7a-ecc74448eff6');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
19,1084,N'Content',0,'ae2d25a8-fe37-4e78-8a10-fc02e5dfa1d0');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
20,1085,N'Content',0,'c5cd3a8b-62a4-4b58-8d26-28ebfe12354e');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
21,1086,N'SEO',4,'180b170b-3857-421c-a1fa-3226670924a4');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
22,1087,N'Result Messages',0,'59ffb9cf-0120-4bb9-b33a-174cd3a227be');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
23,1091,N'Content',0,'c2dcfcfd-5917-4691-952d-0000640de7d4');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
24,1088,N'Footer',4,'144fc0b4-8b80-4214-9147-c03a8405a06d');
GO
SET IDENTITY_INSERT [cmsPropertyTypeGroup] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyType] ON;
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
6,1043,1032,3,N'umbracoFile',N'Upload image',0,1,NULL,NULL,NULL,NULL,0,'00000006-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
7,-91,1032,3,N'umbracoWidth',N'Width',0,0,NULL,NULL,NULL,N'in pixels',0,'00000007-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
8,-91,1032,3,N'umbracoHeight',N'Height',0,0,NULL,NULL,NULL,N'in pixels',0,'00000008-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
9,-93,1032,3,N'umbracoBytes',N'Size',0,0,NULL,NULL,NULL,N'in bytes',0,'00000009-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
10,-92,1032,3,N'umbracoExtension',N'Type',0,0,NULL,NULL,NULL,NULL,0,'0000000a-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
24,-90,1033,4,N'umbracoFile',N'Upload file',0,1,NULL,NULL,NULL,NULL,0,'00000018-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
25,-92,1033,4,N'umbracoExtension',N'Type',0,0,NULL,NULL,NULL,NULL,0,'00000019-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
26,-93,1033,4,N'umbracoBytes',N'Size',0,0,NULL,NULL,NULL,N'in bytes',0,'0000001a-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
28,-89,1044,11,N'umbracoMemberComments',N'Comments',0,0,NULL,NULL,NULL,NULL,0,'0000001c-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
29,-91,1044,11,N'umbracoMemberFailedPasswordAttempts',N'Failed Password Attempts',1,0,NULL,NULL,NULL,NULL,0,'0000001d-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
30,-49,1044,11,N'umbracoMemberApproved',N'Is Approved',2,0,NULL,NULL,NULL,NULL,0,'0000001e-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
31,-49,1044,11,N'umbracoMemberLockedOut',N'Is Locked Out',3,0,NULL,NULL,NULL,NULL,0,'0000001f-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
32,-94,1044,11,N'umbracoMemberLastLockoutDate',N'Last Lockout Date',4,0,NULL,NULL,NULL,NULL,0,'00000020-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
33,-94,1044,11,N'umbracoMemberLastLogin',N'Last Login Date',5,0,NULL,NULL,NULL,NULL,0,'00000021-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
34,-94,1044,11,N'umbracoMemberLastPasswordChangeDate',N'Last Password Change Date',6,0,NULL,NULL,NULL,NULL,0,'00000022-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
35,-94,1044,11,N'umbracoMemberPasswordRetrievalQuestion',N'Password Question',7,0,NULL,NULL,NULL,NULL,0,'00000023-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
36,-94,1044,11,N'umbracoMemberPasswordRetrievalAnswer',N'Password Answer',8,0,NULL,NULL,NULL,NULL,0,'00000024-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
46,-49,1080,15,N'umbracoNaviHide',N'Umbraco Navi Hide',0,0,NULL,NULL,NULL,N'Hide this page from navigation and search result',0,'94afa794-487c-44ba-9584-04d820cb36db');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
47,-49,1080,15,N'hideFromXMLSitemap',N'Hide from XMLSitemap',1,0,NULL,NULL,NULL,N'Hide this page from the XML Sitemap',0,'b92d2d3f-3406-419b-8dc4-70351f33f732');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
49,1078,1082,17,N'mainContent',N'Main Content',4,0,NULL,NULL,NULL,NULL,0,'a42ece03-a834-4213-ba59-d2844d80f22f');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
50,-36,1083,18,N'articleDate',N'Article Date',0,1,NULL,NULL,NULL,N'Enter the date for the Article',0,'48259b48-b2a9-4091-8635-545f4390e3f5');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
51,-88,1083,18,N'authorName',N'Author Name',1,0,NULL,NULL,NULL,N'Enter the name of the Author',0,'c2e3e2af-bb1e-46ee-9e59-85d961e0cfae');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
52,-88,1084,19,N'title',N'Title',0,0,NULL,NULL,NULL,N'Enter the title for the page',0,'03dee08d-d9b7-4323-8693-3ae59e8525bb');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
53,-88,1084,19,N'subtitle',N'Subtitle',1,0,NULL,NULL,NULL,N'Enter the subtitle for this page',0,'baa9c46c-9046-418c-a6d6-060f22ed7a99');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
54,1048,1085,20,N'mainImage',N'Main Image',3,0,NULL,NULL,NULL,N'Choose the image for the Main Page',0,'b8c0df86-3d4b-401d-b084-f25cc03af302');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
55,-88,1086,21,N'metaName',N'Meta Name',0,0,NULL,NULL,NULL,N'Enter the meta name for this page',0,'b69ca2be-b634-4d7d-904f-e00e9ebf106b');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
56,-89,1086,21,N'metaDescription',N'Meta Description',1,0,NULL,NULL,NULL,N'Enter the meta description for this page',0,'14b80af3-2c16-49be-9af8-4bf3af5b896d');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
57,1041,1086,21,N'metaKeywords',N'Meta Keywords',2,0,NULL,NULL,NULL,N'Enter the keyword for this page',0,'def75fff-9202-4f24-9d7f-ab32ce96efd5');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
58,-87,1087,22,N'successMessage',N'Success Message',0,0,NULL,NULL,NULL,N'Enter a success message',0,'dc687a77-97a9-442c-9fdd-fbaf37954329');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
59,-87,1087,22,N'errorMessage',N'Error Message',1,0,NULL,NULL,NULL,N'Enter an error message',0,'4af883bb-ba66-47e0-8a9b-b27d277680e7');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
60,-88,1091,23,N'iconClass',N'Icon Class',0,1,NULL,NULL,NULL,N'Enter the class name for the Icon eg "fab fa-facebook"',0,'050d8b96-c492-40e8-bc7c-f27fd8c4135b');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
61,1090,1091,23,N'link',N'Link',1,1,NULL,NULL,NULL,N'Enter the link for this item',0,'f119f8c0-8c62-49f5-b9f3-02fcd8d8dfee');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
62,1092,1088,24,N'socialLinks',N'Social Links',0,0,NULL,NULL,NULL,N'Enter a social link for the footer',0,'0fce6403-1054-4b9d-9445-2dd3e36cedb2');
GO
SET IDENTITY_INSERT [cmsPropertyType] OFF;
GO
SET IDENTITY_INSERT [umbracoPropertyData] ON;
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
95,15,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{
"src": "/media/x1qhmfb1/mikhail-vasilyev-nodtncsldte-unsplash.jpg",
"focalPoint": {
"left": 0.50166666666666671,
"top": 0.49871055319534791
},
"crops": null
}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
96,15,7,NULL,NULL,5042,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
97,15,8,NULL,NULL,3151,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
98,15,9,NULL,NULL,NULL,NULL,NULL,N'2697261',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
99,15,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
184,29,46,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
186,29,47,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
188,31,46,NULL,NULL,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
189,31,47,NULL,NULL,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
208,27,46,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
210,27,47,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
212,27,49,NULL,NULL,NULL,NULL,NULL,NULL,N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
214,27,52,NULL,NULL,NULL,NULL,NULL,N'Test blog',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
216,27,53,NULL,NULL,NULL,NULL,NULL,N'asdasdasdasd',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
218,27,54,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
220,27,57,NULL,NULL,NULL,NULL,NULL,NULL,N'[]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
222,32,50,NULL,NULL,NULL,NULL,{ts '2020-04-21 12:00:00.000'},NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
224,32,51,NULL,NULL,NULL,NULL,NULL,N'Tung',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
226,32,57,NULL,NULL,NULL,NULL,NULL,NULL,N'[]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
228,32,54,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
230,32,52,NULL,NULL,NULL,NULL,NULL,N'Test',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
232,32,53,NULL,NULL,NULL,NULL,NULL,N'Blah bLah',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
234,32,49,NULL,NULL,NULL,NULL,NULL,NULL,N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
236,32,46,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
238,32,47,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
240,33,46,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
241,35,46,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
242,33,47,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
243,35,47,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
244,33,49,NULL,NULL,NULL,NULL,NULL,NULL,N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
245,35,49,NULL,NULL,NULL,NULL,NULL,NULL,N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
246,33,52,NULL,NULL,NULL,NULL,NULL,N'Test blog',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
247,35,52,NULL,NULL,NULL,NULL,NULL,N'Test blog',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
248,33,53,NULL,NULL,NULL,NULL,NULL,N'asdasdasdasd',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
249,35,53,NULL,NULL,NULL,NULL,NULL,N'asdasdasdasd',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
250,33,54,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
251,35,54,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
252,33,57,NULL,NULL,NULL,NULL,NULL,NULL,N'[]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
253,35,57,NULL,NULL,NULL,NULL,NULL,NULL,N'[]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
254,34,46,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
255,36,46,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
256,34,47,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
257,36,47,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
258,34,49,NULL,NULL,NULL,NULL,NULL,NULL,N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
259,36,49,NULL,NULL,NULL,NULL,NULL,NULL,N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
260,34,50,NULL,NULL,NULL,NULL,{ts '2020-04-21 12:00:00.000'},NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
261,36,50,NULL,NULL,NULL,NULL,{ts '2020-04-21 12:00:00.000'},NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
262,34,51,NULL,NULL,NULL,NULL,NULL,N'Tung',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
263,36,51,NULL,NULL,NULL,NULL,NULL,N'Tung',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
264,34,52,NULL,NULL,NULL,NULL,NULL,N'Test',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
265,36,52,NULL,NULL,NULL,NULL,NULL,N'Test',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
266,34,53,NULL,NULL,NULL,NULL,NULL,N'Blah bLah',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
267,36,53,NULL,NULL,NULL,NULL,NULL,N'Blah bLah',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
268,34,54,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
269,36,54,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
270,34,57,NULL,NULL,NULL,NULL,NULL,NULL,N'[]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
271,36,57,NULL,NULL,NULL,NULL,NULL,NULL,N'[]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
272,26,46,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
274,26,47,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
276,26,49,NULL,NULL,NULL,NULL,NULL,NULL,N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
278,26,52,NULL,NULL,NULL,NULL,NULL,N'About Page',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
280,26,53,NULL,NULL,NULL,NULL,NULL,N'Bla Blah',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
282,26,54,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
284,26,57,NULL,NULL,NULL,NULL,NULL,NULL,N'[]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
286,28,58,NULL,NULL,NULL,NULL,NULL,NULL,N'<p>Success</p>');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
287,39,58,NULL,NULL,NULL,NULL,NULL,NULL,N'<p>Success</p>');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
288,28,59,NULL,NULL,NULL,NULL,NULL,NULL,N'<p>Error</p>');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
289,39,59,NULL,NULL,NULL,NULL,NULL,NULL,N'<p>Error</p>');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
290,40,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/lrrduolu/gif-image-1024-768-pixels.gif","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
291,40,7,NULL,NULL,1024,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
292,40,8,NULL,NULL,768,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
293,40,9,NULL,NULL,NULL,NULL,NULL,N'149996',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
294,40,10,NULL,NULL,NULL,NULL,NULL,N'gif',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
295,41,46,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
296,42,46,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
297,41,47,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
298,42,47,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
299,41,49,NULL,NULL,NULL,NULL,NULL,NULL,N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
300,42,49,NULL,NULL,NULL,NULL,NULL,NULL,N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
301,41,52,NULL,NULL,NULL,NULL,NULL,N'Page Not Found',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
302,42,52,NULL,NULL,NULL,NULL,NULL,N'Page Not Found',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
303,41,54,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/392a635ad2744d4c9ba0a09e653b203f');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
304,42,54,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/392a635ad2744d4c9ba0a09e653b203f');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
305,41,57,NULL,NULL,NULL,NULL,NULL,NULL,N'[]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
306,42,57,NULL,NULL,NULL,NULL,NULL,NULL,N'[]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
307,37,46,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
309,37,47,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
311,37,49,NULL,NULL,NULL,NULL,NULL,NULL,N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Full","id":"cc6750e3-976a-fc03-b701-b7ed16bf070d","areas":[{"grid":"12","controls":[{"value":"<p>This is the full about content</p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
313,37,52,NULL,NULL,NULL,NULL,NULL,N'About Page',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
315,37,53,NULL,NULL,NULL,NULL,NULL,N'Bla Blah',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
317,37,54,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
319,37,57,NULL,NULL,NULL,NULL,NULL,NULL,N'[]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
328,43,46,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
330,43,47,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
332,43,49,NULL,NULL,NULL,NULL,NULL,NULL,N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Full","id":"cc6750e3-976a-fc03-b701-b7ed16bf070d","areas":[{"grid":"12","controls":[{"value":"<p>This is the full about content</p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Half","id":"536c7a04-21e3-5e73-d460-8324abd6c5f2","areas":[{"grid":"6","controls":[{"value":{"id":1064,"udi":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96","image":"/media/x1qhmfb1/mikhail-vasilyev-nodtncsldte-unsplash.jpg"},"editor":{"alias":"media","view":"media"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
334,43,52,NULL,NULL,NULL,NULL,NULL,N'About Page',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
336,43,53,NULL,NULL,NULL,NULL,NULL,N'Bla Blah',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
338,43,54,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
340,43,57,NULL,NULL,NULL,NULL,NULL,NULL,N'[]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
342,44,46,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
343,45,46,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
344,44,47,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
345,45,47,NULL,NULL,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
346,44,49,NULL,NULL,NULL,NULL,NULL,NULL,N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Full","id":"cc6750e3-976a-fc03-b701-b7ed16bf070d","areas":[{"grid":"12","controls":[{"value":"<p>This is the full about content</p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null},{"value":{"id":1064,"udi":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96","image":"/media/x1qhmfb1/mikhail-vasilyev-nodtncsldte-unsplash.jpg"},"editor":{"alias":"media","view":"media"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
347,45,49,NULL,NULL,NULL,NULL,NULL,NULL,N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Full","id":"cc6750e3-976a-fc03-b701-b7ed16bf070d","areas":[{"grid":"12","controls":[{"value":"<p>This is the full about content</p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null},{"value":{"id":1064,"udi":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96","image":"/media/x1qhmfb1/mikhail-vasilyev-nodtncsldte-unsplash.jpg"},"editor":{"alias":"media","view":"media"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
348,44,52,NULL,NULL,NULL,NULL,NULL,N'About Page',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
349,45,52,NULL,NULL,NULL,NULL,NULL,N'About Page',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
350,44,53,NULL,NULL,NULL,NULL,NULL,N'Bla Blah',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
351,45,53,NULL,NULL,NULL,NULL,NULL,N'Bla Blah',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
352,44,54,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
353,45,54,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/1466e1b8a73b4cf2a1e9177fce387b96');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
354,44,57,NULL,NULL,NULL,NULL,NULL,NULL,N'[]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
355,45,57,NULL,NULL,NULL,NULL,NULL,NULL,N'[]');
GO
SET IDENTITY_INSERT [umbracoPropertyData] OFF;
GO
SET IDENTITY_INSERT [cmsMemberType] OFF;
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (
1052,1060,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (
1068,1100,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (
1069,1099,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (
1070,1103,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (
1071,1101,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (
1073,1105,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (
1074,1102,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (
1076,1104,1);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (
1031,1031,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (
1031,1032,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (
1031,1033,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (
1052,1069,2);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (
1052,1070,1);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (
1052,1071,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (
1052,1073,3);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (
1052,1074,4);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (
1052,1076,5);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (
1069,1068,0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1064,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\r\n  \"src\": \"/media/x1qhmfb1/mikhail-vasilyev-nodtncsldte-unsplash.jpg\",\r\n  \"focalPoint\": {\r\n    \"left\": 0.50166666666666671,\r\n    \"top\": 0.49871055319534791\r\n  },\r\n  \"crops\": null\r\n}"}],"umbracoWidth":[{"culture":"","seg":"","val":5042}],"umbracoHeight":[{"culture":"","seg":"","val":3151}],"umbracoBytes":[{"culture":"","seg":"","val":"2697261"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"cat"}',2);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1066,0,N'{"properties":{"mainContent":[],"title":[],"subtitle":[],"mainImage":[],"metaName":[],"metaDescription":[],"metaKeywords":[],"socialLinks":[]},"cultureData":{},"urlSegment":"home"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1066,1,N'{"properties":{"mainContent":[],"title":[],"subtitle":[],"mainImage":[],"metaName":[],"metaDescription":[],"metaKeywords":[],"socialLinks":[]},"cultureData":{},"urlSegment":"home"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1093,0,N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}],"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Full\",\"id\":\"cc6750e3-976a-fc03-b701-b7ed16bf070d\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":\"<p>This is the full about content</p>\",\"editor\":{\"alias\":\"rte\",\"view\":\"rte\"},\"styles\":null,\"config\":null},{\"value\":{\"id\":1064,\"udi\":\"umb://media/1466e1b8a73b4cf2a1e9177fce387b96\",\"image\":\"/media/x1qhmfb1/mikhail-vasilyev-nodtncsldte-unsplash.jpg\"},\"editor\":{\"alias\":\"media\",\"view\":\"media\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"title":[{"culture":"","seg":"","val":"About Page"}],"subtitle":[{"culture":"","seg":"","val":"Bla Blah"}],"mainImage":[{"culture":"","seg":"","val":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96"}],"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}]},"cultureData":{},"urlSegment":"about"}',5);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1093,1,N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}],"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Full\",\"id\":\"cc6750e3-976a-fc03-b701-b7ed16bf070d\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":\"<p>This is the full about content</p>\",\"editor\":{\"alias\":\"rte\",\"view\":\"rte\"},\"styles\":null,\"config\":null},{\"value\":{\"id\":1064,\"udi\":\"umb://media/1466e1b8a73b4cf2a1e9177fce387b96\",\"image\":\"/media/x1qhmfb1/mikhail-vasilyev-nodtncsldte-unsplash.jpg\"},\"editor\":{\"alias\":\"media\",\"view\":\"media\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"title":[{"culture":"","seg":"","val":"About Page"}],"subtitle":[{"culture":"","seg":"","val":"Bla Blah"}],"mainImage":[{"culture":"","seg":"","val":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96"}],"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}]},"cultureData":{},"urlSegment":"about"}',3);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1094,0,N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}],"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[]}]}"}],"title":[{"culture":"","seg":"","val":"Test blog"}],"subtitle":[{"culture":"","seg":"","val":"asdasdasdasd"}],"mainImage":[{"culture":"","seg":"","val":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96"}],"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}]},"cultureData":{},"urlSegment":"blog"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1094,1,N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}],"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[]}]}"}],"title":[{"culture":"","seg":"","val":"Test blog"}],"subtitle":[{"culture":"","seg":"","val":"asdasdasdasd"}],"mainImage":[{"culture":"","seg":"","val":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96"}],"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}]},"cultureData":{},"urlSegment":"blog"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1095,0,N'{"properties":{"successMessage":[{"culture":"","seg":"","val":"<p>Success</p>"}],"errorMessage":[{"culture":"","seg":"","val":"<p>Error</p>"}]},"cultureData":{},"urlSegment":"contact"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1095,1,N'{"properties":{"successMessage":[{"culture":"","seg":"","val":"<p>Success</p>"}],"errorMessage":[{"culture":"","seg":"","val":"<p>Error</p>"}]},"cultureData":{},"urlSegment":"contact"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1096,0,N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":1}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":1}]},"cultureData":{},"urlSegment":"xml-sitemap"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1096,1,N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"xml-sitemap"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1097,0,N'{"properties":{},"cultureData":{},"urlSegment":"search"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1097,1,N'{"properties":{},"cultureData":{},"urlSegment":"search"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1098,0,N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}],"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[]}]}"}],"articleDate":[{"culture":"","seg":"","val":"2020-04-21T12:00:00"}],"authorName":[{"culture":"","seg":"","val":"Tung"}],"title":[{"culture":"","seg":"","val":"Test"}],"subtitle":[{"culture":"","seg":"","val":"Blah bLah"}],"mainImage":[{"culture":"","seg":"","val":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96"}],"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}]},"cultureData":{},"urlSegment":"test-article"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1098,1,N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}],"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[]}]}"}],"articleDate":[{"culture":"","seg":"","val":"2020-04-21T12:00:00"}],"authorName":[{"culture":"","seg":"","val":"Tung"}],"title":[{"culture":"","seg":"","val":"Test"}],"subtitle":[{"culture":"","seg":"","val":"Blah bLah"}],"mainImage":[{"culture":"","seg":"","val":"umb://media/1466e1b8a73b4cf2a1e9177fce387b96"}],"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}]},"cultureData":{},"urlSegment":"test-article"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1106,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/lrrduolu/gif-image-1024-768-pixels.gif\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1024}],"umbracoHeight":[{"culture":"","seg":"","val":768}],"umbracoBytes":[{"culture":"","seg":"","val":"149996"}],"umbracoExtension":[{"culture":"","seg":"","val":"gif"}]},"cultureData":{},"urlSegment":"gif-image-1024-768-pixels"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1107,0,N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}],"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[]}]}"}],"title":[{"culture":"","seg":"","val":"Page Not Found"}],"subtitle":[],"mainImage":[{"culture":"","seg":"","val":"umb://media/392a635ad2744d4c9ba0a09e653b203f"}],"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}]},"cultureData":{},"urlSegment":"error"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1107,1,N'{"properties":{"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"hideFromXMLSitemap":[{"culture":"","seg":"","val":0}],"mainContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[]}]}"}],"title":[{"culture":"","seg":"","val":"Page Not Found"}],"subtitle":[],"mainImage":[{"culture":"","seg":"","val":"umb://media/392a635ad2744d4c9ba0a09e653b203f"}],"metaName":[],"metaDescription":[],"metaKeywords":[{"culture":"","seg":"","val":"[]"}]},"cultureData":{},"urlSegment":"error"}',0);
GO
ALTER TABLE [umbracoUser] ADD CONSTRAINT [PK_user] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUserLogin] ADD CONSTRAINT [PK_umbracoUserLogin] PRIMARY KEY ([sessionId]);
GO
ALTER TABLE [umbracoServer] ADD CONSTRAINT [PK_umbracoServer] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoRelationType] ADD CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [PK_umbracoNode] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUserStartNode] ADD CONSTRAINT [PK_userStartNode] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUserGroup] ADD CONSTRAINT [PK_umbracoUserGroup] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUserGroup2NodePermission] ADD CONSTRAINT [PK_umbracoUserGroup2NodePermission] PRIMARY KEY ([userGroupId],[nodeId],[permission]);
GO
ALTER TABLE [umbracoUserGroup2App] ADD CONSTRAINT [PK_userGroup2App] PRIMARY KEY ([userGroupId],[app]);
GO
ALTER TABLE [umbracoUser2UserGroup] ADD CONSTRAINT [PK_user2userGroup] PRIMARY KEY ([userId],[userGroupId]);
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY ([userId],[nodeId],[action]);
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [PK_umbracoRelation] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoRedirectUrl] ADD CONSTRAINT [PK_umbracoRedirectUrl] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLog] ADD CONSTRAINT [PK_umbracoLog] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLock] ADD CONSTRAINT [PK_umbracoLock] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLanguage] ADD CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoKeyValue] ADD CONSTRAINT [PK_umbracoKeyValue] PRIMARY KEY ([key]);
GO
ALTER TABLE [umbracoExternalLogin] ADD CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoDomain] ADD CONSTRAINT [PK_umbracoDomain] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoDocumentCultureVariation] ADD CONSTRAINT [PK_umbracoDocumentCultureVariation] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoDataType] ADD CONSTRAINT [PK_umbracoDataType] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [umbracoConsent] ADD CONSTRAINT [PK_umbracoConsent] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoCacheInstruction] ADD CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoAudit] ADD CONSTRAINT [PK_umbracoAudit] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [PK_umbracoAccess] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoAccessRule] ADD CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [PK_cmsTemplate] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsTags] ADD CONSTRAINT [PK_cmsTags] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsMacro] ADD CONSTRAINT [PK_cmsMacro] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsDictionary] ADD CONSTRAINT [PK_cmsDictionary] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsLanguageText] ADD CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY ([parentContentTypeId],[childContentTypeId]);
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [PK_cmsContentType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [umbracoContent] ADD CONSTRAINT [PK_umbracoContent] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [umbracoDocument] ADD CONSTRAINT [PK_umbracoDocument] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [umbracoContentVersion] ADD CONSTRAINT [PK_umbracoContentVersion] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoMediaVersion] ADD CONSTRAINT [PK_umbracoMediaVersion] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoDocumentVersion] ADD CONSTRAINT [PK_umbracoDocumentVersion] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoContentVersionCultureVariation] ADD CONSTRAINT [PK_umbracoContentVersionCultureVariation] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoContentSchedule] ADD CONSTRAINT [PK_umbracoContentSchedule] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsMember] ADD CONSTRAINT [PK_cmsMember] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY ([Member],[MemberGroup]);
GO
ALTER TABLE [cmsPropertyTypeGroup] ADD CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoPropertyData] ADD CONSTRAINT [PK_umbracoPropertyData] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY ([nodeId],[propertyTypeId],[tagId]);
GO
ALTER TABLE [cmsMemberType] ADD CONSTRAINT [PK_cmsMemberType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsDocumentType] ADD CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY ([contentTypeNodeId],[templateNodeId]);
GO
ALTER TABLE [cmsContentTypeAllowedContentType] ADD CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY ([Id],[AllowedId]);
GO
ALTER TABLE [cmsContentNu] ADD CONSTRAINT [PK_cmsContentNu] PRIMARY KEY ([nodeId],[published]);
GO
CREATE INDEX [IX_umbracoUser_userLogin] ON [umbracoUser] ([userLogin] ASC);
GO
CREATE INDEX [IX_umbracoUserLogin_lastValidatedUtc] ON [umbracoUserLogin] ([lastValidatedUtc] ASC);
GO
ALTER TABLE [umbracoServer] ADD CONSTRAINT [IX_computerName] UNIQUE ([computerName]);
GO
CREATE INDEX [IX_umbracoServer_isActive] ON [umbracoServer] ([isActive] ASC);
GO
ALTER TABLE [umbracoRelationType] ADD CONSTRAINT [IX_umbracoRelationType_alias] UNIQUE ([alias]);
GO
ALTER TABLE [umbracoRelationType] ADD CONSTRAINT [IX_umbracoRelationType_name] UNIQUE ([name]);
GO
ALTER TABLE [umbracoRelationType] ADD CONSTRAINT [IX_umbracoRelationType_UniqueId] UNIQUE ([typeUniqueId]);
GO
CREATE INDEX [IX_umbracoNode_ObjectType] ON [umbracoNode] ([nodeObjectType] ASC);
GO
CREATE INDEX [IX_umbracoNode_ParentId] ON [umbracoNode] ([parentId] ASC);
GO
CREATE INDEX [IX_umbracoNode_Path] ON [umbracoNode] ([path] ASC);
GO
CREATE INDEX [IX_umbracoNode_Trashed] ON [umbracoNode] ([trashed] ASC);
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [IX_umbracoNode_UniqueId] UNIQUE ([uniqueId]);
GO
ALTER TABLE [umbracoUserStartNode] ADD CONSTRAINT [IX_umbracoUserStartNode_startNodeType] UNIQUE ([startNodeType],[startNode],[userId]);
GO
ALTER TABLE [umbracoUserGroup] ADD CONSTRAINT [IX_umbracoUserGroup_userGroupAlias] UNIQUE ([userGroupAlias]);
GO
ALTER TABLE [umbracoUserGroup] ADD CONSTRAINT [IX_umbracoUserGroup_userGroupName] UNIQUE ([userGroupName]);
GO
CREATE INDEX [IX_umbracoUser2NodePermission_nodeId] ON [umbracoUserGroup2NodePermission] ([nodeId] ASC);
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [IX_umbracoRelation_parentChildType] UNIQUE ([parentId],[childId],[relType]);
GO
ALTER TABLE [umbracoRedirectUrl] ADD CONSTRAINT [IX_umbracoRedirectUrl] UNIQUE ([urlHash],[contentKey],[culture],[createDateUtc]);
GO
CREATE INDEX [IX_umbracoLog] ON [umbracoLog] ([NodeId] ASC);
GO
CREATE INDEX [IX_umbracoLanguage_fallbackLanguageId] ON [umbracoLanguage] ([fallbackLanguageId] ASC);
GO
ALTER TABLE [umbracoLanguage] ADD CONSTRAINT [IX_umbracoLanguage_languageISOCode] UNIQUE ([languageISOCode]);
GO
CREATE INDEX [IX_umbracoDocumentCultureVariation_LanguageId] ON [umbracoDocumentCultureVariation] ([languageId] ASC);
GO
ALTER TABLE [umbracoDocumentCultureVariation] ADD CONSTRAINT [IX_umbracoDocumentCultureVariation_NodeId] UNIQUE ([nodeId],[languageId]);
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [IX_umbracoAccess_nodeId] UNIQUE ([nodeId]);
GO
ALTER TABLE [umbracoAccessRule] ADD CONSTRAINT [IX_umbracoAccessRule] UNIQUE ([ruleValue],[ruleType],[accessId]);
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [IX_cmsTemplate_nodeId] UNIQUE ([nodeId]);
GO
ALTER TABLE [cmsTags] ADD CONSTRAINT [IX_cmsTags] UNIQUE ([group],[tag],[languageId]);
GO
CREATE INDEX [IX_cmsTags_LanguageId] ON [cmsTags] ([languageId] ASC);
GO
ALTER TABLE [cmsMacro] ADD CONSTRAINT [IX_cmsMacro_UniqueId] UNIQUE ([uniqueId]);
GO
ALTER TABLE [cmsMacro] ADD CONSTRAINT [IX_cmsMacroPropertyAlias] UNIQUE ([macroAlias]);
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [IX_cmsMacroProperty_Alias] UNIQUE ([macro],[macroPropertyAlias]);
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [IX_cmsMacroProperty_UniquePropertyId] UNIQUE ([uniquePropertyId]);
GO
ALTER TABLE [cmsDictionary] ADD CONSTRAINT [IX_cmsDictionary_id] UNIQUE ([id]);
GO
CREATE INDEX [IX_cmsDictionary_key] ON [cmsDictionary] ([key] ASC);
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [IX_cmsContentType] UNIQUE ([nodeId]);
GO
CREATE INDEX [IX_cmsContentType_icon] ON [cmsContentType] ([icon] ASC);
GO
CREATE INDEX [IX_umbracoDocument_Published] ON [umbracoDocument] ([published] ASC);
GO
CREATE INDEX [IX_umbracoContentVersion_NodeId] ON [umbracoContentVersion] ([nodeId] ASC,[current] ASC);
GO
ALTER TABLE [umbracoMediaVersion] ADD CONSTRAINT [IX_umbracoMediaVersion] UNIQUE ([id],[path]);
GO
CREATE INDEX [IX_umbracoContentVersionCultureVariation_LanguageId] ON [umbracoContentVersionCultureVariation] ([languageId] ASC);
GO
ALTER TABLE [umbracoContentVersionCultureVariation] ADD CONSTRAINT [IX_umbracoContentVersionCultureVariation_VersionId] UNIQUE ([versionId],[languageId]);
GO
CREATE INDEX [IX_cmsMember_LoginName] ON [cmsMember] ([LoginName] ASC);
GO
ALTER TABLE [cmsPropertyTypeGroup] ADD CONSTRAINT [IX_cmsPropertyTypeGroupUniqueID] UNIQUE ([uniqueID]);
GO
CREATE INDEX [IX_cmsPropertyTypeAlias] ON [cmsPropertyType] ([Alias] ASC);
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [IX_cmsPropertyTypeUniqueID] UNIQUE ([UniqueID]);
GO
CREATE INDEX [IX_umbracoPropertyData_LanguageId] ON [umbracoPropertyData] ([languageId] ASC);
GO
CREATE INDEX [IX_umbracoPropertyData_PropertyTypeId] ON [umbracoPropertyData] ([propertyTypeId] ASC);
GO
CREATE INDEX [IX_umbracoPropertyData_Segment] ON [umbracoPropertyData] ([segment] ASC);
GO
ALTER TABLE [umbracoPropertyData] ADD CONSTRAINT [IX_umbracoPropertyData_VersionId] UNIQUE ([versionId],[propertyTypeId],[languageId],[segment]);
GO
ALTER TABLE [umbracoUserLogin] ADD CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY ([parentId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [FK_umbracoNode_umbracoUser_id] FOREIGN KEY ([nodeUser]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserStartNode] ADD CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id] FOREIGN KEY ([startNode]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserStartNode] ADD CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup] ADD CONSTRAINT [FK_startContentId_umbracoNode_id] FOREIGN KEY ([startContentId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup] ADD CONSTRAINT [FK_startMediaId_umbracoNode_id] FOREIGN KEY ([startMediaId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup2NodePermission] ADD CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup2NodePermission] ADD CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id] FOREIGN KEY ([userGroupId]) REFERENCES [umbracoUserGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup2App] ADD CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id] FOREIGN KEY ([userGroupId]) REFERENCES [umbracoUserGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2UserGroup] ADD CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2UserGroup] ADD CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id] FOREIGN KEY ([userGroupId]) REFERENCES [umbracoUserGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY ([parentId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY ([childId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY ([relType]) REFERENCES [umbracoRelationType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRedirectUrl] ADD CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID] FOREIGN KEY ([contentKey]) REFERENCES [umbracoNode]([uniqueId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoLog] ADD CONSTRAINT [FK_umbracoLog_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoLanguage] ADD CONSTRAINT [FK_umbracoLanguage_umbracoLanguage_id] FOREIGN KEY ([fallbackLanguageId]) REFERENCES [umbracoLanguage]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDomain] ADD CONSTRAINT [FK_umbracoDomain_umbracoNode_id] FOREIGN KEY ([domainRootStructureID]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDocumentCultureVariation] ADD CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [umbracoLanguage]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDocumentCultureVariation] ADD CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDataType] ADD CONSTRAINT [FK_umbracoDataType_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY ([loginNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY ([noAccessNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccessRule] ADD CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY ([accessId]) REFERENCES [umbracoAccess]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTags] ADD CONSTRAINT [FK_cmsTags_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [umbracoLanguage]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY ([macro]) REFERENCES [cmsMacro]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDictionary] ADD CONSTRAINT [FK_cmsDictionary_cmsDictionary_id] FOREIGN KEY ([parent]) REFERENCES [cmsDictionary]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsLanguageText] ADD CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id] FOREIGN KEY ([UniqueId]) REFERENCES [cmsDictionary]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsLanguageText] ADD CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [umbracoLanguage]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY ([childContentTypeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY ([parentContentTypeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoContent] ADD CONSTRAINT [FK_umbracoContent_cmsContentType_NodeId] FOREIGN KEY ([contentTypeId]) REFERENCES [cmsContentType]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoContent] ADD CONSTRAINT [FK_umbracoContent_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDocument] ADD CONSTRAINT [FK_umbracoDocument_umbracoContent_nodeId] FOREIGN KEY ([nodeId]) REFERENCES [umbracoContent]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoContentVersion] ADD CONSTRAINT [FK_umbracoContentVersion_umbracoContent_nodeId] FOREIGN KEY ([nodeId]) REFERENCES [umbracoContent]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoContentVersion] ADD CONSTRAINT [FK_umbracoContentVersion_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoMediaVersion] ADD CONSTRAINT [FK_umbracoMediaVersion_umbracoContentVersion_id] FOREIGN KEY ([id]) REFERENCES [umbracoContentVersion]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDocumentVersion] ADD CONSTRAINT [FK_umbracoDocumentVersion_cmsTemplate_nodeId] FOREIGN KEY ([templateId]) REFERENCES [cmsTemplate]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDocumentVersion] ADD CONSTRAINT [FK_umbracoDocumentVersion_umbracoContentVersion_id] FOREIGN KEY ([id]) REFERENCES [umbracoContentVersion]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoContentVersionCultureVariation] ADD CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoContentVersion_id] FOREIGN KEY ([versionId]) REFERENCES [umbracoContentVersion]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoContentVersionCultureVariation] ADD CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [umbracoLanguage]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoContentVersionCultureVariation] ADD CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoUser_id] FOREIGN KEY ([availableUserId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoContentSchedule] ADD CONSTRAINT [FK_umbracoContentSchedule_umbracoContent_nodeId] FOREIGN KEY ([nodeId]) REFERENCES [umbracoContent]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoContentSchedule] ADD CONSTRAINT [FK_umbracoContentSchedule_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [umbracoLanguage]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember] ADD CONSTRAINT [FK_cmsMember_umbracoContent_nodeId] FOREIGN KEY ([nodeId]) REFERENCES [umbracoContent]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY ([Member]) REFERENCES [cmsMember]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY ([MemberGroup]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyTypeGroup] ADD CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId] FOREIGN KEY ([contenttypeNodeId]) REFERENCES [cmsContentType]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId] FOREIGN KEY ([contentTypeId]) REFERENCES [cmsContentType]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY ([propertyTypeGroupId]) REFERENCES [cmsPropertyTypeGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [FK_cmsPropertyType_umbracoDataType_nodeId] FOREIGN KEY ([dataTypeId]) REFERENCES [umbracoDataType]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoPropertyData] ADD CONSTRAINT [FK_umbracoPropertyData_cmsPropertyType_id] FOREIGN KEY ([propertyTypeId]) REFERENCES [cmsPropertyType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoPropertyData] ADD CONSTRAINT [FK_umbracoPropertyData_umbracoContentVersion_id] FOREIGN KEY ([versionId]) REFERENCES [umbracoContentVersion]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoPropertyData] ADD CONSTRAINT [FK_umbracoPropertyData_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [umbracoLanguage]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [FK_cmsTagRelationship_cmsContent] FOREIGN KEY ([nodeId]) REFERENCES [umbracoContent]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY ([propertyTypeId]) REFERENCES [cmsPropertyType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY ([tagId]) REFERENCES [cmsTags]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMemberType] ADD CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId] FOREIGN KEY ([NodeId]) REFERENCES [cmsContentType]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMemberType] ADD CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY ([NodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDocumentType] ADD CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId] FOREIGN KEY ([contentTypeNodeId]) REFERENCES [cmsContentType]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDocumentType] ADD CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId] FOREIGN KEY ([templateNodeId]) REFERENCES [cmsTemplate]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDocumentType] ADD CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY ([contentTypeNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentTypeAllowedContentType] ADD CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType] FOREIGN KEY ([Id]) REFERENCES [cmsContentType]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentTypeAllowedContentType] ADD CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1] FOREIGN KEY ([AllowedId]) REFERENCES [cmsContentType]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentNu] ADD CONSTRAINT [FK_cmsContentNu_umbracoContent_nodeId] FOREIGN KEY ([nodeId]) REFERENCES [umbracoContent]([nodeId]) ON DELETE CASCADE ON UPDATE NO ACTION;
GO

