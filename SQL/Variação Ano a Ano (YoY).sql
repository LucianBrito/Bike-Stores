SELECT
    sto.Name AS canal_venda,
    YEAR(ord.OrderDate) AS ano,
    SUM(itm.LineTotal) AS faturamento_total,
    LAG(SUM(itm.LineTotal)) OVER (
        PARTITION BY sto.Name
        ORDER BY YEAR(ord.OrderDate)
    ) AS faturamento_ano_anterior,
    ROUND(
        (SUM(itm.LineTotal) - LAG(SUM(itm.LineTotal)) OVER (
            PARTITION BY sto.Name
            ORDER BY YEAR(ord.OrderDate)
        )) * 100.0 /
        NULLIF(LAG(SUM(itm.LineTotal)) OVER (
            PARTITION BY sto.Name
            ORDER BY YEAR(ord.OrderDate)
        ), 0),
    2
    ) AS variacao_percentual
FROM Sales.[Order] ord
INNER JOIN Sales.OrderItem itm
    ON ord.OrderID = itm.OrderID
INNER JOIN Sales.Store sto
    ON ord.StoreID = sto.StoreID
WHERE
    ord.OrderDate >= '2016-01-01'
    AND ord.OrderDate < '2019-01-01'
    AND ord.Status <> 5
GROUP BY
    sto.Name,
    YEAR(ord.OrderDate)
ORDER BY
    sto.Name,
    ano;
