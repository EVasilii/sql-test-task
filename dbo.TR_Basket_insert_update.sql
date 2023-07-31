CREATE TRIGGER dbo.TR_Basket_insert_update
ON [dbo].[Basket]
AFTER INSERT
AS
	UPDATE [dbo].[Basket]
	SET [DiscountValue] = [dbo].[Basket].[Value] * 1.05
	FROM inserted i
	WHERE dbo.Basket.Id_sku in (select i.Id_sku from inserted i group by i.Id_sku having count(i.Id_sku) > 1)

	UPDATE [dbo].[Basket]
	SET [DiscountValue] = 0
	FROM inserted i
	WHERE dbo.Basket.Id_sku not in (select i.Id_sku from inserted i group by i.Id_sku having count(i.Id_sku) > 1)
GO