-- Verifica EmployeeID e StoreID nulos na tabela fato
SELECT
    COUNT(*)                                      AS Total_Pedidos,
    COUNT(EmployeeID)                             AS Com_EmployeeID,
    COUNT(*) - COUNT(EmployeeID)                  AS EmployeeID_Nulos,
    COUNT(StoreID)                                AS Com_StoreID,
    COUNT(*) - COUNT(StoreID)                     AS StoreID_Nulos
FROM Sales.[Order];

-- Detalhamento dos registros com chaves estrangeiras nulas
SELECT
    OrderID,
    OrderDate,
    CASE WHEN EmployeeID IS NULL THEN 'Sim' ELSE 'Não' END AS EmployeeID_Nulo,
    CASE WHEN StoreID    IS NULL THEN 'Sim' ELSE 'Não' END AS StoreID_Nulo
FROM Sales.[Order]
WHERE EmployeeID IS NULL OR StoreID IS NULL
ORDER BY OrderDate DESC;

