CREATE PROC dbo.usp_MakeFamilyPurchase
    @FamilySurName varchar(255)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Family WHERE SurName = @FamilySurName)
    BEGIN
        RAISERROR('Семьи с фамилией %s не существует', 11, 1, @FamilySurName)
        RETURN
    END;

    UPDATE dbo.Family
    SET BudgetValue = BudgetValue - (
        SELECT SUM(b.Value)
        FROM dbo.Basket b
        JOIN dbo.SKU ON dbo.Basket.ID_SKU = dbo.SKU.ID
        WHERE dbo.SKU.SurName = @FamilySurName
    )
    WHERE SurName = @FamilySurName
END;