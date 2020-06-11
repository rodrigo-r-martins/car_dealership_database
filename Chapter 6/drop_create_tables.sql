-- Dropping the existing tables for the car_dealership
DROP TABLE sale_custom_item;
DROP TABLE survey;
DROP TABLE sale;
DROP TABLE newcar_options;
DROP TABLE usedcar_feature;
DROP TABLE customization_menu;
DROP TABLE financing;
DROP TABLE customer;
DROP TABLE salesperson;
DROP TABLE newcar;
DROP TABLE options_menu;
DROP TABLE usedcar;
DROP TABLE insurance;
DROP TABLE registration;
DROP TABLE warrantee;
DROP TABLE ad;
DROP TABLE zips;

-- Creating new tables for the car_dealership
CREATE TABLE zips (
  zip int NOT NULL AUTO_INCREMENT,
  city varchar(45),
  state char(2),
  CONSTRAINT zip_pk PRIMARY KEY (zip));

CREATE TABLE ad (
  adNumber int NOT NULL AUTO_INCREMENT,
  placedIn varchar(45) NOT NULL,
  initialDate date NOT NULL,
  totalCost decimal(10,2),
  frequency varchar(30),
  contactPerson varchar(45),
  phoneArea int,
  phoneNumber int,
  CONSTRAINT ad_pk PRIMARY KEY (adNumber));

CREATE TABLE customer (
  custId int NOT NULL AUTO_INCREMENT,
  firstName varchar(45) NOT NULL,
  lastName varchar(45) NOT NULL,
  street varchar(45), 
  zip int,
  phoneArea int,
  phoneNumber int,
  driveLicenseNum varchar(11),
  referredBy varchar(45),
  adSeen int NOT NULL,
  CONSTRAINT custId_pk PRIMARY KEY (custId),
  CONSTRAINT zip_fk FOREIGN KEY (zip) REFERENCES zips(zip),
  CONSTRAINT ad_fk FOREIGN KEY (adSeen) REFERENCES ad(adNumber));
  
CREATE TABLE salesperson (
  salespersonId int NOT NULL AUTO_INCREMENT,
  firstName varchar(45) NOT NULL,
  lastName varchar(45) NOT NULL,
  street varchar(45),
  zip int,
  homePhoneArea int,
  homePhoneNumber int,
  officePhoneArea int,
  officePhoneNumber int,
  cellPhoneArea int,
  cellPhoneNumber int,
  dateHired date,
  CONSTRAINT salespersonId_pk PRIMARY KEY (salespersonId), 
  CONSTRAINT zip1_fk FOREIGN KEY (zip) REFERENCES zips(zip));

CREATE TABLE newcar (
  newCarId int NOT NULL AUTO_INCREMENT,
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
  CONSTRAINT newCarId_pk PRIMARY KEY (newCarId));

CREATE TABLE options_menu (
  carOption int NOT NULL AUTO_INCREMENT,
  price decimal(10,2),
  CONSTRAINT caroption_pk PRIMARY KEY (carOption));

CREATE TABLE newcar_options (
  newCarId int NOT NULL,
  carOption int NOT NULL,
  CONSTRAINT caroption_pk PRIMARY KEY (newCarId, carOption),
  CONSTRAINT newcarId_fk FOREIGN KEY (newCarId) REFERENCES newcar (newCarId),
  CONSTRAINT caroption_fk FOREIGN KEY (carOption) REFERENCES options_menu (carOption));

CREATE TABLE usedcar (
  usedCarId int NOT NULL AUTO_INCREMENT,
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
  CONSTRAINT usedCarId_pk PRIMARY KEY (usedCarId));

CREATE TABLE usedcar_feature (
  usedCarId int NOT NULL,
  feature varchar(30) NOT NULL,
  CONSTRAINT usedcarfeature_pk PRIMARY KEY (usedCarId, feature));

CREATE TABLE insurance (
  insId int NOT NULL AUTO_INCREMENT,
  policy varchar(45) NOT NULL,
  company varchar(45) NOT NULL,
  street varchar(45),
  zip int,
  phoneArea int,
  phoneNumber int,
  issueDate date,
  expirationDate date,
  CONSTRAINT insurance_pk PRIMARY KEY (insId), 
  CONSTRAINT zip2_fk FOREIGN KEY (zip) REFERENCES zips(zip));

CREATE TABLE registration (
  regNumber int NOT NULL AUTO_INCREMENT,
  licensePlate varchar(45),
  licenseFee decimal(10,2),
  CONSTRAINT registration_pk PRIMARY KEY (regNumber));

CREATE TABLE customization_menu (
  customId int NOT NULL AUTO_INCREMENT,
  customItem varchar(45) NOT NULL,
  price decimal(10,2) DEFAULT NULL,
  CONSTRAINT custommenu_pk PRIMARY KEY (customId));

CREATE TABLE warrantee (
  warId int NOT NULL AUTO_INCREMENT,
  warType varchar(45) NOT NULL,
  cost decimal(10,2),
  period varchar(30),
  CONSTRAINT warrantee_pk PRIMARY KEY (warId));

CREATE TABLE financing (
  finId int NOT NULL AUTO_INCREMENT,
  policy varchar(45) NOT NULL,
  company varchar(45) NOT NULL,
  street varchar(45),
  zip int,
  phoneArea int,
  phoneNumber int,
  startDate date,
  amountFinanced decimal(10,2),
  rate varchar(10) DEFAULT '4% p.m',
  numberMonths int,
  CONSTRAINT financing_pk PRIMARY KEY (finId), 
  CONSTRAINT zip3_fk FOREIGN KEY (zip) REFERENCES zips(zip));

CREATE TABLE sale (
  invoiceNumber int NOT NULL AUTO_INCREMENT,
  saleDate date,
  salePrice decimal(10,2),
  tax decimal(10,2),
  tradeInAmount decimal(10,2) DEFAULT '0.00',
  amountPaid decimal(10,2),
  amountDue decimal(10,2),
  saleMiles int,
  customerId int NOT NULL,
  salespersonId int NOT NULL,
  newCarId int DEFAULT NULL,
  usedCarId int DEFAULT NULL,
  insuranceId int NOT NULL,
  financingId int DEFAULT NULL,
  tradeInVIN varchar(30) DEFAULT '0',
  registrationNumber int NOT NULL,
  warranteeId int NOT NULL,
  CONSTRAINT sale_pk PRIMARY KEY (invoiceNumber),
  CONSTRAINT custId_fk FOREIGN KEY (customerId) REFERENCES customer (custId),
  CONSTRAINT salespersonId_fk FOREIGN KEY (salespersonId) REFERENCES salesperson (salespersonId),
  CONSTRAINT newcar_fk FOREIGN KEY (newCarId) REFERENCES newcar (newCarId),
  CONSTRAINT usedcar_fk FOREIGN KEY (usedCarId) REFERENCES usedcar (usedCarId),
  CONSTRAINT insurance_fk FOREIGN KEY (insuranceId) REFERENCES insurance (insId),
  CONSTRAINT financing_fk FOREIGN KEY (financingId) REFERENCES financing (finId),
  CONSTRAINT registrationnumber_fk FOREIGN KEY (registrationNumber) REFERENCES registration (regNumber),
  CONSTRAINT warrantee_fk FOREIGN KEY (warranteeId) REFERENCES warrantee (warId));

CREATE TABLE sale_custom_item (
  invoiceNumber int NOT NULL,
  customId int NOT NULL,
  CONSTRAINT salecustom_pk PRIMARY KEY (invoiceNumber,customId),
  CONSTRAINT invoicenumber_fk FOREIGN KEY (invoiceNumber) REFERENCES sale (invoiceNumber),
  CONSTRAINT customitem_fk FOREIGN KEY (customId) REFERENCES customization_menu (customId));

CREATE TABLE survey (
  surveyNumber int NOT NULL AUTO_INCREMENT,
  dealershipRating int,
  salespersonRating int,
  carRating int,
  invoiceNumber int NOT NULL,
  CONSTRAINT survey_pk PRIMARY KEY (surveyNumber),
  CONSTRAINT invoice_fk FOREIGN KEY (invoiceNumber) REFERENCES sale (invoiceNumber));


