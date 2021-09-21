USE [master]
GO
/****** Object:  Database [DBQuanLyThuVien]    Script Date: 9/21/2021 3:35:57 PM ******/
CREATE DATABASE [DBQuanLyThuVien]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBQuanLyThuVien', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DBQuanLyThuVien.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBQuanLyThuVien_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DBQuanLyThuVien_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBQuanLyThuVien] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBQuanLyThuVien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBQuanLyThuVien] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBQuanLyThuVien] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBQuanLyThuVien] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBQuanLyThuVien] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBQuanLyThuVien] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBQuanLyThuVien] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBQuanLyThuVien] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBQuanLyThuVien] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBQuanLyThuVien] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBQuanLyThuVien] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBQuanLyThuVien] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBQuanLyThuVien] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBQuanLyThuVien] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBQuanLyThuVien] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBQuanLyThuVien] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBQuanLyThuVien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBQuanLyThuVien] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBQuanLyThuVien] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBQuanLyThuVien] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBQuanLyThuVien] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBQuanLyThuVien] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DBQuanLyThuVien] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBQuanLyThuVien] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBQuanLyThuVien] SET  MULTI_USER 
GO
ALTER DATABASE [DBQuanLyThuVien] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBQuanLyThuVien] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBQuanLyThuVien] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBQuanLyThuVien] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBQuanLyThuVien] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBQuanLyThuVien] SET QUERY_STORE = OFF
GO
USE [DBQuanLyThuVien]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/21/2021 3:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 9/21/2021 3:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dayBrorrow] [datetime] NOT NULL,
	[dayBack] [datetime] NOT NULL,
	[status] [int] NOT NULL,
	[Book_id] [int] NULL,
	[User_id] [int] NULL,
 CONSTRAINT [PK_dbo.Bookings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 9/21/2021 3:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[author] [nvarchar](255) NOT NULL,
	[publisher] [nvarchar](255) NOT NULL,
	[content] [nvarchar](max) NULL,
	[image] [nvarchar](255) NOT NULL,
	[status] [int] NOT NULL,
	[Branch_id] [int] NULL,
	[Category_id] [int] NULL,
 CONSTRAINT [PK_dbo.Books] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 9/21/2021 3:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Branches] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/21/2021 3:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 9/21/2021 3:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/21/2021 3:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[fullName] [nvarchar](255) NOT NULL,
	[phoneNumber] [nvarchar](255) NOT NULL,
	[status] [int] NOT NULL,
	[Branch_id] [int] NULL,
	[Role_id] [int] NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202109171550318_crete-database', N'QuanLyThuVienAsp.Migrations.Configuration', 0x1F8B0800000000000400ED1DDB6EE3B8F5BD40FF41D053BBC85A49060B6C037B1733CE4C11EC2499C69941DF06B4C4D8C248942A51D91845BF6C1FFA49FD8552A22E24454AA42C5F2630F66542EA1C9EFB39BC1CEFFFFEF8EFF4D79730B09E6192FA119AD9179373DB82C88D3C1FAD6676869F7EFCD9FEF5973FFF69FADE0B5FAC2FD5776FF2EF08244A67F61AE3F8CA7152770D43904E42DF4DA2347AC213370A1DE045CEE5F9F9DF9C8B0B07121436C16559D3870C613F84C51FE4CF79845C18E30C04B7910783B41C27338B02AB75074298C6C08533FB1F19401F378FEBEC8B0FD1DB349E5010DB7A1BF88090B380C1936D0184220C3021F6EA730A173889D06A119301103C6E6248BE7B02410A4B26AE9ACF75F939BFCCF9711AC00A959BA5380A0D115EBC2905E488E083C46CD70224227C4F448D3739D7851867F6BB28FA46D46B5BE25A57F320C9BF530A7952829E59E20767B56D1013CAFF3BB3E65980B304CE10CC70028233EB53B60C7CF737B8798CBE4134435910B0841252C91C3740863E25510C13BC79804F25F9BE675B0E0FE788803518034339BB41F8CDA56DDD91C5C13280B51D305258E028817F8708260043EF13C01826448D371E2C24D95A5D58CB039B77499424D1EFD59AD704CF233177C9B2FDA880FB6D6B3C29E12C4BFB4420E0B803CFFEAA9088802D3702DB7A80413199AEFD987A5D611D5F4B1321AB7D48A2F0210A4A887AE2EB23485610136A22D9EC22CA12D7801AE2DE89949A7C424A0D37D1A2869F955133751A97EA75B4A15E7672B18EB510C89D80AE46627B11CC6EC1CB478856783DB32F7FFA89E8DB7F815E355252F019F924B511209C64E65E0432BC8E92FDAF1BE74A4DD7F0004BBB11C244251D0B937F6A2DDCBD8E1F82D501343A7E5CA4B166786CACE28D3C3656B14A9BA20420772DA7A7982A50F3E430E3ED48CD4E9A06EA3971F555946CA4E454936D82F8991649C2F476F1BA14D780885D409E62F6D1C5ECF13D5CE1DE3AEED4726E99AF99D43D725A680553DAB258F6D025E5450F9DDBCA85683566EE4039DCC97D3AD6229B3E3F3840ED01D2F4F728F1F6BFF213F9FCEE2031235E4708DE65E1F21015D71E4B12CD0D9218B5E4DBA7114A128DB825A7858F69BA94E418A474E4135FCBF0DA90D18CB6A22733B555F0A4149907CF1CEE143C5F79EDA1CEF7BDF62A7A8DC49407D96B53D19BDB6C057BB2DB576EB7EA9A597BCF27DAAF624BA863C36FD33472FD821286BE260BF24CBD479ED5B94BA79AA9F6F74439C450FD989826597A669F4F26172D41A970D64985C74975CEA1FD41649561AA87577697A2244BBA6561A82A33B419AFD263856EF10DE793AF6C543429CA9C8628BA9931E25371B6BC439DB2555337554209D5CDE70FBD4C0A3B49730331609249712AA264F9AEA189965646AA94157C463233E04F08852A925471B121AB49C946BCAA0ED9C671501A8AE711C2C027A9B0E499CBFBD7CB7C1ABE60492D41445D96136999D1443672F40B884BC4CB7A4BD3E400D1FB5A9268A350C1F70317F60FA5F0A56BF460C86831D702A746D7039C108DCA80A90BF400BBD4107C2986C6B8042C8CDE1B54C28937F38DF4485CACD6FA726F4D79AD2D47174565DE020A4AA7580FF2BCE9F0CD1D054AD85626E1FE34CC525C5B5917DFB2B4DB27B9013C0B47096DA63B32B2464E66282E5DA38367790ADE8DAEB9230B15D792DCDC9B9D0770CCE7630D4B19C02FBBD56CB3ABCAD27D799AA1B50C5E1DCC4AD2729FB006302AEE4DDACC76A56C9DA4CD10CD06DD0ECE15497A0B77AE7649756A6E1E5E39F4E555F542CB513CD19ADE8238CE9DA9812C47AC057DAF35FF7161FE8629A4381C37953C65AAA9AD5722BB6CB082C22C599A50FAC14F527C0D3058827CD73AF7C2D6678A42449128AB45855AA3ADB62A795600F9BF25954FFB759588AB91E907C26608112E38868CE2959056FE840E0420919C62CCA3200B91EA24A40B9A7DE2C46261C7CDB015AF9C4454C5A03E9EEADC8245538DB5B14C1D41A8A2069D960A05B7124D42DB60C6B39681A6B22F3BA1E7572C3C1DD1C750BDB961715463FA589817342C2266581F57FD2486C5540FEAE3299FBC70C2A543AFCDE2ABF26314A39716533A66AF003C56C3FF2E549B296A3D73BD163B5B73ADCAC176A3D3F2069E45500E1904A2FA3A9D8B43F5A83EA6E67A9CC5D48C1AD0C45E777364B113AFCC72E93E630CCB2D8E55CC2D570E768A465BE894D9468DA1D8FAB4CB5CB96AD093827514CC6F58792D0BC78A7A753203A0B975CAF7DD929BCCD6D9545B365AFA2D70C9949C8BA65ED894A6F24860204DC6E4909DB2E717B71837697E3F5CDF0D6B702A9E4A98DB0177CCAA5B3956DFEBEC8A64E2961CCA0EB5008A6A0C1B901CF21E9709A858DDDA08847367BD3A739460203DA81E28F502D70886203DF93E2A4B50703A921D94E7F0BA56507EAEB3A7500A9B3B743F782490DC241C95FA771708D88B09BD9ABDFA7AA0FADBD71803255D201A41F7ED7B91A352BD82CDAD152F5ED4E8D7F55B9602F26B9D8132AF918D6008F26BA2A332860E76FB0DA27569257E52EF4EEACB2BE1926A5A5E18F5FFD840EB06897E625B84FD67DFCB6F8F169B14C370927F3059FC2B98077E71105C7D700B90FF04534C1FAADA97E71797C24F151CCFCF063869EA71EF68D5BF1DC0EB6C0F8F6DFD5CA8BDCF6907F4D7F3ADFA1E418C4768D51F8C877F7C5B706D88A1DE7031285A6FAA6E90075F66F6BF0B982BEBE69F5F4BB033EB3E21667B659D5BFF6197D6E9E2ADAB3BB3954B30FD95CD1AF05F87A9D2031DBA007A0689BB0649FB31F8561DEDA3A16D35AC8F8659E847AFF0FE25042F7F35B556AEE77C340A47F0DFA64836F4E00A701B1FE652B3D9FA0CE82E7C59F6C4F9E4CD5B989E5953EFEB103CD7463B5EC013BA6447432C36C18E4771BBC7F51402D99DB4F9DA25D80E425FFBAEF0BBF5BFEF2BF0C9EFF14EC2DF85F0B7E9CC1BA313AF680B316ED4226888CA61926B0404F308A538017EFB42F453E223D78F41C052DD3E93D131A35C84353A71E61AC610E5F62170A6B354C79D648D5630E83EDE77D39B38423BA28ED18CA56AD593B59D285B4FD35D370E7BD0B57E7FE6B6FD98FBF76CC54BB6837A76C705E3DEB4DDDDA13A96636BD9CC77E7D8DA367568C7D6ECD3DDB635779F5A56BCEF3B9C8E3B2E0CF7A061C34EE5319A93F799AC3B1EFD1D2E5DF7DC0E8EAE7579BF76BB9B4A5418DF4A5CA759751736BD4D9BD9DE32220AA65B86E6714E4FAB32B502458BB60AB306DA32ED287BB7A5A8552D9622761AA8148DDD32CC9FA50D8D225A1A43152DDF32B40FB23ECB16DAC6613B7AC165E8E7CA8EC63DF48A732D91B28E7D79852879067664CDE03C8DD29F123017C6A1BBBD3902653F70B0476D8DD2CE3D4C575AA2385CC736479AEC9724F6C2CC0EBAB23932553F7031AA5719345DB7DFA990ACCEFCAF33484991FAAB0645FEFA064197CBE7F53737E829AA6A0B81A2EA13E168EF1662E09164FF36C1FE1370319976619A16BEF6050419F9E47DB884DE0DBACF709C61C2320C970127BEBC3CE95ABFE82CE7699EDEC7C52F858DC10221D3CFDF62DCA377991F7835DD1F2407930A1479DD531EC2E6BAC4F961EC6A5363BA8B9026A2527C75B9F608C33820C8D27BB400CF70086DC4AF3EC2157037D5732335927E45F0629F5EFB609580302D7134F0E44F62C35EF8F2CBFF01DD7E231241660000, N'6.4.4')
GO
/****** Object:  Index [IX_Book_id]    Script Date: 9/21/2021 3:35:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_Book_id] ON [dbo].[Bookings]
(
	[Book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_id]    Script Date: 9/21/2021 3:35:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_id] ON [dbo].[Bookings]
(
	[User_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Branch_id]    Script Date: 9/21/2021 3:35:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_Branch_id] ON [dbo].[Books]
(
	[Branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Category_id]    Script Date: 9/21/2021 3:35:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_Category_id] ON [dbo].[Books]
(
	[Category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Branch_id]    Script Date: 9/21/2021 3:35:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_Branch_id] ON [dbo].[Users]
(
	[Branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Role_id]    Script Date: 9/21/2021 3:35:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_Role_id] ON [dbo].[Users]
(
	[Role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Bookings_dbo.Books_Book_id] FOREIGN KEY([Book_id])
REFERENCES [dbo].[Books] ([id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_dbo.Bookings_dbo.Books_Book_id]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Bookings_dbo.Users_User_id] FOREIGN KEY([User_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_dbo.Bookings_dbo.Users_User_id]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Books_dbo.Branches_Branch_id] FOREIGN KEY([Branch_id])
REFERENCES [dbo].[Branches] ([id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_dbo.Books_dbo.Branches_Branch_id]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Books_dbo.Categories_Category_id] FOREIGN KEY([Category_id])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_dbo.Books_dbo.Categories_Category_id]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Branches_Branch_id] FOREIGN KEY([Branch_id])
REFERENCES [dbo].[Branches] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Branches_Branch_id]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Roles_Role_id] FOREIGN KEY([Role_id])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Roles_Role_id]
GO
USE [master]
GO
ALTER DATABASE [DBQuanLyThuVien] SET  READ_WRITE 
GO
