USE [master]
GO
/****** Object:  Database [QL_ThiTNTH]    Script Date: 8/10/2020 4:08:17 PM ******/
CREATE DATABASE [QL_ThiTNTH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_ThiTNTH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QL_ThiTNTH.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QL_ThiTNTH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QL_ThiTNTH_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QL_ThiTNTH] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_ThiTNTH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_ThiTNTH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_ThiTNTH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_ThiTNTH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_ThiTNTH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_ThiTNTH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_ThiTNTH] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QL_ThiTNTH] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QL_ThiTNTH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_ThiTNTH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_ThiTNTH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_ThiTNTH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_ThiTNTH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_ThiTNTH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_ThiTNTH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_ThiTNTH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_ThiTNTH] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QL_ThiTNTH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_ThiTNTH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_ThiTNTH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_ThiTNTH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_ThiTNTH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_ThiTNTH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_ThiTNTH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_ThiTNTH] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QL_ThiTNTH] SET  MULTI_USER 
GO
ALTER DATABASE [QL_ThiTNTH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_ThiTNTH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QL_ThiTNTH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QL_ThiTNTH] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QL_ThiTNTH]
GO
/****** Object:  Table [dbo].[CauHoi]    Script Date: 8/10/2020 4:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CauHoi](
	[MaCH] [int] IDENTITY(1,1) NOT NULL,
	[HinhThucCH] [nvarchar](50) NULL,
	[NoiDungCH] [nvarchar](500) NULL,
	[DoKho] [int] NOT NULL,
 CONSTRAINT [PK_CauHoi] PRIMARY KEY CLUSTERED 
(
	[MaCH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DapAn]    Script Date: 8/10/2020 4:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DapAn](
	[MaDA] [int] IDENTITY(1,1) NOT NULL,
	[MaCH] [int] NULL,
	[DungSai] [bit] NULL,
	[NoiDungDA] [nvarchar](500) NULL,
 CONSTRAINT [PK_DapAn] PRIMARY KEY CLUSTERED 
(
	[MaDA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DotThi]    Script Date: 8/10/2020 4:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DotThi](
	[MaNgayThi] [varchar](50) NOT NULL,
	[NgayThi] [datetime] NULL,
	[SoLuongDK] [int] NULL,
 CONSTRAINT [PK_TaiKhoan_1] PRIMARY KEY CLUSTERED 
(
	[MaNgayThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KetQua]    Script Date: 8/10/2020 4:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KetQua](
	[MaTS] [int] NOT NULL,
	[MaKT] [varchar](50) NOT NULL,
	[Diem] [int] NULL,
 CONSTRAINT [PK_KetQua] PRIMARY KEY CLUSTERED 
(
	[MaTS] ASC,
	[MaKT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KyThi]    Script Date: 8/10/2020 4:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KyThi](
	[MaKT] [varchar](50) NOT NULL,
	[ThoiGianLamBai] [int] NULL,
	[DotThi] [int] NULL,
	[MaNgayThi] [varchar](50) NULL,
 CONSTRAINT [PK_KyThi] PRIMARY KEY CLUSTERED 
(
	[MaKT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 8/10/2020 4:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaLoaiTK] [nvarchar](50) NOT NULL,
	[LoaiTK] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[MaLoaiTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongTinCaNhan]    Script Date: 8/10/2020 4:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThongTinCaNhan](
	[MaTS] [int] IDENTITY(1,1) NOT NULL,
	[HoVaTenTS] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[SDT] [varchar](50) NULL,
	[CMND] [varchar](20) NULL,
	[MatKhau] [varchar](20) NULL,
	[MaLoaiTK] [nvarchar](50) NULL,
	[MaKyThi] [varchar](50) NULL,
	[NgaySinh] [date] NOT NULL,
 CONSTRAINT [PK_ThongTinCaNhan] PRIMARY KEY CLUSTERED 
(
	[MaTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CauHoi] ON 

INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (1, N'TN', N' Bạn đã cài đặt một bộ xử lý mới có tốc độ xử lý cao hơn vào máy của bạn. Điều này có thể có kết quả gì?', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (2, N'TN', N'Bảng mã ASCII mở rộng có bao nhiêu ký tự?', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (5, NULL, N'Binary là hệ đếm gì?', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (6, NULL, N'Các phần mềm dùng để nén tập tin, bạn sử dụng lựa chọn nào?', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (7, NULL, N'Các tập tin sau khi được chọn và xóa bằng phím Shift + Delete:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (8, NULL, N' Các thông số 1280 x 1024, 1280 x 720, 1152 x 864 là những thông số dùng để thiết lập:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (9, NULL, N'Cho biết cách sử dụng bàn phím ảo (On Screen Keyboard ) trong hệ điều hành Windows:?', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (10, NULL, N'Cho biết chức năng (Decrease Indent) trong Microsoft Word 2010:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (11, NULL, N'Cho biết ý nghĩa của chức năng Format Painter trong Microsoft Word 2010:?', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (13, NULL, N'Khẳng định nào sau đây là đúng:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (14, NULL, N'Khi làm việc với văn bản muốn chọn toàn bộ văn bản bạn bấm tổ hợp phím:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (15, NULL, N'Khi làm việc với văn bản muốn in đậm nội dung văn bản đang chọn khối bạn bấm tổ hợp phím:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (16, NULL, N'Các địa chỉ sau đây $A1, B$5, $L9, $DS7 là loại địa chỉ gì:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (17, NULL, N'Cho biết kết quả của công thức = MOD(20,3):', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (18, NULL, N' Cho biết kết quả của phép tính Mod(10,3) là:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (19, NULL, N'Cho biết phím tắt để cố định địa chỉ ô trong công thức của Excel:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (20, NULL, N'Chức năng Animations - Timing Delay trong Powerpoint 2010 dùng để:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (21, NULL, N'Chức năng Animations – Timing Delay dùng để:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (22, NULL, N'Chức năng nhóm Home - Slides Layout trong Powerpoint 2010 dùng để:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (23, NULL, N'Chức năng Slide color scheme trong Powerpoint 2010 là gì?', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (24, NULL, N'Các máy tính trong mạng diện rộng(WAN) được kết nối với nhau:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (25, NULL, N'Các trạm hoạt động trong một mạng vừa như máy phục vụ (server), vừa như máy khách ( client) có thể tìm thấy trong mạng nào ?', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (26, NULL, N'Các đơn vị dữ liệu giao thức trong lớp 2 của mô hình OSI được gọi là :', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (28, NULL, N'Bộ nhớ RAM và ROM là bộ nhớ gì?', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (29, NULL, N'Bộ nhớ ROM (Read Only Memory) trên máy tính là:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (30, NULL, N'Bộ nhớ truy nhập trực tiếp RAMđược viết tắt từ, bạn sử dụng lựa chọn nào?', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (31, NULL, N'Cho biết cách xóa một tập tin hay thư mục mà không di chuyển vào Recycle Bin:?', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (33, NULL, N'Cho biết thao tác hiệu chỉnh ngày tháng năm trong Hệ điều hành Windows 7 :?', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (34, NULL, N'Cho biết thao tác nén thư mục :?', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (35, NULL, N'Cho biết thao tác phục hồi tập tin khi bị xóa trong Recycle Bin:?', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (36, NULL, N'Khi làm việc với văn bản muốn phục hồi lại thao tác vừa thực hiện bạn bấm tổ hợp phím:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (37, NULL, N'Khi một từ không có trong danh sách sửa lỗi mặc định (Auto Correct), nó sẽ được biểu thị thế nào trên màn hình?', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (38, NULL, N' Khi soạn thảo văn bản trong Word 2010, muốn di chuyển từ 1 ô này sang ô kế tiếp về bên phải của một bảng Table ta bấm phím:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (39, NULL, N'Khi soạn thảo văn bản trong Word 2010, để hiển thị trang sẽ in lên màn hình, ta chọn :', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (40, NULL, N'Khi đang soạn thảo văn bản Word 2010, muốn phục hồi thao tác vừa thực hiện thì bấm tổ hợp phím:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (41, NULL, N' Cho biết phím tắt để sửa công thức trong Excel là:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (42, NULL, N' Cho các hàm sau, hàm nào đúng:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (43, NULL, N'Chọn công thức đúng', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (44, NULL, N'Chọn lựa nào để ẩn hiện đường lưới trong wooksheet (Cho phép chọn nhiều):', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (45, NULL, N'Công thức =Mid("Đại học khoa học tự nhiên",4,9) cho kết quả:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (46, NULL, N'Khi gán 1 hiệu ứng loại “Exit” cho đối tượng A trên slide, lúc mới trình chiếu chưa thao tác gì cả thì:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (47, NULL, N'Khi muốn chèn âm thanh đi kèm hiệu ứng cho đối tượng (văn bản, hình ảnh,…) trong cửa sổ Animation Pane, bạn sử dụng lựa chọn nào?', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (48, NULL, N'Khi muốn thiết lập thêm hiệu ứng cho đối tượng (văn bản, hình ảnh,…), bạn sử dụng lựa chọn nào?', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (49, NULL, N'Khi thiết kế các Slide, sử dụng Home - Slides - New Slide có ý nghĩa gì?', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (50, NULL, N'Khi thiết kế Slide với PowerPoint 2010, muốn thay đổi mẫu nền thiết kế của Slide, ta thực hiện:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (51, NULL, N'Cách thức để mở 1 trang web sử dụng Internet Explorer:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (52, NULL, N'Cáp xoắn đôi(UTP) loại Cat5 theo lý thuyết cho phép kết nối hai máy có khoảng cách xa nhất là:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (53, NULL, N'Cáp đồng trục loại mỏng(thin ethernet) cho phép kết nối một dạng Bus có:', 1)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (54, N'CHU', N' Bạn đã cài đặt một bộ xử lý mới có tốc độ xử lý cao hơn vào máy của bạn. Điều này có thể có kết quả gì?', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (55, N'CHU', N'Các đơn vị lưu trữ thông tin của máy tính là?', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (56, N'CHU', N'Cáp quang được làm bằng từ chất liệu gì:?', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (57, N'CHU', N'Cấu trúc chính của máy tính gồm?', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (58, N'CHU', N'Chọn phát biểu đúng về chức năng tìm kiếm tập tin trong Windows', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (59, N'CHU', N'Chọn phát biểu đúng về chức năng tìm kiếm tập tin trong Windows', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (60, N'CHU', N'Chọn phát biểu đúng về chức năng tìm kiếm tập tin trong Windows', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (61, N'CHU', N'Chọn phát biểu đúng về chức năng tìm kiếm tập tin trong Windows', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (62, N'CHU', N'Cách chuyển đổi chữ hoa sang chữ thường và ngược lại, bạn sử dụng:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (63, N'CHU', N'Cách nào sau đây dùng để viết chữ chỉ số trên? (ví dụ: )', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (64, N'CHU', N'Chế độ xem nào sau đây cho phép bạn xem văn bản theo dạng bản in :', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (65, N'CHU', N'Trong word 2010, để tạo chử nghệ thuật ta chọn chức năng:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (66, N'CHU', N'Cho biết chức năng (Decrease Indent) trong Microsoft Word 2010:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (67, N'CHU', N'Kết quả của công thức sau : = INT (-4.5)', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (68, N'CHU', N'Kết quả trả về của công thức: =OR(2>3,4<1) sẽ là:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (69, N'CHU', N'Khi cần so sánh khác nhau thì sử dụng kí hiệu nào:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (70, N'CHU', N'Khi chọn trong mục Edit/ Paste Special chỉ mục Comments dùng để:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (71, N'CHU', N'Khi gõ công thức xong, rồi Enter, máy hiện ra #REF! có nghĩa là:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (72, N'CHU', N'Cho biết nhóm hiệu ứng “Emphasis” trong PowerPoint 2010 dùng để:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (73, N'CHU', N'Chọn lựa nào trong ứng dụng PowerPoint 2010 dùng để ẩn hiện Slide kết thúc nền màu đen:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (74, N'CHU', N'Chọn phát biểu sai:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (75, N'CHU', N'Chức năng Animations - Timing Delay trong Powerpoint 2010 dùng để:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (76, N'CHU', N'Chức năng Animations – Timing Delay dùng để:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (77, N'CHU', N'Chọn phát biểu đúng về tên miền?', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (78, N'CHU', N'Chọn phát biểu đúng về địa chỉ IP phiên bản 4?', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (79, N'CHU', N' Chương trình thường sử dụng để xem các trang web gọi là gì?', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (80, N'CHU', N'Cho biết tên nào sau đây là tên hệ điều hành?', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (81, N'CHU', N'Cho biết đâu là tên thiết bị mạng?', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (82, N'CHU', N'Cho số nhị phân 10001101, số thập phân tương đương là:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (83, N'CHU', N'Chọn phát biểu đúng về chức năng tìm kiếm tập tin trong Windows', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (84, N'CHU', N'Chọn phát biểu đúng về chương trình bảo vệ màn hình:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (85, N'CHU', N'Chọn phát biểu đúng về màn hình desktop trong Windows:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (86, N'CHU', N'Chọn phát biểu đúng về màn hình desktop trong Windows:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (87, N'CHU', N'Cho biết ý nghĩa của chức năng Format Painter trong Microsoft Word 2010:?', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (88, N'CHU', N'Khẳng định nào sau đây là đúng:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (89, N'CHU', N'Khi làm việc với văn bản muốn chọn toàn bộ văn bản bạn bấm tổ hợp phím:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (90, N'CHU', N'Khi làm việc với văn bản muốn in đậm nội dung văn bản đang chọn khối bạn bấm tổ hợp phím:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (91, N'CHU', N'Khi làm việc với văn bản muốn phục hồi lại thao tác vừa thực hiện bạn bấm tổ hợp phím:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (92, N'CHU', N'Bạn đã nhập số 15 vào ô C6. Bạn nhấn vào nút nào để có thể ô C6 có giá trị là $15:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (93, N'CHU', N'Biểu thức =Sum(4,6,-2,9, A) trả lại kết quả là bao nhiêu?, bạn sử dụng lựa chọn nào:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (94, N'CHU', N'Biểu thức sau =AND(5>4, 6<9, 2<1, 10>7, OR(2<1,3>2)) cho kết quả là:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (95, N'CHU', N'Biểu thức sau cho kết quả là bao nhiêu nếu DTB = 9 và HK loại C (trong đó DTB: Điểm trung bình, HK: Hạnh kiểm) =If(OR(DTB>=8, HK="A"),1000,300), bạn sử dụng lựa chọn nào:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (96, N'CHU', N'Các kiểu dữ liệu thông dụng của Excel là:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (97, N'CHU', N'Chức năng nhóm Home - Slides Layout trong Powerpoint 2010 dùng để:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (98, N'CHU', N'Chức năng Slide color scheme trong Powerpoint 2010 là gì?', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (99, N'CHU', N'Khi gán 1 hiệu ứng loại “Exit” cho đối tượng A trên slide, lúc mới trình chiếu chưa thao tác gì cả thì:', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (100, N'CHU', N'Khi muốn chèn âm thanh đi kèm hiệu ứng cho đối tượng (văn bản, hình ảnh,…) trong cửa sổ Animation Pane, bạn sử dụng lựa chọn nào?', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (101, N'CHU', N'Khi muốn thiết lập thêm hiệu ứng cho đối tượng (văn bản, hình ảnh,…), bạn sử dụng lựa chọn nào?', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (102, N'CHU', N'Có bao nhiêu vùng va chạm (collision domains) trong mạng gồm 88 máy tính , 10 HUB và 2 REPEATER?', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (103, N'CHU', N'Có thể mở các file .html bằng :', 2)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (104, N'CHU', N'Có thể truy cập các dịch vụ của một máy tính chạy Window trong mạng TCP/IP bằng. Hãy chọn câu phát biểu “không chính xác” nhất trong các câu phát biểu sau:', 2)
GO
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (105, N'CHU', N'Chọn câu trả lời đúng nhất: USB là?', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (106, N'CHU', N'Chọn lựa nào đúng về các loại mạng máy tính?', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (107, N'CHU', N'Chọn phát biểu đúng trong các câu sau:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (108, N'CHU', N'Chọn phát biểu đúng về thuộc tính ẩn (Hidden) của tập tin', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (109, N'CHU', N'Chọn phát biểu đúng về thuộc tính chỉ đọc (Read Only) của tập tin:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (110, N'CHU', N'Chọn phát biểu đúng về thuộc tính chỉ đọc (Read Only) của tập tin', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (111, N'CHU', N'Chọn phát biểu đúng về thuộc tính chỉ đọc (Read Only) của tập tin', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (112, N'CHU', N'Khi đang soạn thảo văn bản Word 2010, muốn đánh dấu lựa chọn một từ, ta thực hiện :', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (113, N'CHU', N'Khi đang soạn thảo văn bản Word, muốn di chuyển một đoạn văn bản thì bạn bôi đen đoạn văn bản đó và bấm tổ hợp phím:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (114, N'CHU', N'Microsoft Word 2010 có các chế độ nhập liệu nào sau đây?', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (115, N'CHU', N' Muốn chuyển sang trang giấy ngang trong Microsoft Word 2010 bạn làm như thế nào:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (116, N'CHU', N'Phần mềm Microsfot Word 2010 có thể :', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (117, N'CHU', N'Cho biết phím tắt để sửa công thức trong Excel là:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (118, N'CHU', N'Cho các hàm sau, hàm nào đúng:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (119, N'CHU', N'Chọn công thức đúng', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (120, N'CHU', N'Chọn lựa nào để ẩn hiện đường lưới trong wooksheet (Cho phép chọn nhiều):', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (121, N'CHU', N'Công thức =Mid("Đại học khoa học tự nhiên",4,9) cho kết quả:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (122, N'CHU', N'Lệnh nào sau đây không khởi động Powerpoint:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (123, N'CHU', N'Loại hiệu ứng “Entrance” dùng để:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (124, N'CHU', N'Lựa chọn nào không là kiểu của tập tin PowerPoint 2010:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (125, N'CHU', N' Lựa chọn nào là sai trong các lựa chọn sau:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (126, N'CHU', N'Biểu tượng tác động trên đối tượng để:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (127, N'CHU', N'Công ty của bạn được gán cho địa chỉ mạng 131.107.0.0/16. Với tư cách là người quản trị bạn phải cấu hình Subnet Mask nào sau đây để điều tiết cho phù hợp với 25 mạng con với số máy = 2000 máy:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (128, N'CHU', N'Dịch vụ nào cho phép chuyển các file từ trạm này sang trạm khác, bất kể yếu tố địa lý hay hệ điều hành sử dụng:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (129, N'CHU', N'Dịch vụ Thư điện tử dùng để:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (130, NULL, N'Chọn phát biểu đúng về Email?', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (131, NULL, N'Chữ viết tắt MB thường gặp trong các tài liệu về máy tính có nghĩa là gì?', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (132, NULL, N' Chức năng nào dưới đây có thể nhìn thấy các máy tính trong mạng nội bộ?', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (133, NULL, N'Chọn phát biểu đúng về trình soạn thảo Notepad:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (134, NULL, N'Chọn phát biểu đúng về việc thay đổi độ phân giải màn hình trong windows:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (135, NULL, N' Chức năng nào có thể dùng để đóng và thoát một ứng dụng đang chạy trên Windows?', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (136, NULL, N'Chuỗi tìm kiếm nào sau đây sẽ trả về được 3 file: "sayit.txt", "daya)doc" và "pay.mon"?', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (137, NULL, N' Phần mềm nào sau đây không phải là hệ điều hành máy tính?', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (138, NULL, N'Phần mềm nào sau đây sử dụng mã nguồn mở?', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (139, NULL, N'Phần mềm soạn thảo văn bản Microsoft Word 2010 cho phép:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (140, NULL, N'Bạn mở bộ gõ tiếng Việt (Unikey) để soạn thảo. Bạn lựa chọn kiểu gõ Telex và bảng mã Unicode, khi đó bạn cần chọn nhóm font chữ nào trong các font chữ sau để đọc được tiếng Việt:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (141, NULL, N'Cách chuyển đổi chữ hoa sang chữ thường và ngược lại, bạn sử dụng:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (142, NULL, N'Công thức sau: = ROUND(136485.22,-3) sẽ cho kết quả:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (143, NULL, N'Công thức thông báo lỗi nào sau đây cho biết người sử dụng nhập sai tên hàm hoặc chuỗi không đặt trong cặp dấu “ ”:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (144, NULL, N'Cửa sổ Excel thuộc loại:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (145, NULL, N'Giả sử ngày hệ thống của máy tính là: 3/18/2016; Khi đó tại ô A2 gõ vào công thức =Today()-1 thì nhận được kết quả là:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (146, NULL, N'Giả sử ngày hệ thống của máy tính là: 7/20/2016, tại ô C2 gõ vào công thức =Today()-1 thì nhận được kết quả là:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (147, NULL, N'Cách tạo liên kết trong Powerpoint ta làm như thế nào?', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (148, NULL, N'Chế độ View nào giúp ta làm việc tốt nhất với các chuyển cảnh khi thiết kế (Slide transitions) ?', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (149, NULL, N' Cho biết nhóm hiệu ứng “Emphasis” trong PowerPoint 2010 dùng để:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (150, NULL, N'Chọn lựa nào trong ứng dụng PowerPoint 2010 dùng để ẩn hiện Slide kết thúc nền màu đen:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (151, NULL, N'Chọn phát biểu sai:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (152, NULL, N' FireFox là:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (153, NULL, N'Giao thức HTTP được viết tắt, bạn sử dụng lựa chọn nào?', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (154, NULL, N'Giao thức nào dùng để tìm địa chỉ MAC khi biết địa chỉ IP của máy tính:', 3)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (157, NULL, N'333333333333333333333333333', 4)
INSERT [dbo].[CauHoi] ([MaCH], [HinhThucCH], [NoiDungCH], [DoKho]) VALUES (158, NULL, N'123', 3)
SET IDENTITY_INSERT [dbo].[CauHoi] OFF
SET IDENTITY_INSERT [dbo].[DapAn] ON 

INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2318, 1, 1, N'Máy tính của bạn sẽ chạy nhanh hơn')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2319, 1, 0, N'ROM (Read Only Memory) sẽ có dung lượng lớn hơn')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2320, 1, 0, N'RAM (Random Access Memory) sẽ có dung lượng lớn hơn')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2321, 1, 0, N'Đĩa cứng máy tính sẽ lưu trữ dữ liệu nhiều hơn')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2322, 2, 0, N'254')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2323, 2, 1, N'255')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2324, 2, 0, N'256')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2325, 2, 0, N'257')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2326, 5, 0, N'Thập lục phân')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2327, 5, 1, N' Nhị phân')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2328, 5, 0, N' Hệ bát phân')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2329, 5, 0, N' Hệ thập phân')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2330, 6, 1, N' Winzip, Winrar, Total Commander')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2331, 6, 0, N' Winzip, Window, Total Commander')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2332, 6, 0, N'Winzip, Winword, Window Explorer')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2333, 6, 0, N' Winzip, Winword, Excel')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2334, 7, 0, N'Có thể phục hồi khi mở Recyle Bin')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2335, 7, 0, N' Có thể phục hồi khi mở My Document')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2336, 7, 0, N' Có thể phục hồi khi mở My Computer')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2337, 7, 1, N' Không thể phục hồi được nữa')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2338, 8, 0, N'Những bài toán nhân')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2339, 8, 0, N' Kích thước ảnh')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2340, 8, 1, N'Độ phân giải màn hình (Screen Resolution)')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2341, 8, 0, N'Dung lượng tập tin')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2342, 9, 0, N'Vào Start – Run - gõ lệnh OKN')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2343, 9, 0, N' Vào Computer - Ổ đĩa C - Program Files – Unikey - Unikey')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2344, 9, 0, N'Vào Computer - Ô đĩa C - Program Files Microsoft Office - Office14 - Winword')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2345, 9, 1, N' Vào Start – Run - gõ lệnh OSK')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2346, 10, 0, N'Tăng lề trái của văn bản')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2347, 10, 1, N' Giảm lề trái của văn bản')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2348, 10, 0, N' Xóa các ký tự trong văn bản từ bên phải qua trái')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2349, 10, 0, N' Xóa các dòng trong văn bản từ bên phải qua trái')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2350, 11, 1, N' Sao chép tất cả định dạng của một phần/ đối tượng trong văn bản')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2351, 11, 0, N' Sao chép đối tượng trong văn bản')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2352, 11, 0, N' Xóa tất cả các định dạng của phần văn bản được chọn')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2353, 11, 0, N' Định dạng trang giấy nằm ngang')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2354, 13, 0, N'Có thể áp dụng chữ hoa đầu đoạn (Drop Cap) cho tất cả các đoạn trong tài liệu kể cả các đoạn văn bản nằm trong bảng (Table)')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2355, 13, 0, N' Chỉ có thể áp dụng chữ hoa đầu đoạn cho đoạn đầu tiên tài liệu')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2356, 13, 1, N' Không thể áp dụng chữ hoa đầu đoạn cho các đoạn được định dạng kiểu danh sách liệt kê')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2357, 13, 0, N' Không thể áp dụng chữ hoa đầu đoạn cho nhiều đoạn trong cùng một trang tài liệu')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2358, 14, 1, N' Ctrl - A')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2359, 14, 0, N' Ctrl - Z')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2360, 14, 0, N' Ctrl - B')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2361, 14, 0, N' Ctrl - X')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2362, 15, 0, N' Ctrl - A')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2363, 15, 1, N'Ctrl - B')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2364, 15, 0, N' Ctrl - C')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2365, 15, 0, N' Ctrl - D')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2366, 16, 0, N'Địa chỉ tương đối')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2367, 16, 1, N' Địa chỉ hỗn hợp')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2368, 16, 0, N' Địa chỉ tuyệt đối')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2369, 16, 0, N' Địa chỉ tuyệt đối cột, tương đối dòng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2370, 17, 0, N'6')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2371, 17, 0, N'20')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2372, 17, 1, N'2')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2373, 17, 0, N'6')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2374, 18, 1, N'1')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2375, 18, 0, N'3')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2376, 18, 0, N'11')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2377, 18, 0, N'13')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2378, 19, 0, N' F2')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2379, 19, 1, N' F4')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2380, 19, 0, N' F6')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2381, 19, 0, N' F8')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2382, 20, 0, N' Thiết lập thời gian chờ trước khi slide được trình chiếu')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2383, 20, 1, N' Thiết lập thời gian chờ trước khi hiệu ứng bắt đầu')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2384, 20, 0, N' Thiết lập thời gian hoạt động cho tất cả các hiệu ứng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2385, 20, 0, N' Thiết lập thời gian hoạt động cho tất cả các Slide')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2386, 21, 0, N' Thiết lập thời gian chờ trước khi slide được trình chiếu')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2387, 21, 1, N' Thiết lập thời gian chờ trước khi hiệu ứng bắt đầu')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2388, 21, 0, N' Thiết lập thời gian hoạt động cho tất cả các hiệu ứng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2389, 21, 0, N'Thiết lập thời gian chờ trước khi chuyển sang slide khác')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2390, 22, 0, N' Chèn một loại hộp văn bản mới vào Slide')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2391, 22, 0, N' Thay đổi màu nền cho Slide')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2392, 22, 1, N' Thay đổi cách bố cục của các đối tượng trên Slide')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2393, 22, 0, N' Chèn hình ảnh vào Slide')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2394, 23, 1, N' Bộ màu chuẩn của power point')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2395, 23, 0, N' Màu nền')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2396, 23, 0, N' Chèn màu vào các slide')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2397, 23, 0, N' Tên của một slide mới')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2398, 24, 1, N'Bằng các hệ thống truyền dẫn riêng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2399, 24, 0, N' Bằng các hệ thống điện thoại')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2400, 24, 0, N' Bằng các mạng viễn thông công cộng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2401, 24, 0, N' Cả 3 loại hệ thống')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2402, 25, 1, N' Client/Server')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2403, 25, 0, N' Ethernet')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2404, 25, 0, N' Peer to Peer')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2405, 25, 0, N' LAN')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2406, 26, 0, N' PDU')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2407, 26, 0, N' Packet')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2408, 26, 0, N' CSU')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2409, 26, 1, N' Frame')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2410, 28, 0, N' Secondary memory')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2411, 28, 0, N'Receive memory')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2412, 28, 1, N'Primary memory')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2413, 28, 0, N'Random access memory')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2414, 29, 0, N'Loại bộ nhớ chỉ đọc trên máy tính')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2415, 29, 0, N'Không mất dữ liệu khi mất nguồn điện')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2416, 29, 0, N'Hỗ trợ quá trình khởi động máy tính')
GO
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2417, 29, 1, N'Loại bộ nhớ chỉ đọc trên máy tính và không mất dữ liệu khi mất nguồn điện và hỗ trợ quá trình khởi động máy tính')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2418, 30, 0, N'Read Access Memory.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2419, 30, 0, N'Rewrite Access Memory.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2420, 30, 1, N'Random Access Memory')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2421, 30, 0, N'Secondary memory.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2422, 31, 0, N'Chọn thư mục hay tâp tin cần xóa - Delete')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2423, 31, 0, N'Chọn thư mục hay tâp tin cần xóa - Ctrl + Delete')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2424, 31, 0, N'Chọn thư mục hay tâp tin cần xóa - Alt + Delete')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2425, 31, 1, N'Chọn thư mục hay tâp tin cần xóa - Shift + Delete')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2426, 33, 0, N'Vào Start - Control panel - Date and Time Font')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2427, 33, 0, N'Vào Start - Control panel - Date and Time Display')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2428, 33, 1, N'Vào Start - Control panel - Date and Time Change Date and Time')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2429, 33, 0, N'Vào Start - Control panel - Display - Change Date and Time')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2430, 34, 0, N'Right Click Mouse vào thư mục cần nén Include in library -Documents -Ok')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2431, 34, 0, N'Right Click Mouse vào thư mục cần nén Send to - Desktop - Ok')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2432, 34, 0, N'Right Click Mouse vào thư mục cần nén Properties - Sharing - Ok')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2433, 34, 1, N'Right Click Mouse vào thư mục cần nén Add to (tên thư mục cần nén) - Ok')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2434, 35, 0, N' Vào Recycle Bin - chọn tập tin cần phục hồi - Right Click Mouse - Delete')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2435, 35, 0, N'Vào Recycle Bin - chọn tập tin cần phục hồi - Right Click Mouse -Cut')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2436, 35, 1, N'Vào Recycle Bin - chọn tập tin cần phục hồi - Right Click Mouse - Restore')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2437, 35, 0, N'Vào Recycle Bin - chọn tập tin cần phục hồi - Right Click Mouse - Properties')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2438, 36, 0, N'Ctrl - A')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2439, 36, 1, N'Ctrl - Z')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2440, 36, 0, N'Ctrl - B')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2441, 36, 0, N'Ctrl – X')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2442, 37, 0, N' Có đường lượn sóng màu xanh lá phía dưới')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2443, 37, 0, N'Có đường chấm tím phía dưới')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2444, 37, 1, N'Có đường lượn sóng màu đỏ phía dưới')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2445, 37, 0, N'Được đánh dấu bằng màu vàng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2446, 38, 0, N'ESC')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2447, 38, 0, N'Ctrl')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2448, 38, 0, N'CapsLock')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2449, 38, 1, N'Tab')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2450, 39, 0, N'Home - Print Preview')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2451, 39, 0, N'Page Layout - Print Preview')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2452, 39, 1, N'File - Print')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2453, 39, 0, N'File - Print Preview')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2454, 40, 1, N'Ctrl + Z')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2455, 40, 0, N'Ctrl + X')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2456, 40, 0, N'Ctrl + V')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2457, 40, 0, N'Ctrl + Y')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2458, 41, 1, N'F2')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2459, 41, 0, N' F4')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2460, 41, 0, N'F6')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2461, 41, 0, N'F8')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2462, 42, 0, N'ROUND(172.55,0) = 170')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2463, 42, 0, N'ROUND(172.55,2) = 172,6')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2464, 42, 1, N'ROUND(172.55,-1) = 170')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2465, 42, 0, N'ROUND(172.55,-2) = 180')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2466, 43, 0, N'IF((C2<8) AND (C2>5),"Khá","TB")')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2467, 43, 0, N'IF((C2<8 & C2>5),"Khá","TB")')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2468, 43, 0, N'IF((C2<8) OR (C2>5),"Khá","TB","Kém")')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2469, 43, 1, N'IF(AND(C2<8,C2>5),"Khá","TB")')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2470, 44, 0, N'Không có chức năng này')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2471, 44, 1, N'View tag, Show group, Girdlines')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2472, 44, 0, N'Home tag, Paragraph group, No Border')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2473, 44, 0, N'File tag, Options, Advandced, Display Option for this Woooksheet, Show Girdlines')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2474, 45, 0, N'học khoa')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2475, 45, 0, N'khoa học')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2476, 45, 1, N'(khoảng trắng) học khoa')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2477, 45, 0, N' học kho')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2478, 46, 0, N'Đối tượng A không xuất hiện')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2479, 46, 1, N'Đối tượng A đã xuất hiện')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2480, 46, 0, N'Đối tượng A xuất hiện và biến mất')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2481, 46, 0, N'Đối tượng A không biến mất')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2482, 47, 0, N'Chọn đối tượng- Insert - Media - Video')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2483, 47, 1, N'Chọn đối tượng- Effect Options - Sound')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2484, 47, 0, N'Chọn đối tượng- Insert - Media - Audio')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2485, 47, 0, N'Chọn đối tượng-Trasitions- Sound')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2486, 48, 0, N'Animations - Advanced Animation Animation Painter')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2487, 48, 0, N'Animations - Animation')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2488, 48, 0, N' Animations - Advanced Animation Animation Pane ')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2489, 48, 1, N'Animations - Advanced Animation - Add Animations')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2490, 49, 0, N'Chèn thêm một slide mới vào ngay trước slide hiện hành')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2491, 49, 1, N'Chèn thêm một slide mới vào ngay sau slide hiện hành')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2492, 49, 0, N'Chèn thêm một slide mới vào ngay sau slide cuối cùng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2493, 49, 0, N'Chèn thêm một slide mới vào ngay trước slide đầu tiên')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2494, 50, 0, N'Design - Themes …')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2495, 50, 1, N'Design - Background')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2496, 50, 0, N'Insert - Slide Design ...')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2497, 50, 0, N' Slide Show - Themes.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2498, 51, 1, N'Chọn File/Open rồi nhập url của trang web rồi nhấn Enter')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2499, 51, 0, N'Chọn File/Save rồi nhập url của trang web rồi nhấn Enter')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2500, 51, 0, N'Chọn File/Print rồi nhập url của trang web rồi nhấn Enter')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2501, 51, 0, N'Chọn File/New rồi nhập url của trang web rồi nhấn Ente')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2502, 52, 1, N'100m')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2503, 52, 0, N'200m')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2504, 52, 0, N' 300m')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2505, 52, 0, N' 400m')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2506, 53, 0, N'Khoảng cách tối đa 200m, số kết nối là 30, khoảng cách tối thiểu giữa 2 máy là 1m')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2507, 53, 0, N' Khoảng cách tối đa 200m, số kết nối là 28, khoảng cách tối thiểu giữa 2 máy là 1m')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2508, 53, 1, N'Khoảng cách tối đa 185m, số kết nối là 30, khoảng cách tối thiểu giữa 2 máy là 0,5m')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2509, 53, 0, N' Khoảng cách tối đa 185m, số máy kết nối là 28, khoảng cách tối thiểu giữa 2 máy là 0,5m.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2510, 54, 1, N'Bit, Byte, KB, MB, GB')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2511, 54, 0, N'Boolean, Byte, MB')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2512, 54, 0, N'Bit, Byte, KG, Mb, Gb')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2513, 54, 0, N'Đĩa cứng, bộ nhớ')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2514, 55, 1, N'Sợi Quang học')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2515, 55, 0, N'Đồng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2516, 55, 0, N'Sắt')
GO
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2517, 55, 0, N'Nhôm')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2518, 56, 1, N' Đơn vị xử lý trung tâm (CPU), Bộ nhớ chính (RAM-ROM), đĩa cứng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2519, 56, 0, N'Các thành phần nhập, các thành phần kết nối hệ thống')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2520, 56, 0, N'Các thiết bị đĩa cứng, USB, CDRom, Mouse')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2521, 56, 0, N'Màn hình, máy in, và phần kết nối hệ thống')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2522, 57, 1, N'Chức năng tìm kiếm trên một ổ đĩa logic (Ví dụ: ổ C, D, …)')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2523, 57, 0, N'Ta chỉ có thể thực hiện chức năng tìm kiếm trên một ổ đĩa logic (Ví dụ: ổ C, D, …)')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2524, 57, 0, N'a không thể thực hiện chức năng tìm kiếm trên ổ đĩa mềm A')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2525, 57, 0, N'Thực hiện nhiều chức năng cùng một lúc.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2526, 58, 1, N'Chức năng tìm kiếm trên các tập tin hình ảnh, âm thanh, văn bản, bảng tính')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2527, 58, 0, N'Ta không thể thực hiện chức năng tìm kiếm trên các tập tin hình ảnh, âm thanh.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2528, 58, 0, N'Ta không thể tìm kiếm tập tin video mà nội dung của nó có chứa một hình ảnh nào đó')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2529, 58, 0, N'Ta không thể thực hiện chức năng tìm kiếm các tập tin văn bản.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2530, 59, 1, N'Kết quả của quá trình tìm kiếm có thể tìm thấy nhiều tập tin thỏa điều kiện tìm kiếm')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2531, 59, 0, N' Kết quả của quá trình tìm kiếm có thể không tìm thấy một tập tin nào cả')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2532, 59, 0, N' Kết quả của quá trình tìm kiếm có thể không tìm thấy nhiều tập tin thỏa điều kiện tìm kiếm')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2533, 59, 0, N'Kết quả của quá trình tìm kiếm có thể tìm thấy một hay 2 tập tin')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2534, 60, 1, N'Ta chỉ có thể thực hiện chức năng tìm kiếm tập tin, không thể tìm kiếm thư mục.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2535, 60, 0, N'Ta có thể sử dụng ký tự đại diện (Ví dụ: *,%) để làm tiêu chuẩn tìm kiếm tập tin.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2536, 60, 0, N' Ta không thể tìm kiếm tập tin có ký tự thứ 3 của phần mở rộng là t')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2537, 60, 0, N'Kết quả của quá trình tìm kiếm không thể có hơn 256 tập tin.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2538, 61, 1, N'Home - Font - Change Case')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2539, 61, 0, N' Home - Font - Text Effect - Change Case')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2540, 61, 0, N'Nhấn phím Shift+F3')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2541, 61, 0, N'Nhấn phím F3')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2542, 62, 1, N'CTRL+SHIFT+')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2543, 62, 0, N'ALT+F8')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2544, 62, 0, N'SHIFT+')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2545, 62, 0, N'CTRL+T')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2546, 63, 1, N'Print Layout View')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2547, 63, 0, N'Outline View')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2548, 63, 0, N'Nomal View')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2549, 63, 0, N'Web Layout View')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2550, 64, 1, N'Insert – text - wordart')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2551, 64, 0, N'Font - text effects')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2552, 64, 0, N'Insert - symbol')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2553, 64, 0, N' Insert – illustrations - pictures')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2554, 65, 1, N'Giảm lề trái của văn bản')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2555, 65, 0, N'Tăng lề trái của văn bản')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2556, 65, 0, N'Xóa các ký tự trong văn bản từ bên phải qua trái')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2557, 65, 0, N'Xóa các dòng trong văn bản từ bên phải qua trái')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2558, 66, 1, N'-5')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2559, 66, 0, N'2')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2560, 66, 0, N'- 4')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2561, 66, 0, N' 0.5')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2562, 67, 1, N'FALSE')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2563, 67, 0, N'TRUE')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2564, 67, 0, N'Đúng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2565, 67, 0, N' Sai')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2566, 68, 1, N'< >')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2567, 68, 0, N'#')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2568, 68, 0, N'><')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2569, 68, 0, N'&')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2570, 69, 1, N'Chép ghi chú')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2571, 69, 0, N'Chép định dạng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2572, 69, 0, N'Chép giá trị trong ô')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2573, 69, 0, N'Chép bề rộng ô')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2574, 70, 1, N'Không tìm thấy địa chỉ tham chiếu')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2575, 70, 0, N'Không tìm thấy tên hàm')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2576, 70, 0, N'Không tìm thấy giá trị dò tìm')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2577, 70, 0, N'Hàm thiếu đối số')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2578, 71, 1, N'Nhấn mạnh đối tượng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2579, 71, 0, N'Làm đối tượng biến mất')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2580, 71, 0, N'Làm đối tượng chuyển vị trí trên slide')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2581, 71, 0, N'Làm xuất hiện đối tượng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2582, 72, 1, N'File - Options - Advanced - Slide Show chọn hoặc bỏ chọn dòng End with black slide')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2583, 72, 0, N'File - Options - Advanced - Display - chọn hoặc bỏ chọn Show all windows in the Taskbar')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2584, 72, 0, N'File - Options - Advanced - General - chọn hoặc bỏ chọn dòng Show add-in user interface errors')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2585, 72, 0, N' File - Options - Advanced - Editing options - chọn hoặc bỏ chọn Allow text to be dragged and dropped')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2586, 73, 1, N'Không thể loại bỏ hiệu ứng chuyển trang trong bài trình diễn')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2587, 73, 0, N' Khi tạo hiệu ứng động cho một khối văn bản ta có thể cho xuất hiện lần lượt từng từ trong khối văn bản khi trình chiếu')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2588, 73, 0, N'Có thể thực hiện hiệu ứng chuyển trang cho 1 slide bất kỳ trong bài trình diễn')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2589, 73, 0, N'Có thể thực hiện hiệu ứng chuyển trang cho tất cả các slide trong bài trình diễn')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2590, 74, 1, N'Thiết lập thời gian chờ trước khi hiệu ứng bắt đầu')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2591, 74, 0, N'Thiết lập thời gian chờ trước khi slide được trình chiếu')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2592, 74, 0, N'Thiết lập thời gian hoạt động cho tất cả các hiệu ứng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2593, 74, 0, N' Thiết lập thời gian hoạt động cho tất cả các Slide')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2594, 75, 1, N'Thiết lập thời gian chờ trước khi hiệu ứng bắt đầu')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2595, 75, 0, N'Thiết lập thời gian chờ trước khi slide được trình chiếu')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2596, 75, 0, N'Thiết lập thời gian hoạt động cho tất cả các hiệu ứng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2597, 75, 0, N'Thiết lập thời gian hoạt động cho tất cả các Slide')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2598, 76, 1, N'Thiết lập thời gian chờ trước khi hiệu ứng bắt đầu')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2599, 76, 0, N'Thiết lập thời gian chờ trước khi slide được trình chiếu')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2600, 76, 0, N'Thiết lập thời gian hoạt động cho tất cả các hiệu ứng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2601, 76, 0, N'Thiết lập thời gian chờ trước khi chuyển sang slide khác')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2602, 77, 1, N'Tên miền là tên gọi dễ nhớ ánh xạ về một địa chỉ IP')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2603, 77, 0, N'Tên miền là tên giao dịch của 1 công ty hay tổ chức sử dụng trên Internet')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2604, 77, 0, N'Công việc chuyển đổi từ tên miền sang địa chỉ IP do máy chủ DNS đảm trách.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2605, 77, 0, N'Tên miền là tên cho website..')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2606, 78, 1, N'Địa chỉ IP bao gồm 32 bit được chia thành 4 nhóm, mỗi nhóm cách nhau bằng dấu chấm (.).')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2607, 78, 0, N'Địa chỉ IP bao gồm 16 bit được chia thành 4 nhóm, mỗi nhóm cách nhau bằng dấu chấm (.).')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2608, 78, 0, N'Địa chỉ IP bao gồm 64 bit được chia thành 4 nhóm, mỗi nhóm cách nhau bằng dấu chấm phẩy ( ;).')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2609, 78, 0, N'Địa chỉ IP bao gồm 32 bit được chia thành 4 nhóm, mỗi nhóm cách nhau bằng dấu phẩy ().')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2610, 79, 1, N'Trình duyệt web')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2611, 79, 0, N'Trình duyệt nội dung')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2612, 79, 0, N'Trình duyệt tài liệu')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2613, 79, 0, N'Trình duyệt hình ảnh.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2614, 80, 1, N' Windows 10')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2615, 80, 0, N'Notepad')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2616, 80, 0, N'UniKey')
GO
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2617, 80, 0, N'Microsoft Office 2016')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2618, 81, 1, N'Switch')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2619, 81, 0, N'Webcam')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2620, 81, 0, N'USB')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2621, 81, 0, N'HeadPhone')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2622, 82, 1, N'141')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2623, 82, 0, N'213')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2624, 82, 0, N' 217')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2625, 82, 0, N'215')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2626, 83, 1, N'Tìm kiếm tất cả các tập tin theo tên và phần mở rộng.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2627, 83, 0, N'Ta chỉ có thể thực hiện tìm kiếm tập tin, không thể tìm kiếm thư mục')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2628, 83, 0, N' Ta chỉ có thể tìm kiếm những tập tin được tạo cách thời điểm hiện hành một năm')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2629, 83, 0, N'Ta chỉ có thể tìm kiếm những tập tin văn bản (txt, ini, doc) chứ không thể tìm kiếm những tập tin hình ảnh, âm thanh, video')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2630, 84, 1, N'Ta có thể thay đổi chương trình bảo vệ màn hình ở bất kỳ độ phân giải nào')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2631, 84, 0, N'Ta không thể thay đổi chương trình bảo vệ màn hình ở độ phân giải 800x600')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2632, 84, 0, N' Ta không thể thay đổi chương trình bảo vệ màn hình ở độ phân giải 1024x768')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2633, 84, 0, N' Ta không thể thay đổi chương trình bảo vệ màn hình ở bất kỳ độ phân giải nào')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2634, 85, 1, N'Di chuyển, tạo thư mục trên màn hình Desktop')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2635, 85, 0, N' Ta có thể sử dụng bàn phím để di chuyển qua lại giữa các shortcut trên màn hình desktop')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2636, 85, 0, N' Ta có thể tạo thư mục trên màn hình desktop')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2637, 85, 0, N'Ta có thể di chuyển các shortcut trên màn hình desktop')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2638, 86, 1, N'Thay đổi hình nền, tạo tập tin, thư mục, tạo shortcut trên màn hình desktop')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2639, 86, 0, N' Không thể tạo shortcut trên màn hình desktop')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2640, 86, 0, N'Không thể tạo tập tin, thư mục trên màn hình desktop')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2641, 86, 0, N'Không có thể thay đổi hình nền trên màn hình desktop')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2642, 87, 1, N'Sao chép tất cả định dạng của một phần/ đối tượng trong văn bản')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2643, 87, 0, N' Sao chép đối tượng trong văn bản')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2644, 87, 0, N'Xóa tất cả các định dạng của phần văn bản được chọn')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2645, 87, 0, N'Định dạng trang giấy nằm ngang')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2646, 88, 1, N'Không thể áp dụng chữ hoa đầu đoạn cho các đoạn được định dạng kiểu danh sách liệt kê')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2647, 88, 0, N'Không thể áp dụng chữ hoa đầu đoạn cho nhiều đoạn trong cùng một trang tài liệu')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2648, 88, 0, N'Có thể áp dụng chữ hoa đầu đoạn (Drop Cap) cho tất cả các đoạn trong tài liệu kể cả các đoạn văn bản nằm trong bảng (Table)')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2649, 88, 0, N'Chỉ có thể áp dụng chữ hoa đầu đoạn cho đoạn đầu tiên tài liệu')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2650, 89, 1, N'Ctrl - A')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2651, 89, 0, N'Ctrl - Z')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2652, 89, 0, N'Ctrl - B')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2653, 89, 0, N'Ctrl - X')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2654, 90, 1, N' Ctrl - B')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2655, 90, 0, N' Ctrl - A')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2656, 90, 0, N'Ctrl - C')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2657, 90, 0, N'Ctrl - D')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2658, 91, 1, N'Ctrl - Z')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2659, 91, 0, N'Ctrl - A')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2660, 91, 0, N'Ctrl - B')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2661, 91, 0, N'Ctrl – X')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2662, 92, 1, N'Chọn ô C6 rồi nhấn chuột vào nút $ trên thanh công cụ')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2663, 92, 0, N'Vào thực đơn Format - Cells – Border')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2664, 92, 0, N'Vào thực đơn Format - Cells - Number Scientific')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2665, 92, 0, N'Vào thực đơn Format - Cells - Alignment Accounting')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2666, 93, 1, N' #Name?')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2667, 93, 0, N' 5')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2668, 93, 0, N'17')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2669, 93, 0, N'#Value!')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2670, 94, 1, N'False')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2671, 94, 0, N'True')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2672, 94, 0, N'#Name?')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2673, 94, 0, N'#Value!')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2674, 95, 1, N'1000')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2675, 95, 0, N'300')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2676, 95, 0, N' False')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2677, 95, 0, N' #Value!')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2678, 96, 1, N'Kiểu chuỗi, kiểu văn bản, kiểu ngày tháng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2679, 96, 0, N'Kiểu chuỗi, kiểu số, kiểu ngày tháng, kiểu công thức')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2680, 96, 0, N' Kiểu số, kiểu lôgic, kiểu ngày tháng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2681, 96, 0, N'Kiểu công thức, kiểu hàm, kiểu số, kiểu ngày tháng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2682, 97, 1, N'Thay đổi cách bố cục của các đối tượng trên Slide')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2683, 97, 0, N'Chèn một loại hộp văn bản mới vào Slide')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2684, 97, 0, N'Thay đổi màu nền cho Slide')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2685, 97, 0, N'Chèn hình ảnh vào Slide')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2686, 98, 1, N'Bộ màu chuẩn của power point')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2687, 98, 0, N' Màu nền')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2688, 98, 0, N'Chèn màu vào các slide')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2689, 98, 0, N'Tên của một slide mới')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2690, 99, 1, N'Đối tượng A đã xuất hiện')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2691, 99, 0, N'Đối tượng A không xuất hiện')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2692, 99, 0, N'Đối tượng A xuất hiện và biến mất')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2693, 99, 0, N'Đối tượng A không biến mất')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2694, 100, 1, N'Chọn đối tượng- Effect Options - Sound')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2695, 100, 0, N'Đối tượng A không xuất hiện')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2696, 100, 0, N'Đối tượng A xuất hiện và biến mất')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2697, 100, 0, N'Chọn đối tượng-Trasitions- Sound')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2698, 101, 1, N'Animations - Advanced Animation - Add Animations')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2699, 101, 0, N'Animations - Advanced Animation Animation Pane')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2700, 101, 0, N'Animations - Animation')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2701, 101, 0, N'Animations - Advanced Animation Animation Painter')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2702, 102, 1, N'10')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2703, 102, 0, N'1')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2704, 102, 0, N'12')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2705, 102, 0, N'1000')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2706, 103, 1, N'Trình duyệt web (Browser) Internet Explorer.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2707, 103, 0, N'Các trình duyệt mail như Outlook Express, Microsoft Outlook, …')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2708, 103, 0, N'Dùng Paint để mở.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2709, 103, 0, N'Dùng Foxit reader để mở')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2710, 104, 1, N' Địa chỉ MAC(Media Access Control)')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2711, 104, 0, N' Tên DNS(Domain Name System)')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2712, 104, 0, N'Địa chỉ IP')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2713, 104, 0, N'Tên máy(Window Name)')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2714, 105, 0, N'Thiết bị nhập dữ liệu')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2715, 105, 0, N'Thiết bị lưu trữ trong')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2716, 105, 1, N'Thiết bị lưu trữ ngoài')
GO
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2717, 105, 0, N'Thiết bị chuyển đổi dữ liệu')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2718, 106, 1, N'LAN - MAN -WAN')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2719, 106, 0, N'MAN - LAN -VAN - INTRANET')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2720, 106, 0, N'LAM - NAN -WAN')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2721, 106, 0, N'MAN - MEN -WAN - WWW')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2722, 107, 1, N'Rom là bộ nhớ chỉ đọc')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2723, 107, 0, N'RAM là bộ nhớ ngoài.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2724, 107, 0, N'Dữ liệu là thông tin.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2725, 107, 0, N'Đĩa mềm là bộ nhớ trong.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2726, 108, 0, N'Không thể nhìn thấy tập tin có thuộc tính ẩn trong Windows Explorer')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2727, 108, 0, N'Không thể xóa tập tin có thuộc tính ẩn')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2728, 108, 1, N'Có thể di chuyển tập tin có thuộc tính ẩn từ thư mục này sang thư mục khác')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2729, 108, 0, N'Không tồn tại tập tin có thuộc tính ẩn')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2730, 109, 1, N'Không thể thay đổi nội dung của tập tin có thuộc tính chỉ đọc')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2731, 109, 0, N'Không thể di chuyển tập tin có thuộc tính chỉ đọc từ thư mục này sang thư mục khác')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2732, 109, 0, N'Không tồn tại tập tin có thuộc tính ẩn')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2733, 109, 0, N'Không thể làm gì với tập tin có thuộc tính ẩn')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2734, 110, 0, N'Không thể nhìn thấy tập tin có thuộc tính chỉ đọc trong Windows Explorer.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2735, 110, 1, N'Không thể thay đổi nội dung của tập tin có thuộc tính chỉ đọc')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2736, 110, 0, N' Không thể di chuyển tập tin có thuộc tính chỉ đọc từ thư mục này sang thư mục khác')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2737, 110, 0, N' Không thể lưu tập tin chỉ đọc với tên khác')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2738, 111, 0, N'Không thể xem nội dung của tập tin có thuộc tính chỉ đọc')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2739, 111, 0, N'Không thể xóa tập tin có thuộc tính chỉ đọc')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2740, 111, 1, N'Không thể thay đổi nội dung của tập tin có thuộc tính chỉ đọc')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2741, 111, 0, N'Không thể di chuyển tập tin có thuộc tính chỉ đọc từ thư mục này sang thư mục khác')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2742, 112, 1, N'Nhấn chuột 2 lần liên tiếp vào từ cần chọn')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2743, 112, 0, N'Bấm tổ hợp phím Ctrl - C')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2744, 112, 0, N'Nháy chuột vào từ cần chọn')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2745, 112, 0, N' Bấm phím Enter')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2746, 113, 0, N'Ctrl - Z')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2747, 113, 1, N'Ctrl - X - Ctrl - V')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2748, 113, 0, N' Ctrl - C - Ctrl - V')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2749, 113, 0, N'Ctrl - Y')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2750, 114, 0, N'Chế độ thay ký tự (Overtype)')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2751, 114, 0, N'Chế độ chèn ký tự (Insert)')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2752, 114, 1, N'Chế độ chèn ký tự (Insert) và chế độ thay ký tự (Overtype)')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2753, 114, 0, N'Chế độ chèn ký tự (Insert) và không có chế độ thay ký tự (Overtype)')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2754, 115, 0, N'Home - Paragraph - Line spacing - Exactly Ok')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2755, 115, 0, N'Insert - Header & Footer - Page number Format Page number - Ok')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2756, 115, 0, N'Page layout - Page borders - Format Page number - Ok')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2757, 115, 1, N'Page layout - Page set up - Orientation Landscape')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2758, 116, 0, N'Soạn thảo văn bản, báo cáo, chứng từ')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2759, 116, 0, N'Lưu văn bản thành tập tin')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2760, 116, 0, N'Xem và hiệu chỉnh văn bản trước khi in')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2761, 116, 1, N' Làm mọi thứ về soạn thảo văn bản.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2762, 117, 1, N'F2')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2763, 117, 0, N'F4')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2764, 117, 0, N'F6')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2765, 117, 0, N'F8')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2766, 118, 0, N'ROUND(172.55,0) = 170')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2767, 118, 0, N'ROUND(172.55,2) = 172,6')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2768, 118, 1, N'ROUND(172.55,-1) = 170')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2769, 118, 0, N'ROUND(172.55,-2) = 180')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2770, 119, 0, N'IF((C2<8) AND (C2>5),"Khá","TB")')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2771, 119, 0, N'IF((C2<8 & C2>5),"Khá","TB")')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2772, 119, 0, N'IF((C2<8) OR (C2>5),"Khá","TB","Kém")')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2773, 119, 1, N' IF(AND(C2<8,C2>5),"Khá","TB")')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2774, 120, 0, N'Không có chức năng này')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2775, 120, 0, N'View tag, Show group, Girdlines')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2776, 120, 0, N'Home tag, Paragraph group, No Border')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2777, 120, 0, N'File tag, Options, Advandced, Display Option for this Woooksheet, Show Girdlines')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2778, 120, 1, N'B, D đều đúng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2779, 121, 0, N'học khoa')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2780, 121, 0, N' khoa học')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2781, 121, 1, N'(khoảng trắng) học khoa')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2782, 121, 0, N' học kho')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2783, 122, 0, N'Start - All Programs - Microsoft Office Microsoft Powerpoint')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2784, 122, 0, N'Start - Run – gõ Powerpnt.exe - nhấn Enter')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2785, 122, 1, N'Star – Search - For files and Folders')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2786, 122, 0, N'Kích đúp chuột vào biểu tượng Microsoft Powerpoint trên màn hình Desktop')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2787, 123, 0, N'Làm đối tượng biến mất')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2788, 123, 1, N'Làm xuất hiện đối tượng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2789, 123, 0, N'NULLLàm đối tượng chuyển vị trí trên slide')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2790, 123, 0, N'Nhấn mạnh đối tượng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2791, 124, 0, N'.pptx')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2792, 124, 0, N'.ppsx')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2793, 124, 1, N'.ptp')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2794, 124, 0, N' .potx')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2795, 125, 0, N'Trong Powerpoint 2010 có thể Insert vào tập tin Phim:')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2796, 125, 0, N'Trong Powerpoint 2010 có thể Insert vào tập tin Nhạc')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2797, 125, 0, N'Trong Powerpoint 2010 có thể Insert vào tập tin Hình ảnh')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2798, 125, 1, N'Trong Powerpoint 2010 không thể Insert được bất kỳ tập tin nào')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2799, 126, 1, N'Xoay ngang (Horizontal) hoặc xoay đứng (Staked)')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2800, 126, 0, N'Tạo Drop Cap')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2801, 126, 0, N'Kéo dãn ký tự')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2802, 126, 0, N'Tăng chiều cao ký tự')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2803, 127, 0, N' /20 hoặc 255.255.240.0')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2804, 127, 1, N'/21 hoặc 255.255.248.0')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2805, 127, 0, N'/22 hoặc 255.255.252.0')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2806, 127, 0, N'/22 hoặc 255.255.258.0')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2807, 128, 1, N'FTP')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2808, 128, 0, N'Telnet')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2809, 128, 0, N'Email')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2810, 128, 0, N'WWW')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2811, 129, 0, N'Trao đổi thông tin trực tuyến')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2812, 129, 0, N'Hội thoại trực tuyến')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2813, 129, 1, N'Gửi/nhận thư thông qua môi trường Internet')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2814, 129, 0, N'Tìm kiếm thông tin')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2815, 130, 0, N'Là phương thức truyền tập tin từ máy này đến máy khác trên mạng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2816, 130, 0, N'Là dịch vụ cho phép ta truy cập đến hệ thống máy tính khác trên mạng')
GO
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2817, 130, 1, N'Là dịch vụ cho phép ta gởi và nhận thư điện tử')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2818, 130, 0, N'Là hình thức hội thoại trực tiếp trên Internet')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2819, 131, 0, N'Là đơn vị đo độ phân giải màn hình')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2820, 131, 0, N'Là đơn vị đo cường độ âm thanh')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2821, 131, 0, N' Là đơn vị đo tốc độ xử lý')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2822, 131, 1, N' Là đơn vị đo lường thông tin trên thiết bị lưu trữ.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2823, 132, 0, N'My Documents')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2824, 132, 0, N'My Computer')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2825, 132, 1, N'My Network')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2826, 132, 0, N'Control Panel')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2827, 133, 1, N' Nodepad chỉ có thể hiển thị một font chữ tại một thời điểm.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2828, 133, 0, N' Notepad hiển thị nhiều font chữ khác nhau tại một thời điểm.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2829, 133, 0, N'Notepad có thể hiển thị nhiều font và màu sắc khác nhau tại 1 thời điểm')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2830, 133, 0, N'Notepad không thể hiển thị nhiều font chữ khác nhau')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2831, 134, 1, N'Ta có thể thay đổi độ phân giải của màn hình trong giới hạn cho phép')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2832, 134, 0, N'Việc thay đổi độ phân giải của màn hình làm cho máy tính không còn chạy ổn định')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2833, 134, 0, N'Ta không thể tạo shortcut trên màn hình desktop sau khi thay đổi độ phân giải của màn hình.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2834, 134, 0, N'Việc thay đổi độ phân giải của màn hình làm cho nội dung của các tập tin trên màn hình desktop bị thay đổi')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2835, 135, 0, N'Close')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2836, 135, 0, N'Cut')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2837, 135, 0, N'Remove')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2838, 135, 1, N'Exit')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2839, 136, 0, N'?ay?.*')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2840, 136, 0, N'?ay.*')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2841, 136, 0, N'ay.*')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2842, 136, 1, N'?ay*.*')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2843, 137, 0, N'Windows')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2844, 137, 0, N'IOS')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2845, 137, 1, N'Photoshop')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2846, 137, 0, N'Linux')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2847, 138, 0, N'Microsoft Office')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2848, 138, 0, N'Windows Media')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2849, 138, 0, N'Photoshop')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2850, 138, 1, N'Linux')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2851, 139, 0, N'Hiển thị nhiều Font chữ với nhiều màu sắc khác nhau trong một văn bản')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2852, 139, 0, N'Vẽ hình trong văn bản')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2853, 139, 0, N' Phóng to, thu nhỏ văn bản trong quá trình soạn thảo')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2854, 139, 1, N'Cả 3 câu a, b, c đều đúng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2855, 140, 0, N'vn Times, .vn Arial, .vn Courier')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2856, 140, 0, N'vn Times, Times new roman')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2857, 140, 1, N' Tahoma, Arial, Times new Roman')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2858, 140, 0, N'VNI Times, Arial, .Vn Avant')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2859, 141, 1, N'Home - Font - Change Case')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2860, 141, 0, N'Home - Font - Text Effect - Change Case')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2861, 141, 0, N'Nhấn phím Shift+F3')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2862, 141, 0, N'Nhấn phím F3')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2863, 142, 0, N'136,000.22')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2864, 142, 1, N'136000')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2865, 142, 0, N'137,000.22')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2866, 142, 0, N'137000')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2867, 143, 0, N'#Value!')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2868, 143, 0, N'#REF!')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2869, 143, 1, N'Name?')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2870, 143, 0, N'#Div/0 !')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2871, 144, 1, N'Cửa sổ ứng dụng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2872, 144, 0, N'Cửa sổ tư liệu')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2873, 144, 0, N'Cửa sổ thư mục.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2874, 144, 0, N'Cửa sổ windown')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2875, 145, 0, N'0')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2876, 145, 0, N'#VALUE!')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2877, 145, 0, N' #NAME!')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2878, 145, 1, N'3/17/2016')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2879, 146, 0, N' Kết quả là số 0')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2880, 146, 1, N' 7/19/2016')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2881, 146, 0, N'#VALUE!')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2882, 146, 0, N'#####')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2883, 147, 0, N' Home - Links - Hyperlink')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2884, 147, 0, N'Design - Links - Hyperlink')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2885, 147, 0, N'Transitions - Links - Hyperlink')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2886, 147, 1, N' Insert - Links - Hyperlink')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2887, 148, 0, N' Reading View')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2888, 148, 0, N'Slide Show')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2889, 148, 0, N' Notes Pages')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2890, 148, 1, N'Normal')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2891, 149, 0, N'Làm đối tượng biến mất')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2892, 149, 1, N'Nhấn mạnh đối tượng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2893, 149, 0, N'Làm đối tượng chuyển vị trí trên slide')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2894, 149, 0, N' Làm xuất hiện đối tượng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2895, 150, 1, N'File - Options - Advanced - Slide Show chọn hoặc bỏ chọn dòng End with black slide')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2896, 150, 0, N' File - Options - Advanced - Display - chọn hoặc bỏ chọn Show all windows in the Taskbar')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2897, 150, 0, N'File - Options - Advanced - General - chọn hoặc bỏ chọn dòng Show add-in user interface errors')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2898, 150, 0, N' File - Options - Advanced - Editing options - chọn hoặc bỏ chọn Allow text to be dragged and dropped')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2899, 151, 0, N' Khi tạo hiệu ứng động cho một khối văn bản ta có thể cho xuất hiện lần lượt từng từ trong khối văn bản khi trình chiếu.')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2900, 151, 1, N' Không thể loại bỏ hiệu ứng chuyển trang trong bài trình diễn')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2901, 151, 0, N'Có thể thực hiện hiệu ứng chuyển trang cho 1 slide bất kỳ trong bài trình diễn')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2902, 151, 0, N'Có thể thực hiện hiệu ứng chuyển trang cho tất cả các slide trong bài trình diễn')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2903, 152, 0, N'1 chuẩn mạng cục bộ')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2904, 152, 1, N'Trình duyệt web dùng để hiển thị các trang web trên Internet')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2905, 152, 0, N'Bộ giao thức')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2906, 152, 0, N'Thiết bị kết nối các mạng')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2907, 153, 1, N'Hypertext Transfer Protocol')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2908, 153, 0, N'Hypertext Transitions Protocol')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2909, 153, 0, N'Hypertext Trans Protocol')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2910, 153, 0, N'Hypertext Transfer Promotion')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2911, 154, 0, N'RARP')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2912, 154, 0, N'DHCP')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2913, 154, 0, N'TCP/IP')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2914, 154, 1, N'ARP')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2923, 157, 0, N'3434343')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2924, 157, 0, N'4343434')
GO
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2925, 157, 1, N'343434')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2926, 157, 0, N'434343434')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2927, 158, 0, N'eqwewqe')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2928, 158, 0, N'ewqeqw')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2929, 158, 0, N'wqeqweqwewq')
INSERT [dbo].[DapAn] ([MaDA], [MaCH], [DungSai], [NoiDungDA]) VALUES (2930, 158, 1, N'qweqwewqwwwwwwwwwwww')
SET IDENTITY_INSERT [dbo].[DapAn] OFF
INSERT [dbo].[DotThi] ([MaNgayThi], [NgayThi], [SoLuongDK]) VALUES (N'02052010', CAST(0x0000AC190104B4A0 AS DateTime), 50)
INSERT [dbo].[DotThi] ([MaNgayThi], [NgayThi], [SoLuongDK]) VALUES (N'06092020  ', CAST(0x0000AC2E00000000 AS DateTime), 50)
INSERT [dbo].[DotThi] ([MaNgayThi], [NgayThi], [SoLuongDK]) VALUES (N'13092020  ', CAST(0x0000AC3500000000 AS DateTime), 50)
INSERT [dbo].[DotThi] ([MaNgayThi], [NgayThi], [SoLuongDK]) VALUES (N'20092020  ', CAST(0x0000ABB000000000 AS DateTime), 45)
INSERT [dbo].[KyThi] ([MaKT], [ThoiGianLamBai], [DotThi], [MaNgayThi]) VALUES (N'02052010', 40, 1, N'02052010')
INSERT [dbo].[KyThi] ([MaKT], [ThoiGianLamBai], [DotThi], [MaNgayThi]) VALUES (N'TCCTH2', 20, 2, N'06092020')
INSERT [dbo].[KyThi] ([MaKT], [ThoiGianLamBai], [DotThi], [MaNgayThi]) VALUES (N'TCCTH3', 25, 1, N'13092020')
INSERT [dbo].[KyThi] ([MaKT], [ThoiGianLamBai], [DotThi], [MaNgayThi]) VALUES (N'TCCTH4', 20, 2, N'13092020')
INSERT [dbo].[KyThi] ([MaKT], [ThoiGianLamBai], [DotThi], [MaNgayThi]) VALUES (N'TCCTH5', 25, 1, N'20092020')
INSERT [dbo].[KyThi] ([MaKT], [ThoiGianLamBai], [DotThi], [MaNgayThi]) VALUES (N'TCCTH6', 20, 2, N'20092020')
INSERT [dbo].[KyThi] ([MaKT], [ThoiGianLamBai], [DotThi], [MaNgayThi]) VALUES (N'TCCTH7', 20, 3, N'20092020')
INSERT [dbo].[PhanQuyen] ([MaLoaiTK], [LoaiTK]) VALUES (N'AD', N'Admin')
INSERT [dbo].[PhanQuyen] ([MaLoaiTK], [LoaiTK]) VALUES (N'NV', N'Nhân viên')
INSERT [dbo].[PhanQuyen] ([MaLoaiTK], [LoaiTK]) VALUES (N'TS', N'Thí sinh')
SET IDENTITY_INSERT [dbo].[ThongTinCaNhan] ON 

INSERT [dbo].[ThongTinCaNhan] ([MaTS], [HoVaTenTS], [Email], [SDT], [CMND], [MatKhau], [MaLoaiTK], [MaKyThi], [NgaySinh]) VALUES (1011, N'Ngọc Long', N'long@gmail.com', N'123', N'123123', N'123123', N'AD', NULL, CAST(0x8F260B00 AS Date))
INSERT [dbo].[ThongTinCaNhan] ([MaTS], [HoVaTenTS], [Email], [SDT], [CMND], [MatKhau], [MaLoaiTK], [MaKyThi], [NgaySinh]) VALUES (1012, N'Nhật Lâm', N'lam@gmail.com', N'456', N'456456', N'123123', N'NV', NULL, CAST(0x0C240B00 AS Date))
INSERT [dbo].[ThongTinCaNhan] ([MaTS], [HoVaTenTS], [Email], [SDT], [CMND], [MatKhau], [MaLoaiTK], [MaKyThi], [NgaySinh]) VALUES (1014, N'Hửu Phúc', N'dse@gmail.com', N'101', N'545454545454', N'123123', N'TS', N'TCCTH4', CAST(0x69410B00 AS Date))
SET IDENTITY_INSERT [dbo].[ThongTinCaNhan] OFF
ALTER TABLE [dbo].[DapAn]  WITH CHECK ADD  CONSTRAINT [FK_DapAn_CauHoi] FOREIGN KEY([MaCH])
REFERENCES [dbo].[CauHoi] ([MaCH])
GO
ALTER TABLE [dbo].[DapAn] CHECK CONSTRAINT [FK_DapAn_CauHoi]
GO
ALTER TABLE [dbo].[KetQua]  WITH CHECK ADD  CONSTRAINT [FK_KetQua_KyThi] FOREIGN KEY([MaKT])
REFERENCES [dbo].[KyThi] ([MaKT])
GO
ALTER TABLE [dbo].[KetQua] CHECK CONSTRAINT [FK_KetQua_KyThi]
GO
ALTER TABLE [dbo].[KetQua]  WITH CHECK ADD  CONSTRAINT [FK_KetQua_ThongTinCaNhan] FOREIGN KEY([MaTS])
REFERENCES [dbo].[ThongTinCaNhan] ([MaTS])
GO
ALTER TABLE [dbo].[KetQua] CHECK CONSTRAINT [FK_KetQua_ThongTinCaNhan]
GO
ALTER TABLE [dbo].[KyThi]  WITH CHECK ADD  CONSTRAINT [FK_KyThi_DotThi] FOREIGN KEY([MaNgayThi])
REFERENCES [dbo].[DotThi] ([MaNgayThi])
GO
ALTER TABLE [dbo].[KyThi] CHECK CONSTRAINT [FK_KyThi_DotThi]
GO
ALTER TABLE [dbo].[ThongTinCaNhan]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinCaNhan_KyThi] FOREIGN KEY([MaKyThi])
REFERENCES [dbo].[KyThi] ([MaKT])
GO
ALTER TABLE [dbo].[ThongTinCaNhan] CHECK CONSTRAINT [FK_ThongTinCaNhan_KyThi]
GO
ALTER TABLE [dbo].[ThongTinCaNhan]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinCaNhan_PhanQuyen] FOREIGN KEY([MaLoaiTK])
REFERENCES [dbo].[PhanQuyen] ([MaLoaiTK])
GO
ALTER TABLE [dbo].[ThongTinCaNhan] CHECK CONSTRAINT [FK_ThongTinCaNhan_PhanQuyen]
GO
USE [master]
GO
ALTER DATABASE [QL_ThiTNTH] SET  READ_WRITE 
GO
