CREATE VIEW dbo.vw_SKUPrice
AS
SELECT [Id_sku],
	   [Code],
	   [Name],
	   [dbo].[GetSKUPrice]([Id_sku]) AS cost_prod
FROM [dbo].[SKU] 
GO