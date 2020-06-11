INSERT INTO zips (zip, city, state) 
VALUES 
(13905,'Lynn','MA'),
(13217,'Syracuse','NY'),
(14624,'Rochester','NY'),
(10155,'New York City','NY'),
(17405,'York','PA');

INSERT INTO ad (adNumber, placedIn, initialDate, totalCost, frequency, contactPerson, phoneArea, PhoneNumber) 
VALUES 
(DEFAULT,'Internet','2019-02-09',143.00,'3','Sheff Nern',462,4183703),
(DEFAULT,'Magazine','2019-10-12',196.00,'3','Rodney Luke',950,5379358),
(DEFAULT,'Newspaper','2019-03-18',275.00,'2','Gunther Sole',914,6011763),
(DEFAULT,'Radio','2019-02-15',264.00,'5','Anselma O\'Connolly',224,4736611),
(DEFAULT,'TV','2019-06-21',208.00,'1','Dannel Matyushonok',495,6948514);

INSERT INTO customer (custId, firstName, lastName, street, zip, phoneArea, phoneNumber, driveLicenseNum, referredBy, adSeen) 
VALUES 
(DEFAULT,'Ari','Feavearyear','29468 Trailsway Hill',13905,565,1519997,'592-10-6337','Greg Tomas',5),
(DEFAULT,'Merrick','Ogger','1 Pond Alley',13217,684,4276587,'798-62-0623','Bill Miler',4),
(DEFAULT,'Pauletta','Stallwood','774 Larry Circle',14624,729,8809712,'686-23-0548','Carol Han',4),
(DEFAULT,'Marge','Bonhill','33041 Chinook Point',10155,983,2858761,'722-04-0644','Chun Kai',2),
(DEFAULT,'Rachael','Nourse','59254 Sage Center',17405,834,2586399,'886-52-1866','Garret Cart',2);

INSERT INTO customization_menu (customId, customItem, price) 
VALUES 
(DEFAULT,'gps system',156.00),
(DEFAULT,'alarm system',243.00),
(DEFAULT,'sun roof',465.00),
(DEFAULT,'leather seats',122.00),
(DEFAULT,'new color',321.00);

INSERT INTO financing (finId, policy, company, street, zip, phoneArea, phoneNumber, startDate, amountFinanced, rate, numberMonths) 
VALUES 
(DEFAULT,'FIN001','Citibank','655 Straubel Way',14624,914,4028607,'2019-01-05',15000.00,NULL,36),
(DEFAULT,'FIN002','HSBC','77119 Prairieview Way',14624,203,7563868,'2019-11-11',12000.00,NULL,36),
(DEFAULT,'FIN003','US Bank','9 Springview Drive',13217,974,9438954,'2019-07-10',10000.00,NULL,24),
(DEFAULT,'FIN004','Citibank','12 Summer Ridge Terrace', 17405,172,8915964,'2018-10-30',15000.00,NULL,48),
(DEFAULT,'FIN005','HSBC','261 Bobwhite Park',10155,914,1240079,'2019-06-15',13000.00,NULL,36);

INSERT INTO insurance (insId, policy, company, street, zip, phoneArea, phoneNumber, issueDate, expirationDate) 
VALUES 
(DEFAULT,'INS001','Geico','2243 Central Park Ave', 14624,203,2077847,'2019-01-04','2019-07-04'),
(DEFAULT,'INS002','Liberty','2243 Main Ave', 14624,203,2077847,'2019-10-09','2020-04-09'),
(DEFAULT,'INS003','Geico','2243 Central Park Ave',10155,914,2077847,'2019-08-24','2020-02-24'),
(DEFAULT,'INS004','Geico','2243 Central Park Ave',10155,914,2077847,'2019-08-27','2020-02-27'),
(DEFAULT,'INS005','Liberty','2651 Strang Blvd Floor One',17405,172,7850180,'2019-11-20','2020-05-20');

INSERT INTO newcar (newCarId, VIN, make, model, listPrice, dateOfManufacture, placeOfManufacture, cylinders, doors, weight, capacity, color, deliveryDate, deliveryMiles) 
VALUES 
(DEFAULT,'1C3CCBCG8DN043829','Land Rover','Discovery',47337.00,'2019-05-22','New York',6,5,3693,5,'Black','2019-06-01',102),
(DEFAULT,'1D7RB1CT7BS881175','Volkswagen','Golf',17264.00,'2019-08-10','New York',4,5,5868,5,'White','2019-12-02',129),
(DEFAULT,'1G4HH5E90AU691486','Volkswagen','Passat',22209.00,'2019-07-18','New York',4,5,3800,5,'Blue','2019-08-02',51),
(DEFAULT,'3C63D3HL7CG670654','Subaru','Crosstrek',20461.00,'2019-09-13','New York',4,5,4888,5,'Blue','2019-11-10',567),
(DEFAULT,'3VW517AT1EM034793','Ford','Edge',31292.00,'2019-08-05','New Jersey',6,5,4413,5,'Blue','2019-09-15',648);

INSERT INTO options_menu (carOption, price) 
VALUES 
(DEFAULT,1643.00),
(DEFAULT,945.00),
(DEFAULT,695.00),
(DEFAULT,539.00),
(DEFAULT,224.00);

INSERT INTO newcar_options (newCarId, carOption) 
VALUES 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);

INSERT INTO registration (regNumber, licensePlate, licenseFee) 
VALUES 
(DEFAULT,'Y31FAC',102.00),
(DEFAULT,'N16FKN',81.00),
(DEFAULT,'F44FAE',81.00),
(DEFAULT,'H98FHO',110.00),
(DEFAULT,'K99FHB',85.00);

INSERT INTO usedcar (usedCarId, VIN, make, model, cylinders, doors, weight, capacity, color, modelYear, mileage, bookValue) 
VALUES 
(DEFAULT,'2HNYD28257H276330','Subaru','Impreza',4,5,4320,5,'Black',2015,9923,15000.00),
(DEFAULT,'3N1CN7AP4FL777122','Honda','CRV',4,5,3790,5,'Blue',2016,10612,17000.00),
(DEFAULT,'WA1C8AFP8DA597506','BMW','328i',4,5,4123,5,'Black',2017,13199,26000.00),
(DEFAULT,'WAUCVAFRXCA314714','Nissan','Rogue',4,5,4090,5,'Black',2018,21308,16000.00),
(DEFAULT,'WBAKG1C57BE375422','Volkswagen','Golf',4,5,3902,5,'Gray',2015,9407,13000.00),
(DEFAULT,'WDDHF2EB6DA278138','Subaru','Crosstrek',4,5,4145,5,'White',2016,3374,17000.00);

INSERT INTO usedcar_feature (usedCarId, feature) 
VALUES 
(1,'sunroof'),
(2,'gpsSystem'),
(3,'sunroof+gpsSystem'),
(4,'gpsSystem'),
(5,'sunroof');

INSERT INTO warrantee (warId, warType, cost, period) 
VALUES 
(DEFAULT,'Accessories Warranty',600.00,'2 years'),
(DEFAULT,'New Car Warranty',1000.00,'2 years'),
(DEFAULT,'New Car Warranty Extension',1700.00,'4 years'),
(DEFAULT,'Powertrain Warranty',1300.00,'2 years'),
(DEFAULT,'Used Car Warrantee',500.00,'90 days');

INSERT INTO salesperson (salespersonId, firstName, lastName, street, zip, homePhoneArea, homePhoneNumber, officePhoneArea, officePhoneNumber, cellPhoneArea, cellPhoneNumber, dateHired) 
VALUES 
(DEFAULT,'Pat','Cawtheray','5 Pankratz Park',14624,786,3542296,422,7436544,786,9632453,'2019-02-23'),
(DEFAULT,'Ari','Rembrant','3 Texas Plaza',10155,122,4076779,422,7436554,122,6435647,'2019-01-26'),
(DEFAULT,'Timotheus','Yeowell','03634 Talmadge Lane',10155,522,5740369,422,7436564,522,8646321,'2018-08-13'),
(DEFAULT,'Rosalyn','Kuhnhardt','62084 Dexter Point',10155,282,9200832,422,7436574,282,9654771,'2018-03-20'),
(DEFAULT,'Lyman','Bottomer','054 Amoth Avenue',14624,936,3733865,422,7436584,936,7129836,'2018-06-23');

INSERT INTO sale (invoiceNumber, saleDate, salePrice, tax, tradeInAmount, amountPaid, amountDue, saleMiles, customerId, salespersonId, newCarId, usedCarId, insuranceId, financingId, tradeInVIN, registrationNumber, warranteeId) 
VALUES 
(DEFAULT,'2019-07-28',47337.00,4733.00,0.00,47337.00,0.00,135,1,2,1,NULL,1,NULL,NULL,1,1),
(DEFAULT,'2019-08-24',17264.00,1726.00,0.00,17264.00,0.00,123,2,4,2,NULL,2,NULL,NULL,2,2),
(DEFAULT,'2019-12-14',20461.00,2046.00,0.00,20461.00,0.00,123,3,4,4,NULL,3,NULL,'WBAKG1C57BE375422',3,1),
(DEFAULT,'2019-04-21',31292.00,3129.00,0.00,21292.00,10000.00,123,4,3,5,NULL,4,3,NULL,4,2),
(DEFAULT,'2019-04-29',26000.00,2600.00,0.00,11000.00,15000.00,123,5,5,NULL,3,5,1,NULL,5,3);

INSERT INTO sale_custom_item (invoiceNumber, customId) 
VALUES 
(1,5),
(2,1),
(3,1),
(4,3),
(5,2);

INSERT INTO survey (surveyNumber, dealershipRating, salespersonRating, carRating, invoiceNumber) 
VALUES 
(DEFAULT,2,2,3,1),
(DEFAULT,2,3,3,2),
(DEFAULT,2,3,2,3),
(DEFAULT,1,2,2,4),
(DEFAULT,3,3,2,5);