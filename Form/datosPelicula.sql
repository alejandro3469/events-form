USE [Cinepolis]
GO
SET IDENTITY_INSERT [dbo].[cata_clasificacion] ON 
GO
INSERT [dbo].[cata_clasificacion] ([clasi_id], [clasi_nombre]) VALUES (1, N'A')
GO
INSERT [dbo].[cata_clasificacion] ([clasi_id], [clasi_nombre]) VALUES (2, N'B')
GO
INSERT [dbo].[cata_clasificacion] ([clasi_id], [clasi_nombre]) VALUES (3, N'C')
GO
SET IDENTITY_INSERT [dbo].[cata_clasificacion] OFF
GO
SET IDENTITY_INSERT [dbo].[cata_genero] ON 
GO
INSERT [dbo].[cata_genero] ([gene_id], [gene_nombre]) VALUES (1, N'Acciones')
GO
INSERT [dbo].[cata_genero] ([gene_id], [gene_nombre]) VALUES (2, N'Terror')
GO
INSERT [dbo].[cata_genero] ([gene_id], [gene_nombre]) VALUES (3, N'Suspenso')
GO
INSERT [dbo].[cata_genero] ([gene_id], [gene_nombre]) VALUES (4, N'Comedia')
GO
SET IDENTITY_INSERT [dbo].[cata_genero] OFF
GO
SET IDENTITY_INSERT [dbo].[pelicula] ON 
GO
INSERT [dbo].[pelicula] ([peli_id], [peli_nombre], [peli_genero_id], [peli_clasificacion_id], [peli_anio], [peli_productor], [peli_sinopsis], [peli_poster_url], [peli_mini_url], [peli_rating], [peli_video_url], [peli_fecha_creacion], [peli_estatus]) VALUES (1, N'Avengers 2', 3, 2, 2005, N'Jorge Aguilar', N'película de superhéroes estadounidense de 2012 basada en el equipo de superhéroes homónimo de Marvel Comics', N'https://i0.wp.com/codigoespagueti.com/wp-content/uploads/2022/04/Resena-The-Avengers-el-crossover-que-cambio-la-industria-del-cine.jpg?fit=1280%2C720&quality=80&ssl=1', N'https://lumiere-a.akamaihd.net/v1/images/p_avengersinfinitywar_19871_cb171514.jpeg?region=0%2C0%2C540%2C810', CAST(4.00 AS Decimal(18, 2)), N'https://www.youtube.com/embed/6ZfuNTqbHE8', CAST(N'2022-11-05T10:46:18.507' AS DateTime), 1)
GO
INSERT [dbo].[pelicula] ([peli_id], [peli_nombre], [peli_genero_id], [peli_clasificacion_id], [peli_anio], [peli_productor], [peli_sinopsis], [peli_poster_url], [peli_mini_url], [peli_rating], [peli_video_url], [peli_fecha_creacion], [peli_estatus]) VALUES (3, N'Avengers', 1, 1, 2005, N'Jorge Aguilar', N'película de superhéroes estadounidense de 2012 basada en el equipo de superhéroes homónimo de Marvel Comics', N'https://i0.wp.com/codigoespagueti.com/wp-content/uploads/2022/04/Resena-The-Avengers-el-crossover-que-cambio-la-industria-del-cine.jpg?fit=1280%2C720&quality=80&ssl=1', N'https://lumiere-a.akamaihd.net/v1/images/p_avengersinfinitywar_19871_cb171514.jpeg?region=0%2C0%2C540%2C810', CAST(5.00 AS Decimal(18, 2)), N'https://www.youtube.com/embed/6ZfuNTqbHE8', CAST(N'2022-11-05T10:39:49.240' AS DateTime), 1)
GO
INSERT [dbo].[pelicula] ([peli_id], [peli_nombre], [peli_genero_id], [peli_clasificacion_id], [peli_anio], [peli_productor], [peli_sinopsis], [peli_poster_url], [peli_mini_url], [peli_rating], [peli_video_url], [peli_fecha_creacion], [peli_estatus]) VALUES (4, N'¿Qué pasó ayer?', 1, 2, 2009, N'Todd Phillips', N'Dos días antes de su boda, Doug y tres amigos viajan a Las Vegas para una fiesta inolvidable y salvaje. De hecho, cuando los tres acompañantes despiertan la mañana siguiente, no recuerdan nada ni encuentran a Doug', N'https://occ.a.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABVx-pT_hQkhZmQldl0OU4D62tnbVHEIteseNsscHbY0m5amKhAC0zHkHVb00lS8tdgBz9VFYlOoFuUU3j_DL_y66btf552UfIk-u.jpg?r=fc4', N'https://occ.a.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABVx-pT_hQkhZmQldl0OU4D62tnbVHEIteseNsscHbY0m5amKhAC0zHkHVb00lS8tdgBz9VFYlOoFuUU3j_DL_y66btf552UfIk-u.jpg?r=fc4', CAST(5.00 AS Decimal(18, 2)), N'https://www.youtube.com/embed/wnNgGp1KVWQ', CAST(N'2022-12-14T16:51:44.883' AS DateTime), 1)
GO
INSERT [dbo].[pelicula] ([peli_id], [peli_nombre], [peli_genero_id], [peli_clasificacion_id], [peli_anio], [peli_productor], [peli_sinopsis], [peli_poster_url], [peli_mini_url], [peli_rating], [peli_video_url], [peli_fecha_creacion], [peli_estatus]) VALUES (5, N'Intensamente 2', 4, 1, 2024, N'Disney', N'Pelicula chida', N'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/6252FCE1E1E5E967604E576CE1687E52B051E9C8573BC14A86D81F4212E405F7/scale?width=1200&amp;aspectRatio=1.78&amp;format=webp', N'https://mx.web.img3.acsta.net/pictures/17/08/07/21/43/466493.jpg', CAST(5.00 AS Decimal(18, 2)), N'https://www.youtube.com/embed/9bol4Yyx9Gs', CAST(N'2024-06-22T15:14:00.000' AS DateTime), 1)
GO
INSERT [dbo].[pelicula] ([peli_id], [peli_nombre], [peli_genero_id], [peli_clasificacion_id], [peli_anio], [peli_productor], [peli_sinopsis], [peli_poster_url], [peli_mini_url], [peli_rating], [peli_video_url], [peli_fecha_creacion], [peli_estatus]) VALUES (6, N'Intensamente 2', 4, 1, 2024, N'Disney', N'Pelicula chida', N'https://prod-ripcut-delivery.disney-plus.net/v1/variantdisney/6252FCE1E1E5E967604E576CE1687E52B051E9C8573BC14A86D81F4212E405F7/scalewidth=1200&amp;aspectRatio=1.78&amp;format=webp', N'https://mx.web.img3.acsta.net/pictures/17/08/07/21/43/466493.jpg', CAST(5.00 AS Decimal(18, 2)), N'https://www.youtube.com/embed/9bol4Yyx9Gs', CAST(N'2024-06-22T15:14:00.000' AS DateTime), 1)
GO
INSERT [dbo].[pelicula] ([peli_id], [peli_nombre], [peli_genero_id], [peli_clasificacion_id], [peli_anio], [peli_productor], [peli_sinopsis], [peli_poster_url], [peli_mini_url], [peli_rating], [peli_video_url], [peli_fecha_creacion], [peli_estatus]) VALUES (7, N'Intensamente 2', 4, 1, 2024, N'Disney', N'Pelicula chida', N'https://prod-ripcut-delivery.disney-plus.net/v1/variantdisney/6252FCE1E1E5E967604E576CE1687E52B051E9C8573BC14A86D81F4212E405F7/scalewidth=1200&amp;aspectRatio=1.78&amp;format=webp', N'https://mx.web.img3.acsta.net/pictures/17/08/07/21/43/466493.jpg', CAST(5.00 AS Decimal(18, 2)), N'https://www.youtube.com/embed/9bol4Yyx9Gs', CAST(N'2024-06-22T15:14:00.000' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[pelicula] OFF
GO
SET IDENTITY_INSERT [dbo].[contador] ON 
GO
INSERT [dbo].[contador] ([cont_id], [cont_like], [cont_peli_id]) VALUES (1, 1, 1)
GO
INSERT [dbo].[contador] ([cont_id], [cont_like], [cont_peli_id]) VALUES (2, 1, 1)
GO
INSERT [dbo].[contador] ([cont_id], [cont_like], [cont_peli_id]) VALUES (3, 1, 1)
GO
INSERT [dbo].[contador] ([cont_id], [cont_like], [cont_peli_id]) VALUES (4, 0, 1)
GO
INSERT [dbo].[contador] ([cont_id], [cont_like], [cont_peli_id]) VALUES (5, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[contador] OFF
GO
