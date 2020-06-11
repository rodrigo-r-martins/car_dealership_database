-- Create a user and authorize that person to read the view
CREATE USER 'U_001' IDENTIFIED BY '12345';
GRANT SELECT ON CustomerView TO 'U_001';

-- Create and authorize four other users to access and/or modify various parts of the database
CREATE USER 'U_002' IDENTIFIED BY '12345';
CREATE USER 'U_003' IDENTIFIED BY '12345';
CREATE USER 'U_004' IDENTIFIED BY '12345';
CREATE USER 'U_005' IDENTIFIED BY '12345';

GRANT SELECT ON sale TO 'U_002';
GRANT ALL PRIVILEGES ON financing TO 'U_003';
GRANT SELECT, UPDATE, INSERT, DELETE ON newcar TO 'U_004' WITH GRANT OPTION;
GRANT UPDATE ON salesperson TO 'U_005';

-- Showing grant for each user
USE mysql;
SELECT * FROM tables_priv;
