CREATE INDEX vinnew_idx ON newcar_options (VIN);
CREATE INDEX caroption_idx ON newcar_options (carOption);
CREATE INDEX custId_idx ON sale (custId);
CREATE INDEX salespersonId_idx ON sale (salespersonId);
CREATE INDEX vinnewcar_idx ON sale (newCarVIN);
CREATE INDEX vinusedcar_idx ON sale (usedCarVIN);
CREATE INDEX inspolicycompany_idx ON sale (insurancePolicy, insuranceCompany);
CREATE INDEX finpolicycompany_idx ON sale (financingPolicy, financingCompany);
CREATE INDEX registnumber_idx ON sale (registrationNumber);
CREATE INDEX warrantype_idx ON sale (warranteeType);
CREATE INDEX customitem_idx ON sale_custom_item (customItem);
CREATE INDEX invoicenumber_idx ON sale_custom_item (invoiceNumber);
CREATE INDEX invoicenum_idx ON survey (invoiceNumber);
CREATE UNIQUE INDEX salespersonname_idx ON salesperson (firstName, lastName);
CREATE UNIQUE INDEX customerdrivelicense_idx ON customer (driveLicenseNum);

