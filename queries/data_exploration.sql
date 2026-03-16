-- Exploração dedos:
SELECT *
FROM  Product p LIMIT 10;

SELECT *
FROM  Product p ORDER BY UnitPrice, ProductName LIMIT 10;


SELECT 
	COUNT(*) AS Total_tipos_Produtos
FROM Product p; 


SELECT 
	COUNT(DISTINCT CompanyName) AS Total_clientes
FROM Customer c; 

SELECT *
FROM OrderDetail ;

SELECT *
FROM Category c;

