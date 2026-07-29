-- Itens com ProductID inexistente na dimensão
SELECT oi.ItemID, oi.ProductID, oi.OrderID
FROM Sales.OrderItem oi
LEFT JOIN Production.Product p ON oi.ProductID = p.ProductID
WHERE oi.ProductID IS NOT NULL
  AND p.ProductID IS NULL;
