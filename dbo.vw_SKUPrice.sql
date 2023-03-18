CREATE VIEW dbo.SKUPrice AS
SELECT ID, Code, Name, dbo.udf_GetSKUPrice(ID) AS Price
FROM dbo.SKU
