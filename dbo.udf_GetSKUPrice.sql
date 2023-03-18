CREATE FUNCTION dbo.udf_GetSKUPrice(@ID_SKU INT)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @price DECIMAL(18, 2);
    SELECT @price = SUM(b.Value)/SUM(b.Quantity)
    FROM dbo.Basket b
    WHERE b.ID_SKU = @ID_SKU;
    RETURN @price;
END;