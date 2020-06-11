-- Query 01: What is the most expensive new car available?
SELECT
	make,
    model,
    listPrice
FROM newcar
WHERE listPrice=(select max(listPrice) from newcar);

-- Query 02: Who are the customers who live in New York?
SELECT
	c.firstName,
    c.lastName,
    c.street,
    z.city,
    z.state,
    z.zip
FROM customer c
JOIN zips z
	ON c.zip = z.zip
WHERE state='NY';

-- Query 03: Which sales were made between April 2019 and December 2019?
SELECT 
	invoiceNumber,
    saleDate,
    salePrice,
    newCarId,
    usedcarId
FROM sale
WHERE saleDate BETWEEN '2019-04-01' AND '2019-12-31';

-- Query 04: What model, year, color and price of Subaru used cars available?
SELECT
	make,
	model,
	modelYear,
    color,
    bookValue
FROM usedcar
WHERE make = 'Subaru';

-- Query 05: Which insurance companies have been contracted by customers?
SELECT
	DISTINCT company
FROM insurance;