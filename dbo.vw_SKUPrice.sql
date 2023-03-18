CREATE VIEW dbo.SKUWithPrice AS
SELECT ID, Code, Name, dbo.udf_GetSKUPrice(ID) AS Price
FROM dbo.SKU