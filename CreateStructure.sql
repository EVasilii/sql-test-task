CREATE TABLE dbo.SKU
(Id_sku INT PRIMARY KEY IDENTITY(1,1),
 Code AS 's' + CONVERT(VARCHAR(50),id_sku),
 "Name" VARCHAR(50),
 CONSTRAINT Un_code UNIQUE(Code));
GO

CREATE TABLE dbo.Family
(Id_family INT PRIMARY KEY IDENTITY(1,1),
 SurName VARCHAR(50),
 BudgetValue INT);
GO
 
CREATE TABLE dbo.Basket
(Id_basket INT PRIMARY KEY IDENTITY(1,1),
 Id_sku INT,
 Id_family INT,
 Quantity INT,
 "Value" INT, 
 PurchaseDate DATE DEFAULT(GETDATE()),
 DiscountValue INT,
 CONSTRAINT fk_sku FOREIGN KEY(Id_sku)
	REFERENCES dbo.SKU(Id_sku),
 CONSTRAINT fk_fam FOREIGN KEY(Id_family)
	REFERENCES dbo.Family(Id_family),
 CONSTRAINT chk_qua CHECK (Quantity >= 0),
 CONSTRAINT chk_val CHECK ("Value" >= 0))
 GO

 INSERT INTO [dbo].[SKU]
 VALUES ('Milk'),
		('Meat'),
		('Sugar'),
		('Bread'),
		('Orange')
GO

INSERT INTO [dbo].[Family]
VALUES ('Makkinton', 2000),
	   ('Cannady', 1000),
	   ('Kingstone', 3500),
	   ('Flopers',1500),
	   ('Smith', 2500)
GO

SELECT * FROM [dbo].[Family]

INSERT INTO [dbo].[Basket]([Id_sku],[Id_family],[Quantity],[Value],[PurchaseDate],[DiscountValue])
VALUES (1, 1, 15, 150,'2023-03-02', 10),
	   (2, 1, 15, 150,'2023-03-02', 15),
	   (3, 2, 15, 350,'2023-03-02', 10),
	   (2, 2, 25, 300,'2023-03-02', 5),
	   (3, 3, 15, 250,'2023-03-02', 20),
	   (4, 4, 30, 250,'2023-03-02', 25)
GO