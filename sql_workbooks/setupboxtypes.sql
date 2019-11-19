CREATE table SetUpBoxTypesBox (
	ID numeric(10,0) PRIMARY KEY,
	stbtype varchar(255),
	features varchar(255),
	dimensions varchar(255),
	price numeric(10,2),
	installationCharges numeric(10,2),
	upgrationCharges numeric(10,2),
	discount numeric(5,2),
	billingType varchar(255),
	refundableAmount numeric(10,2)
);

insert into SetUpBoxTypesBox values (1, 'Standard', '','30 x 20 x 5', 4000.00, 150.50, 0, 2.0, 'Post Paid', 1000);
insert into SetUpBoxTypesBox values (2, 'High Definition (HD)', '', '30 x 20 x 5', 5500.00, 100.00, 100, 2.2, 'Pre Paid', 0);
insert into SetUpBoxTypesBox values (3, 'High Definition Recorder HD+', '', '30 x 20 x 5', 6000.00, 50.00, 170, 4.0, 'Pre Paid', 0);
insert into SetUpBoxTypesBox values (4, 'IPTV', '','30 x 20 x 5', 7500.00, 50.00, 1000, 10, 'Post Paid', 1000);

select * from SetUpBoxTypesBox;

select * from SetUpBoxTypesBox where billingType = 'Post Paid' AND stbtype = 'Standard';


