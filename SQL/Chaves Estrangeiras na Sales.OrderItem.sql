-- Verifica OrderID e ProductID nulos
SELECT
    COUNT(*)                                  AS Total_Itens,
    COUNT(OrderID)                            AS Com_OrderID,
    COUNT(*) - COUNT(OrderID)                 AS OrderID_Nulos,
    COUNT(ProductID)                          AS Com_ProductID,
    COUNT(*) - COUNT(ProductID)               AS ProductID_Nulos
FROM Sales.OrderItem;

-- Detalhamento dos itens com chaves estrangeiras nulas
SELECT
    ItemID,
    OrderID,
    ProductID,
    Quantity,
    CASE WHEN OrderID   IS NULL THEN 'Sim' ELSE 'Não' END AS OrderID_Nulo,
    CASE WHEN ProductID IS NULL THEN 'Sim' ELSE 'Não' END AS ProductID_Nulo
FROM Sales.OrderItem
WHERE OrderID IS NULL OR ProductID IS NULL;
