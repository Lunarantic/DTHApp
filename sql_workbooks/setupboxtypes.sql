CREATE table SetUpBoxTypesBox (
	ID number(10,0) PRIMARY KEY,
	Dimensions nvarchar2(255),
	Type number(3,0),
	Features nvarchar2(255),
	Price number(10,2),
	UpgrationCharges number(10,2),
	Discount number(5,2),
	BillingType nvarchar2(255),
	RefundableAmount number(10,2),
	InstallationCharges number(10,2)
)

insert into SetUpBoxTypesBox values (1, '30 x 20 x 5', 1, null, 100.00, 30.00, 0.20, null, 50.00, 50.00);
insert into SetUpBoxTypesBox values (2, '30 x 20 x 5', 2, '', 200.00, 30.00, 0.20, null, 150.00, 50.00);
insert into SetUpBoxTypesBox values (3, '30 x 20 x 5', 3, '', 300.00, 30.00, 0.20, null, 250.00, 50.00);
insert into SetUpBoxTypesBox values (4, '30 x 20 x 5', 4, '', 400.00, 30.00, 0.20, null, 300.00, 50.00);





