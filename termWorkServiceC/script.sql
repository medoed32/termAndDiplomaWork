USE [master]
GO
/****** Object:  Database [СервисЦентр]    Script Date: 07.12.2018 15:57:34 ******/
CREATE DATABASE [СервисЦентр]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'СервисЦентр', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\СервисЦентр.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'СервисЦентр_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\СервисЦентр_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [СервисЦентр] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [СервисЦентр].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [СервисЦентр] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [СервисЦентр] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [СервисЦентр] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [СервисЦентр] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [СервисЦентр] SET ARITHABORT OFF 
GO
ALTER DATABASE [СервисЦентр] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [СервисЦентр] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [СервисЦентр] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [СервисЦентр] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [СервисЦентр] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [СервисЦентр] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [СервисЦентр] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [СервисЦентр] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [СервисЦентр] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [СервисЦентр] SET  DISABLE_BROKER 
GO
ALTER DATABASE [СервисЦентр] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [СервисЦентр] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [СервисЦентр] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [СервисЦентр] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [СервисЦентр] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [СервисЦентр] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [СервисЦентр] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [СервисЦентр] SET RECOVERY FULL 
GO
ALTER DATABASE [СервисЦентр] SET  MULTI_USER 
GO
ALTER DATABASE [СервисЦентр] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [СервисЦентр] SET DB_CHAINING OFF 
GO
ALTER DATABASE [СервисЦентр] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [СервисЦентр] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [СервисЦентр] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [СервисЦентр] SET QUERY_STORE = OFF
GO
USE [СервисЦентр]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [СервисЦентр]
GO
/****** Object:  Table [dbo].[Должность]    Script Date: 07.12.2018 15:57:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Должность](
	[Код_Должности] [int] IDENTITY(1,1) NOT NULL,
	[Наименование_Должности] [varchar](30) NOT NULL,
	[Оклад] [varchar](30) NOT NULL,
	[Обязанности] [varchar](1000) NOT NULL,
	[Требования] [varchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_Должности] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудник]    Script Date: 07.12.2018 15:57:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудник](
	[Код_Сотрудника] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия_Сотрудника] [varchar](80) NOT NULL,
	[Имя_Сотрудника] [varchar](80) NOT NULL,
	[Отчество_Сотрудника] [varchar](80) NOT NULL,
	[Возраст] [int] NOT NULL,
	[Пол] [varchar](1) NOT NULL,
	[Адрес_Проживания] [varchar](1000) NOT NULL,
	[Телефон_Сотрудника] [bigint] NOT NULL,
	[Паспортные_Данные] [varchar](500) NOT NULL,
	[Код_Должности] [int] NOT NULL,
	[Логин] [varchar](80) NOT NULL,
	[Пароль] [varchar](80) NOT NULL,
 CONSTRAINT [PK__Сотрудни__9F557E0985F149D8] PRIMARY KEY CLUSTERED 
(
	[Код_Сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Отдел_Кадров]    Script Date: 07.12.2018 15:57:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Отдел_Кадров]
AS
SELECT        dbo.Должность.Наименование_Должности, dbo.Сотрудник.*
FROM            dbo.Должность INNER JOIN
                         dbo.Сотрудник ON dbo.Должность.Код_Должности = dbo.Сотрудник.Код_Должности
GO
/****** Object:  Table [dbo].[Вид_Неисправности]    Script Date: 07.12.2018 15:57:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Вид_Неисправности](
	[Код_Вида_Неисправности] [int] IDENTITY(1,1) NOT NULL,
	[Код_модели] [int] NOT NULL,
	[Описание] [varchar](1000) NOT NULL,
	[Симптомы] [varchar](1000) NOT NULL,
	[Методы_Ремонта] [varchar](1000) NOT NULL,
	[Код_Запчасти_1] [int] NOT NULL,
	[Код_Запчасти_2] [int] NULL,
	[Код_Запчасти_3] [int] NULL,
	[Цена] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_Вида_Неисправности] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказ]    Script Date: 07.12.2018 15:57:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ](
	[Номер_Заказа] [int] IDENTITY(1,1) NOT NULL,
	[Дата_Заказа] [date] NOT NULL,
	[Дата_Возврата] [date] NULL,
	[Фамилия_Заказчика] [varchar](80) NOT NULL,
	[Имя_Заказчика] [varchar](80) NOT NULL,
	[Отчество_Заказчика] [varchar](80) NOT NULL,
	[Серийный_Номер] [bigint] NOT NULL,
	[Код_Вида_Неисправности] [int] NOT NULL,
	[Код_Магазина] [int] NOT NULL,
	[Отметка_О_Гарантии] [varchar](4) NOT NULL,
	[Срок_Гарантии_Ремонта] [datetime] NULL,
	[Цена] [decimal](10, 2) NOT NULL,
	[Код_Сотрудника] [int] NOT NULL,
 CONSTRAINT [PK__Заказ__2EBA558D67C69AC4] PRIMARY KEY CLUSTERED 
(
	[Номер_Заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Обсуживаемый_Магазин]    Script Date: 07.12.2018 15:57:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Обсуживаемый_Магазин](
	[Код_Магазина] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
	[Адрес] [varchar](200) NOT NULL,
	[Телефон_Магазина] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_Магазина] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Список_Заказов]    Script Date: 07.12.2018 15:57:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Список_Заказов]
AS
SELECT        dbo.Заказ.Номер_Заказа, dbo.Заказ.Дата_Заказа, dbo.Заказ.Дата_Возврата, dbo.Заказ.Фамилия_Заказчика, dbo.Заказ.Отчество_Заказчика, dbo.Заказ.Имя_Заказчика, dbo.Заказ.Серийный_Номер, 
                         dbo.Заказ.Код_Вида_Неисправности, dbo.Вид_Неисправности.Методы_Ремонта, dbo.Вид_Неисправности.Код_Запчасти_1, dbo.Вид_Неисправности.Код_Запчасти_2, dbo.Вид_Неисправности.Код_Запчасти_3, 
                         dbo.Вид_Неисправности.Описание, dbo.Вид_Неисправности.Симптомы, dbo.Заказ.Код_Магазина, dbo.Обсуживаемый_Магазин.Наименование, dbo.Заказ.Отметка_О_Гарантии, dbo.Заказ.Срок_Гарантии_Ремонта, 
                         dbo.Заказ.Цена, dbo.Заказ.Код_Сотрудника, dbo.Сотрудник.Фамилия_Сотрудника
FROM            dbo.Вид_Неисправности INNER JOIN
                         dbo.Заказ ON dbo.Вид_Неисправности.Код_Вида_Неисправности = dbo.Заказ.Код_Вида_Неисправности INNER JOIN
                         dbo.Обсуживаемый_Магазин ON dbo.Заказ.Код_Магазина = dbo.Обсуживаемый_Магазин.Код_Магазина INNER JOIN
                         dbo.Сотрудник ON dbo.Заказ.Код_Сотрудника = dbo.Сотрудник.Код_Сотрудника
GO
/****** Object:  Table [dbo].[Ремонтируемая_Модель]    Script Date: 07.12.2018 15:57:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ремонтируемая_Модель](
	[Код_модели] [int] IDENTITY(1,1) NOT NULL,
	[Наименование_Модели] [varchar](500) NOT NULL,
	[Тип_Модели] [varchar](100) NOT NULL,
	[Производитель] [varchar](80) NOT NULL,
	[Технические_Характеристики] [varchar](1000) NULL,
	[Особенности] [varchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_модели] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Список_Неисправностей]    Script Date: 07.12.2018 15:57:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Список_Неисправностей]
AS
SELECT        dbo.Вид_Неисправности.Код_Вида_Неисправности, dbo.Вид_Неисправности.Код_модели, dbo.Ремонтируемая_Модель.Наименование_Модели, dbo.Ремонтируемая_Модель.Тип_Модели, 
                         dbo.Ремонтируемая_Модель.Производитель, dbo.Вид_Неисправности.Описание, dbo.Вид_Неисправности.Симптомы, dbo.Вид_Неисправности.Методы_Ремонта, dbo.Вид_Неисправности.Код_Запчасти_1, 
                         dbo.Вид_Неисправности.Код_Запчасти_2, dbo.Вид_Неисправности.Код_Запчасти_3, dbo.Вид_Неисправности.Цена
FROM            dbo.Вид_Неисправности INNER JOIN
                         dbo.Ремонтируемая_Модель ON dbo.Вид_Неисправности.Код_модели = dbo.Ремонтируемая_Модель.Код_модели
GO
/****** Object:  Table [dbo].[Запчасть]    Script Date: 07.12.2018 15:57:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Запчасть](
	[Код_Запчасти] [int] IDENTITY(1,1) NOT NULL,
	[Наименование_Запчасти] [varchar](500) NOT NULL,
	[Функции] [varchar](1000) NOT NULL,
	[Цена] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_Запчасти] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Вид_Неисправности] ON 

INSERT [dbo].[Вид_Неисправности] ([Код_Вида_Неисправности], [Код_модели], [Описание], [Симптомы], [Методы_Ремонта], [Код_Запчасти_1], [Код_Запчасти_2], [Код_Запчасти_3], [Цена]) VALUES (2, 1, N'Разбит экран', N'Трещина на дисплее', N'Замена дисплея', 1, NULL, NULL, CAST(7000.00 AS Decimal(10, 2)))
INSERT [dbo].[Вид_Неисправности] ([Код_Вида_Неисправности], [Код_модели], [Описание], [Симптомы], [Методы_Ремонта], [Код_Запчасти_1], [Код_Запчасти_2], [Код_Запчасти_3], [Цена]) VALUES (4, 5, N'Разбит экран', N'Трещина на дисплее', N'Замена дисплея', 2, NULL, NULL, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Вид_Неисправности] ([Код_Вида_Неисправности], [Код_модели], [Описание], [Симптомы], [Методы_Ремонта], [Код_Запчасти_1], [Код_Запчасти_2], [Код_Запчасти_3], [Цена]) VALUES (6, 6, N'Проблема с батарей', N'Не держит заряд, экран приподнят', N'Замена АКБ', 6, NULL, NULL, CAST(3000.00 AS Decimal(10, 2)))
INSERT [dbo].[Вид_Неисправности] ([Код_Вида_Неисправности], [Код_модели], [Описание], [Симптомы], [Методы_Ремонта], [Код_Запчасти_1], [Код_Запчасти_2], [Код_Запчасти_3], [Цена]) VALUES (7, 10, N'Разбит экран', N'Трещина на дисплее', N'Замена дисплея', 4, NULL, NULL, CAST(6000.00 AS Decimal(10, 2)))
INSERT [dbo].[Вид_Неисправности] ([Код_Вида_Неисправности], [Код_модели], [Описание], [Симптомы], [Методы_Ремонта], [Код_Запчасти_1], [Код_Запчасти_2], [Код_Запчасти_3], [Цена]) VALUES (10, 7, N'Разбит экран', N'Трещина на дисплее', N'Замена дисплея', 3, NULL, NULL, CAST(5000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Вид_Неисправности] OFF
SET IDENTITY_INSERT [dbo].[Должность] ON 

INSERT [dbo].[Должность] ([Код_Должности], [Наименование_Должности], [Оклад], [Обязанности], [Требования]) VALUES (1, N'СистемныйАдминистартор', N'50000', N'НастройкаПО', N'Поддержание жизни деятельности работы приложения и БД')
INSERT [dbo].[Должность] ([Код_Должности], [Наименование_Должности], [Оклад], [Обязанности], [Требования]) VALUES (2, N'Сотрудник', N'30000', N'РемонтУстройств', NULL)
INSERT [dbo].[Должность] ([Код_Должности], [Наименование_Должности], [Оклад], [Обязанности], [Требования]) VALUES (3, N'Менеджер', N'35000', N'Органицаия работ в сервис центре', N'Заполнение отчетов и контроль над сотрудниками сервис центра')
INSERT [dbo].[Должность] ([Код_Должности], [Наименование_Должности], [Оклад], [Обязанности], [Требования]) VALUES (5, N'Сотрудник', N'25000', N'Ремонт устройств', N'Заполнение заказов, предоставление ремонтных услуг')
INSERT [dbo].[Должность] ([Код_Должности], [Наименование_Должности], [Оклад], [Обязанности], [Требования]) VALUES (6, N'Менеджер', N'30000', N'Управление персоналом', N'Управление персоналом, заполние информации о сотрудниках в БД ')
INSERT [dbo].[Должность] ([Код_Должности], [Наименование_Должности], [Оклад], [Обязанности], [Требования]) VALUES (7, N'Директор', N'30000', N'Управление компанией', NULL)
INSERT [dbo].[Должность] ([Код_Должности], [Наименование_Должности], [Оклад], [Обязанности], [Требования]) VALUES (8, N'Уборщик', N'10000', N'Уборка', N'уборка помещений')
SET IDENTITY_INSERT [dbo].[Должность] OFF
SET IDENTITY_INSERT [dbo].[Заказ] ON 

INSERT [dbo].[Заказ] ([Номер_Заказа], [Дата_Заказа], [Дата_Возврата], [Фамилия_Заказчика], [Имя_Заказчика], [Отчество_Заказчика], [Серийный_Номер], [Код_Вида_Неисправности], [Код_Магазина], [Отметка_О_Гарантии], [Срок_Гарантии_Ремонта], [Цена], [Код_Сотрудника]) VALUES (1, CAST(N'2018-10-11' AS Date), CAST(N'2018-10-20' AS Date), N'Чикин', N'Михаил', N'Сергеевич', 1223213, 2, 1, N'есть', CAST(N'2019-10-10T00:00:00.000' AS DateTime), CAST(7000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Заказ] ([Номер_Заказа], [Дата_Заказа], [Дата_Возврата], [Фамилия_Заказчика], [Имя_Заказчика], [Отчество_Заказчика], [Серийный_Номер], [Код_Вида_Неисправности], [Код_Магазина], [Отметка_О_Гарантии], [Срок_Гарантии_Ремонта], [Цена], [Код_Сотрудника]) VALUES (3, CAST(N'2018-10-11' AS Date), CAST(N'2018-10-11' AS Date), N'Пупов', N'Михаил', N'Анатольевич', 2143566, 6, 1, N'нету', NULL, CAST(3000.00 AS Decimal(10, 2)), 11)
INSERT [dbo].[Заказ] ([Номер_Заказа], [Дата_Заказа], [Дата_Возврата], [Фамилия_Заказчика], [Имя_Заказчика], [Отчество_Заказчика], [Серийный_Номер], [Код_Вида_Неисправности], [Код_Магазина], [Отметка_О_Гарантии], [Срок_Гарантии_Ремонта], [Цена], [Код_Сотрудника]) VALUES (4, CAST(N'2018-10-12' AS Date), CAST(N'2018-10-12' AS Date), N'Елахин', N'Никита', N'Максимович', 2255453, 6, 1, N'нету', NULL, CAST(3000.00 AS Decimal(10, 2)), 11)
INSERT [dbo].[Заказ] ([Номер_Заказа], [Дата_Заказа], [Дата_Возврата], [Фамилия_Заказчика], [Имя_Заказчика], [Отчество_Заказчика], [Серийный_Номер], [Код_Вида_Неисправности], [Код_Магазина], [Отметка_О_Гарантии], [Срок_Гарантии_Ремонта], [Цена], [Код_Сотрудника]) VALUES (5, CAST(N'2018-10-12' AS Date), CAST(N'2018-10-12' AS Date), N'Паприков', N'Максим', N'Максимович', 5437654, 6, 1, N'нету', NULL, CAST(3000.00 AS Decimal(10, 2)), 11)
INSERT [dbo].[Заказ] ([Номер_Заказа], [Дата_Заказа], [Дата_Возврата], [Фамилия_Заказчика], [Имя_Заказчика], [Отчество_Заказчика], [Серийный_Номер], [Код_Вида_Неисправности], [Код_Магазина], [Отметка_О_Гарантии], [Срок_Гарантии_Ремонта], [Цена], [Код_Сотрудника]) VALUES (6, CAST(N'2018-10-12' AS Date), CAST(N'2018-10-12' AS Date), N'Кирюлин', N'Кирилл', N'Кириллович', 7455743, 6, 1, N'нету', NULL, CAST(3000.00 AS Decimal(10, 2)), 12)
INSERT [dbo].[Заказ] ([Номер_Заказа], [Дата_Заказа], [Дата_Возврата], [Фамилия_Заказчика], [Имя_Заказчика], [Отчество_Заказчика], [Серийный_Номер], [Код_Вида_Неисправности], [Код_Магазина], [Отметка_О_Гарантии], [Срок_Гарантии_Ремонта], [Цена], [Код_Сотрудника]) VALUES (7, CAST(N'2018-10-12' AS Date), CAST(N'2018-10-12' AS Date), N'Володина', N'Елена', N'Никитична', 7654534, 6, 1, N'нету', NULL, CAST(3000.00 AS Decimal(10, 2)), 14)
INSERT [dbo].[Заказ] ([Номер_Заказа], [Дата_Заказа], [Дата_Возврата], [Фамилия_Заказчика], [Имя_Заказчика], [Отчество_Заказчика], [Серийный_Номер], [Код_Вида_Неисправности], [Код_Магазина], [Отметка_О_Гарантии], [Срок_Гарантии_Ремонта], [Цена], [Код_Сотрудника]) VALUES (8, CAST(N'2018-10-12' AS Date), CAST(N'2018-10-12' AS Date), N'Чирюлина', N'Вита', N'Витальевна', 6478437, 2, 1, N'есть', CAST(N'2019-10-11T00:00:00.000' AS DateTime), CAST(7000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[Заказ] ([Номер_Заказа], [Дата_Заказа], [Дата_Возврата], [Фамилия_Заказчика], [Имя_Заказчика], [Отчество_Заказчика], [Серийный_Номер], [Код_Вида_Неисправности], [Код_Магазина], [Отметка_О_Гарантии], [Срок_Гарантии_Ремонта], [Цена], [Код_Сотрудника]) VALUES (9, CAST(N'2018-10-12' AS Date), CAST(N'2018-10-12' AS Date), N'Вильевна', N'Варвара', N'Юрьевна', 4576435, 10, 6, N'есть', CAST(N'2020-10-11T00:00:00.000' AS DateTime), CAST(5000.00 AS Decimal(10, 2)), 12)
INSERT [dbo].[Заказ] ([Номер_Заказа], [Дата_Заказа], [Дата_Возврата], [Фамилия_Заказчика], [Имя_Заказчика], [Отчество_Заказчика], [Серийный_Номер], [Код_Вида_Неисправности], [Код_Магазина], [Отметка_О_Гарантии], [Срок_Гарантии_Ремонта], [Цена], [Код_Сотрудника]) VALUES (10, CAST(N'2018-10-13' AS Date), CAST(N'2018-10-13' AS Date), N'Суркина', N'Веда', N'Сергеевна', 3463253, 6, 1, N'нету', NULL, CAST(3000.00 AS Decimal(10, 2)), 11)
INSERT [dbo].[Заказ] ([Номер_Заказа], [Дата_Заказа], [Дата_Возврата], [Фамилия_Заказчика], [Имя_Заказчика], [Отчество_Заказчика], [Серийный_Номер], [Код_Вида_Неисправности], [Код_Магазина], [Отметка_О_Гарантии], [Срок_Гарантии_Ремонта], [Цена], [Код_Сотрудника]) VALUES (11, CAST(N'2018-10-13' AS Date), CAST(N'2018-10-13' AS Date), N'Якбил', N'Сергей', N'Ли', 4523652, 4, 1, N'есть', CAST(N'2019-10-12T00:00:00.000' AS DateTime), CAST(10000.00 AS Decimal(10, 2)), 11)
SET IDENTITY_INSERT [dbo].[Заказ] OFF
SET IDENTITY_INSERT [dbo].[Запчасть] ON 

INSERT [dbo].[Запчасть] ([Код_Запчасти], [Наименование_Запчасти], [Функции], [Цена]) VALUES (1, N'Дисплей iphone 7', N'Дисплей', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Запчасть] ([Код_Запчасти], [Наименование_Запчасти], [Функции], [Цена]) VALUES (2, N'Дисплей iphone 8', N'Дисплей ', CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[Запчасть] ([Код_Запчасти], [Наименование_Запчасти], [Функции], [Цена]) VALUES (3, N'Дисплей iphone 6s', N'Дисплей ', CAST(3400.00 AS Decimal(10, 2)))
INSERT [dbo].[Запчасть] ([Код_Запчасти], [Наименование_Запчасти], [Функции], [Цена]) VALUES (4, N'Дисплей Samsung G8', N'Дисплей ', CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[Запчасть] ([Код_Запчасти], [Наименование_Запчасти], [Функции], [Цена]) VALUES (5, N'АКБ Samsung A5', N'АКБ', CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Запчасть] ([Код_Запчасти], [Наименование_Запчасти], [Функции], [Цена]) VALUES (6, N'АКБ iphone 5s', N'АКБ', CAST(1500.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Запчасть] OFF
SET IDENTITY_INSERT [dbo].[Обсуживаемый_Магазин] ON 

INSERT [dbo].[Обсуживаемый_Магазин] ([Код_Магазина], [Наименование], [Адрес], [Телефон_Магазина]) VALUES (1, N'reStore', N'ЦУМ', 89774344343)
INSERT [dbo].[Обсуживаемый_Магазин] ([Код_Магазина], [Наименование], [Адрес], [Телефон_Магазина]) VALUES (2, N'reStore', N'метро Арбатное', 89771233232)
INSERT [dbo].[Обсуживаемый_Магазин] ([Код_Магазина], [Наименование], [Адрес], [Телефон_Магазина]) VALUES (3, N'Связной', N'метро Бабушкинская', 89255174435)
INSERT [dbo].[Обсуживаемый_Магазин] ([Код_Магазина], [Наименование], [Адрес], [Телефон_Магазина]) VALUES (4, N'БигГик', N'метро Фили', 89771435332)
INSERT [dbo].[Обсуживаемый_Магазин] ([Код_Магазина], [Наименование], [Адрес], [Телефон_Магазина]) VALUES (5, N'Мвидео', N'метро Красносельская', 89998764535)
INSERT [dbo].[Обсуживаемый_Магазин] ([Код_Магазина], [Наименование], [Адрес], [Телефон_Магазина]) VALUES (6, N'Евросеть', N'метро Панфиловская', 89996547373)
SET IDENTITY_INSERT [dbo].[Обсуживаемый_Магазин] OFF
SET IDENTITY_INSERT [dbo].[Ремонтируемая_Модель] ON 

INSERT [dbo].[Ремонтируемая_Модель] ([Код_модели], [Наименование_Модели], [Тип_Модели], [Производитель], [Технические_Характеристики], [Особенности]) VALUES (1, N'iPhone 7', N'Смартфон', N'Apple', N'Apple A10', NULL)
INSERT [dbo].[Ремонтируемая_Модель] ([Код_модели], [Наименование_Модели], [Тип_Модели], [Производитель], [Технические_Характеристики], [Особенности]) VALUES (5, N'iPhone 8', N'Смартфон', N'Apple', N'apple A11 BIONIC', NULL)
INSERT [dbo].[Ремонтируемая_Модель] ([Код_модели], [Наименование_Модели], [Тип_Модели], [Производитель], [Технические_Характеристики], [Особенности]) VALUES (6, N'iPhone 5s', N'Смартфон', N'Apple', N'Apple A7 ', NULL)
INSERT [dbo].[Ремонтируемая_Модель] ([Код_модели], [Наименование_Модели], [Тип_Модели], [Производитель], [Технические_Характеристики], [Особенности]) VALUES (7, N'iPhone 6s ', N'Смартфон', N'Apple', N'Apple A9 ', NULL)
INSERT [dbo].[Ремонтируемая_Модель] ([Код_модели], [Наименование_Модели], [Тип_Модели], [Производитель], [Технические_Характеристики], [Особенности]) VALUES (8, N'Samsung A5', N'Смартфон', N'Samsung', N'Snapdregon 820', NULL)
INSERT [dbo].[Ремонтируемая_Модель] ([Код_модели], [Наименование_Модели], [Тип_Модели], [Производитель], [Технические_Характеристики], [Особенности]) VALUES (10, N'Samsung G8', N'Смартфон', N'Samsung', N'qalcom', NULL)
SET IDENTITY_INSERT [dbo].[Ремонтируемая_Модель] OFF
SET IDENTITY_INSERT [dbo].[Сотрудник] ON 

INSERT [dbo].[Сотрудник] ([Код_Сотрудника], [Фамилия_Сотрудника], [Имя_Сотрудника], [Отчество_Сотрудника], [Возраст], [Пол], [Адрес_Проживания], [Телефон_Сотрудника], [Паспортные_Данные], [Код_Должности], [Логин], [Пароль]) VALUES (1, N'Епанчин', N'Никита', N'Константинович', 20, N'м', N'Москва', 88005553535, N'1222333333', 1, N'ad', N'ad')
INSERT [dbo].[Сотрудник] ([Код_Сотрудника], [Фамилия_Сотрудника], [Имя_Сотрудника], [Отчество_Сотрудника], [Возраст], [Пол], [Адрес_Проживания], [Телефон_Сотрудника], [Паспортные_Данные], [Код_Должности], [Логин], [Пароль]) VALUES (2, N'Гусев', N'Евгений', N'Романович', 19, N'м', N'Москва', 89774553434, N'1234657564', 2, N'gus', N'gus')
INSERT [dbo].[Сотрудник] ([Код_Сотрудника], [Фамилия_Сотрудника], [Имя_Сотрудника], [Отчество_Сотрудника], [Возраст], [Пол], [Адрес_Проживания], [Телефон_Сотрудника], [Паспортные_Данные], [Код_Должности], [Логин], [Пароль]) VALUES (3, N'Шмаругин', N'Петоров', N'Петрович', 35, N'м', N'Москва', 89262343557, N'1234574456', 3, N'men', N'men')
INSERT [dbo].[Сотрудник] ([Код_Сотрудника], [Фамилия_Сотрудника], [Имя_Сотрудника], [Отчество_Сотрудника], [Возраст], [Пол], [Адрес_Проживания], [Телефон_Сотрудника], [Паспортные_Данные], [Код_Должности], [Логин], [Пароль]) VALUES (5, N'Гусев ', N'Евгений', N'Романович', 19, N'м', N'Москва', 89771234325, N'1123321443', 5, N'gus', N'gus')
INSERT [dbo].[Сотрудник] ([Код_Сотрудника], [Фамилия_Сотрудника], [Имя_Сотрудника], [Отчество_Сотрудника], [Возраст], [Пол], [Адрес_Проживания], [Телефон_Сотрудника], [Паспортные_Данные], [Код_Должности], [Логин], [Пароль]) VALUES (6, N'Угараева', N'Елена', N'Эдуардовна', 24, N'ж', N'Москва', 89656556455, N'1423655465', 6, N'men', N'men')
INSERT [dbo].[Сотрудник] ([Код_Сотрудника], [Фамилия_Сотрудника], [Имя_Сотрудника], [Отчество_Сотрудника], [Возраст], [Пол], [Адрес_Проживания], [Телефон_Сотрудника], [Паспортные_Данные], [Код_Должности], [Логин], [Пароль]) VALUES (8, N'Целева', N'Надежда', N'Павловна', 35, N'ж', N'Москва', 89545647453, N'1246743452', 8, N'0', N'0')
INSERT [dbo].[Сотрудник] ([Код_Сотрудника], [Фамилия_Сотрудника], [Имя_Сотрудника], [Отчество_Сотрудника], [Возраст], [Пол], [Адрес_Проживания], [Телефон_Сотрудника], [Паспортные_Данные], [Код_Должности], [Логин], [Пароль]) VALUES (9, N'Кабабурин', N'Павел', N'Сергеевич', 45, N'м', N'Москва', 89998768787, N'4352423254', 7, N'0', N'0')
INSERT [dbo].[Сотрудник] ([Код_Сотрудника], [Фамилия_Сотрудника], [Имя_Сотрудника], [Отчество_Сотрудника], [Возраст], [Пол], [Адрес_Проживания], [Телефон_Сотрудника], [Паспортные_Данные], [Код_Должности], [Логин], [Пароль]) VALUES (11, N'Робакин', N'Роман', N'Романович', 21, N'м', N'Москва', 89345234234, N'2436346344', 5, N'kukir', N'erevan')
INSERT [dbo].[Сотрудник] ([Код_Сотрудника], [Фамилия_Сотрудника], [Имя_Сотрудника], [Отчество_Сотрудника], [Возраст], [Пол], [Адрес_Проживания], [Телефон_Сотрудника], [Паспортные_Данные], [Код_Должности], [Логин], [Пароль]) VALUES (12, N'Какушкин', N'Алексей', N'Артемович', 40, N'м', N'Москва', 89543542421, N'2476535465', 5, N'pukar', N'qwerty12')
INSERT [dbo].[Сотрудник] ([Код_Сотрудника], [Фамилия_Сотрудника], [Имя_Сотрудника], [Отчество_Сотрудника], [Возраст], [Пол], [Адрес_Проживания], [Телефон_Сотрудника], [Паспортные_Данные], [Код_Должности], [Логин], [Пароль]) VALUES (13, N'Яноренко', N'Светлана', N'Михайловна', 30, N'ж', N'Москва', 86589569567, N'6545678433', 5, N'dudim420', N'echpochmak')
INSERT [dbo].[Сотрудник] ([Код_Сотрудника], [Фамилия_Сотрудника], [Имя_Сотрудника], [Отчество_Сотрудника], [Возраст], [Пол], [Адрес_Проживания], [Телефон_Сотрудника], [Паспортные_Данные], [Код_Должности], [Логин], [Пароль]) VALUES (14, N'Фыркин', N'Максим', N'Максимович', 18, N'м', N'Москва', 89545642342, N'2354678534', 5, N'zanuda2000', N'sobakadrugcheloveka')
INSERT [dbo].[Сотрудник] ([Код_Сотрудника], [Фамилия_Сотрудника], [Имя_Сотрудника], [Отчество_Сотрудника], [Возраст], [Пол], [Адрес_Проживания], [Телефон_Сотрудника], [Паспортные_Данные], [Код_Должности], [Логин], [Пароль]) VALUES (15, N'Венцеслав', N'Андрей', N'Павлович', 20, N'м', N'Москва', 89534535421, N'5467347543', 5, N'dom2', N'kadonivedma')
SET IDENTITY_INSERT [dbo].[Сотрудник] OFF
ALTER TABLE [dbo].[Вид_Неисправности]  WITH CHECK ADD FOREIGN KEY([Код_Запчасти_1])
REFERENCES [dbo].[Запчасть] ([Код_Запчасти])
GO
ALTER TABLE [dbo].[Вид_Неисправности]  WITH CHECK ADD FOREIGN KEY([Код_Запчасти_2])
REFERENCES [dbo].[Запчасть] ([Код_Запчасти])
GO
ALTER TABLE [dbo].[Вид_Неисправности]  WITH CHECK ADD FOREIGN KEY([Код_Запчасти_3])
REFERENCES [dbo].[Запчасть] ([Код_Запчасти])
GO
ALTER TABLE [dbo].[Вид_Неисправности]  WITH CHECK ADD FOREIGN KEY([Код_модели])
REFERENCES [dbo].[Ремонтируемая_Модель] ([Код_модели])
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK__Заказ__Код_Вида___46E78A0C] FOREIGN KEY([Код_Вида_Неисправности])
REFERENCES [dbo].[Вид_Неисправности] ([Код_Вида_Неисправности])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK__Заказ__Код_Вида___46E78A0C]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK__Заказ__Код_Магаз__47DBAE45] FOREIGN KEY([Код_Магазина])
REFERENCES [dbo].[Обсуживаемый_Магазин] ([Код_Магазина])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK__Заказ__Код_Магаз__47DBAE45]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK__Заказ__Код_Сотру__48CFD27E] FOREIGN KEY([Код_Сотрудника])
REFERENCES [dbo].[Сотрудник] ([Код_Сотрудника])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK__Заказ__Код_Сотру__48CFD27E]
GO
ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD  CONSTRAINT [FK__Сотрудник__Код_Д__49C3F6B7] FOREIGN KEY([Код_Должности])
REFERENCES [dbo].[Должность] ([Код_Должности])
GO
ALTER TABLE [dbo].[Сотрудник] CHECK CONSTRAINT [FK__Сотрудник__Код_Д__49C3F6B7]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Должность"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 278
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Сотрудник"
            Begin Extent = 
               Top = 18
               Left = 434
               Bottom = 148
               Right = 644
            End
            DisplayFlags = 280
            TopColumn = 8
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Отдел_Кадров'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Отдел_Кадров'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[35] 4[43] 2[3] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Вид_Неисправности"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "Заказ"
            Begin Extent = 
               Top = 6
               Left = 307
               Bottom = 136
               Right = 538
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "Обсуживаемый_Магазин"
            Begin Extent = 
               Top = 6
               Left = 576
               Bottom = 136
               Right = 772
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Сотрудник"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 248
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3090
         Alias = 900
         Table = 2415
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Список_Заказов'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Список_Заказов'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[37] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Вид_Неисправности"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 261
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Ремонтируемая_Модель"
            Begin Extent = 
               Top = 6
               Left = 307
               Bottom = 136
               Right = 559
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2355
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Список_Неисправностей'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Список_Неисправностей'
GO
USE [master]
GO
ALTER DATABASE [СервисЦентр] SET  READ_WRITE 
GO
