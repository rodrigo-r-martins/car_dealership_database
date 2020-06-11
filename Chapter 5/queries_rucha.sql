-- Query 01: List the Customer’s Id, Name and City who bought a car by dealing with Salesperson ‘Pat’
SELECT 
	custID, 
	firstName, 
	lastName, 
    city,
    state
FROM customer
WHERE custID In (
	SELECT custID FROM sale
	WHERE salespersonId In (
		SELECT salespersonId FROM salesperson
		WHERE firstName LIKE '%Pat%'));

-- Query 02: List the Warantee details of the new car Land Rover
SELECT * FROM warrantee
WHERE warType In (
	SELECT warranteeType FROM sale
	WHERE newCarVIN In (
		SELECT VIN FROM newcar
		WHERE make LIKE '%Land Rover%'));

-- Query 03: List the registration details of the used car Subaru
SELECT * FROM registration
WHERE regNumber In (
	SELECT registrationNumber FROM sale
	WHERE tradeInVIN In (
		SELECT VIN FROM UsedCar
		WHERE make LIKE '%Subaru%'));

-- Query 04: List down the VIN and model of the new car whose sale price is 47337
SELECT 
	VIN, 
	model 
FROM newcar
WHERE VIN In (
	SELECT newCarVIN FROM sale
	WHERE salePrice LIKE '%47337%');

-- Query 05: List down the Survey details placed by customer Marge
SELECT * FROM survey
WHERE invoiceNumber In (
	SELECT invoiceNumber FROM sale
	WHERE custId In (
		SELECT custId FROM customer
		WHERE firstName LIKE '%Marge%'));
        


