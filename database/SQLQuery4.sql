
CREATE DATABASE [gestion_hotele]

 ON  PRIMARY 
( NAME = 'gestion_hotele_Data', FILENAME = 'E:\my web site\broject _ stage\gestion_hotele.mdf' , SIZE = 6MB , MAXSIZE = 10mb , FILEGROWTH = 2MB )
 LOG ON 
( NAME = ' gestion_hotele_Log', FILENAME = 'E:\my web site\broject _ stage\gestion_hotele.Ldf' , SIZE = 6MB , MAXSIZE = 10mb , FILEGROWTH = 2MB )
GO


USE [gestion_hotele]


CREATE TABLE [dbo].[directeur] (
    [cin]    VARCHAR (50) NOT NULL,
    [image]  IMAGE        NULL,
    [nom]    VARCHAR (50) NULL,
    [prenom] VARCHAR (50) NULL,
    [tele]   INT          NULL,
    [email]  VARCHAR (50) NULL,
    [pass]   VARCHAR (50) NULL,
    CONSTRAINT [PK_directeur] PRIMARY KEY CLUSTERED ([cin] ASC)
);

CREATE TABLE [dbo].[reception] (
    [cin]      VARCHAR (50)    NOT NULL,
    [image]    VARBINARY (MAX) NULL,
    [nom]      VARCHAR (50)    NULL,
    [prenom]   VARCHAR (50)    NULL,
    [adresse]  VARCHAR (50)    NULL,
    [tele]     INT             NULL,
    [date_dep] DATE            NULL,
    [salaire]  MONEY           NULL,
    [travau]   VARCHAR (50)    NULL,
    [email]    VARCHAR (50)    NULL,
    [pass]     VARCHAR (50)    NULL,
    [cin_dire] VARCHAR (50)    NULL,
    CONSTRAINT [PK_reception] PRIMARY KEY CLUSTERED ([cin] ASC),
    CONSTRAINT [FK_reception_directeur] FOREIGN KEY ([cin_dire]) REFERENCES [dbo].[directeur] ([cin])
);
CREATE TABLE [dbo].[chambre] (
    [numero]        INT           NOT NULL,
    [size]          VARCHAR (50)  NULL,
    [capasitiy]     VARCHAR (50)  NULL,
    [services]      VARCHAR (150) NULL,
    [prix]          INT           NULL,
    [open_close]    VARCHAR (50)  NULL,
    [cin_reception] VARCHAR (50)  NULL,
    CONSTRAINT [PK_chambre] PRIMARY KEY CLUSTERED ([numero] ASC),
    CONSTRAINT [FK_chambre_reception] FOREIGN KEY ([cin_reception]) REFERENCES [dbo].[reception] ([cin])
);

CREATE TABLE [dbo].[commande] (
    [nb_commande] INT          IDENTITY (1, 1) NOT NULL,
    [cin_client]  VARCHAR (50) NULL,
    [nom_prenom]  VARCHAR (50) NULL,
    [tele]        INT          NULL,
    [nb_chambre]  INT          NULL,
    [day]         INT          NULL,
    [date_dep]    DATE         NULL,
    [date_fin]    DATE         NULL,
    [mois]        INT          NULL,
    [prix]        FLOAT (53)   NULL,
    CONSTRAINT [PK_commande] PRIMARY KEY CLUSTERED ([nb_commande] ASC),
    CONSTRAINT [FK_commande_chambre] FOREIGN KEY ([nb_chambre]) REFERENCES [dbo].[chambre] ([numero]),
    CONSTRAINT [ch_comm] CHECK ([mois]>=(1) AND [mois]<=(12))
);
CREATE TABLE [dbo].[employe] (
    [cin]        VARCHAR (50) NOT NULL,
    [nom]        VARCHAR (50) NULL,
    [prenom]     VARCHAR (50) NULL,
    [adresse]    VARCHAR (50) NULL,
    [tele]       INT          NULL,
    [travau]     VARCHAR (50) NULL,
    [date_dep]   DATE         NULL,
    [salaire]    INT          NULL,
    [cin_direct] VARCHAR (50) NULL,
    CONSTRAINT [PK_employe] PRIMARY KEY CLUSTERED ([cin] ASC),
    CONSTRAINT [FK_employe_directeur] FOREIGN KEY ([cin_direct]) REFERENCES [dbo].[directeur] ([cin])
);

CREATE TABLE [dbo].[factures] (
    [numero]      INT          IDENTITY (1, 1) NOT NULL,
    [libelle]     VARCHAR (50) NULL,
    [date]        DATE         NULL,
    [description] VARCHAR (50) NULL,
    [prix]        INT          NULL,
    [mois]        INT          NULL,
    [cin_direc]   VARCHAR (50) NULL,
    CONSTRAINT [PK_factures] PRIMARY KEY CLUSTERED ([numero] ASC),
    CONSTRAINT [FK_factures_directeur] FOREIGN KEY ([cin_direc]) REFERENCES [dbo].[directeur] ([cin])
);



CREATE TABLE [dbo].[totale] (
    [mois]      INT          NOT NULL,
    [commande]  FLOAT (53)   NULL,
    [factures]  FLOAT (53)   NULL,
    [employes]  FLOAT (53)   NULL,
    [reception] FLOAT (53)   NULL,
    [total]     FLOAT (53)   NULL,
    [cin_direc] VARCHAR (50) NULL,
    CONSTRAINT [PK_totale] PRIMARY KEY CLUSTERED ([mois] ASC),
    CONSTRAINT [FK_totale_directeur] FOREIGN KEY ([cin_direc]) REFERENCES [dbo].[directeur] ([cin]),
    CONSTRAINT [ch_total] CHECK ([mois]>=(1) AND [mois]<=(12))
);
----------directeur-----------------
declare @image varchar(max)
set @image = (SELECT * from Openrowset( Bulk 'E:\\WebApplication1\images\C:\directeur.jpeg', Single_Blob) as Image)

INSERT INTO [dbo].[directeur] ([cin], [image], [nom], [prenom], [tele], [email], [pass]) VALUES (N'CB1111', @image, 'Driss', N'Hotel', 61111111, N'Driss@gmail.com', N'Driss111')

----------reception-------
declare @image2 varchar(max)
set @image2 = (SELECT * from Openrowset( Bulk 'E:\\WebApplication1\images\C:\reception.jpeg', Single_Blob) as Image)

INSERT INTO [dbo].[reception] ([cin], [image], [nom], [prenom], [adresse], [tele], [date_dep], [salaire], [travau], [email], [pass], [cin_dire]) VALUES (N'CB2222', @image2, N'Ahnouche', N'Ayoub', N'NR 199', 6222222, N'2019-03-03', CAST(3000.0000 AS Money), N'reception1', N'ayoub@gmail.com', N'ayoub123', N'CB1111')
INSERT INTO [dbo].[reception] ([cin], [image], [nom], [prenom], [adresse], [tele], [date_dep], [salaire], [travau], [email], [pass], [cin_dire]) VALUES (N'CB3333', @image2, N'Maroune', N'Adel', N'NR 22', 6333333, N'2018-04-04', CAST(30000000.0000 AS Money), N'reception2', N'adel@gmail.com', N'adel123', N'CB1111')

----------chmabre-------------
INSERT INTO [dbo].[chambre] ([numero], [size], [capasitiy], [services], [prix], [open_close], [cin_reception]) VALUES (1, N'30ft', N'1 perssone', N'wifi/tv/piscine/resturant', 400, N'open', N'CB2222')
INSERT INTO [dbo].[chambre] ([numero], [size], [capasitiy], [services], [prix], [open_close], [cin_reception]) VALUES (2, N'30ft', N'1 perssone', N'wifi/tv/piscine/resturant', 400, N'open', N'CB2222')
INSERT INTO [dbo].[chambre] ([numero], [size], [capasitiy], [services], [prix], [open_close], [cin_reception]) VALUES (3, N'30ft', N'1 perssone', N'wifi/tv/piscine/resturant', 400, N'open', N'CB2222')
INSERT INTO [dbo].[chambre] ([numero], [size], [capasitiy], [services], [prix], [open_close], [cin_reception]) VALUES (4, N'50ft', N'2 perssone', N'wifi/tv/piscine/resturant', 400, N'open', N'CB2222')
INSERT INTO [dbo].[chambre] ([numero], [size], [capasitiy], [services], [prix], [open_close], [cin_reception]) VALUES (5, N'50ft', N'2 perssone', N'wifi/tv/piscine/resturant', 400, N'open', N'CB2222')
INSERT INTO [dbo].[chambre] ([numero], [size], [capasitiy], [services], [prix], [open_close], [cin_reception]) VALUES (6, N'50ft', N'2 perssone', N'wifi/tv/piscine/resturant', 400, N'open', N'CB2222')
INSERT INTO [dbo].[chambre] ([numero], [size], [capasitiy], [services], [prix], [open_close], [cin_reception]) VALUES (7, N'200ft', N'5 perssone', N'wifi/tv/piscine/resturant', 600, N'open', N'CB2222')
INSERT INTO [dbo].[chambre] ([numero], [size], [capasitiy], [services], [prix], [open_close], [cin_reception]) VALUES (8, N'200ft', N'5 perssone', N'wifi/tv/piscine/resturant', 600, N'open', N'CB2222')
INSERT INTO [dbo].[chambre] ([numero], [size], [capasitiy], [services], [prix], [open_close], [cin_reception]) VALUES (9, N'200ft', N'5 perssone', N'wifi/tv/piscine/resturant', 600, N'open', N'CB2222')
INSERT INTO [dbo].[chambre] ([numero], [size], [capasitiy], [services], [prix], [open_close], [cin_reception]) VALUES (10, N'200ft', N'5 perssone', N'wifi/tv/piscine/resturant', 600, N'open', N'CB2222')

------------employe-----------------------

INSERT INTO [dbo].[employe] ([cin], [nom], [prenom], [adresse], [tele], [travau], [date_dep], [salaire], [cin_direct]) VALUES (N'CB4444', N'emp1', N'amp1', N'NR 1', 6444444, N'minage', N'2018-05-05', 2000, N'CB1111')
INSERT INTO [dbo].[employe] ([cin], [nom], [prenom], [adresse], [tele], [travau], [date_dep], [salaire], [cin_direct]) VALUES (N'CB5555', N'emp2', N'amp2', N'NR 5', 6555555, N'minage', N'2018-06-06', 2000, N'CB1111')
INSERT INTO [dbo].[employe] ([cin], [nom], [prenom], [adresse], [tele], [travau], [date_dep], [salaire], [cin_direct]) VALUES (N'CB6666', N'emp3', N'amp3', N'NR 6', 6666666, N'minage', N'2018-07-07', 2000, N'CB1111')
INSERT INTO [dbo].[employe] ([cin], [nom], [prenom], [adresse], [tele], [travau], [date_dep], [salaire], [cin_direct]) VALUES (N'CB7777', N'emp7', N'amp7', N'NR 7', 6777777, N'cuisine', N'2018-07-07', 2500, N'CB1111')
INSERT INTO [dbo].[employe] ([cin], [nom], [prenom], [adresse], [tele], [travau], [date_dep], [salaire], [cin_direct]) VALUES (N'CB8888', N'emp8', N'amp8', N'NR 8', 6888888, N'cuisine', N'2018-08-08', 2500, N'CB1111')
INSERT INTO [dbo].[employe] ([cin], [nom], [prenom], [adresse], [tele], [travau], [date_dep], [salaire], [cin_direct]) VALUES (N'CB9999', N'emp9', N'amp9', N'NR 9', 6999999, N'cuisine', N'2018-09-09', 2500, N'CB1111')

----------------factures-----------------
INSERT INTO [dbo].[factures] ([numero], [libelle], [date], [description], [prix], [mois], [cin_direc]) VALUES (1, N'bannane', N'2001-02-02', N'21 kg de bannane _', 222, 1, N'CB1111')


------------------commande-------------
INSERT INTO [dbo].[commande] ([nb_commande], [cin_client], [nom_prenom], [tele], [nb_chambre], [day], [date_dep], [date_fin], [mois], [prix]) VALUES (3, N'CB322', N'client_1', 2222222, 1, 2, N'2222-02-22', N'2222-02-22', 1, 800)

