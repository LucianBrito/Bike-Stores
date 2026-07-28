SELECT
    sto.Name AS canal_venda,
    FORMAT(ord.OrderDate, 'yyyy-MM') AS mes_ano,
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
WHERE
    ord.OrderDate >= '2016-01-01'
    AND ord.OrderDate < '2019-01-01'
GROUP BY
    sto.Name,
    FORMAT(ord.OrderDate, 'yyyy-MM')
ORDER BY
    sto.Name,
    mes_ano;
