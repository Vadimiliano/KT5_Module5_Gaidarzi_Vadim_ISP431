USE [master]
GO
/****** Object:  Database [EmployeeBD]    Script Date: 14.01.2025 11:59:32 ******/
CREATE DATABASE [EmployeeBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EmployeeBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EmployeeBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EmployeeBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EmployeeBD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmployeeBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmployeeBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmployeeBD] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EmployeeBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EmployeeBD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EmployeeBD] SET QUERY_STORE = OFF
GO
USE [EmployeeBD]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 14.01.2025 11:59:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 14.01.2025 11:59:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14.01.2025 11:59:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] NOT NULL,
	[idRole] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[SeriaPasporta] [int] NOT NULL,
	[NomerPasporta] [int] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[LastEntry] [nvarchar](50) NULL,
	[LoginType] [bit] NULL,
	[idGender] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Gender] ([id], [Name]) VALUES (1, N'женский')
INSERT [dbo].[Gender] ([id], [Name]) VALUES (2, N'мужской')
GO
INSERT [dbo].[Role] ([id], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([id], [Name]) VALUES (2, N'Исполнитель')
INSERT [dbo].[Role] ([id], [Name]) VALUES (3, N'Менеджер')
GO
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (1, 3, N'Акимов Ян Алексеевич', N'gohufreilagrau-3818@yopmail.com', N'akimovya', N'bn069Caj', N'+7(781) 7855837', 2367, 558134, CAST(N'1993-07-03' AS Date), N'1,67523E+12', NULL, 2)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (2, 2, N'Гончарова Ульяна Львовна', N'xawugosune-1385@yopmail.com', N'goncharovaul', N'pW4qZhL!', N'+7(230) 9068815', 7101, 669343, CAST(N'1975-06-22' AS Date), N'1,6763E+12', 1, 1)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (3, 1, N'Анохина Елизавета Матвеевна', N'leuttevitrafo1998@mail.ru', N'anochinaem', N'y6UNmaJg', N'+7(555) 4448316', 3455, 719630, CAST(N'1991-08-16' AS Date), N'1,67605E+12', 1, 1)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (4, 3, N'Николаев Илья Владиславович', N'frapreubrulloba1141@yandex.ru', N'nickolaeviv', N'ebOt@4y$', N'+7(392) 6824442', 2377, 871623, CAST(N'1970-12-22' AS Date), N'1,6754E+12', 1, 2)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (5, 2, N'Уткин Дмитрий Платонович', N'zapramaxesu-7741@yopmail.com', N'utkindp', N'zQt8g@GH', N'+7(836) 4290386', 8755, 921148, CAST(N'1999-05-04' AS Date), N'1,6765E+12', 0, 2)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (6, 2, N'Куликова Стефания Никитична', N'rouzecroummegre-3899@yopmail.com', N'kulikovasn', N'TCmE7Jon', N'+7(283) 9453092', 4355, 104594, CAST(N'1994-12-06' AS Date), N'1,67615E+12', 1, 1)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (7, 2, N'Волков Егор Матвеевич', N'ziyeuddocrabri-4748@@yopmail.com', N'volkovem', N'pbgO3Vv5', N'+7(621) 3593669', 2791, 114390, CAST(N'1995-03-28' AS Date), N'1,67649E+12', 1, 2)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (8, 1, N'Соколова Софья Георгиевна', N'ketameissoinnei-1951@yopmail.com', N'sokolovasg', N'lITaH?Bs', N'+7(440) 5610314', 5582, 126286, CAST(N'1977-03-27' AS Date), N'1,6765E+12', 0, 1)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (9, 3, N'Голубева Полина Андреевна', N'yipraubaponou-5849@yopmail.com', N'golubevapa', N's|ke*p@~', N'+7(331) 9182434', 2978, 133653, CAST(N'1975-04-12' AS Date), N'1,67558E+12', 1, 1)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (10, 3, N'Вишневская Мария Андреевна', N'crapedocouca-3572@yopmail.com', N'vishnevskayama', N'OCaywHJZ', N'+7(493) 2193942', 7512, 141956, CAST(N'1975-12-23' AS Date), NULL, 1, 1)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (11, 3, N'Васильева Арина Данииловна', N'ceigoixakaunni-9227@yopmail.com', N'vasilevad', N'DAWuV%#u', N'+7(407) 4855030', 5046, 158433, CAST(N'2000-01-22' AS Date), NULL, 0, 1)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (12, 3, N'Павлов Дмитрий Максимович', N'yeimmeiwauzomo-7054@yopmail.com', N'pavlovdm', N'ptoED%zE', N'+7(919) 4782497', 2460, 169505, CAST(N'1983-10-03' AS Date), N'1,67554E+12', 0, 2)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (13, 2, N'Горбунова Мирослава Артуровна', N'pixil59@gmail.com', N'gorbunovama', N'ZFR2~Zl*', N'+7(482) 8029580', 3412, 174593, CAST(N'1998-03-03' AS Date), N'1,67653E+12', 1, 1)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (14, 3, N'Демина София Романовна', N'deummecillummu-4992@mail.ru', N'deminasr', N'D%DVKyDN', N'+7(455) 9446449', 4950, 183034, CAST(N'1993-06-08' AS Date), N'1,67607E+12', 0, 1)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (15, 2, N'Петрова Алина Робертовна', N'vilagajaunne-5170@yandex.ru', N'petrovaar', N'z7ZE?8N5', N'+7(710) 3882563', 5829, 219464, CAST(N'1980-09-23' AS Date), N'1,67527E+12', 1, 1)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (16, 2, N'Плотников Григорий Александрович', N'frusubroppotou656@yandex.ru', N'plotnikovga', N'yh+S4@yc', N'+7(759) 4523846', 6443, 208059, CAST(N'1991-03-13' AS Date), N'1,67588E+12', 1, 2)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (17, 2, N'Прохорова Есения Тимофеевна', N'vhopkins@lewis-mullen.com', N'prochorovaet', N'wLF186dB', N'+7(687) 8011332', 7079, 213265, CAST(N'1998-04-14' AS Date), N'', NULL, 1)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (18, 2, N'Чернов Алексей Егорович', N'nlewis@yahoo.com', N'chernovae', N'Sjkr*1zV', N'+7(425) 7832253', 8207, 522702, CAST(N'1980-04-16' AS Date), N'1,67561E+12', 1, 2)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (19, 3, N'Горбунов Степан Артёмович', N'garciadavid@mckinney-mcbride.com', N'gorbunovsa', N'hFhK%$JI', N'+7(889) 4494391', 9307, 232158, CAST(N'1993-07-23' AS Date), N'1,67632E+12', 1, 2)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (20, 2, N'Рябинина Софья Артёмовна', N'loudittoimmolau1900@gmail.com', N'ryabininasa', N'&yw1da4K', N'+7(825) 3018250', 1357, 242839, CAST(N'1990-06-01' AS Date), NULL, NULL, 1)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (21, 2, N'Козлова Яна Даниловна', N'hittuprofassa4984@mail.com', N'kozlovayd', N'wCH7dl3k', N'+7(397) 3342086', 1167, 256636, CAST(N'1987-12-21' AS Date), NULL, NULL, 1)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (22, 3, N'Лукьянова Ульяна Олеговна', N'freineiciweijau888@yandex.ru', N'lyckyanovayo', N'JadQ24D5', N'+7(241) 5703040', 1768, 266986, CAST(N'1981-10-22' AS Date), NULL, NULL, 1)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (23, 2, N'Кондрашова Арина Ивановна', N'jessica84@hotmail.com', N'kondrashovai', N'YlBz$8vJ', N'+7(713) 4628265', 1710, 427875, CAST(N'1976-12-22' AS Date), N'1,6758E+12', 0, 1)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (24, 3, N'Быкова Виктория Тимуровна', N'nokupekidda2001@gmail.com', N'bykovavt', N'nx8Z$K98', N'+7(854) 8222331', 1806, 289145, CAST(N'1973-06-14' AS Date), NULL, NULL, 1)
INSERT [dbo].[Users] ([id], [idRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [LoginType], [idGender]) VALUES (25, 2, N'Гуляев Тимофей Даниилович', N'ginaritter@schneider-buchanan.com', N'gylyaevtd', N'lz$kp1?f', N'+7(439) 7136117', 1587, 291249, CAST(N'1987-02-05' AS Date), N'44958,54676', 0, 2)
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Gender] FOREIGN KEY([idGender])
REFERENCES [dbo].[Gender] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Gender]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([idRole])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
USE [master]
GO
ALTER DATABASE [EmployeeBD] SET  READ_WRITE 
GO
