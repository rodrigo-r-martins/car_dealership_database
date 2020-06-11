-- Create a value-independent view that hides some private information
CREATE VIEW customerview AS 
	SELECT 
		c.custId, 
		c.firstName, 
        c.lastName, 
        c.street, 
        z.city,
        z.state,
        c.zip, 
        c.phoneArea, 
        c.phoneNumber
	FROM customer as c
    JOIN zips as z
		ON c.zip = z.zip;

-- Test view
SELECT * FROM customerview;