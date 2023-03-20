CREATE TABLE dbo.SKU (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  Code AS 's' + CAST(ID AS VARCHAR(10)),
  Name VARCHAR(255)
);

CREATE TABLE dbo.Basket (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  ID_SKU INT FOREIGN KEY REFERENCES dbo.SKU(ID),
  Quantity INT CHECK (Quantity >= 0),
  Value DECIMAL(10, 2) CHECK (Value >= 0),
  PurchaseDate DATETIME DEFAULT(GETDATE()),
  DiscountValue DECIMAL(10, 2)
);

CREATE TABLE dbo.Family (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  SurName VARCHAR(255),
  BudgetValue DECIMAL(10,2)
);
