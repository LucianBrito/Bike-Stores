SELECT
    sto.Name AS canal_venda,
    CASE ord.Status
        WHEN 1 THEN 'Pendente'
        WHEN 2 THEN 'Processando'
        WHEN 3 THEN 'Enviado'
        WHEN 4 THEN 'Concluido'
        WHEN 5 THEN 'Cancelado'
        ELSE 'Desconhecido'
    END AS status_legivel,
    COUNT(DISTINCT ord.OrderID) AS total_pedidos,
    SUM(itm.Quantity) AS total_itens_vendidos,
    SUM(itm.LineTotal) AS faturamento_total
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
    ord.Status
ORDER BY
    sto.Name,
    ord.Status;
