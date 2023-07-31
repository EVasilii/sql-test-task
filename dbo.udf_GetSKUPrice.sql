CREATE FUNCTION GetSKUPrice (@ID_SKU  INT)
RETURNS DECIMAL(18,2)
AS
	BEGIN 
	DECLARE @cost DECIMAL(18,2)
	SELECT @cost = SUM("Value")/SUM(Quantity)
	FROM [dbo].[Basket] B JOIN [dbo].[SKU] S ON B.Id_sku = S.Id_sku
	WHERE S.Id_sku = @ID_SKU
	RETURN @cost
	END
GO