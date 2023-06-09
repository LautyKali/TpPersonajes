USE [master]
GO
/****** Object:  Database [TpPersonaje]    Script Date: 19/5/2023 08:55:21 ******/
CREATE DATABASE [TpPersonaje]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TpPersonaje', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TpPersonaje.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TpPersonaje_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TpPersonaje_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TpPersonaje] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TpPersonaje].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TpPersonaje] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TpPersonaje] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TpPersonaje] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TpPersonaje] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TpPersonaje] SET ARITHABORT OFF 
GO
ALTER DATABASE [TpPersonaje] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TpPersonaje] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TpPersonaje] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TpPersonaje] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TpPersonaje] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TpPersonaje] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TpPersonaje] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TpPersonaje] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TpPersonaje] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TpPersonaje] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TpPersonaje] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TpPersonaje] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TpPersonaje] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TpPersonaje] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TpPersonaje] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TpPersonaje] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TpPersonaje] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TpPersonaje] SET RECOVERY FULL 
GO
ALTER DATABASE [TpPersonaje] SET  MULTI_USER 
GO
ALTER DATABASE [TpPersonaje] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TpPersonaje] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TpPersonaje] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TpPersonaje] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TpPersonaje] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TpPersonaje', N'ON'
GO
ALTER DATABASE [TpPersonaje] SET QUERY_STORE = OFF
GO
USE [TpPersonaje]
GO
/****** Object:  User [alumno]    Script Date: 19/5/2023 08:55:22 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Admin]    Script Date: 19/5/2023 08:55:22 ******/
CREATE USER [Admin] FOR LOGIN [Admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Admin]
GO
/****** Object:  Table [dbo].[Peli_Serie]    Script Date: 19/5/2023 08:55:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peli_Serie](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Imagen] [varchar](4000) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[FechaCreacion] [date] NOT NULL,
	[Calificacion] [float] NOT NULL,
 CONSTRAINT [PK_Peli_Serie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personaje]    Script Date: 19/5/2023 08:55:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personaje](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Imagen] [varchar](4000) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
	[Peso] [float] NOT NULL,
	[Historia] [varchar](4000) NOT NULL,
 CONSTRAINT [PK_Personaje] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonajeXPeli_Serie]    Script Date: 19/5/2023 08:55:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonajeXPeli_Serie](
	[fkPersonaje] [int] NOT NULL,
	[fkPeli_Serie] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Peli_Serie] ON 

INSERT [dbo].[Peli_Serie] ([Id], [Imagen], [Titulo], [FechaCreacion], [Calificacion]) VALUES (1, N'https://es.web.img3.acsta.net/medias/nmedia/18/73/54/02/20415767.jpg', N'Aladdín', CAST(N'1992-11-25' AS Date), 4)
INSERT [dbo].[Peli_Serie] ([Id], [Imagen], [Titulo], [FechaCreacion], [Calificacion]) VALUES (2, N'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/CE555DC1CB28435986B9983496FF2E3C70E8B4A990E333EC35089C8780A99D17/scale?https://www.imdb.com/title/tt4154756/mediaviewer/rm3645348609/?ref_=tt_ov_i', N'Avengers: Infinity War', CAST(N'2018-04-26' AS Date), 4.2)
INSERT [dbo].[Peli_Serie] ([Id], [Imagen], [Titulo], [FechaCreacion], [Calificacion]) VALUES (3, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ63Co08Xo67f1MDqM3-tlCh1j_4hUpo7Y4LuA2NXzN6z_mtfQ7', N'Toy Story 3', CAST(N'2010-06-15' AS Date), 4.1)
INSERT [dbo].[Peli_Serie] ([Id], [Imagen], [Titulo], [FechaCreacion], [Calificacion]) VALUES (4, N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSKTW3jUyO26OzUfoQnFRdIcH_9NgxuU2yzeFUMmJWqBCtPP9lF', N'Star Wars: episodio IV - una nueva esperanza', CAST(N'1997-12-25' AS Date), 4.3)
INSERT [dbo].[Peli_Serie] ([Id], [Imagen], [Titulo], [FechaCreacion], [Calificacion]) VALUES (5, N'https://static.wikia.nocookie.net/doblaje/images/1/1d/LaCasadeMickeyMouse.jpg/revision/latest?cb=20200716161312&path-prefix=es', N'La Casa de Mickey Mouse', CAST(N'2006-05-05' AS Date), 2.4)
INSERT [dbo].[Peli_Serie] ([Id], [Imagen], [Titulo], [FechaCreacion], [Calificacion]) VALUES (6, N'https://www.imdb.com/title/tt8111088/mediaviewer/rm2603036161/?ref_=tt_ov_i', N'The Mandalorian ', CAST(N'2019-11-12' AS Date), 4.4)
SET IDENTITY_INSERT [dbo].[Peli_Serie] OFF
GO
SET IDENTITY_INSERT [dbo].[Personaje] ON 

INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (1, N'https://cdn.s7.shopdisney.eu/is/image/ShopDisneyEMEA/33631_aladdin_character_sq_l?$characterImageSizeDesktop1x$&fit=constrain', N'Aladdin', 18, 64, N'Aladdín es un joven pobre que, junto con su inseparable mono Abú, se dedica a robar o engañar a la gente de Ágrabah para poder sobrevivir, soñando con ser algún día alguien importante. Se enamora de la princesa Jasmine, hija del Sultán.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (2, N'https://cdn.s7.shopdisney.eu/is/image/ShopDisneyEMEA/33631_darth_vader_character_sq_l?$characterImageSizeDesktop1x$&fit=constrain', N'Darth Vader', 45, 136, N'ras salvar a Palpatine de Windu, Anakin se arrodilla ante su nuevo maestro y este lo asigna a los Sith y le da su propio nombre elegante de Señor Sith: Darth Vader, siendo la primera de muchas decisiones que Palpatine tomará por Anakin antes de que finalmente se rompa')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (3, N'https://cdn.s7.shopdisney.eu/is/image/ShopDisneyEMEA/33631_buzz_lightyear_character_sq_l?$characterImageSizeDesktop1x$&fit=constrain', N'Buzz Lightyear', 0, 2, N'Buzz Lightyear es un guardián espacial del Comando Estelar, el cual lleva a cabo una misión, junto con su oficial al mando y mejor amiga, Alisha Hawthorne, deciden aterrizar y explorar el planeta habitable, T''Kani Prime para corroborar si el mismo tiene las condiciones ideales para la colonización.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (4, N'https://cdn.s7.shopdisney.eu/is/image/ShopDisneyEMEA/33631_hulk_character_sq_l?$characterImageSizeDesktop1x$&fit=constrain', N'Hulk', 56, 635, N'Después de una exposición accidental a los rayos gamma durante la detonación de una bomba experimental, Banner se transforma físicamente en Hulk cuando está sometido a estrés emocional, a su voluntad o en contra de ella, lo que a menudo lleva a destrozos y conflictos que complican la vida civil de Banner.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (5, N'https://cdn.s7.shopdisney.eu/is/image/ShopDisneyEMEA/33631_captain_america_character_sq_l?$characterImageSizeDesktop1x$&fit=constrain', N'Capitan America', 39, 109, N'Steve Rogers nació durante la Depresión y creció, convirtiéndose en un joven débil en una familia pobre. Su padre murió cuando él era un niño; su madre, durante la adolescencia de Steve. Horrorizado ante un noticiario que mostraba a los nazis en Europa, Rogers intentó alistarse en el ejército, siendo utilizado para un experimento relacionado con un suero que creaba a un "super-humano", incrementando las cualidades fisicas del usuario. Así es como nace el Capitan America')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (6, N'https://cdn.s7.shopdisney.eu/is/image/ShopDisneyEMEA/33631_r2-d2_character_sq_l?$characterImageSizeDesktop1x$&fit=constrain', N'R2-D2', 0, 1.21, N'R2-D2, un robot del tipo R2, perteneció a las fuerzas de defensa en Naboo sirvió al Rey Veruna durante su término. Este droide siempre estuvo alojado en la Nave Real de Naboo, al igual que otros congéneres con la simple función de reparar cualquier parte de la nave y asistir como navegantes.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (7, N'https://cdn.s7.shopdisney.eu/is/image/ShopDisneyEMEA/33631_woody_character_sq_l?$characterImageSizeDesktop1x$&fit=constrain', N'Woody', 0, 1.5, N'Es un muñeco vaquero vintage basado en un personaje del mismo nombre de una serie de televisión infantil de los años 1950 llamada Woody''s Roundup. Ha sido el juguete favorito de un niño llamado Andy Davis, hasta que Andy creció y se lo dio a una niña llamada Bonnie Anderson. Woody es el líder de los juguetes.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (8, N'https://cdn.s7.shopdisney.eu/is/image/ShopDisneyEMEA/33631_lotso_character_sq_l?$characterImageSizeDesktop1x$&fit=constrain', N'Lotso', 0, 1.9, N'Lotso fue el gran antagonista de Woody, Buzz y el resto de la pandilla en Toy Story 3. Un oso con problemas psicológicos tras ser abandonado por su dueño que hará la vida imposible a los juguetes de Andy en su nuevo hogar, la guardería.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (9, N'https://cdn.s7.shopdisney.eu/is/image/ShopDisneyEMEA/33631_mickey_mouse_character_sq_l?$characterImageSizeDesktop1x$&fit=constrain', N'Mickey Mouse', 93, 10, N'Mickey Mouse es ante todo un personaje de dibujos animados, creado en 1928, después de que Walt Disney tuviera que dejar su primer personaje, Oswald el conejo afortunado, a su productor. Los primeros cortometrajes fueron animados en su mayoría por el asociado de Walt Disney, Ub Iwerks, en Disney Studios.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (10, N'https://cdn.s7.shopdisney.eu/is/image/ShopDisneyEMEA/33631_goofy_character_sq_l?$characterImageSizeDesktop1x$&fit=constrain', N'Goofy', 84, 12, N'Su primera aparición fue el 27 de mayo de 1932 en el cortometraje Mickey''s Revue como Dippy Dawg, teniendo un aspecto más anciano a sus siguientes apariciones. Su siguiente aparición fue ese mismo año en el cortometraje The Whoopee Party, apareciendo con el que sería su aspecto frecuente.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (11, N'https://cdn.s7.shopdisney.eu/is/image/ShopDisneyEMEA/33631_the_child_character_sq_l?$characterImageSizeDesktop1x$&fit=constrain', N'Grogu', 53, 3, N'Din Grogu, conocido por muchos simplemente como «el Niño», fue un Iniciado Jedi y expósito mandaloriano sensible a la Fuerza que pertenecía a la misma especie del Gran Maestro Jedi Yoda y la Maestra Jedi Yaddle. Grogu nació alrededor de 41 ABY, y fue criado en el Templo Jedi en Coruscant.')
SET IDENTITY_INSERT [dbo].[Personaje] OFF
GO
INSERT [dbo].[PersonajeXPeli_Serie] ([fkPersonaje], [fkPeli_Serie]) VALUES (1, 1)
INSERT [dbo].[PersonajeXPeli_Serie] ([fkPersonaje], [fkPeli_Serie]) VALUES (2, 4)
INSERT [dbo].[PersonajeXPeli_Serie] ([fkPersonaje], [fkPeli_Serie]) VALUES (3, 3)
INSERT [dbo].[PersonajeXPeli_Serie] ([fkPersonaje], [fkPeli_Serie]) VALUES (4, 2)
INSERT [dbo].[PersonajeXPeli_Serie] ([fkPersonaje], [fkPeli_Serie]) VALUES (5, 2)
INSERT [dbo].[PersonajeXPeli_Serie] ([fkPersonaje], [fkPeli_Serie]) VALUES (6, 4)
INSERT [dbo].[PersonajeXPeli_Serie] ([fkPersonaje], [fkPeli_Serie]) VALUES (7, 3)
INSERT [dbo].[PersonajeXPeli_Serie] ([fkPersonaje], [fkPeli_Serie]) VALUES (8, 3)
INSERT [dbo].[PersonajeXPeli_Serie] ([fkPersonaje], [fkPeli_Serie]) VALUES (9, 5)
INSERT [dbo].[PersonajeXPeli_Serie] ([fkPersonaje], [fkPeli_Serie]) VALUES (10, 5)
INSERT [dbo].[PersonajeXPeli_Serie] ([fkPersonaje], [fkPeli_Serie]) VALUES (11, 6)
GO
ALTER TABLE [dbo].[PersonajeXPeli_Serie]  WITH CHECK ADD  CONSTRAINT [FK_PersonajeXPeli_Serie_Peli_Serie] FOREIGN KEY([fkPeli_Serie])
REFERENCES [dbo].[Peli_Serie] ([Id])
GO
ALTER TABLE [dbo].[PersonajeXPeli_Serie] CHECK CONSTRAINT [FK_PersonajeXPeli_Serie_Peli_Serie]
GO
ALTER TABLE [dbo].[PersonajeXPeli_Serie]  WITH CHECK ADD  CONSTRAINT [FK_PersonajeXPeli_Serie_Personaje] FOREIGN KEY([fkPersonaje])
REFERENCES [dbo].[Personaje] ([Id])
GO
ALTER TABLE [dbo].[PersonajeXPeli_Serie] CHECK CONSTRAINT [FK_PersonajeXPeli_Serie_Personaje]
GO
USE [master]
GO
ALTER DATABASE [TpPersonaje] SET  READ_WRITE 
GO
