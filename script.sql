USE [master]
GO
/****** Object:  Database [StudyEnglish]    Script Date: 04/04/2023 8:53:11 SA ******/
CREATE DATABASE [StudyEnglish]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudyEnglish', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\StudyEnglish.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudyEnglish_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\StudyEnglish_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [StudyEnglish] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudyEnglish].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudyEnglish] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudyEnglish] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudyEnglish] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudyEnglish] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudyEnglish] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudyEnglish] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [StudyEnglish] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudyEnglish] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudyEnglish] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudyEnglish] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudyEnglish] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudyEnglish] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudyEnglish] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudyEnglish] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudyEnglish] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StudyEnglish] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudyEnglish] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudyEnglish] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudyEnglish] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudyEnglish] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudyEnglish] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudyEnglish] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudyEnglish] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StudyEnglish] SET  MULTI_USER 
GO
ALTER DATABASE [StudyEnglish] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudyEnglish] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudyEnglish] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudyEnglish] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudyEnglish] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudyEnglish] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [StudyEnglish] SET QUERY_STORE = ON
GO
ALTER DATABASE [StudyEnglish] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [StudyEnglish]
GO
/****** Object:  Table [dbo].[BaiTap]    Script Date: 04/04/2023 8:53:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiTap](
	[maVideo] [int] NOT NULL,
	[maBt] [int] NOT NULL,
	[CauHoi] [text] NULL,
	[DA1] [char](20) NULL,
	[DA2] [char](20) NULL,
	[DA3] [char](20) NULL,
	[DA4] [char](20) NULL,
	[DA5] [char](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[maBt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 04/04/2023 8:53:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[maDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[tenDanhMuc] [nvarchar](100) NULL,
	[linkDanhMuc] [varchar](50) NULL,
	[maThuocTinh] [int] NULL,
 CONSTRAINT [PK_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[maDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSu]    Script Date: 04/04/2023 8:53:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSu](
	[maNguoidung] [int] NOT NULL,
	[maVideo] [int] NOT NULL,
	[maBt] [int] NOT NULL,
	[NgayLamBai] [datetime] NULL,
	[Diem] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[maNguoidung] ASC,
	[maVideo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MucDo]    Script Date: 04/04/2023 8:53:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MucDo](
	[maMucDo] [int] NOT NULL,
	[tenMucDo] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[maMucDo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nguoidung]    Script Date: 04/04/2023 8:53:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nguoidung](
	[maNguoidung] [int] NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[tendangnhap] [varchar](20) NULL,
	[matkhau] [varchar](10) NULL,
	[email] [varchar](50) NULL,
	[diachi] [nvarchar](100) NULL,
	[dienthoai] [varchar](15) NULL,
	[ngaysinh] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[maNguoidung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuocTinh]    Script Date: 04/04/2023 8:53:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuocTinh](
	[maThuocTinh] [int] IDENTITY(1,1) NOT NULL,
	[tenThuocTinh] [nvarchar](50) NULL,
 CONSTRAINT [PK_ThuocTinh] PRIMARY KEY CLUSTERED 
(
	[maThuocTinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 04/04/2023 8:53:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[maVideo] [int] IDENTITY(1,1) NOT NULL,
	[maMucDo] [int] NOT NULL,
	[tenVideo] [nvarchar](200) NOT NULL,
	[linkVideo] [varchar](max) NULL,
	[maDanhMuc] [int] NULL,
 CONSTRAINT [PK__Video__69DD932E5F3F8052] PRIMARY KEY CLUSTERED 
(
	[maVideo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc], [linkDanhMuc], [maThuocTinh]) VALUES (1, N'Luyện nghe với video TED', N'/DanhMuc/luyen_nghe_voi_video_TED', 1)
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc], [linkDanhMuc], [maThuocTinh]) VALUES (2, N'VOA: English in a Minute', N'/DanhMuc/VOA_English_in_a_Minute', 1)
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc], [linkDanhMuc], [maThuocTinh]) VALUES (3, N'Học tiếng Anh qua CNN', N'/DanhMuc/hoc_tieng_anh_qua_cnn', 1)
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc], [linkDanhMuc], [maThuocTinh]) VALUES (4, N'Học tiếng Anh qua BBC news', N'/DanhMuc/hoc-tieng-anh-qua-BBC-news
', 1)
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc], [linkDanhMuc], [maThuocTinh]) VALUES (5, N'Luyện nghe tiếng Anh qua video VOA', N'/DanhMuc/luyen-nghe-tieng-anh-qua-video-VOA
', 1)
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc], [linkDanhMuc], [maThuocTinh]) VALUES (6, N'Học tiếng Anh với người nổi tiếng', N'/DanhMuc/hoc-tieng-anh-voi-nguoi-noi-tieng
', 1)
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc], [linkDanhMuc], [maThuocTinh]) VALUES (7, N'Học tiếng Anh qua Youtube', N'/DanhMuc/hoc-tieng-anh-qua-youtube
', 1)
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc], [linkDanhMuc], [maThuocTinh]) VALUES (8, N'Phát âm', N'/DanhMuc/phat-am
', 2)
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc], [linkDanhMuc], [maThuocTinh]) VALUES (9, N'Ngữ pháp', N'/DanhMuc/ngu-phap
', 2)
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc], [linkDanhMuc], [maThuocTinh]) VALUES (10, N'Từ vựng', N'/DanhMuc/tu-vung
', 2)
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc], [linkDanhMuc], [maThuocTinh]) VALUES (11, N'Luyện nghe', N'/DanhMuc/luyen-nghe
', 2)
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc], [linkDanhMuc], [maThuocTinh]) VALUES (12, N'Luyện nói', N'/DanhMuc/luyen-noi
', 2)
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc], [linkDanhMuc], [maThuocTinh]) VALUES (13, N'Luyện đọc', N'/DanhMuc/luyen-doc
', 2)
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc], [linkDanhMuc], [maThuocTinh]) VALUES (14, N'Luyện viết', N'/DanhMuc/luyen-viet
', 2)
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc], [linkDanhMuc], [maThuocTinh]) VALUES (15, N'Luyện nói qua Video Chat', N'/DanhMuc/luyen-noi-qua-video-chat
', 3)
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc], [linkDanhMuc], [maThuocTinh]) VALUES (16, N'Học tiếng Anh qua bài hát', N'/DanhMuc/hoc-tieng-anh-qua-bai-hat
', 3)
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc], [linkDanhMuc], [maThuocTinh]) VALUES (17, N'Học tiếng Anh qua phim Trailer', N'/DanhMuc/hoc-tieng-anh-qua-phim-trailer
', 3)
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc], [linkDanhMuc], [maThuocTinh]) VALUES (18, N'Học tiếng Anh qua truyện cười', N'/DanhMuc/hoc-tieng-anh-qua-truyen-cuoi
', 3)
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc], [linkDanhMuc], [maThuocTinh]) VALUES (19, N'Học tiếng Anh qua danh ngôn', N'/DanhMuc/hoc-tieng-anh-qua-danh-ngon', 3)
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
GO
INSERT [dbo].[MucDo] ([maMucDo], [tenMucDo]) VALUES (1, N'100')
INSERT [dbo].[MucDo] ([maMucDo], [tenMucDo]) VALUES (2, N'250')
INSERT [dbo].[MucDo] ([maMucDo], [tenMucDo]) VALUES (3, N'400')
INSERT [dbo].[MucDo] ([maMucDo], [tenMucDo]) VALUES (4, N'550')
INSERT [dbo].[MucDo] ([maMucDo], [tenMucDo]) VALUES (5, N'700')
GO
SET IDENTITY_INSERT [dbo].[ThuocTinh] ON 

INSERT [dbo].[ThuocTinh] ([maThuocTinh], [tenThuocTinh]) VALUES (1, N'Học qua video')
INSERT [dbo].[ThuocTinh] ([maThuocTinh], [tenThuocTinh]) VALUES (2, N' Kỹ năng')
INSERT [dbo].[ThuocTinh] ([maThuocTinh], [tenThuocTinh]) VALUES (3, N'Học và chơi')
SET IDENTITY_INSERT [dbo].[ThuocTinh] OFF
GO
SET IDENTITY_INSERT [dbo].[Video] ON 

INSERT [dbo].[Video] ([maVideo], [maMucDo], [tenVideo], [linkVideo], [maDanhMuc]) VALUES (19, 1, N'English in a Minute- Tone Deaf', N'/Content/video/VOA English in a Minute/English in a Minute- Tone Deaf.mp4', 1)
INSERT [dbo].[Video] ([maVideo], [maMucDo], [tenVideo], [linkVideo], [maDanhMuc]) VALUES (20, 1, N'VOA60: July 22, 2021', N'/Content/video/VOA English in a Minute/VOA60- July 22, 2021.mp4', 1)
INSERT [dbo].[Video] ([maVideo], [maMucDo], [tenVideo], [linkVideo], [maDanhMuc]) VALUES (21, 1, N'VOA60: October 1, 2021', N'/Content/video/VOA English in a Minute/VOA60- October 1, 2021.mp4', 2)
INSERT [dbo].[Video] ([maVideo], [maMucDo], [tenVideo], [linkVideo], [maDanhMuc]) VALUES (25, 1, N'CNN Student News 08_04_2016 » Học tiếng Anh qua CNN - Học Tiếng Anh Miễn Phí, Học Tiếng Anh Trực Tuyến', N'/Content/video/Hoc tieng Anh qua CNN/CNN Student News 08_04_2016 » H?c ti?ng Anh qua CNN - H?c Ti?ng Anh Mi?n Phí, H?c Ti?ng Anh Tr?c Tuy?n.mp4', 3)
INSERT [dbo].[Video] ([maVideo], [maMucDo], [tenVideo], [linkVideo], [maDanhMuc]) VALUES (26, 1, N'CNN Student News 10_05_2016 » Học tiếng Anh qua CNN - Học Tiếng Anh Miễn Phí, Học Tiếng Anh Trực Tuyến', N'/Content/video/Hoc tieng Anh qua CNN/CNN Student News 10_05_2016 » H?c ti?ng Anh qua CNN - H?c Ti?ng Anh Mi?n Phí, H?c Ti?ng Anh Tr?c Tuy?n.mp4', 3)
INSERT [dbo].[Video] ([maVideo], [maMucDo], [tenVideo], [linkVideo], [maDanhMuc]) VALUES (27, 1, N'CNN Student News 24_05_2016 » Học tiếng Anh qua CNN - Học Tiếng Anh Miễn Phí, Học Tiếng Anh Trực Tuyến', N'/Content/Video/Hoc tieng Anh qua CNN/CNN Student News 24_05_2016 » H?c ti?ng Anh qua CNN - H?c Ti?ng Anh Mi?n Phí, H?c Ti?ng Anh Tr?c Tuy?n.mp4', 3)
INSERT [dbo].[Video] ([maVideo], [maMucDo], [tenVideo], [linkVideo], [maDanhMuc]) VALUES (28, 1, N'CNN Student News 28_03_2016 » Học tiếng Anh qua CNN - Học Tiếng Anh Miễn Phí, Học Tiếng Anh Trực Tuyến', N'/Content/video/Hoc tieng Anh qua CNN/CNN Student News 28_03_2016 » H?c ti?ng Anh qua CNN - H?c Ti?ng Anh Mi?n Phí, H?c Ti?ng Anh Tr?c Tuy?n.mp4', 2)
INSERT [dbo].[Video] ([maVideo], [maMucDo], [tenVideo], [linkVideo], [maDanhMuc]) VALUES (30, 1, N'At least 26 dead as tornadoes ravage parts of US – BBC News', N'/Content/video/Hoc tieng Anh qua BBC news/At least 26 dead as tornadoes ravage parts of US – BBC News.mp4', 4)
INSERT [dbo].[Video] ([maVideo], [maMucDo], [tenVideo], [linkVideo], [maDanhMuc]) VALUES (31, 1, N'Donald Trump starts journey from Florida to New York to face criminal charges – BBC News', N'/Content/video/Hoc tieng Anh qua BBC news/Donald Trump starts journey from Florida to New York to face criminal charges – BBC News.mp4', 4)
INSERT [dbo].[Video] ([maVideo], [maMucDo], [tenVideo], [linkVideo], [maDanhMuc]) VALUES (32, 1, N'Finland to join Nato military alliance on Tuesday – BBC News.mp4', N'/Content/Video/Hoc tieng Anh qua BBC news/Finland to join Nato military alliance on Tuesday – BBC News.mp4', 4)
SET IDENTITY_INSERT [dbo].[Video] OFF
GO
ALTER TABLE [dbo].[BaiTap]  WITH CHECK ADD  CONSTRAINT [FK__BaiTap__maVideo__412EB0B6] FOREIGN KEY([maVideo])
REFERENCES [dbo].[Video] ([maVideo])
GO
ALTER TABLE [dbo].[BaiTap] CHECK CONSTRAINT [FK__BaiTap__maVideo__412EB0B6]
GO
ALTER TABLE [dbo].[DanhMuc]  WITH CHECK ADD FOREIGN KEY([maThuocTinh])
REFERENCES [dbo].[ThuocTinh] ([maThuocTinh])
GO
ALTER TABLE [dbo].[LichSu]  WITH CHECK ADD FOREIGN KEY([maBt])
REFERENCES [dbo].[BaiTap] ([maBt])
GO
ALTER TABLE [dbo].[LichSu]  WITH CHECK ADD FOREIGN KEY([maNguoidung])
REFERENCES [dbo].[Nguoidung] ([maNguoidung])
GO
ALTER TABLE [dbo].[LichSu]  WITH CHECK ADD  CONSTRAINT [FK__LichSu__maVideo__4222D4EF] FOREIGN KEY([maVideo])
REFERENCES [dbo].[Video] ([maVideo])
GO
ALTER TABLE [dbo].[LichSu] CHECK CONSTRAINT [FK__LichSu__maVideo__4222D4EF]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK__Video__maDanhMuc__6754599E] FOREIGN KEY([maDanhMuc])
REFERENCES [dbo].[DanhMuc] ([maDanhMuc])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK__Video__maDanhMuc__6754599E]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK__Video__maMucDo__403A8C7D] FOREIGN KEY([maMucDo])
REFERENCES [dbo].[MucDo] ([maMucDo])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK__Video__maMucDo__403A8C7D]
GO
USE [master]
GO
ALTER DATABASE [StudyEnglish] SET  READ_WRITE 
GO
