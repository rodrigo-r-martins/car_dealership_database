CREATE TRIGGER formatting_values
BEFORE INSERT ON customer
FOR EACH ROW
SET 
NEW.firstName = CONCAT(UPPER(LEFT(new.firstName, 1)), SUBSTRING(new.firstName, 2)),
NEW.lastName = CONCAT(UPPER(LEFT(new.lastName, 1)), SUBSTRING(new.lastName, 2)),
NEW.custId = CONCAT(UPPER(LEFT(new.custId, 1)), SUBSTRING(new.custId, 2)),
NEW.city = CONCAT(UPPER(LEFT(new.city, 1)), SUBSTRING(new.city, 2)),
NEW.state = UPPER(NEW.state);

INSERT INTO customer values ('c011', 'rodrigo', 'martins', '750 Summer Street', 'stamford', 'ct', null, null, null, null, null, null);

DROP TRIGGER formatting_values;
