USE chinook_autoincrement;
SELECT 
    i.InvoiceId,
    i.InvoiceDate,
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Country
FROM invoice i
INNER JOIN customer c
    ON i.CustomerId = c.CustomerId;
    SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Email
FROM customer c
LEFT JOIN invoice i
    ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;
SELECT 
    t.TrackId,
    t.Name AS TrackName,
    SUM(il.UnitPrice * il.Quantity) AS TotalRevenue
FROM invoiceline il
INNER JOIN track t
    ON il.TrackId = t.TrackId
GROUP BY t.TrackId, t.Name
ORDER BY TotalRevenue DESC;
SELECT 
    g.Name AS Genre,
    SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM invoiceline il
INNER JOIN track t ON il.TrackId = t.TrackId
INNER JOIN genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY Revenue DESC;
SELECT 
    MIN(InvoiceDate) AS FirstDate,
    MAX(InvoiceDate) AS LastDate
FROM invoice;
SELECT 
    i.InvoiceId,
    i.InvoiceDate,
    SUM(il.UnitPrice * il.Quantity) AS TotalSales
FROM invoice i
INNER JOIN invoiceline il
    ON i.InvoiceId = il.InvoiceId
WHERE i.InvoiceDate BETWEEN '2022-01-01' AND '2023-12-31'
GROUP BY i.InvoiceId, i.InvoiceDate
ORDER BY TotalSales DESC;    