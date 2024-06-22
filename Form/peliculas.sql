---CREA la BS  Cinepolis

/****** Object:  UserDefinedFunction [dbo].[CalcularTotal]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[CalcularTotal](
   @cantidad int,
   @precio decimal(18,2),
   @descuento decimal(18,2))
returns decimal(18,2)
as
   begin
	return @cantidad * @precio * (1 - @descuento)
   end
GO
/****** Object:  Table [dbo].[pelicula]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pelicula](
	[peli_id] [int] IDENTITY(1,1) NOT NULL,
	[peli_nombre] [nvarchar](50) NOT NULL,
	[peli_genero_id] [int] NOT NULL,
	[peli_clasificacion_id] [int] NOT NULL,
	[peli_anio] [int] NOT NULL,
	[peli_productor] [nvarchar](50) NOT NULL,
	[peli_sinopsis] [nvarchar](max) NOT NULL,
	[peli_poster_url] [nvarchar](max) NOT NULL,
	[peli_mini_url] [nvarchar](max) NOT NULL,
	[peli_rating] [decimal](18, 2) NOT NULL,
	[peli_video_url] [nvarchar](max) NOT NULL,
	[peli_fecha_creacion] [datetime] NOT NULL,
	[peli_estatus] [bit] NOT NULL,
 CONSTRAINT [PK_Pelicula] PRIMARY KEY CLUSTERED 
(
	[peli_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwSelectPeliculas]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwSelectPeliculas]
as
select peli_id, peli_anio, peli_nombre from pelicula P where peli_clasificacion_id = 2
union
select peli_id, peli_anio, peli_nombre from pelicula where peli_genero_id = 1
union
select 0 peli_id, 2023 peli_anio, 'Mi pelicula' peli_nombre
GO
/****** Object:  Table [dbo].[cata_clasificacion]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cata_clasificacion](
	[clasi_id] [int] IDENTITY(1,1) NOT NULL,
	[clasi_nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cata_clasificacion] PRIMARY KEY CLUSTERED 
(
	[clasi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cata_genero]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cata_genero](
	[gene_id] [int] IDENTITY(1,1) NOT NULL,
	[gene_nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cata_genero] PRIMARY KEY CLUSTERED 
(
	[gene_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contador]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contador](
	[cont_id] [int] IDENTITY(1,1) NOT NULL,
	[cont_like] [bit] NOT NULL,
	[cont_peli_id] [int] NOT NULL,
 CONSTRAINT [PK_contador] PRIMARY KEY CLUSTERED 
(
	[cont_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[contador]  WITH CHECK ADD  CONSTRAINT [FK_contador_Pelicula] FOREIGN KEY([cont_peli_id])
REFERENCES [dbo].[pelicula] ([peli_id])
GO
ALTER TABLE [dbo].[contador] CHECK CONSTRAINT [FK_contador_Pelicula]
GO
ALTER TABLE [dbo].[pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Pelicula_cata_clasificacion] FOREIGN KEY([peli_clasificacion_id])
REFERENCES [dbo].[cata_clasificacion] ([clasi_id])
GO
ALTER TABLE [dbo].[pelicula] CHECK CONSTRAINT [FK_Pelicula_cata_clasificacion]
GO
ALTER TABLE [dbo].[pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Pelicula_cata_genero] FOREIGN KEY([peli_genero_id])
REFERENCES [dbo].[cata_genero] ([gene_id])
GO
ALTER TABLE [dbo].[pelicula] CHECK CONSTRAINT [FK_Pelicula_cata_genero]
GO
/****** Object:  StoredProcedure [dbo].[spDeleteClasificacion]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteClasificacion]
(@IdClasificacion int)
AS
DELETE FROM cata_clasificacion 

WHERE clasi_id = @IdClasificacion
GO
/****** Object:  StoredProcedure [dbo].[spDeleteGenero]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteGenero]
(@IdGenero int)
AS
DELETE FROM cata_genero 

WHERE gene_id = @IdGenero
GO
/****** Object:  StoredProcedure [dbo].[spDeletePelicula]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec spDeletePelicula 9
CREATE PROCEDURE [dbo].[spDeletePelicula]
(@IdPelicula int)
AS
DELETE FROM pelicula 

WHERE peli_id = @IdPelicula
GO
/****** Object:  StoredProcedure [dbo].[spGetClasificacion]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetClasificacion]
(@IdClasificacion INT)
AS
SELECT [clasi_id]
      ,[clasi_nombre]
FROM cata_clasificacion
WHERE clasi_id = @IdClasificacion
GO
/****** Object:  StoredProcedure [dbo].[spGetClasificaciones]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetClasificaciones]
AS
SELECT [clasi_id]
      ,[clasi_nombre]
FROM cata_clasificacion
GO
/****** Object:  StoredProcedure [dbo].[spGetGenero]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetGenero]
(@IdGenero INT)
AS
SELECT [gene_id]
      ,[gene_nombre]
FROM cata_genero
WHERE gene_id = @IdGenero
GO
/****** Object:  StoredProcedure [dbo].[spGetGeneros]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetGeneros]
AS
SELECT [gene_id]
      ,[gene_nombre]
FROM cata_genero
GO
/****** Object:  StoredProcedure [dbo].[spGetPelicula]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetPelicula]
(@IdPelicula INT)
AS
SELECT [peli_id]
      ,[peli_nombre]
      ,[peli_genero_id]
      ,[peli_clasificacion_id]
      ,[peli_anio]
      ,[peli_productor]
      ,[peli_sinopsis]
      ,[peli_poster_url]
      ,[peli_mini_url]
      ,[peli_rating]
      ,[peli_video_url]
      ,[peli_fecha_creacion]
      ,[peli_estatus]
FROM pelicula
WHERE peli_id = @IdPelicula
GO
/****** Object:  StoredProcedure [dbo].[spGetPeliculas]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec spGetPeliculas 'ave', 1, 0
CREATE PROCEDURE [dbo].[spGetPeliculas]
(@nombre varchar(50), @clasificacionId int, @generoId int)
AS
SELECT [peli_id]
      ,[peli_nombre]
      ,[peli_genero_id]
      ,[peli_clasificacion_id]
      ,[peli_anio]
      ,[peli_productor]
      ,[peli_sinopsis]
      ,[peli_poster_url]
      ,[peli_mini_url]
      ,[peli_rating]
      ,[peli_video_url]
      ,[peli_fecha_creacion]
      ,[peli_estatus]
FROM pelicula
WHERE peli_nombre LIKE '%' + @nombre + '%'
AND (peli_clasificacion_id = @clasificacionId or @clasificacionId = 0)
AND (peli_genero_id = @generoId or @generoId = 0)
GO
/****** Object:  StoredProcedure [dbo].[spInsertClasificacion]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertClasificacion]
(@NombreClasificacion varchar(50))
AS 
BEGIN
INSERT INTO cata_clasificacion 
([clasi_nombre])
	  VALUES(
	 @NombreClasificacion)
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertContador]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec spInsertContador 1, 1
CREATE PROCEDURE [dbo].[spInsertContador]
(
    @peliculaId INT,
    @like BIT
)
AS
BEGIN
    DECLARE @total INT
    DECLARE @likes INT
    DECLARE @rating DECIMAL(18, 2)
    DECLARE @newRating DECIMAL(18, 2)
    BEGIN TRANSACTION
    -- Inserto el registro
    INSERT INTO contador
    (
        cont_like,
        cont_peli_id
    )
    VALUES
    (@like, @peliculaId)

    --cuentos votos llevo
    SET @total =
    (
        SELECT COUNT(cont_peli_id)FROM contador WHERE cont_peli_id = @peliculaId
    )
    SET @likes =
    (
        SELECT COUNT(cont_peli_id)
        FROM contador
        WHERE cont_peli_id = @peliculaId
              AND cont_like = 1
    )

    SET @rating = (@likes * 100) / @total
    SET @newRating = (@rating * 5.0) / 100

    -- actualizo la pelicula
    UPDATE pelicula
    SET peli_rating = @newRating
    WHERE peli_id = @peliculaId

    SELECT peli_rating
    FROM pelicula
    WHERE peli_id = @peliculaId

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK
    END
    ELSE
    BEGIN
        COMMIT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertGenero]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertGenero]
(@NombreGenero varchar(50))
AS 
BEGIN
INSERT INTO cata_genero 
([gene_nombre])
	  VALUES(
	 @NombreGenero)
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertPelicula]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec spInsertPelicula '¿Qué pasó ayer?', 1, 2, 2009, 'Todd Phillips', 'Dos días antes de su boda, Doug y tres amigos viajan a Las Vegas para una fiesta inolvidable y salvaje. De hecho, cuando los tres acompañantes despiertan la mañana siguiente, no recuerdan nada ni encuentran a Doug','https://occ.a.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABVx-pT_hQkhZmQldl0OU4D62tnbVHEIteseNsscHbY0m5amKhAC0zHkHVb00lS8tdgBz9VFYlOoFuUU3j_DL_y66btf552UfIk-u.jpg?r=fc4', 'https://occ.a.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABVx-pT_hQkhZmQldl0OU4D62tnbVHEIteseNsscHbY0m5amKhAC0zHkHVb00lS8tdgBz9VFYlOoFuUU3j_DL_y66btf552UfIk-u.jpg?r=fc4', 4.5, 'https://www.youtube.com/embed/wnNgGp1KVWQ'
CREATE PROCEDURE [dbo].[spInsertPelicula]
(@NombrePelicula varchar(50),
@GeneroId int,
@ClasificacionId int,
@Anio int,
@Productor varchar(50),
@Sinopsis varchar(max),
@PosterUrl varchar(max),
@MiniUrl varchar(max),
@Rating decimal,
@VideoUrl varchar(max))
AS 
BEGIN
INSERT INTO pelicula 
(
       [peli_nombre]
      ,[peli_genero_id]
      ,[peli_clasificacion_id]
      ,[peli_anio]
      ,[peli_productor]
      ,[peli_sinopsis]
      ,[peli_poster_url]
      ,[peli_mini_url]
      ,[peli_rating]
      ,[peli_video_url]
      ,[peli_fecha_creacion]
      ,[peli_estatus] 
	  )
	  VALUES(
	 @NombrePelicula
      ,@GeneroId
      ,@ClasificacionId
      ,@Anio
      ,@Productor
      ,@Sinopsis 
      ,@PosterUrl
      ,@MiniUrl 
      ,@Rating
      ,@VideoUrl
      ,GETDATE()
      ,1 )

	  SELECT @@IDENTITY AS pelicula_id;
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateClasificacion]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateClasificacion]
(@IdClasificacion int, 
@NombreClasificacion varchar(50))
AS
BEGIN
UPDATE cata_clasificacion set
      clasi_nombre = @NombreClasificacion
WHERE clasi_id = @IdClasificacion
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateGenero]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateGenero]
(@IdGenero int, 
@NombreGenero varchar(50))
AS
BEGIN
UPDATE cata_genero set
      gene_nombre = @NombreGenero

WHERE gene_id = @IdGenero
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdatePelicula]    Script Date: 6/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec spUpdatePelicula 1,'El juego del calamar', 2, 2, 2022, 'Jorge Aguilar', 'Cientos de personas con dificultades económicas aceptan una extraña invitación a un juego de supervivencia', 'https://ichef.bbci.co.uk/news/640/cpsprodpb/14E84/production/_121063658_squid14.png','https://ichef.bbci.co.uk/news/640/cpsprodpb/14E84/production/_121063658_squid14.png', 5.0, 'https://ichef.bbci.co.uk/news/640/cpsprodpb/14E84/production/_121063658_squid14.png', '2022-10-22 11:50:00', 'true'
CREATE PROCEDURE [dbo].[spUpdatePelicula]
(@IdPelicula int, 
@NombrePelicula varchar(50),
@GeneroId int,
@ClasificacionId int,
@Anio int,
@Productor varchar(50),
@Sinopsis varchar(max),
@PosterUrl varchar(max),
@MiniUrl varchar(max),
@Rating decimal,
@VideoUrl varchar(max),
@FechaCreacion DATETIME,
@Estatus bit)
AS
BEGIN
UPDATE pelicula set
      peli_nombre = @NombrePelicula
      ,peli_genero_id = @GeneroId
      ,peli_clasificacion_id = @ClasificacionId
      ,peli_anio = @Anio
      ,peli_productor = @Productor
      ,peli_sinopsis = @Sinopsis 
      ,peli_poster_url = @PosterUrl
      ,peli_mini_url = @MiniUrl 
      ,peli_rating = @Rating
      ,peli_video_url = @VideoUrl
      ,peli_fecha_creacion = @FechaCreacion
      ,peli_estatus = @Estatus
WHERE peli_id = @IdPelicula
END
GO
USE [master]
GO
ALTER DATABASE [Cinepolis] SET  READ_WRITE 
GO
