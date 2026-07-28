WITH ranked AS (
    SELECT
        sto.Name AS canal_venda,
        pro.Name AS produto,
        COUNT(DISTINCT ord.OrderID) AS total_pedidos,
        SUM(itm.Quantity) AS total_itens_vendidos,
        SUM(itm.LineTotal) AS faturamento_total,
        ROUND(AVG(itm.Discount), 2) AS desconto_medio,
        RANK() OVER (
            PARTITION BY sto.Name
            ORDER BY SUM(itm.LineTotal) DESC
        ) AS ranking
    FROM Sales.[Order] ord
    INNER JOIN Sales.OrderItem itm
        ON ord.OrderID = itm.OrderID
    INNER JOIN Sales.Store sto
        ON ord.StoreID = sto.StoreID
    INNER JOIN Production.Product pro
        ON itm.ProductID = pro.ProductID
    WHERE
        ord.OrderDate >= '2016-01-01'
        AND ord.OrderDate < '2019-01-01'
        AND ord.Status <> 5
    GROUP BY
        sto.Name,
        pro.Name
    HAVING
        COUNT(DISTINCT ord.OrderID) >= 5
)
SELECT *
FROM ranked
WHERE ranking <= 10
ORDER BY
    canal_venda,
    ranking;
