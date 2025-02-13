CREATE DATABASE Quiz;
GO
USE [Quiz]
GO
/****** Object:  Table [dbo].[question]    Script Date: 10/02/2025 16:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[question_id] [int] NOT NULL,
	[question_desc] [varchar](500) NOT NULL,
	[question_order] [int] NOT NULL,
	[question_picture] [varchar](50) NOT NULL,
	[question_points] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[answer]    Script Date: 10/02/2025 16:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[answer](
	[answer_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
	[answer_desc] [varchar](250) NOT NULL,
	[answer_order] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[answer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vQuestionAnswer]    Script Date: 10/02/2025 16:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vQuestionAnswer]
as
select question.question_id, question.question_desc, question.question_picture, answer.answer_id, answer.answer_desc
from question
inner join answer on answer.question_id = question.question_id
GO
/****** Object:  Table [dbo].[candidate]    Script Date: 10/02/2025 16:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[candidate](
	[candidate_id] [int] NOT NULL,
	[candidate_name] [varchar](100) NOT NULL,
	[candidate_group] [varchar](50) NOT NULL,
	[candidate_age] [int] NOT NULL,
	[candidate_profession] [varchar](100) NULL,
	[candidate_position] [varchar](100) NULL,
	[candidate_gov_plan] [varchar](200) NULL,
	[candidate_proposal] [varchar](200) NULL,
	[candidate_picture] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[candidate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[candidate_answer]    Script Date: 10/02/2025 16:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[candidate_answer](
	[candidate_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
	[answer_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[candidate_id] ASC,
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quiz]    Script Date: 10/02/2025 16:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quiz](
	[quiz_id] [int] IDENTITY(1,1) NOT NULL,
	[quiz_code] [varchar](10) NOT NULL,
	[quiz_date] [datetime2](0) NOT NULL,
	[quiz_client_ip] [varchar](50) NULL,
	[quiz_status] [smallint] NOT NULL,
	[candidate1_id] [int] NULL,
	[candidate2_id] [int] NULL,
	[candidate3_id] [int] NULL,
	[candidate4_id] [int] NULL,
	[candidate5_id] [int] NULL,
	[candidate1_percent] [smallint] NULL,
	[candidate2_percent] [smallint] NULL,
	[candidate3_percent] [smallint] NULL,
	[candidate4_percent] [smallint] NULL,
	[candidate5_percent] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[quiz_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quiz_answer]    Script Date: 10/02/2025 16:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quiz_answer](
	[quiz_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
	[answer_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[quiz_id] ASC,
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (1, 1, N'a. Secundaria completa', 1)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (2, 1, N'b. Estudios universitarios truncos', 2)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (3, 1, N'c. Estudios universitarios completos', 3)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (4, 1, N'd. Estudios de Postgrado', 4)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (5, 1, N'e. Carrera Técnica', 5)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (6, 2, N'a. Administración de empresas', 1)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (7, 2, N'b. Militar', 2)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (8, 2, N'c. Abogado', 3)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (9, 2, N'd. Ingeniería/Arquitectura', 4)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (10, 2, N'e. Economista', 5)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (11, 3, N'a. 30-40', 1)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (12, 3, N'b. 41-50', 2)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (13, 3, N'c. 51-60', 3)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (14, 3, N'd. 61-70', 4)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (15, 3, N'e. 71+', 5)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (16, 4, N'a. Menor a 1 año', 1)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (17, 4, N'b. De 1 a 2 años', 2)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (18, 4, N'c. De 3 a 4 años', 3)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (19, 4, N'd. De 5 a 6 años', 4)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (20, 4, N'e. De 6 años a más', 5)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (21, 5, N'a. SI', 1)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (22, 5, N'b. NO', 2)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (23, 6, N'a. Mejoramiento del transporte', 1)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (24, 6, N'b. Seguridad Ciudadana', 2)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (25, 6, N'c. Lucha contra la corrupción', 3)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (26, 6, N'd. Educación / Poblaciones vulnerables', 4)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_desc], [answer_order]) VALUES (27, 6, N'e. Infraestructura', 5)
GO
INSERT [dbo].[candidate] ([candidate_id], [candidate_name], [candidate_group], [candidate_age], [candidate_profession], [candidate_position], [candidate_gov_plan], [candidate_proposal], [candidate_picture]) VALUES (1, N'Alberto Beingolea', N'PPC', 53, N'Abogado', N'Ex congresista', N'https://www.scribd.com/document/385151526/PARTIDO-POPULAR-CRISTIANO#from_embed', NULL, N'ALBERTO-BEINGOLEA.JPG')
INSERT [dbo].[candidate] ([candidate_id], [candidate_name], [candidate_group], [candidate_age], [candidate_profession], [candidate_position], [candidate_gov_plan], [candidate_proposal], [candidate_picture]) VALUES (2, N'Ricardo Belmont', N'Perú Libertario', 72, N'Administrador', N'Ex congresista y Ex alcalde de Lima', N'https://www.scribd.com/document/385152079/Peru-Libertario#from_embed', NULL, N'RICARDO-BELTMONT.JPG')
INSERT [dbo].[candidate] ([candidate_id], [candidate_name], [candidate_group], [candidate_age], [candidate_profession], [candidate_position], [candidate_gov_plan], [candidate_proposal], [candidate_picture]) VALUES (3, N'Esther Capuñay', N'Unión por el Perú', 44, N'Estudios no concluidos en Economía', N'Ex congresista', N'https://www.scribd.com/document/385151631/Union-Por-El-Peru#from_embed', NULL, N'ESTHER-CAPUNAY.JPG')
INSERT [dbo].[candidate] ([candidate_id], [candidate_name], [candidate_group], [candidate_age], [candidate_profession], [candidate_position], [candidate_gov_plan], [candidate_proposal], [candidate_picture]) VALUES (4, N'Luis Castañeda Pardo', N'Solidaridad Nacional', 32, N'Administrador', N'Ex Regidor (revocado)', N'https://www.scribd.com/document/385153243/Solidaridad-Nacional#from_embed', NULL, N'LUIS-CASTANEDA.JPG')
INSERT [dbo].[candidate] ([candidate_id], [candidate_name], [candidate_group], [candidate_age], [candidate_profession], [candidate_position], [candidate_gov_plan], [candidate_proposal], [candidate_picture]) VALUES (5, N'Diethell Columbus Murata', N'Fuerza Popular', 37, N'Abogado', N'Ex asesor en Congreso de la República', N'https://cde.3.elcomercio.pe/doc/0/1/7/0/8/1708527.pdf', NULL, N'DIETHELL-COLUMBUS.JPG')
INSERT [dbo].[candidate] ([candidate_id], [candidate_name], [candidate_group], [candidate_age], [candidate_profession], [candidate_position], [candidate_gov_plan], [candidate_proposal], [candidate_picture]) VALUES (6, N'Enrique Cornejo', N'Democracia Directa', 62, N'Economista y administrador', N'Ex Ministro de Transportes y Comunicaciones', N'https://www.scribd.com/document/385150925/Democracia-Directa#from_embed', NULL, N'ENRIQUE-CORNEJO.JPG')
INSERT [dbo].[candidate] ([candidate_id], [candidate_name], [candidate_group], [candidate_age], [candidate_profession], [candidate_position], [candidate_gov_plan], [candidate_proposal], [candidate_picture]) VALUES (7, N'Carlos Enrique Fernández Chacón', N'Frente Amplio', 76, N'Estudios no concluidos en carrera técnica de automotores en el instituto de EEUU.', N'No registra información', N'https://cde.3.elcomercio.pe/doc/0/1/7/0/8/1708538.pdf', NULL, N'CARLOS-ENRIQUE-CHACON.JPG')
INSERT [dbo].[candidate] ([candidate_id], [candidate_name], [candidate_group], [candidate_age], [candidate_profession], [candidate_position], [candidate_gov_plan], [candidate_proposal], [candidate_picture]) VALUES (8, N'Julio Gagó Perez', N'Avanza País', 57, N'Abogado', N'Gerente de Maquinarias JAAM', N'https://cde.3.elcomercio.pe/doc/0/1/7/0/8/1708528.pdf', NULL, N'JULIO-GAGO.JPG')
INSERT [dbo].[candidate] ([candidate_id], [candidate_name], [candidate_group], [candidate_age], [candidate_profession], [candidate_position], [candidate_gov_plan], [candidate_proposal], [candidate_picture]) VALUES (9, N'Roberto Gómez Baca', N'Vamos Perú', 47, N'Abogado', N'Actual alcalde de Surco', N'https://www.scribd.com/document/385152992/Vamos-Peru#from_embed', NULL, N'ROBERTO-GOMEZ.JPG')
INSERT [dbo].[candidate] ([candidate_id], [candidate_name], [candidate_group], [candidate_age], [candidate_profession], [candidate_position], [candidate_gov_plan], [candidate_proposal], [candidate_picture]) VALUES (10, N'Gustavo Guerra García', N'Juntos por el Perú', 52, N'Economista', N'Consultor Economista', N'https://cde.3.elcomercio.pe/doc/0/1/7/0/8/1708530.pdf', NULL, N'GUSTAVO-GUERRA.JPG')
INSERT [dbo].[candidate] ([candidate_id], [candidate_name], [candidate_group], [candidate_age], [candidate_profession], [candidate_position], [candidate_gov_plan], [candidate_proposal], [candidate_picture]) VALUES (11, N'Humberto Lay', N'Restauración Nacional', 83, N'Arquitecto', N'Ex congresista', N'https://www.scribd.com/document/385152228/Restauracion-Nacional#from_embed', NULL, N'HUMBERTO-LAY.JPG')
INSERT [dbo].[candidate] ([candidate_id], [candidate_name], [candidate_group], [candidate_age], [candidate_profession], [candidate_position], [candidate_gov_plan], [candidate_proposal], [candidate_picture]) VALUES (12, N'Jorge Muñoz', N'Acción Popular', 56, N'Abogado', N'Actual alcalde de Miraflores', N'https://www.scribd.com/document/385151731/Accion-Popular#from_embed', N'https://www.youtube.com/watch?v=RpqeJ-djRlU&t=10s', N'JORGE-MUNOZ.JPG')
INSERT [dbo].[candidate] ([candidate_id], [candidate_name], [candidate_group], [candidate_age], [candidate_profession], [candidate_position], [candidate_gov_plan], [candidate_proposal], [candidate_picture]) VALUES (13, N'Luis Enrique Ocrospoma Pella', N'Perú Nación', 50, N'Abogado', N'Socio Estudio de abogados Ocrospoma, Pella', N'https://cde.3.elcomercio.pe/doc/0/1/7/0/8/1708534.pdf', NULL, N'LUIS-ENRIQUE-OCROSPOMA.JPG')
INSERT [dbo].[candidate] ([candidate_id], [candidate_name], [candidate_group], [candidate_age], [candidate_profession], [candidate_position], [candidate_gov_plan], [candidate_proposal], [candidate_picture]) VALUES (14, N'Renzo Reggiardo', N'Perú Patria Segura', 45, N'Estudios no concluidos en Ciencias de la Comunicación', N'Ex congresista', N'https://www.scribd.com/document/385152935/Peru-Patria-Segura#from_embed', NULL, N'RENZO-REGGIARDO.JPG')
INSERT [dbo].[candidate] ([candidate_id], [candidate_name], [candidate_group], [candidate_age], [candidate_profession], [candidate_position], [candidate_gov_plan], [candidate_proposal], [candidate_picture]) VALUES (15, N'Jaime Salinas', N'Alianza para el Progreso', 55, N'Economista', N'Regidor Metropolitano de la Municipalidad de Lima', N'https://cde.3.elcomercio.pe/doc/0/1/7/0/8/1708535.pdf', NULL, N'JAIME-SALINAS.JPG')
INSERT [dbo].[candidate] ([candidate_id], [candidate_name], [candidate_group], [candidate_age], [candidate_profession], [candidate_position], [candidate_gov_plan], [candidate_proposal], [candidate_picture]) VALUES (16, N'Pablo Jacinto Silva Rojas', N'Frente Popular Agrícola FIA', 59, N'Secundaria Completa', N'Vendedor independiente', N'https://cde.3.elcomercio.pe/doc/0/1/7/0/8/1708537.pdf', NULL, N'PABLO-JACINTO.JPG')
INSERT [dbo].[candidate] ([candidate_id], [candidate_name], [candidate_group], [candidate_age], [candidate_profession], [candidate_position], [candidate_gov_plan], [candidate_proposal], [candidate_picture]) VALUES (17, N'Daniel Urresti', N'Podemos Perú', 61, N'General de brigada del Ejército', N'Ex Ministro del Interior', N'https://www.scribd.com/document/385153369/Podemos-Peru#from_embed', NULL, N'DANIEL-URRESTRI.JPG')
INSERT [dbo].[candidate] ([candidate_id], [candidate_name], [candidate_group], [candidate_age], [candidate_profession], [candidate_position], [candidate_gov_plan], [candidate_proposal], [candidate_picture]) VALUES (18, N'Manuel Velarde', N'Siempre Unidos', 49, N'Abogado', N'Actual alcalde de San Isidro', N'https://www.scribd.com/document/385152474/Siempre-Unidos#from_embed', N'https://www.youtube.com/watch?v=OrLUKVdEYWU', N'MANUEL-VELARDE.JPG')
INSERT [dbo].[candidate] ([candidate_id], [candidate_name], [candidate_group], [candidate_age], [candidate_profession], [candidate_position], [candidate_gov_plan], [candidate_proposal], [candidate_picture]) VALUES (19, N'Jorge Villacorta', N'PPK', 63, N'Economista', N'Ex Ministro de Vivienda', N'https://www.scribd.com/document/385151670/Peruanos-Por-El-Kambio#from_embed', NULL, N'JORGE-VILLACORTA.JPG')
INSERT [dbo].[candidate] ([candidate_id], [candidate_name], [candidate_group], [candidate_age], [candidate_profession], [candidate_position], [candidate_gov_plan], [candidate_proposal], [candidate_picture]) VALUES (20, N'Juan Carlos Zurek', N'Somos Perú', 52, N'Administrador', N'Actual alcalde de La Molina', N'https://www.scribd.com/document/385152294/Somos-Peru#from_embed', NULL, N'JUAN-CARLOS.JPG')
GO
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (1, 1, 4)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (1, 2, 8)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (1, 3, 13)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (1, 4, 20)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (1, 5, 21)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (1, 6, 25)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (2, 1, 3)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (2, 2, 6)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (2, 3, 15)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (2, 4, 19)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (2, 5, 21)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (2, 6, 24)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (3, 1, 3)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (3, 2, 6)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (3, 3, 12)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (3, 4, 20)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (3, 5, 22)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (3, 6, 26)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (4, 1, 4)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (4, 2, 6)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (4, 3, 11)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (4, 4, 20)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (4, 5, 22)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (4, 6, 23)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (5, 1, 4)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (5, 2, 8)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (5, 3, 11)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (5, 4, 20)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (5, 5, 21)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (5, 6, 26)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (6, 1, 4)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (6, 2, 10)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (6, 3, 14)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (6, 4, 19)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (6, 5, 21)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (6, 6, 24)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (7, 1, 5)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (7, 2, 9)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (7, 3, 15)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (7, 4, 19)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (7, 5, 21)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (7, 6, 25)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (8, 1, 3)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (8, 2, 6)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (8, 3, 13)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (8, 4, 20)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (8, 5, 21)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (8, 6, 23)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (9, 1, 3)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (9, 2, 8)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (9, 3, 12)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (9, 4, 19)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (9, 5, 21)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (9, 6, 24)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (10, 1, 4)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (10, 2, 10)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (10, 3, 13)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (10, 4, 17)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (10, 5, 21)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (10, 6, 23)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (11, 1, 3)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (11, 2, 9)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (11, 3, 15)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (11, 4, 20)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (11, 5, 21)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (11, 6, 25)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (12, 1, 4)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (12, 2, 8)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (12, 3, 13)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (12, 4, 20)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (12, 5, 21)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (12, 6, 24)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (13, 1, 4)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (13, 2, 8)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (13, 3, 12)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (13, 4, 17)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (13, 5, 21)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (13, 6, 23)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (14, 1, 2)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (14, 2, 6)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (14, 3, 12)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (14, 4, 19)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (14, 5, 21)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (14, 6, 24)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (15, 1, 4)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (15, 2, 10)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (15, 3, 13)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (15, 4, 20)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (15, 5, 21)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (15, 6, 24)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (16, 1, 1)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (16, 2, 6)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (16, 3, 13)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (16, 4, 20)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (16, 5, 22)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (16, 6, 26)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (17, 1, 5)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (17, 2, 7)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (17, 3, 14)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (17, 4, 17)
GO
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (17, 5, 21)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (17, 6, 23)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (18, 1, 4)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (18, 2, 8)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (18, 3, 12)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (18, 4, 20)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (18, 5, 21)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (18, 6, 23)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (19, 1, 2)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (19, 2, 6)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (19, 3, 14)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (19, 4, 18)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (19, 5, 22)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (19, 6, 27)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (20, 1, 3)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (20, 2, 6)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (20, 3, 13)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (20, 4, 20)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (20, 5, 21)
INSERT [dbo].[candidate_answer] ([candidate_id], [question_id], [answer_id]) VALUES (20, 6, 23)
GO
INSERT [dbo].[question] ([question_id], [question_desc], [question_order], [question_picture], [question_points]) VALUES (1, N'1. ¿Cuál debería ser el nivel de estudios de mi candidato?', 1, N'Question_001.jpg', 20)
INSERT [dbo].[question] ([question_id], [question_desc], [question_order], [question_picture], [question_points]) VALUES (2, N'2. ¿Cuál debe ser la experiencia laboral de mi candidato ideal?', 2, N'Question_002.jpg', 20)
INSERT [dbo].[question] ([question_id], [question_desc], [question_order], [question_picture], [question_points]) VALUES (3, N'3. ¿Cuál debe ser el rango de edad ideal de mi candidato?', 3, N'Question_003.jpg', 10)
INSERT [dbo].[question] ([question_id], [question_desc], [question_order], [question_picture], [question_points]) VALUES (4, N'4. ¿Cuál debería ser la antigüedad del partido de mi candidato ideal?', 4, N'Question_004.jpg', 10)
INSERT [dbo].[question] ([question_id], [question_desc], [question_order], [question_picture], [question_points]) VALUES (5, N'5. ¿Mi candidato ideal debería tener experiencia en política?', 5, N'Question_005.jpg', 10)
INSERT [dbo].[question] ([question_id], [question_desc], [question_order], [question_picture], [question_points]) VALUES (6, N'6. ¿Cuál es el punto más importante del Plan de Gobierno de mi candidato?', 6, N'Question_006.jpg', 30)
GO
SET IDENTITY_INSERT [dbo].[quiz] ON 

INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (1, N'3u6wdTVJ', CAST(N'2018-09-17T00:00:00.0000000' AS DateTime2), NULL, 0, 19, 7, 14, 16, 1, 22, 19, 19, 18, 18)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (2, N'Fq8XvFmR', CAST(N'2018-09-17T00:00:00.0000000' AS DateTime2), NULL, 0, 6, 5, 15, 2, 8, 22, 18, 18, 10, 10)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (3, N'SAvdHTKS', CAST(N'2018-09-17T00:00:00.0000000' AS DateTime2), NULL, 0, 7, 10, 18, 11, 15, 88, 54, 41, 37, 37)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (4, N'7fwqiyh400', CAST(N'2018-09-21T02:25:50.0000000' AS DateTime2), N'14.233.42.184', 0, 7, 14, 15, 19, NULL, 10, 10, 10, 10, NULL)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (5, N'q8w8wfgptv', CAST(N'2018-09-21T02:36:58.0000000' AS DateTime2), N'14.233.42.184', 0, 6, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (6, N'9wq9zhkc25', CAST(N'2018-09-21T02:37:37.0000000' AS DateTime2), N'14.233.42.184', 0, 6, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (7, N'lksrkhecz6', CAST(N'2018-09-21T02:38:22.0000000' AS DateTime2), N'14.233.42.184', 0, 7, 14, 15, 19, NULL, 10, 10, 10, 10, NULL)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (8, N'8mq1mrf16s', CAST(N'2018-09-21T02:41:48.0000000' AS DateTime2), N'14.233.42.184', 0, 4, 16, 6, 14, 7, 53, 35, 33, 30, 28)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (9, N'y7i38a4bva', CAST(N'2018-09-21T02:45:15.0000000' AS DateTime2), N'14.233.42.184', 0, 5, 3, 7, 2, 19, 48, 43, 38, 38, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (10, N'v15jh3z260', CAST(N'2018-09-21T02:52:34.0000000' AS DateTime2), N'14.233.42.184', 0, 5, 1, 13, 12, 9, 32, 18, 18, 18, 18)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (11, N'0ibl4djq31', CAST(N'2018-09-21T04:55:44.0000000' AS DateTime2), N'14.233.42.184', 0, 6, 1, 16, 2, 15, 55, 40, 38, 33, 28)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (12, N'so2wjpptby', CAST(N'2018-09-21T05:00:02.0000000' AS DateTime2), N'14.233.42.184', 0, 16, 6, 4, 2, 5, 38, 35, 35, 33, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (13, N'sjnge58df9', CAST(N'2018-09-21T05:00:06.0000000' AS DateTime2), N'14.233.42.184', 0, 16, 6, 4, 2, 5, 38, 35, 35, 33, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (14, N'qpwanj99sd', CAST(N'2018-09-21T05:00:10.0000000' AS DateTime2), N'14.233.42.184', 0, 16, 6, 4, 2, 5, 38, 35, 35, 33, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (15, N'jmh0mnxgrw', CAST(N'2018-09-21T05:00:10.0000000' AS DateTime2), N'14.233.42.184', 0, 16, 6, 4, 2, 5, 38, 35, 35, 33, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (16, N'9fvpleufmd', CAST(N'2018-09-21T05:00:10.0000000' AS DateTime2), N'14.233.42.184', 0, 16, 6, 4, 2, 5, 38, 35, 35, 33, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (17, N'3ktbhwl1uy', CAST(N'2018-09-21T05:00:11.0000000' AS DateTime2), N'14.233.42.184', 0, 16, 6, 4, 2, 5, 38, 35, 35, 33, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (18, N'3ircj3pp19', CAST(N'2018-09-21T05:00:20.0000000' AS DateTime2), N'14.233.42.184', 0, 4, 17, 6, 2, 5, 45, 40, 35, 33, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (19, N'exex95yb3y', CAST(N'2018-09-21T05:00:21.0000000' AS DateTime2), N'14.233.42.184', 0, 4, 17, 6, 2, 5, 45, 40, 35, 33, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (20, N'eheboogsq3', CAST(N'2018-09-21T05:00:21.0000000' AS DateTime2), N'14.233.42.184', 0, 4, 17, 6, 2, 5, 45, 40, 35, 33, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (21, N'hvmhmywj2w', CAST(N'2018-09-21T05:00:30.0000000' AS DateTime2), N'14.233.42.184', 0, 6, 2, 19, 4, 5, 45, 43, 40, 35, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (22, N'd23oacbs06', CAST(N'2018-09-21T05:00:30.0000000' AS DateTime2), N'14.233.42.184', 0, 6, 2, 19, 4, 5, 45, 43, 40, 35, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (23, N'q55y3kvl1q', CAST(N'2018-09-21T05:00:30.0000000' AS DateTime2), N'14.233.42.184', 0, 6, 2, 19, 4, 5, 45, 43, 40, 35, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (24, N'e27j2njfj0', CAST(N'2018-09-21T05:00:30.0000000' AS DateTime2), N'14.233.42.184', 0, 6, 2, 19, 4, 5, 45, 43, 40, 35, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (25, N'mytd6m68df', CAST(N'2018-09-21T05:00:40.0000000' AS DateTime2), N'14.233.42.184', 0, 6, 2, 19, 4, 5, 45, 43, 40, 35, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (26, N'0qk139q1u4', CAST(N'2018-09-21T05:00:41.0000000' AS DateTime2), N'14.233.42.184', 0, 6, 2, 19, 4, 5, 45, 43, 40, 35, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (27, N'm9v9qpadwi', CAST(N'2018-09-21T05:00:43.0000000' AS DateTime2), N'14.233.42.184', 0, 6, 2, 19, 4, 5, 45, 43, 40, 35, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (28, N'up9qz84x6z', CAST(N'2018-09-21T05:00:44.0000000' AS DateTime2), N'14.233.42.184', 0, 6, 2, 19, 4, 5, 45, 43, 40, 35, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (29, N'f9cxeyqvnn', CAST(N'2018-09-21T05:00:46.0000000' AS DateTime2), N'14.233.42.184', 0, 6, 2, 19, 4, 5, 45, 43, 40, 35, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (30, N'v3t7i1i186', CAST(N'2018-09-21T05:01:36.0000000' AS DateTime2), N'14.233.42.184', 0, 4, 17, 12, 8, 19, 40, 40, 40, 33, 30)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (31, N'a7tr00i9pz', CAST(N'2018-09-21T05:03:28.0000000' AS DateTime2), N'14.233.42.184', 0, 12, 7, 9, 4, 16, 53, 38, 33, 33, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (32, N'q6b0wwgdjy', CAST(N'2018-09-21T09:07:58.0000000' AS DateTime2), N'117.3.57.58', 0, 13, 5, 19, 17, 14, 53, 45, 43, 43, 38)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (33, N'i6nbyei0qq', CAST(N'2018-09-21T09:07:58.0000000' AS DateTime2), N'117.3.57.58', 0, 13, 5, 19, 17, 14, 53, 45, 43, 43, 38)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (34, N'jinf6x09o3', CAST(N'2018-09-21T09:08:08.0000000' AS DateTime2), N'190.232.153.128', 0, 13, 14, 18, 3, 20, 40, 40, 35, 33, 30)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (35, N'o2vp5cd021', CAST(N'2018-09-21T09:08:36.0000000' AS DateTime2), N'117.3.57.58', 0, 12, 10, 9, 18, 11, 63, 53, 45, 40, 40)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (36, N'k0aj5ndm59', CAST(N'2018-09-21T10:13:16.0000000' AS DateTime2), N'117.3.57.58', 0, 6, 4, 16, 20, 2, 45, 45, 40, 33, 35)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (37, N'3zh7yasng2', CAST(N'2018-09-21T10:13:16.0000000' AS DateTime2), N'117.3.57.58', 0, 6, 4, 16, 20, 2, 45, 45, 40, 33, 35)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (38, N'6juvwhqkdp', CAST(N'2018-09-24T07:37:58.0000000' AS DateTime2), N'14.233.110.35', 0, 6, 9, 2, 4, 11, 60, 50, 45, 43, 35)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (39, N'2tafzzah62', CAST(N'2018-09-24T07:37:59.0000000' AS DateTime2), N'14.233.110.35', 0, 6, 9, 2, 4, 11, 60, 50, 45, 43, 35)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (40, N'he9tl5ksot', CAST(N'2018-09-24T08:00:11.0000000' AS DateTime2), N'14.233.110.35', 0, 8, 17, 4, 3, 15, 50, 43, 33, 28, 25)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (41, N'0drtm1qmsl', CAST(N'2018-09-24T08:12:45.0000000' AS DateTime2), N'14.233.110.35', 0, 17, 3, 5, 13, 7, 55, 48, 45, 40, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (42, N'ky0rs4gmq6', CAST(N'2018-09-24T08:26:03.0000000' AS DateTime2), N'14.233.110.35', 0, 11, 7, 9, 19, 12, 60, 55, 43, 43, 40)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (43, N'f4anl7obpj', CAST(N'2018-09-24T09:05:43.0000000' AS DateTime2), N'14.233.110.35', 0, 6, 4, 17, 5, 15, 53, 43, 38, 35, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (44, N'9aiw5eiv3x', CAST(N'2018-09-24T09:07:06.0000000' AS DateTime2), N'14.233.110.35', 0, 11, 4, 8, 18, 17, 45, 35, 30, 30, 30)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (45, N'rftdxwwbjk', CAST(N'2018-09-24T09:08:22.0000000' AS DateTime2), N'190.232.153.128', 0, 4, 16, 3, 1, 13, 55, 53, 40, 33, 33)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (46, N'bmdzvws3i0', CAST(N'2018-09-25T14:29:30.0000000' AS DateTime2), N'190.117.185.148', 0, 16, 13, 12, 8, 7, 48, 48, 48, 33, 30)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (47, N'17ca4krq6x', CAST(N'2018-09-25T14:36:06.0000000' AS DateTime2), N'190.117.185.148', 0, 4, 12, 19, 16, 13, 43, 43, 33, 30, 30)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (48, N'5t54amzrfv', CAST(N'2018-09-25T14:36:07.0000000' AS DateTime2), N'190.117.185.148', 0, 4, 12, 19, 16, 13, 43, 43, 33, 30, 30)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (49, N'xz2b2yrgeq', CAST(N'2018-09-25T14:57:17.0000000' AS DateTime2), N'190.117.185.148', 0, 15, 8, 12, 7, 6, 62, 47, 47, 43, 38)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (50, N'pzsuc7ukon', CAST(N'2018-09-25T14:59:33.0000000' AS DateTime2), N'179.7.50.197', 0, 20, 13, 18, 3, 11, 57, 57, 47, 43, 24)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (51, N'lstvuza6vm', CAST(N'2018-09-25T19:08:33.0000000' AS DateTime2), N'112.197.251.110', 0, 1, 16, 9, 6, 12, 85, 85, 81, 81, 62)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (52, N'7i4fham4as', CAST(N'2018-09-25T19:16:09.0000000' AS DateTime2), N'112.197.251.110', 0, 6, 16, 1, 9, 11, 85, 81, 66, 66, 43)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (53, N'81qorpflke', CAST(N'2018-09-25T19:53:40.0000000' AS DateTime2), N'112.197.251.110', 0, 7, 10, 6, 15, 5, 43, 43, 38, 38, 38)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (54, N'iciluoeyke', CAST(N'2018-09-25T22:44:52.0000000' AS DateTime2), N'112.197.251.110', 0, 18, 6, 10, 12, 14, 57, 53, 43, 43, 38)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (55, N'xgfkqgrj1w', CAST(N'2018-09-25T22:50:22.0000000' AS DateTime2), N'112.197.251.110', 0, 11, 18, 2, 9, 10, 76, 62, 53, 38, 38)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (56, N'48bku50vpr', CAST(N'2018-09-25T22:50:23.0000000' AS DateTime2), N'112.197.251.110', 0, 11, 18, 2, 9, 10, 76, 62, 53, 38, 38)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (57, N'kmf8m6c4fi', CAST(N'2018-09-26T01:18:50.0000000' AS DateTime2), N'112.197.251.110', 0, 8, 11, 1, 12, 4, 76, 62, 57, 57, 53)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (58, N'ffi5st7ar0', CAST(N'2018-09-26T01:18:51.0000000' AS DateTime2), N'112.197.251.110', 0, 8, 11, 1, 12, 4, 76, 62, 57, 57, 53)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (59, N'qo22ts0vet', CAST(N'2018-09-26T01:18:51.0000000' AS DateTime2), N'112.197.251.110', 0, 8, 11, 1, 12, 4, 76, 62, 57, 57, 53)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (60, N'2khfwcixp4', CAST(N'2018-09-26T01:52:27.0000000' AS DateTime2), N'203.117.153.40', 0, 6, 9, 1, 16, 15, 81, 62, 47, 47, 43)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (61, N'kfpn5h5a1g', CAST(N'2018-09-26T11:24:55.0000000' AS DateTime2), N'190.232.153.128', 0, 16, 1, 4, 8, 9, 81, 66, 62, 62, 47)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (62, N'2z75zy4329', CAST(N'2018-09-26T12:15:41.0000000' AS DateTime2), N'112.197.251.110', 0, 12, 8, 1, 16, 11, 74, 60, 57, 46, 43)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (63, N'yv8w34uy5y', CAST(N'2018-09-26T12:15:42.0000000' AS DateTime2), N'112.197.251.110', 0, 12, 8, 1, 16, 11, 74, 60, 57, 46, 43)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (64, N'f4so8vqeov', CAST(N'2018-09-26T12:16:28.0000000' AS DateTime2), N'190.232.153.128', 0, 11, 18, 9, 5, 7, 49, 31, 31, 28, 28)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (65, N'5gyyr4uhf5', CAST(N'2018-09-26T12:50:15.0000000' AS DateTime2), N'190.232.153.128', 0, 9, 16, 1, 6, 2, 49, 46, 34, 34, 31)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (66, N'oz6avhgdvb', CAST(N'2018-09-26T13:00:09.0000000' AS DateTime2), N'185.63.72.17', 0, 7, 15, 6, 9, 16, 63, 49, 43, 43, 31)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (67, N'jawhwf0b1t', CAST(N'2018-09-26T13:20:39.0000000' AS DateTime2), N'190.232.153.128', 0, 3, 17, 1, 13, 16, 32, 32, 18, 18, 18)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (68, N'wwecr89mn7', CAST(N'2018-09-26T13:23:50.0000000' AS DateTime2), N'190.232.153.128', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (69, N'ybfrd4zdoe', CAST(N'2018-09-26T14:04:38.0000000' AS DateTime2), N'112.197.251.110', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (70, N'c69ak62wzl', CAST(N'2018-09-26T14:04:59.0000000' AS DateTime2), N'112.197.251.110', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (71, N'qkn0thbk1v', CAST(N'2018-09-26T14:05:34.0000000' AS DateTime2), N'112.197.251.110', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (72, N'b5jy5nm49d', CAST(N'2018-09-26T14:05:55.0000000' AS DateTime2), N'112.197.251.110', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (73, N'yheqzo6hsf', CAST(N'2018-09-26T15:02:01.0000000' AS DateTime2), N'190.232.153.128', 0, 14, NULL, NULL, NULL, NULL, 100, NULL, NULL, NULL, NULL)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (74, N'di77d2nssk', CAST(N'2018-09-26T22:11:35.0000000' AS DateTime2), N'190.232.153.128', 0, 7, 11, 5, 14, 19, 45, 45, 37, 32, 32)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (75, N'uwmi2wjaxx', CAST(N'2018-09-26T22:14:43.0000000' AS DateTime2), N'190.232.153.128', 0, 3, 5, 13, 14, 18, 55, 55, 45, 45, 45)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (76, N'r6wlhq56i3', CAST(N'2018-09-26T22:18:28.0000000' AS DateTime2), N'190.232.153.128', 0, 8, 20, 4, 3, 2, 100, 100, 55, 50, 50)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (77, N'4oqr4ns6ik', CAST(N'2018-09-26T22:19:43.0000000' AS DateTime2), N'190.232.153.128', 0, 7, 11, 2, 1, 17, 100, 68, 40, 37, 32)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (84, N'e22af600', CAST(N'2025-02-10T11:46:31.0000000' AS DateTime2), NULL, 0, 4, 8, 20, 10, 13, 55, 55, 55, 37, 37)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (85, N'614f0d51', CAST(N'2025-02-10T12:20:34.0000000' AS DateTime2), NULL, 0, 4, 8, 20, 10, 13, 55, 55, 55, 37, 37)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (86, N'64daa05d', CAST(N'2025-02-10T15:21:30.0000000' AS DateTime2), NULL, 0, 12, 19, 9, 14, 15, 55, 45, 42, 42, 37)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (87, N'a08b7e3d', CAST(N'2025-02-10T15:25:54.0000000' AS DateTime2), NULL, 0, 4, 8, 20, 10, 13, 55, 55, 55, 37, 37)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (88, N'a1340c8c', CAST(N'2025-02-10T16:07:00.0000000' AS DateTime2), NULL, 0, 4, 8, 20, 10, 13, 55, 55, 55, 37, 37)
INSERT [dbo].[quiz] ([quiz_id], [quiz_code], [quiz_date], [quiz_client_ip], [quiz_status], [candidate1_id], [candidate2_id], [candidate3_id], [candidate4_id], [candidate5_id], [candidate1_percent], [candidate2_percent], [candidate3_percent], [candidate4_percent], [candidate5_percent]) VALUES (89, N'02991448', CAST(N'2025-02-10T16:07:08.0000000' AS DateTime2), NULL, 0, 4, 8, 20, 10, 13, 55, 55, 55, 37, 37)
SET IDENTITY_INSERT [dbo].[quiz] OFF
GO
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (1, 1, 4)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (1, 2, 3)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (1, 3, 2)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (1, 4, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (2, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (2, 2, 2)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (2, 3, 3)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (2, 4, 4)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (3, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (3, 2, 3)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (3, 3, 4)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (3, 4, 3)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (3, 5, 3)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (4, 1, 4)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (4, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (4, 3, 11)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (4, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (4, 5, 19)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (5, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (5, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (5, 3, 11)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (5, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (5, 5, 20)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (6, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (6, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (6, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (6, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (6, 5, 20)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (7, 1, 4)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (7, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (7, 3, 11)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (7, 4, 14)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (7, 5, 19)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (8, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (8, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (8, 3, 11)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (8, 4, 14)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (8, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (9, 1, 4)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (9, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (9, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (9, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (9, 5, 19)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (10, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (10, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (10, 3, 11)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (10, 4, 13)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (10, 5, 18)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (11, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (11, 2, 6)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (11, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (11, 4, 15)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (11, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (12, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (12, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (12, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (12, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (12, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (13, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (13, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (13, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (13, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (13, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (14, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (14, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (14, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (14, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (14, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (15, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (15, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (15, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (15, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (15, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (16, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (16, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (16, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (16, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (16, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (17, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (17, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (17, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (17, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (17, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (18, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (18, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (18, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (18, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (18, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (19, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (19, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (19, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (19, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (19, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (20, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (20, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (20, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (20, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (20, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (21, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (21, 2, 8)
GO
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (21, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (21, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (21, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (22, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (22, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (22, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (22, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (22, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (23, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (23, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (23, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (23, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (23, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (24, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (24, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (24, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (24, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (24, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (25, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (25, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (25, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (25, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (25, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (26, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (26, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (26, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (26, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (26, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (27, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (27, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (27, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (27, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (27, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (28, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (28, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (28, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (28, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (28, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (29, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (29, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (29, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (29, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (29, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (30, 1, 3)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (30, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (30, 3, 10)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (30, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (30, 5, 20)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (31, 1, 4)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (31, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (31, 3, 10)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (31, 4, 15)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (31, 5, 20)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (32, 1, 4)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (32, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (32, 3, 10)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (32, 4, 13)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (32, 5, 18)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (33, 1, 4)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (33, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (33, 3, 10)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (33, 4, 13)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (33, 5, 18)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (34, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (34, 2, 5)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (34, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (34, 4, 13)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (34, 5, 19)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (35, 1, 2)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (35, 2, 5)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (35, 3, 10)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (35, 4, 15)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (35, 5, 20)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (36, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (36, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (36, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (36, 4, 15)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (36, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (37, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (37, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (37, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (37, 4, 15)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (37, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (38, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (38, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (38, 3, 10)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (38, 4, 15)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (38, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (39, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (39, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (39, 3, 10)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (39, 4, 15)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (39, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (40, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (40, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (40, 3, 11)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (40, 4, 14)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (40, 5, 20)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (41, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (41, 2, 8)
GO
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (41, 3, 11)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (41, 4, 13)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (41, 5, 18)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (42, 1, 4)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (42, 2, 7)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (42, 3, 10)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (42, 4, 15)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (42, 5, 18)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (43, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (43, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (43, 3, 11)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (43, 4, 14)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (43, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (44, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (44, 2, 6)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (44, 3, 9)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (44, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (44, 5, 19)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (45, 1, 3)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (45, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (45, 3, 10)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (45, 4, 13)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (45, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (46, 1, 4)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (46, 2, 7)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (46, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (46, 4, 14)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (46, 5, 20)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (47, 1, 4)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (47, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (47, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (47, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (47, 5, 20)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (48, 1, 4)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (48, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (48, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (48, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (48, 5, 20)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (49, 1, 4)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (49, 2, 7)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (49, 3, 10)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (49, 4, 13)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (49, 5, 20)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (50, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (50, 2, 5)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (50, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (50, 4, 13)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (50, 5, 19)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (51, 1, 3)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (51, 2, 7)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (51, 3, 10)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (51, 4, 15)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (51, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (52, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (52, 2, 7)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (52, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (52, 4, 15)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (52, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (53, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (53, 2, 6)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (53, 3, 9)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (53, 4, 15)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (53, 5, 18)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (54, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (54, 2, 5)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (54, 3, 10)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (54, 4, 15)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (54, 5, 20)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (55, 1, 2)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (55, 2, 6)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (55, 3, 9)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (55, 4, 15)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (55, 5, 19)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (56, 1, 2)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (56, 2, 6)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (56, 3, 9)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (56, 4, 15)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (56, 5, 19)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (57, 1, 3)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (57, 2, 7)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (57, 3, 9)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (57, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (57, 5, 19)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (58, 1, 3)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (58, 2, 7)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (58, 3, 9)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (58, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (58, 5, 19)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (59, 1, 3)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (59, 2, 7)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (59, 3, 9)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (59, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (59, 5, 19)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (60, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (60, 2, 7)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (60, 3, 10)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (60, 4, 13)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (60, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (61, 1, 3)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (61, 2, 7)
GO
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (61, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (61, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (61, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (62, 1, 3)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (62, 2, 7)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (62, 3, 9)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (62, 4, 15)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (62, 5, 20)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (63, 1, 3)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (63, 2, 7)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (63, 3, 9)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (63, 4, 15)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (63, 5, 20)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (64, 1, 2)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (64, 2, 7)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (64, 3, 11)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (64, 4, 14)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (64, 5, 19)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (65, 1, 2)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (65, 2, 7)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (65, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (65, 4, 14)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (65, 5, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (66, 1, 4)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (66, 2, 7)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (66, 3, 10)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (66, 4, 15)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (66, 5, 18)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (67, 1, 3)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (67, 2, 6)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (67, 3, 11)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (67, 4, 18)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (67, 5, 21)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (67, 6, 26)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (68, 1, 3)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (68, 2, 9)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (68, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (68, 4, 18)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (68, 5, 21)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (68, 6, 24)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (69, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (69, 2, 9)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (69, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (69, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (69, 5, 22)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (69, 6, 23)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (70, 1, 2)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (70, 2, 10)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (70, 3, 14)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (70, 4, 18)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (70, 5, 22)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (70, 6, 24)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (71, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (71, 2, 6)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (71, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (71, 4, 17)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (71, 5, 22)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (71, 6, 23)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (72, 1, 3)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (72, 2, 7)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (72, 3, 13)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (72, 4, 19)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (72, 5, 22)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (72, 6, 23)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (73, 1, 2)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (73, 2, 6)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (73, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (73, 4, 19)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (73, 5, 21)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (73, 6, 24)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (74, 1, 2)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (74, 2, 9)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (74, 3, 15)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (74, 4, 18)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (74, 5, 21)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (74, 6, 26)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (75, 1, 4)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (75, 2, 6)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (75, 3, 12)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (75, 4, 18)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (75, 5, 21)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (75, 6, 26)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (76, 1, 3)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (76, 2, 6)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (76, 3, 13)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (76, 4, 20)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (76, 5, 21)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (76, 6, 23)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (77, 1, 5)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (77, 2, 9)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (77, 3, 15)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (77, 4, 19)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (77, 5, 21)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (77, 6, 25)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (84, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (84, 2, 6)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (84, 3, 11)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (84, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (84, 5, 21)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (84, 6, 23)
GO
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (85, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (85, 2, 6)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (85, 3, 11)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (85, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (85, 5, 21)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (85, 6, 23)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (86, 1, 2)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (86, 2, 8)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (86, 3, 13)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (86, 4, 18)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (86, 5, 22)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (86, 6, 24)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (87, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (87, 2, 6)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (87, 3, 11)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (87, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (87, 5, 21)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (87, 6, 23)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (88, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (88, 2, 6)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (88, 3, 11)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (88, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (88, 5, 21)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (88, 6, 23)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (89, 1, 1)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (89, 2, 6)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (89, 3, 11)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (89, 4, 16)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (89, 5, 21)
INSERT [dbo].[quiz_answer] ([quiz_id], [question_id], [answer_id]) VALUES (89, 6, 23)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [quiz_code_UNIQUE]    Script Date: 10/02/2025 16:24:08 ******/
ALTER TABLE [dbo].[quiz] ADD  CONSTRAINT [quiz_code_UNIQUE] UNIQUE NONCLUSTERED 
(
	[quiz_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[candidate] ADD  DEFAULT (NULL) FOR [candidate_profession]
GO
ALTER TABLE [dbo].[candidate] ADD  DEFAULT (NULL) FOR [candidate_position]
GO
ALTER TABLE [dbo].[candidate] ADD  DEFAULT (NULL) FOR [candidate_gov_plan]
GO
ALTER TABLE [dbo].[candidate] ADD  DEFAULT (NULL) FOR [candidate_proposal]
GO
ALTER TABLE [dbo].[candidate] ADD  DEFAULT (NULL) FOR [candidate_picture]
GO
ALTER TABLE [dbo].[question] ADD  DEFAULT ('0') FOR [question_points]
GO
ALTER TABLE [dbo].[quiz] ADD  DEFAULT (NULL) FOR [quiz_client_ip]
GO
ALTER TABLE [dbo].[quiz] ADD  DEFAULT ('0') FOR [quiz_status]
GO
ALTER TABLE [dbo].[quiz] ADD  DEFAULT (NULL) FOR [candidate1_id]
GO
ALTER TABLE [dbo].[quiz] ADD  DEFAULT (NULL) FOR [candidate2_id]
GO
ALTER TABLE [dbo].[quiz] ADD  DEFAULT (NULL) FOR [candidate3_id]
GO
ALTER TABLE [dbo].[quiz] ADD  DEFAULT (NULL) FOR [candidate4_id]
GO
ALTER TABLE [dbo].[quiz] ADD  DEFAULT (NULL) FOR [candidate5_id]
GO
ALTER TABLE [dbo].[quiz] ADD  DEFAULT (NULL) FOR [candidate1_percent]
GO
ALTER TABLE [dbo].[quiz] ADD  DEFAULT (NULL) FOR [candidate2_percent]
GO
ALTER TABLE [dbo].[quiz] ADD  DEFAULT (NULL) FOR [candidate3_percent]
GO
ALTER TABLE [dbo].[quiz] ADD  DEFAULT (NULL) FOR [candidate4_percent]
GO
ALTER TABLE [dbo].[quiz] ADD  DEFAULT (NULL) FOR [candidate5_percent]
GO
ALTER TABLE [dbo].[answer]  WITH CHECK ADD FOREIGN KEY([question_id])
REFERENCES [dbo].[question] ([question_id])
GO
ALTER TABLE [dbo].[candidate_answer]  WITH CHECK ADD FOREIGN KEY([answer_id])
REFERENCES [dbo].[answer] ([answer_id])
GO
ALTER TABLE [dbo].[candidate_answer]  WITH CHECK ADD FOREIGN KEY([question_id])
REFERENCES [dbo].[question] ([question_id])
GO
ALTER TABLE [dbo].[candidate_answer]  WITH CHECK ADD  CONSTRAINT [fk_candidate_answer_candidate1] FOREIGN KEY([candidate_id])
REFERENCES [dbo].[candidate] ([candidate_id])
GO
ALTER TABLE [dbo].[candidate_answer] CHECK CONSTRAINT [fk_candidate_answer_candidate1]
GO
ALTER TABLE [dbo].[quiz_answer]  WITH CHECK ADD FOREIGN KEY([answer_id])
REFERENCES [dbo].[answer] ([answer_id])
GO
ALTER TABLE [dbo].[quiz_answer]  WITH CHECK ADD FOREIGN KEY([question_id])
REFERENCES [dbo].[question] ([question_id])
GO
ALTER TABLE [dbo].[quiz_answer]  WITH CHECK ADD  CONSTRAINT [fk_quiz_answer_quiz1] FOREIGN KEY([quiz_id])
REFERENCES [dbo].[quiz] ([quiz_id])
GO
ALTER TABLE [dbo].[quiz_answer] CHECK CONSTRAINT [fk_quiz_answer_quiz1]
GO
/****** Object:  StoredProcedure [dbo].[upCalculateMatchingCandidates]    Script Date: 10/02/2025 16:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[upCalculateMatchingCandidates] 
@pquiz_id int
AS
BEGIN

	-- Declaring variables
	DECLARE @vtotal_questions REAL = 0, @vtotal_points REAL = 0;
	DECLARE @vcandidate_number INT = 0, @vcandidate_id INT = 0, @vmatching_questions REAL = 0, @vmatching_points REAL = 0;
	DECLARE @vcandidate_percent TINYINT =  0;

	-- Get the total questions and total points, totals to be used in the matching percentage calculations 
	SELECT @vtotal_questions = count(*), @vtotal_points = SUM(question_points)
	FROM question;
		

	-- Declaring cursor of top 5 candidates matching the quiz
	DECLARE cursor_candidate CURSOR FOR
	SELECT TOP 5 
	candidate_answer.candidate_id, COUNT(*) as matching_questions, SUM(question.question_points) as matching_points
	FROM candidate_answer
	inner join question on question.question_id = candidate_answer.question_id
	INNER JOIN quiz_answer on (quiz_answer.question_id = candidate_answer.question_id and quiz_answer.answer_id = candidate_answer.answer_id)
	where quiz_answer.quiz_id = @pquiz_id -- Only for the requested quiz
	group by candidate_answer.candidate_id
	ORDER by COUNT(*) DESC, SUM(question.question_points) DESC;

	
	OPEN cursor_candidate  

	FETCH NEXT FROM cursor_candidate   
	INTO @vcandidate_id, @vmatching_questions, @vmatching_points;

	WHILE @@FETCH_STATUS = 0  
	BEGIN  
		
		SET @vcandidate_number = @vcandidate_number + 1;
		
		SET @vcandidate_percent = ROUND(((@vmatching_questions / @vtotal_questions) + (@vmatching_points / @vtotal_points)) / 2 * 100, 0);
		
		
		IF @vcandidate_number= 1 
		BEGIN
			UPDATE quiz SET candidate1_id= @vcandidate_id, candidate1_percent= @vcandidate_percent WHERE quiz_id = @pquiz_id;
		END
		
		IF @vcandidate_number= 2
		BEGIN
		  UPDATE quiz SET candidate2_id= @vcandidate_id, candidate2_percent= @vcandidate_percent WHERE quiz_id = @pquiz_id;
		END
		
		IF @vcandidate_number= 3
		BEGIN
			UPDATE quiz SET candidate3_id= @vcandidate_id, candidate3_percent= @vcandidate_percent WHERE quiz_id = @pquiz_id;
		END

		IF @vcandidate_number= 4
		BEGIN
		  UPDATE quiz SET candidate4_id= @vcandidate_id, candidate4_percent= @vcandidate_percent WHERE quiz_id = @pquiz_id;
		END

		IF @vcandidate_number= 5
		BEGIN
		  UPDATE quiz SET candidate5_id= @vcandidate_id, candidate5_percent= @vcandidate_percent WHERE quiz_id = @pquiz_id;
		END

		FETCH NEXT FROM cursor_candidate   
		INTO @vcandidate_id, @vmatching_questions, @vmatching_points;

		

	END   
	
	CLOSE cursor_candidate;  
	DEALLOCATE cursor_candidate; 	

END 
GO
