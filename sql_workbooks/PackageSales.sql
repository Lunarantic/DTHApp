create table PACKAGESALES (
	PackageSales_id number (10,0) primary key not null,	
	Package_id number (3,0) not null,
	customer_id number (3,0) not null,
	Start_date DATE,
	End_date DATE
	);
	
INSERT INTO PACKAGESALES values ('121', '021', '01', '04-Mar-20', '05-Mar-22');
INSERT INTO PACKAGESALES values ('122', '022', '02', '02-Mar-20', '03-Mar-22');
INSERT INTO PACKAGESALES values ('123', '023', '03', '05-Mar-20', '06-Mar-22');
INSERT INTO PACKAGESALES values ('124', '024', '04', '08-Mar-20', '07-Mar-22');
INSERT INTO PACKAGESALES values ('125', '025', '05', '07-Mar-20', '08-Mar-22');
INSERT INTO PACKAGESALES values ('126', '026', '06', '03-Mar-20', '04-Mar-22');


select * from Packagesales;
