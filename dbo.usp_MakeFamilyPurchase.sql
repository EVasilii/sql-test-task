CREATE PROCEDURE dbo.usp_MakeFamilyPurchase 
@FamilySurName varchar(255) = 'Makkinton'
AS
SET NOCOUNT ON
	UPDATE [dbo].[Family] 
	SET dbo.Family.BudgetValue = (F.BudgetValue - Q.sum_val)
	from [dbo].[Family] F
	JOIN 
		(SELECT [Id_family], sum(dbo.Basket.Value) AS sum_val 
		FROM dbo.Basket
		GROUP BY [Id_family] ) AS Q 
		ON F.[Id_family] = Q.[Id_family]
	WHERE F.SurName = @FamilySurName
GO