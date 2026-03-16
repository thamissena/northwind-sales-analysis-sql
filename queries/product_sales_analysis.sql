-- 1.Visão Geral: Lista dos nomes de todos os produtos e seus preços.
SELECT 
ProductName as nome_produto, 
UnitPrice as preco_produto,
'Northwind' as empresa
FROM Product p;

-- 2. Filtra por valores numéricos: Ver apenas produtos que custam mais de 20 reais E que têm menos de 10 unidades no estoque.
SELECT ProductName, UnitPrice
FROM Product p 
WHERE UnitPrice > 20
AND UnitsInStock <10
ORDER BY UnitPrice DESC;

-- 3.O TOTAL de quanto foi vendido e  qual o preço médio 
SELECT
	COUNT(*) AS Qtd_Produtos,
	AVG(UnitPrice) AS Preco_Medio
FROM Product
ORDER BY Preco_Medio DESC;

-- 3.1 TOTAL de quanto foi vendido e  qual o preço médio por categoria 
SELECT
	CategoryId,
	COUNT(*) AS Qtd_Produtos,
	AVG(UnitPrice) AS Preco_Medio
FROM Product
GROUP BY CategoryId 
ORDER BY Preco_Medio DESC;

-- 3.2.Identificar o NOME das categorias
SELECT 
	p.CategoryId,
	c.CategoryName,
	COUNT(p.id) AS Qtd_Produtos,
	AVG(p.UnitPrice) AS Preco_Medio
FROM Product as p
JOIN Category as c on c.id = p.CategoryID 
GROUP BY p.CategoryId
ORDER BY Preco_Medio DESC;

-- 4. As 3 categorias de produtos que mais geraram receita total.
SELECT ¾
    c.CategoryName AS Nome_Categoria,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) as Receita
FROM Category as c
JOIN Product as p 
	ON c.Id = p.CategoryId
JOIN OrderDetail as od 
	ON od.ProductId = p.Id
GROUP BY c.CategoryName
ORDER BY Receita DESC
LIMIT 3;

