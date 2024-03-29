CREATE DATABASE gestion_de_syndic
USE [gestion_de_syndic]
GO
/****** Object:  UserDefinedFunction [dbo].[cotis_par_appv1]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[cotis_par_appv1]
( @IdFacture AS INT)

RETURNS REAL
AS
BEGIN
DECLARE
 @cot AS REAL 
 SELECT
	 @cot =Cotisation
 FROM
	view_cotisation_chaque_app
  where
   IdFacture = @IdFacture
   return @cot

END
GO
/****** Object:  Table [dbo].[TAPPARTEMENTS]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAPPARTEMENTS](
	[IdAppartement] [int] NOT NULL,
	[N_Appartement] [int] NOT NULL,
	[IdImmeuble] [int] NOT NULL,
	[N_Etage] [int] NOT NULL,
	[Surface] [float] NOT NULL,
 CONSTRAINT [PK_T APPARTEMENTS] PRIMARY KEY CLUSTERED 
(
	[IdAppartement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TCONSOMMATIONS]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCONSOMMATIONS](
	[IdConsommation] [int] NOT NULL,
	[IdImmeuble] [int] NOT NULL,
	[Electricite] [float] NOT NULL,
	[Eau] [float] NOT NULL,
	[Menage] [float] NOT NULL,
	[Autres] [float] NOT NULL,
	[Annee] [int] NOT NULL,
 CONSTRAINT [PK_TCONSOMMATIONS] PRIMARY KEY CLUSTERED 
(
	[IdConsommation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TFACTURES_APP]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TFACTURES_APP](
	[IdFacture] [int] NOT NULL,
	[IdAppartement] [int] NOT NULL,
	[IdSyndic] [int] NOT NULL,
	[Cotisation] [float] NOT NULL,
	[IdConsommation] [int] NOT NULL,
 CONSTRAINT [PK_TFACTURES_APP] PRIMARY KEY CLUSTERED 
(
	[IdFacture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TIMMEUBLES]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIMMEUBLES](
	[IdImmeuble] [int] NOT NULL,
	[IdLocalisation] [int] NOT NULL,
	[NombreEtages] [int] NOT NULL,
	[NombreAppartements] [int] NOT NULL,
 CONSTRAINT [PK_TIMMEUBLES] PRIMARY KEY CLUSTERED 
(
	[IdImmeuble] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TLOCALISATIONS]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TLOCALISATIONS](
	[IdLocalisation] [int] NOT NULL,
	[NomQuartier] [nvarchar](50) NOT NULL,
	[Adresse] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LOCALISATIONS] PRIMARY KEY CLUSTERED 
(
	[IdLocalisation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TPERSONNE_APP]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TPERSONNE_APP](
	[IdPersonne] [int] NOT NULL,
	[IdAppartement] [int] NOT NULL,
 CONSTRAINT [PK_TPERSONNE_APP] PRIMARY KEY CLUSTERED 
(
	[IdPersonne] ASC,
	[IdAppartement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TPERSONNES]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TPERSONNES](
	[IdPersonne] [int] NOT NULL,
	[Cin] [nvarchar](20) NOT NULL,
	[NomPersonne] [nvarchar](50) NOT NULL,
	[PrénomPersonne] [nvarchar](50) NOT NULL,
	[N_Téléphone] [int] NOT NULL,
 CONSTRAINT [PK_TPAERSONNE] PRIMARY KEY CLUSTERED 
(
	[IdPersonne] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TSYNDICS]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TSYNDICS](
	[IdSyndic] [int] NOT NULL,
	[IdPersonne] [int] NOT NULL,
	[AnnéeSyndic] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TSYNDIC] PRIMARY KEY CLUSTERED 
(
	[IdSyndic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[view_cotisation_chaque_app]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_cotisation_chaque_app]
	AS
		SELECT
		IdFacture ,(Electricite+Eau+Menage+Autres)/NombreAppartements AS Cotisation 
	FROM 
		TFACTURES_APP F , TCONSOMMATIONS C , TIMMEUBLES I
	WHERE
		F.IdConsommation = C.IdConsommation 
		AND
		C.IdImmeuble = I.IdImmeuble
GO
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (1, 1, 1, 1, 60)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (2, 2, 1, 1, 60)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (3, 3, 1, 1, 60)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (4, 4, 1, 2, 60)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (5, 5, 1, 2, 70)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (6, 6, 1, 2, 50)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (7, 7, 1, 3, 60)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (8, 8, 1, 3, 65)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (9, 9, 1, 3, 55)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (10, 10, 1, 4, 60)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (11, 11, 1, 4, 60)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (12, 12, 1, 4, 60)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (13, 13, 1, 5, 60)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (14, 14, 1, 5, 70)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (15, 15, 1, 5, 50)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (16, 1, 2, 1, 50)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (17, 2, 2, 1, 50)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (18, 3, 2, 1, 50)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (19, 4, 2, 2, 70)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (20, 5, 2, 2, 40)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (21, 6, 2, 2, 40)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (22, 7, 2, 3, 60)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (23, 8, 2, 3, 40)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (24, 9, 2, 3, 50)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (25, 10, 2, 4, 50)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (26, 11, 2, 4, 50)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (27, 12, 2, 4, 50)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (28, 13, 2, 5, 70)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (29, 14, 2, 5, 40)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (30, 15, 2, 5, 40)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (31, 16, 2, 6, 60)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (32, 17, 2, 6, 40)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (33, 18, 2, 6, 50)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (34, 1, 3, 1, 70)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (35, 2, 3, 1, 70)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (36, 3, 3, 2, 70)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (37, 4, 3, 2, 70)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (38, 5, 3, 3, 70)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (39, 6, 3, 3, 70)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (40, 7, 3, 4, 70)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (41, 8, 3, 4, 70)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (42, 9, 3, 5, 70)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (43, 10, 3, 5, 70)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (44, 11, 3, 6, 70)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (45, 12, 3, 6, 70)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (46, 13, 3, 7, 70)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (47, 14, 3, 7, 70)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (48, 1, 4, 1, 80)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (49, 2, 4, 1, 80)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (50, 3, 4, 2, 80)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (51, 4, 4, 2, 80)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (52, 5, 4, 3, 80)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (53, 6, 4, 3, 80)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (54, 7, 4, 4, 80)
INSERT [dbo].[TAPPARTEMENTS] ([IdAppartement], [N_Appartement], [IdImmeuble], [N_Etage], [Surface]) VALUES (55, 8, 4, 4, 80)
INSERT [dbo].[TCONSOMMATIONS] ([IdConsommation], [IdImmeuble], [Electricite], [Eau], [Menage], [Autres], [Annee]) VALUES (1, 1, 2096.73, 1317.55, 10607.49, 955.23, 2019)
INSERT [dbo].[TCONSOMMATIONS] ([IdConsommation], [IdImmeuble], [Electricite], [Eau], [Menage], [Autres], [Annee]) VALUES (2, 2, 1868.45, 1330.19, 26188.78, 899.9, 2019)
INSERT [dbo].[TCONSOMMATIONS] ([IdConsommation], [IdImmeuble], [Electricite], [Eau], [Menage], [Autres], [Annee]) VALUES (3, 3, 2034.46, 1218.22, 30129.45, 518.79, 2019)
INSERT [dbo].[TCONSOMMATIONS] ([IdConsommation], [IdImmeuble], [Electricite], [Eau], [Menage], [Autres], [Annee]) VALUES (4, 4, 1883.06, 1509.6, 31113.76, 420.49, 2019)
INSERT [dbo].[TCONSOMMATIONS] ([IdConsommation], [IdImmeuble], [Electricite], [Eau], [Menage], [Autres], [Annee]) VALUES (5, 1, 1841.64, 1210.93, 3726.6, 740.91, 2020)
INSERT [dbo].[TCONSOMMATIONS] ([IdConsommation], [IdImmeuble], [Electricite], [Eau], [Menage], [Autres], [Annee]) VALUES (6, 2, 2477.62, 1354.86, 8339.81, 963.32, 2020)
INSERT [dbo].[TCONSOMMATIONS] ([IdConsommation], [IdImmeuble], [Electricite], [Eau], [Menage], [Autres], [Annee]) VALUES (7, 3, 2283.44, 1504.5, 33002.43, 458.88, 2020)
INSERT [dbo].[TCONSOMMATIONS] ([IdConsommation], [IdImmeuble], [Electricite], [Eau], [Menage], [Autres], [Annee]) VALUES (8, 4, 2365.37, 1515.67, 18360.22, 754.29, 2020)
INSERT [dbo].[TCONSOMMATIONS] ([IdConsommation], [IdImmeuble], [Electricite], [Eau], [Menage], [Autres], [Annee]) VALUES (9, 1, 2376.57, 1532.8, 29990.89, 424.73, 2021)
INSERT [dbo].[TCONSOMMATIONS] ([IdConsommation], [IdImmeuble], [Electricite], [Eau], [Menage], [Autres], [Annee]) VALUES (10, 2, 1947.92, 1333.26, 28866.37, 981.74, 2021)
INSERT [dbo].[TCONSOMMATIONS] ([IdConsommation], [IdImmeuble], [Electricite], [Eau], [Menage], [Autres], [Annee]) VALUES (11, 3, 2453.5, 1572.49, 16421.75, 997.11, 2021)
INSERT [dbo].[TCONSOMMATIONS] ([IdConsommation], [IdImmeuble], [Electricite], [Eau], [Menage], [Autres], [Annee]) VALUES (12, 4, 1919.53, 1312.58, 33042.35, 998.75, 2021)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (1, 1, 1, 0, 1)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (2, 2, 1, 0, 1)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (3, 4, 1, 0, 1)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (4, 5, 1, 0, 1)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (5, 6, 1, 0, 1)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (6, 7, 1, 0, 1)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (7, 9, 1, 0, 1)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (8, 10, 1, 0, 1)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (9, 11, 1, 0, 1)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (10, 12, 1, 0, 1)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (11, 14, 1, 0, 1)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (12, 15, 1, 0, 1)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (13, 16, 2, 0, 2)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (14, 17, 2, 0, 2)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (15, 18, 2, 0, 2)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (16, 19, 2, 0, 2)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (17, 20, 2, 0, 2)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (18, 23, 2, 0, 2)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (19, 24, 2, 0, 2)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (20, 27, 2, 0, 2)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (21, 28, 2, 0, 2)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (22, 29, 2, 0, 2)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (23, 31, 2, 0, 2)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (24, 32, 2, 0, 2)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (25, 34, 3, 0, 3)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (26, 35, 3, 0, 3)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (27, 36, 3, 0, 3)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (28, 38, 3, 0, 3)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (29, 39, 3, 0, 3)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (30, 41, 3, 0, 3)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (31, 42, 3, 0, 3)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (32, 44, 3, 0, 3)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (33, 45, 3, 0, 3)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (34, 46, 3, 0, 3)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (35, 48, 4, 0, 4)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (36, 50, 4, 0, 4)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (37, 51, 4, 0, 4)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (38, 53, 4, 0, 4)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (39, 54, 4, 0, 4)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (40, 55, 4, 0, 4)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (41, 1, 5, 0, 5)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (42, 2, 5, 0, 5)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (43, 4, 5, 0, 5)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (44, 6, 5, 0, 5)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (45, 8, 5, 0, 5)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (46, 9, 5, 0, 5)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (47, 10, 5, 0, 5)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (48, 12, 5, 0, 5)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (49, 15, 5, 0, 5)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (50, 16, 8, 0, 6)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (51, 18, 8, 0, 6)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (52, 19, 8, 0, 6)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (53, 21, 8, 0, 6)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (54, 23, 8, 0, 6)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (55, 26, 8, 0, 6)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (56, 27, 8, 0, 6)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (57, 28, 8, 0, 6)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (58, 30, 8, 0, 6)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (59, 34, 6, 0, 7)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (60, 35, 6, 0, 7)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (61, 38, 6, 0, 7)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (62, 39, 6, 0, 7)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (63, 40, 6, 0, 7)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (64, 42, 6, 0, 7)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (65, 44, 6, 0, 7)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (66, 45, 6, 0, 7)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (67, 47, 6, 0, 7)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (68, 50, 7, 0, 8)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (69, 51, 7, 0, 8)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (70, 53, 7, 0, 8)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (71, 54, 7, 0, 8)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (72, 55, 7, 0, 8)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (73, 2, 11, 0, 9)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (74, 5, 11, 0, 9)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (75, 10, 11, 0, 9)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (76, 11, 11, 0, 9)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (77, 12, 11, 0, 9)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (78, 15, 11, 0, 9)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (79, 21, 12, 0, 10)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (80, 23, 12, 0, 10)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (81, 25, 12, 0, 10)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (82, 27, 12, 0, 10)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (83, 30, 12, 0, 10)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (84, 31, 12, 0, 10)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (85, 34, 10, 0, 11)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (86, 36, 10, 0, 11)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (87, 39, 10, 0, 11)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (88, 41, 10, 0, 11)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (89, 45, 10, 0, 11)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (90, 47, 10, 0, 11)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (91, 49, 9, 0, 12)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (92, 50, 9, 0, 12)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (93, 51, 9, 0, 12)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (94, 53, 9, 0, 12)
INSERT [dbo].[TFACTURES_APP] ([IdFacture], [IdAppartement], [IdSyndic], [Cotisation], [IdConsommation]) VALUES (95, 55, 9, 0, 12)
INSERT [dbo].[TIMMEUBLES] ([IdImmeuble], [IdLocalisation], [NombreEtages], [NombreAppartements]) VALUES (1, 2, 5, 15)
INSERT [dbo].[TIMMEUBLES] ([IdImmeuble], [IdLocalisation], [NombreEtages], [NombreAppartements]) VALUES (2, 1, 6, 18)
INSERT [dbo].[TIMMEUBLES] ([IdImmeuble], [IdLocalisation], [NombreEtages], [NombreAppartements]) VALUES (3, 1, 7, 14)
INSERT [dbo].[TIMMEUBLES] ([IdImmeuble], [IdLocalisation], [NombreEtages], [NombreAppartements]) VALUES (4, 3, 4, 8)
INSERT [dbo].[TLOCALISATIONS] ([IdLocalisation], [NomQuartier], [Adresse]) VALUES (1, N'California', N'Bloc 22 N 21')
INSERT [dbo].[TLOCALISATIONS] ([IdLocalisation], [NomQuartier], [Adresse]) VALUES (2, N'Maarif', N'Bloc 33 N 29')
INSERT [dbo].[TLOCALISATIONS] ([IdLocalisation], [NomQuartier], [Adresse]) VALUES (3, N'Ghandi', N'Bloc 44 N 3')
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (1, 1)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (1, 50)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (2, 17)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (3, 36)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (4, 2)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (4, 46)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (5, 18)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (5, 47)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (6, 47)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (7, 29)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (8, 7)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (9, 40)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (10, 40)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (11, 23)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (12, 10)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (13, 30)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (14, 5)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (15, 5)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (16, 24)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (17, 34)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (18, 41)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (19, 43)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (20, 20)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (20, 48)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (21, 35)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (22, 54)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (23, 55)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (24, 38)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (25, 15)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (25, 37)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (26, 33)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (26, 49)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (27, 3)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (28, 3)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (29, 6)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (29, 22)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (30, 11)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (31, 42)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (32, 26)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (33, 16)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (34, 25)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (35, 55)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (36, 8)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (37, 27)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (38, 44)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (39, 51)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (40, 53)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (41, 4)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (42, 32)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (43, 14)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (44, 21)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (45, 28)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (46, 21)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (47, 45)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (48, 31)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (49, 52)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (50, 12)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (51, 13)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (52, 39)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (53, 19)
INSERT [dbo].[TPERSONNE_APP] ([IdPersonne], [IdAppartement]) VALUES (54, 9)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (1, N'AB1122', N'LAHRECH', N'ABDELAZIZ', 6112233)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (2, N'AC1122', N'AZLAG', N'SAID', 6223344)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (3, N'AD1122', N'FAKHAM', N'ZOUHAIR', 6334455)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (4, N'AE1122', N'MIKHARBACH', N'KAMAL', 6445577)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (5, N'AF1122', N'ZAROUALI', N'YOUSSEF', 6556677)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (6, N'AG1122', N'MOTTAKI', N'ADIL', 6667788)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (7, N'AH1122', N'ATIF', N'SAADIA', 6778899)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (8, N'AI1122', N'CHAABI', N'LATIFA', 6889910)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (9, N'AJ1122', N'RAKHIMI', N'RACHIDA', 6991011)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (10, N'AK1122', N'FAKHIR', N'MOAD', 6101112)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (11, N'AL1122', N'RAHINE', N'KHOULOUD', 6111213)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (12, N'AM1122', N'AJIR', N'KAWTAR', 6121314)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (13, N'AN1122', N'BAHA', N'FATIMA', 6131415)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (14, N'AO1122', N'BEZZI', N'AYA', 6141516)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (15, N'AP1122', N'JAMAI', N'FATIMA', 6151617)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (16, N'AQ1122', N'AYNIN', N'SAMIRA', 6161718)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (17, N'AR1122', N'FAKHAM', N'ELMEHDI', 6171819)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (18, N'AS1122', N'ANIBA', N'SOUHAIL', 6181920)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (19, N'AT1122', N'ATTAR', N'MONCEF', 6192021)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (20, N'AU1122', N'AZLAG', N'NOUHAILA', 6202122)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (21, N'AV1122', N'LAHRECH', N'ILHAM', 6212223)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (22, N'AW1122', N'FAKHAM', N'CHAIMAA', 6222324)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (23, N'AX1122', N'DAHMANE', N'IBRAHIM', 6232425)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (24, N'AY1122', N'SABIR', N'BADR', 6242526)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (25, N'AZ1122', N'BOU', N'NAJIA', 6252627)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (26, N'BA1222', N'DAHBI', N'ILYASS', 7262728)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (27, N'BB1222', N'KAMILE', N'SOUKAINA', 7272829)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (28, N'BC1222', N'MAJDOUBI', N'MOAD', 7282930)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (29, N'BD1222', N'FAKIR', N'HIBA', 7293031)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (30, N'BE1222', N'BENDIB', N'FATIMA', 7303132)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (31, N'BF1222', N'ASBIKA', N'HICHAM', 7313233)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (32, N'BG1222', N'CHARAF', N'AHMED', 7323334)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (33, N'BH1222', N'HARKACHI', N'NOUHAILA', 7333435)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (34, N'BI1222', N'SAMOUD', N'HASSNA', 7343536)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (35, N'BG1222', N'BARAKA', N'YASSIR', 7353637)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (36, N'BK1222', N'ELKANTOUR', N'YOUNES', 7363738)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (37, N'BL1222', N'ZINDAR', N'AMINA', 7373839)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (38, N'BM1222', N'SADIK', N'KHADIJA', 7383940)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (39, N'BN1222', N'ELNOUIDRAT', N'SMAHANE', 7394041)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (40, N'BO1222', N'MOUFID', N'MOHAMMED', 7404142)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (41, N'BP1222', N'JAHABLI', N'MOUNA', 7414243)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (42, N'BQ1222', N'GASSOUS', N'TARIK', 7424344)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (43, N'BR1222', N'ACHBAR', N'AHLAM', 7434445)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (44, N'BS1222', N'HAMIDI', N'MONTASSIR', 7444546)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (45, N'BT1222', N'FARKILE', N'OMAR', 7454647)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (46, N'BU1222', N'ELOUARDYGHY', N'ZAZIA', 7464748)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (47, N'BV1222', N'SATIRI', N'AYMAN', 7474849)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (48, N'BW1222', N'BENCHAKROUN', N'ZAKARIA', 7486950)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (49, N'BX1222', N'HADBI', N'ADIL', 7495052)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (50, N'BY1222', N'ATKOU', N'IDRIS', 7505152)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (51, N'BZ1222', N'DIOUANE', N'TAOFIK', 7515253)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (52, N'CA1322', N'RAFIK', N'AYA', 7525354)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (53, N'CB1322', N'BAHAOUI', N'ZAYNA', 7535455)
INSERT [dbo].[TPERSONNES] ([IdPersonne], [Cin], [NomPersonne], [PrénomPersonne], [N_Téléphone]) VALUES (54, N'CD1322', N'MAANE', N'NABIL', 7545556)
INSERT [dbo].[TSYNDICS] ([IdSyndic], [IdPersonne], [AnnéeSyndic]) VALUES (1, 1, N'2019')
INSERT [dbo].[TSYNDICS] ([IdSyndic], [IdPersonne], [AnnéeSyndic]) VALUES (2, 2, N'2019')
INSERT [dbo].[TSYNDICS] ([IdSyndic], [IdPersonne], [AnnéeSyndic]) VALUES (3, 4, N'2019')
INSERT [dbo].[TSYNDICS] ([IdSyndic], [IdPersonne], [AnnéeSyndic]) VALUES (4, 1, N'2019')
INSERT [dbo].[TSYNDICS] ([IdSyndic], [IdPersonne], [AnnéeSyndic]) VALUES (5, 8, N'2020')
INSERT [dbo].[TSYNDICS] ([IdSyndic], [IdPersonne], [AnnéeSyndic]) VALUES (6, 5, N'2020')
INSERT [dbo].[TSYNDICS] ([IdSyndic], [IdPersonne], [AnnéeSyndic]) VALUES (7, 22, N'2020')
INSERT [dbo].[TSYNDICS] ([IdSyndic], [IdPersonne], [AnnéeSyndic]) VALUES (8, 2, N'2020')
INSERT [dbo].[TSYNDICS] ([IdSyndic], [IdPersonne], [AnnéeSyndic]) VALUES (9, 20, N'2021')
INSERT [dbo].[TSYNDICS] ([IdSyndic], [IdPersonne], [AnnéeSyndic]) VALUES (10, 21, N'2021')
INSERT [dbo].[TSYNDICS] ([IdSyndic], [IdPersonne], [AnnéeSyndic]) VALUES (11, 8, N'2021')
INSERT [dbo].[TSYNDICS] ([IdSyndic], [IdPersonne], [AnnéeSyndic]) VALUES (12, 20, N'2021')
ALTER TABLE [dbo].[TAPPARTEMENTS]  WITH CHECK ADD  CONSTRAINT [FK_T APPARTEMENTS_TIMMEUBLES] FOREIGN KEY([IdImmeuble])
REFERENCES [dbo].[TIMMEUBLES] ([IdImmeuble])
GO
ALTER TABLE [dbo].[TAPPARTEMENTS] CHECK CONSTRAINT [FK_T APPARTEMENTS_TIMMEUBLES]
GO
ALTER TABLE [dbo].[TCONSOMMATIONS]  WITH CHECK ADD  CONSTRAINT [FK_TCONSOMMATIONS_TIMMEUBLES] FOREIGN KEY([IdImmeuble])
REFERENCES [dbo].[TIMMEUBLES] ([IdImmeuble])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TCONSOMMATIONS] CHECK CONSTRAINT [FK_TCONSOMMATIONS_TIMMEUBLES]
GO
ALTER TABLE [dbo].[TFACTURES_APP]  WITH CHECK ADD  CONSTRAINT [FK_TFACTURES_APP_TAPPARTEMENTS] FOREIGN KEY([IdAppartement])
REFERENCES [dbo].[TAPPARTEMENTS] ([IdAppartement])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TFACTURES_APP] CHECK CONSTRAINT [FK_TFACTURES_APP_TAPPARTEMENTS]
GO
ALTER TABLE [dbo].[TFACTURES_APP]  WITH CHECK ADD  CONSTRAINT [FK_TFACTURES_APP_TCONSOMMATIONS] FOREIGN KEY([IdConsommation])
REFERENCES [dbo].[TCONSOMMATIONS] ([IdConsommation])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TFACTURES_APP] CHECK CONSTRAINT [FK_TFACTURES_APP_TCONSOMMATIONS]
GO
ALTER TABLE [dbo].[TFACTURES_APP]  WITH CHECK ADD  CONSTRAINT [FK_TFACTURES_APP_TSYNDICS] FOREIGN KEY([IdSyndic])
REFERENCES [dbo].[TSYNDICS] ([IdSyndic])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TFACTURES_APP] CHECK CONSTRAINT [FK_TFACTURES_APP_TSYNDICS]
GO
ALTER TABLE [dbo].[TIMMEUBLES]  WITH CHECK ADD  CONSTRAINT [FK_TIMMEUBLES_TLOCALISATIONS] FOREIGN KEY([IdLocalisation])
REFERENCES [dbo].[TLOCALISATIONS] ([IdLocalisation])
GO
ALTER TABLE [dbo].[TIMMEUBLES] CHECK CONSTRAINT [FK_TIMMEUBLES_TLOCALISATIONS]
GO
ALTER TABLE [dbo].[TPERSONNE_APP]  WITH CHECK ADD  CONSTRAINT [FK_TPERSONNE_APP_TAPPARTEMENTS1] FOREIGN KEY([IdAppartement])
REFERENCES [dbo].[TAPPARTEMENTS] ([IdAppartement])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TPERSONNE_APP] CHECK CONSTRAINT [FK_TPERSONNE_APP_TAPPARTEMENTS1]
GO
ALTER TABLE [dbo].[TPERSONNE_APP]  WITH CHECK ADD  CONSTRAINT [FK_TPERSONNE_APP_TPERSONNES1] FOREIGN KEY([IdPersonne])
REFERENCES [dbo].[TPERSONNES] ([IdPersonne])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TPERSONNE_APP] CHECK CONSTRAINT [FK_TPERSONNE_APP_TPERSONNES1]
GO
ALTER TABLE [dbo].[TSYNDICS]  WITH CHECK ADD  CONSTRAINT [FK_TSYNDIC_TPERSONNE] FOREIGN KEY([IdPersonne])
REFERENCES [dbo].[TPERSONNES] ([IdPersonne])
GO
ALTER TABLE [dbo].[TSYNDICS] CHECK CONSTRAINT [FK_TSYNDIC_TPERSONNE]
GO
/****** Object:  StoredProcedure [dbo].[app_pas_facturev1]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[app_pas_facturev1]
AS
BEGIN
 SELECT
	IdAppartement ,IdImmeuble
 FROM
	TAPPARTEMENTS
 WHERE
	IdAppartement NOT IN
		(
			SELECT 
				IdAppartement
			FROM 
				TFACTURES_APP
		)
END


GO
/****** Object:  StoredProcedure [dbo].[app_pas_facturev2]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[app_pas_facturev2]
AS
BEGIN

 SELECT
	IdAppartement, IdImmeuble
 FROM
	TAPPARTEMENTS
 WHERE NOT EXISTS
	(
	SELECT 
		IdAppartement 
	FROM
		TFACTURES_APP
	WHERE 
		TAPPARTEMENTS.IdAppartement = TFACTURES_APP.IdAppartement
	)

END

GO
/****** Object:  StoredProcedure [dbo].[app_pas_facturev3]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[app_pas_facturev3]
AS
BEGIN
	SELECT 
		IdAppartement 
	from 
		TAPPARTEMENTS
	EXCEPT
	SELECT
		IdAppartement 
	FROM
		TFACTURES_APP

END

GO
/****** Object:  StoredProcedure [dbo].[appartement_a_plus_per]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[appartement_a_plus_per]

AS
BEGIN
	SELECT
		IdAppartement, COUNT(IdPersonne) AS NBR_per
	FROM TPERSONNE_APP 
	GROUP BY IdAppartement
	HAVING
		 COUNT(IdPersonne) > 1 
END

GO
/****** Object:  StoredProcedure [dbo].[clc_cotisation_avc_fct]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[clc_cotisation_avc_fct]
AS
BEGIN
 
UPDATE
	TFACTURES_APP
SET
	 cotisation = dbo.cotis_par_appv1(IdFacture)

END

GO
/****** Object:  StoredProcedure [dbo].[clc_cotisation_avc_view]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[clc_cotisation_avc_view]
	AS
BEGIN
	UPDATE 
		TFACTURES_APP 
	SET
		Cotisation = v.Cotisation
		FROM 
			view_cotisation_chaque_app AS v
		WHERE TFACTURES_APP.IdFacture = v.Idfacture
END

GO
/****** Object:  StoredProcedure [dbo].[clc_cotisation_curseur]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[clc_cotisation_curseur]
	AS
BEGIN
DECLARE
	@idfacture AS INT,
	@Cotisation AS FLOAT

	declare CursCOT CURSOR LOCAL FAST_FORWARD
	FOR 
		SELECT
		IdFacture , Cotisation 
	FROM 
		(SELECT
		IdFacture , IdAppartement , (Electricite+Eau+Menage+Autres)/NombreAppartements AS Cotisation , Annee
	FROM 
		TFACTURES_APP F , TCONSOMMATIONS C , TIMMEUBLES I
	WHERE
		F.IdConsommation = C.IdConsommation 
		AND
		C.IdImmeuble = I.IdImmeuble) AS T

	OPEN CursCOT
FETCH NEXT FROM CursCOT INTO @idfacture,@Cotisation
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		UPDATE 
				TFACTURES_APP
		SET 
				Cotisation= @Cotisation
		WHERE 
				IdFacture = @idfacture

		FETCH NEXT FROM CursCOT INTO @idfacture,@Cotisation 
END
 CLOSE CursCOT
 DEALLOCATE CurCOT
	 
END

GO
/****** Object:  StoredProcedure [dbo].[cons_max_immeuble]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cons_max_immeuble] 
  @Année AS INT
AS
BEGIN
	SELECT
		max(consom) as con_max
	FROM 
	(
		SELECT 
			(Electricite+Eau+Menage+Autres) AS consom , IdImmeuble
		FROM
			TCONSOMMATIONS
		WHERE
			Annee=@Année
	) AS T


END

GO
/****** Object:  StoredProcedure [dbo].[cons_min_immeuble]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[cons_min_immeuble]
  @Année AS INT
AS
BEGIN
	SELECT
		MIN(consom) as con_min
	FROM 
	(
		SELECT 
			(Electricite+Eau+Menage+Autres) AS consom , IdImmeuble
		FROM
			TCONSOMMATIONS
		WHERE
			Annee=@Année
	) AS T


END

GO
/****** Object:  StoredProcedure [dbo].[conso_max_top]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[conso_max_top] 
@Année AS INT 
AS
BEGIN
	SELECT
		TOP(1) with ties IdImmeuble ,(Electricite+Eau+Menage+Autres) AS consom_max 
	FROM 
		TCONSOMMATIONS  
	WHERE 
		Annee= @Année
	ORDER BY
		consom_max  desc



END

GO
/****** Object:  StoredProcedure [dbo].[conso_min_top]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[conso_min_top] 
@Année AS INT 
AS
BEGIN
	SELECT
		TOP(1) with ties IdImmeuble ,(Electricite+Eau+Menage+Autres) AS consom_min
	FROM 
		TCONSOMMATIONS  
	WHERE 
		Annee=@Année
	ORDER BY
		consom_min 


END

GO
/****** Object:  StoredProcedure [dbo].[consommation_moy_par_imm_annee]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[consommation_moy_par_imm_annee]

AS
BEGIN
	SELECT
		IdConsommation , I.IdImmeuble, (Electricite+Eau+Menage+Autres)/NombreAppartements AS Consomation , Annee
	FROM 
		TCONSOMMATIONS C , TIMMEUBLES I
	WHERE
		C.IdImmeuble = I.IdImmeuble
END

GO
/****** Object:  StoredProcedure [dbo].[cotisation_annee_app]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cotisation_annee_app]
	@annee AS INT,
	@idappartement AS INT
AS
BEGIN
		SELECT
		IdFacture , IdAppartement , (Electricite+Eau+Menage+Autres)/NombreAppartements AS Cotisation , Annee
	FROM 
		TFACTURES_APP F , TCONSOMMATIONS C , TIMMEUBLES I
	WHERE
		IdAppartement=@idappartement
		AND
		annee=@annee
		AND
		F.IdConsommation = C.IdConsommation 
		AND
		C.IdImmeuble = I.IdImmeuble

END

GO
/****** Object:  StoredProcedure [dbo].[cotisation_chaque_app]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cotisation_chaque_app]

AS
BEGIN
	SELECT
		IdFacture , IdAppartement , (Electricite+Eau+Menage+Autres)/NombreAppartements AS Cotisation , Annee
	FROM 
		TFACTURES_APP F , TCONSOMMATIONS C , TIMMEUBLES I
	WHERE
		F.IdConsommation = C.IdConsommation 
		AND
		C.IdImmeuble = I.IdImmeuble
END

GO
/****** Object:  StoredProcedure [dbo].[cotisation_chaque_app_sous_req]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cotisation_chaque_app_sous_req] 

AS
BEGIN
	SELECT IdFacture , IdAppartement ,
	(
	SELECT
		 (Electricite+Eau+Menage+Autres)/NombreAppartements AS Cotisation 
	FROM 
		TCONSOMMATIONS C , TIMMEUBLES I
	WHERE
		TFACTURES_APP.IdConsommation = C.IdConsommation 
		AND
		C.IdImmeuble = I.IdImmeuble
		) AS Cotisation , Annee
	FROM 
	TFACTURES_APP , TCONSOMMATIONS
END

GO
/****** Object:  StoredProcedure [dbo].[liste_immmeuble_local]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[liste_immmeuble_local] 
	@IdLocalisation AS INT
AS
BEGIN
	SELECT
		IdImmeuble ,TLOCALISATIONS.IdLocalisation , NomQuartier
	FROM 
		TIMMEUBLES,TLOCALISATIONS 
	WHERE
		TIMMEUBLES.IdLocalisation=TLOCALISATIONS.IdLocalisation AND 
		TLOCALISATIONS.IdLocalisation= @IdLocalisation
END
GO
/****** Object:  StoredProcedure [dbo].[personne_admet_plus_app]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[personne_admet_plus_app]  
AS
BEGIN
	SELECT
		IdPersonne,nbapp 
	FROM 
	(
		SELECT 
			IdPersonne,count(IdAppartement) as nbapp
		FROM
			 TPERSONNE_APP
		GROUP BY IdPersonne
	) AS T
	WHERE
		nbapp > 1

END

GO
/****** Object:  StoredProcedure [dbo].[personne_jamais_syndic_v1]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[personne_jamais_syndic_v1]

AS
BEGIN
	SELECT
		IdPersonne,NomPersonne,PrénomPersonne
	FROM 
		TPERSONNES
		WHERE IdPersonne NOT IN 
							(
								SELECT 
									IdPersonne
								FROM 
									TSYNDICS
								)
END

GO
/****** Object:  StoredProcedure [dbo].[personne_jamais_syndic_v2]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[personne_jamais_syndic_v2]

AS
BEGIN
	SELECT
		IdPersonne,NomPersonne,PrénomPersonne
	FROM 
		TPERSONNES P
		WHERE NOT EXISTS
							(
								SELECT 
									IdPersonne
								FROM 
									TSYNDICS S
									WHERE
									P.IdPersonne=S.IdPersonne
								)
END

GO
/****** Object:  StoredProcedure [dbo].[personne_jamais_syndic_v3]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[personne_jamais_syndic_v3]

AS
BEGIN
	SELECT
		P.IdPersonne,NomPersonne,PrénomPersonne
	FROM 
		TPERSONNES P LEFT JOIN TSYNDICS S
		ON
			P.IdPersonne=S.IdPersonne
	WHERE IdSyndic IS NULL
END

GO
/****** Object:  StoredProcedure [dbo].[personne_jamais_syndic_v4]    Script Date: 31/01/2022 01:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[personne_jamais_syndic_v4]

AS
BEGIN
	SELECT
		P.IdPersonne,NomPersonne,PrénomPersonne
	FROM 
		TSYNDICS S RIGHT JOIN TPERSONNES P
		ON
			P.IdPersonne=S.IdPersonne
	WHERE IdSyndic IS NULL
END

GO
