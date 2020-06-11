CREATE TRIGGER formatting_values
BEFORE INSERT ON customer
FOR EACH ROW
SET 
NEW.firstName = CONCAT(UPPER(LEFT(new.firstName, 1)), SUBSTRING(new.firstName, 2)),
NEW.lastName = CONCAT(UPPER(LEFT(new.lastName, 1)), SUBSTRING(new.lastName, 2));
