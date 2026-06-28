-- ======================================================================
-- PRUEBA TÉCNICA: DANTA ANALYTICS S.A.
-- PARTE 4: CONSULTA EN SQL (T-SQL) - TOP 10 PRODUCTOS CRÍTICOS
-- AUTHOR: JORGE ANDRÉS PADILLA ARIAS
-- ======================================================================
WITH ResumenDevoluciones AS (
    SELECT 
        [StockCode] AS CodigoProducto,
        MAX([Description]) AS Descripcion,
        ABS(SUM([Quantity])) AS TotalUnidadesDevueltas,
        COUNT(DISTINCT [CustomerID]) AS ClientesUnicosDevolvieron
    FROM 
        [dbo].[OnlineRetail]
    WHERE 
        [Quantity] < 0 
        OR [InvoiceNo] LIKE 'C%'
    GROUP BY 
        [StockCode]
)
SELECT TOP 10
    CodigoProducto,
    Descripcion,
    TotalUnidadesDevueltas,
    ClientesUnicosDevolvieron
FROM 
    ResumenDevoluciones
ORDER BY 
    TotalUnidadesDevueltas DESC;
