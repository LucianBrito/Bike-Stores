SELECT
    emp.FullName AS vendedor,
    sto.Name AS loja,
    COUNT(DISTINCT ord.OrderID) AS total_pedidos,
    SUM(itm.Quantity) AS total_itens_vendidos,
    SUM(itm.LineTotal) AS faturamento_total,
    SUM(CASE WHEN ord.Status = 5 THEN itm.LineTotal ELSE 0 END) AS total_cancelado,
    ROUND(
        SUM(CASE WHEN ord.Status = 5 THEN itm.LineTotal ELSE 0 END) * 100.0 /
        NULLIF(SUM(itm.LineTotal), 0),
    2) AS percentual_cancelado
FROM Sales.[Order] ord
INNER JOIN Sales.OrderItem itm
    ON ord.OrderID = itm.OrderID
INNER JOIN Sales.Store sto
    ON ord.StoreID = sto.StoreID
INNER JOIN Sales.Employee emp
    ON ord.EmployeeID = emp.EmployeeID
WHERE
    ord.OrderDate >= '2016-01-01'
    AND ord.OrderDate < '2019-01-01'
    AND emp.Active = 1
GROUP BY
    emp.FullName,
    sto.Name
ORDER BY
    faturamento_total DESC;
