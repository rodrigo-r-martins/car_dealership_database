-- Set up an audit trail trigger for updates to a sensitive item that users can update
SET @username := user();

-- Create the table for the audit trail
CREATE TABLE newcar_price_audit (
	dateofChange	DATE,
    userChanged		VARCHAR(50),
	IDofNewCar		INT(6),
	oldPrice		DECIMAL(10,2),
	newPrice		DECIMAL(10,2));

-- Create trigger
DELIMITER %
CREATE TRIGGER NewCarPriceAuditTrail
	BEFORE UPDATE ON newcar
	FOR EACH ROW
    BEGIN
		INSERT INTO newcar_price_audit VALUES (
			NOW(),
            @username,
			OLD.newCarId,
			OLD.listPrice, 
			NEW.listPrice);
	END%
DELIMITER ;

-- Testing the audit trail trigger
SELECT * FROM newcar WHERE newCarId = 3;
SELECT * FROM newcar_price_audit;
UPDATE car_dealership.newcar SET listPrice = '24300.00' WHERE (newCarId = 3);
SELECT * FROM newcar_price_audit;