CREATE TRIGGER dbo.TR_Basket_insert_update
ON dbo.Basket
AFTER INSERT
AS
BEGIN
  DECLARE @ID_SKU INT, @count INT
  SELECT @ID_SKU = ID_SKU, @count = COUNT(*) FROM inserted GROUP BY ID_SKU
  IF @count >= 2
  BEGIN
    UPDATE b SET b.DiscountValue = b.Value * 0.05
    FROM dbo.Basket b
    INNER JOIN inserted i ON b.ID = i.ID
    WHERE b.ID_SKU = @ID_SKU
  END
  ELSE
  BEGIN
    UPDATE b SET b.DiscountValue = 0
    FROM dbo.Basket b
    INNER JOIN inserted i ON b.ID = i.ID
    WHERE b.ID_SKU = @ID_SKU
  END
END