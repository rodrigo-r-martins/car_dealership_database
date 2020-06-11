CREATE TABLE customer (
  custId varchar(30) NOT NULL,
  firstName varchar(45) NOT NULL,
  lastName varchar(45) NOT NULL,
  street varchar(45),
  city varchar(45),
  state char(2),
  zip int,
  phoneArea int,
  phoneNumber int,
  driveLicenseNum varchar(11),
  referredBy varchar(45),
  adSeen varchar(45),
  CONSTRAINT custId_pk PRIMARY KEY (custId));
  

CREATE TABLE salesperson (
  salespersonId varchar(30) NOT NULL,
  firstName varchar(45) NOT NULL,
  lastName varchar(45) NOT NULL,
  street varchar(45),
  city varchar(45),
  state char(2),
  zip int,
  homePhoneArea int,
  homePhoneNumber int,
  officePhoneArea int,
  officePhoneNumber int,
  cellPhoneArea int,
  cellPhoneNumber int,
  dateHired date,
  CONSTRAINT salespersonId_pk PRIMARY KEY (salespersonId));


CREATE TABLE newcar (
  VIN varchar(30) NOT NULL,
  make varchar(45),
  model varchar(45),
  listPrice decimal(10,2),
  dateOfManufacture date,
  placeOfManufacture varchar(45),
  cylinders int,
  doors int,
  weight int,
  capacity int,
  color varchar(45),
  deliveryDate date,
  deliveryMiles int,
  CONSTRAINT vinnew_pk PRIMARY KEY (VIN));


CREATE TABLE options_menu (
  carOption int NOT NULL,
  price decimal(10,2),
  CONSTRAINT caroption_pk PRIMARY KEY (carOption));


CREATE TABLE newcar_options (
  VIN varchar(30) NOT NULL,
  carOption int NOT NULL,
  CONSTRAINT caroption_pk PRIMARY KEY (VIN, carOption),
  CONSTRAINT vinnew_fk FOREIGN KEY (VIN) REFERENCES newcar (VIN),
  CONSTRAINT caroption_fk FOREIGN KEY (carOption) REFERENCES options_menu (carOption));


CREATE TABLE usedcar (
  VIN varchar(30) NOT NULL,
  make varchar(45),
  model varchar(45),
  cylinders int,
  doors int,
  weight int,
  capacity int,
  color varchar(45),
  modelYear int,
  mileage int,
  bookValue decimal(10,2),
  CONSTRAINT vinused_pk PRIMARY KEY (VIN));

CREATE TABLE usedcar_feature (
  VIN varchar(30) NOT NULL,
  feature varchar(30) NOT NULL,
  CONSTRAINT usedcarfeature_pk PRIMARY KEY (VIN, feature));


CREATE TABLE insurance (
  policy varchar(45) NOT NULL,
  company varchar(45) NOT NULL,
  street varchar(45),
  city varchar(45),
  state char(2),
  zip int,
  phoneArea int,
  phoneNumber int,
  issueDate date,
  expirationDate date,
  CONSTRAINT insurance_pk PRIMARY KEY (policy, company));


CREATE TABLE registration (
  regNumber varchar(10) NOT NULL,
  licensePlate varchar(45),
  licenseFee decimal(10,2),
  CONSTRAINT registration_pk PRIMARY KEY (regNumber));


CREATE TABLE sale (
  invoiceNumber varchar(30) NOT NULL,
  saleDate date,
  salePrice decimal(10,2),
  tax decimal(10,2),
  registrationFee decimal(10,2),
  tradeInAmount decimal(10,2) DEFAULT '0.00',
  financedAmount decimal(10,2) DEFAULT '0.00',
  amountPaid decimal(10,2),
  amountDue decimal(10,2),
  salesPersonCommission decimal(10,2),
  saleMiles int,
  custId varchar(30) NOT NULL,
  salespersonId varchar(30) NOT NULL,
  newCarVIN varchar(30) DEFAULT NULL,
  usedCarVIN varchar(30) DEFAULT NULL,
  insurancePolicy varchar(45) NOT NULL,
  insuranceCompany varchar(45) NOT NULL,
  financingPolicy varchar(45) DEFAULT NULL,
  financingCompany varchar(45) DEFAULT NULL,
  tradeInVIN varchar(30) DEFAULT '0',
  registrationNumber varchar(10) NOT NULL,
  warranteeType varchar(45) NOT NULL,
  CONSTRAINT sale_pk PRIMARY KEY (invoiceNumber),
  CONSTRAINT custId_fk FOREIGN KEY (custId) REFERENCES customer (custId),
  CONSTRAINT salespersonId_fk FOREIGN KEY (salespersonId) REFERENCES salesperson (salespersonId),
  CONSTRAINT vinnewcar_fk FOREIGN KEY (newCarVIN) REFERENCES newcar (VIN),
  CONSTRAINT vinused_fk FOREIGN KEY (usedCarVIN) REFERENCES usedcar (VIN),
  CONSTRAINT insurancepolicycompany_fk FOREIGN KEY (insurancePolicy, insuranceCompany) REFERENCES insurance (policy, company),
  CONSTRAINT financingpolicycompany_fk FOREIGN KEY (financingPolicy, financingCompany) REFERENCES financing (policy, company),
  CONSTRAINT registrationnumber_fk FOREIGN KEY (registrationNumber) REFERENCES registration (regNumber),
  CONSTRAINT warranteetype_fk FOREIGN KEY (warranteeType) REFERENCES warrantee (warType));


CREATE TABLE sale_custom_item (
  invoiceNumber varchar(30) NOT NULL,
  customItem int NOT NULL,
  CONSTRAINT salecustom_pk PRIMARY KEY (invoiceNumber,customItem),
  CONSTRAINT invoicenumber_fk FOREIGN KEY (invoiceNumber) REFERENCES sale (invoiceNumber),
  CONSTRAINT customitem_fk FOREIGN KEY (customItem) REFERENCES customization_menu (customItem));

CREATE TABLE customization_menu (
  customItem int NOT NULL,
  price decimal(10,2) DEFAULT NULL,
  CONSTRAINT custommenu_pk PRIMARY KEY (customItem));


CREATE TABLE warrantee (
  warType varchar(45) NOT NULL,
  cost decimal(10,2),
  period varchar(30),
  CONSTRAINT warrantee_pk PRIMARY KEY (warType));


CREATE TABLE financing (
  policy varchar(45) NOT NULL,
  company varchar(45) NOT NULL,
  street varchar(45),
  city varchar(45),
  state char(2),
  zip int,
  phoneArea int,
  phoneNumber int,
  startDate date,
  amountFinanced decimal(10,2),
  rate varchar(10) DEFAULT '4% p.m',
  numberMonths int,
  CONSTRAINT financing_pk PRIMARY KEY (policy, company));


CREATE TABLE survey (
  surveyNumber varchar(30) NOT NULL,
  dealershipRating int,
  salespersonRating int,
  carRating int,
  invoiceNumber varchar(30) NOT NULL,
  CONSTRAINT survey_pk PRIMARY KEY (surveyNumber),
  CONSTRAINT invoice_fk FOREIGN KEY (invoiceNumber) REFERENCES sale (invoiceNumber));


CREATE TABLE ad (
  placedIn varchar(45) NOT NULL,
  initialDate date NOT NULL,
  totalCost decimal(10,2),
  frequency varchar(30),
  contactPerson varchar(45),
  phoneArea int,
  phoneNumber int,
  CONSTRAINT ad_pk PRIMARY KEY (placedIn, initialDate));
