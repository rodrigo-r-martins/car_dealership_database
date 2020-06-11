-- Query 01: How many sales and the total commission that salesperson Pat have achieved?
SELECT 
	sp.firstName,
    sp.lastName,
	count(invoiceNumber) AS total_sales,
    sum(salesPersonCommission) AS total_commission
FROM sale s
JOIN salesperson sp
	ON s.salespersonId = sp.salespersonId
WHERE sp.firstName='Pat';

-- Query 02: How many sales and the total amount of sales have been achieved in 2019?
SELECT
	count(invoiceNumber) AS total_sales,
    sum(salePrice) as total_sale_price
FROM sale
WHERE saleDate BETWEEN '2019-01-01' AND '2019-12-31';
    