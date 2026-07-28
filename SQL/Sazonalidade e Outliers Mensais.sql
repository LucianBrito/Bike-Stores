WITH mensal AS (
    SELECT
        sto.Name AS canal_venda,
        FORMAT(ord.OrderDate, 'yyyy-MM') AS mes_ano,
        DATEFROMPARTS(YEAR(ord.OrderDate), MONTH(ord.OrderDate), 1) AS data_mes,
        SUM(itm.LineTotal) AS faturamento_total,
        COUNT(DISTINCT ord.OrderID) AS total_pedidos
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
        FORMAT(ord.OrderDate, 'yyyy-MM'),
        DATEFROMPARTS(YEAR(ord.OrderDate), MONTH(ord.OrderDate), 1)
),
com_metricas AS (
    SELECT
        *,
        ROUND(AVG(faturamento_total) OVER (
            PARTITION BY canal_venda
            ORDER BY data_mes
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ), 2) AS media_movel_3m,
        ROUND(STDEV(faturamento_total) OVER (
            PARTITION BY canal_venda
        ), 2) AS desvio_padrao_historico
    FROM mensal
)
SELECT
    canal_venda,
    mes_ano,
    faturamento_total,
    total_pedidos,
    media_movel_3m,
    ROUND(
        (faturamento_total - media_movel_3m) * 100.0 /
        NULLIF(media_movel_3m, 0),
    2
    ) AS desvio_da_media,
    desvio_padrao_historico,
    CASE
        WHEN faturamento_total > media_movel_3m + 1.5 * desvio_padrao_historico
            THEN 'OUTLIER POSITIVO'
        WHEN faturamento_total < media_movel_3m - 1.5 * desvio_padrao_historico
            THEN 'OUTLIER NEGATIVO'
        ELSE 'Normal'
    END AS classificacao
FROM com_metricas
ORDER BY
    canal_venda,
    mes_ano;
