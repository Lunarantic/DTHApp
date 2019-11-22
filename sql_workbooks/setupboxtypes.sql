create table billingtype (
	id numeric(1,0) primary key,
	billingtype nvarchar2(255)
);

insert into billingtype values (0, 'Post Paid');
insert into billingtype values (1, 'Pre Paid');


CREATE table SetUpBoxTypesBox (
	ID numeric(10,0) PRIMARY KEY,
	stbtype varchar(255),
	features varchar(255),
	dimensions varchar(255),
	price numeric(10,2),
	installationCharges numeric(10,2),
	upgrationCharges numeric(10,2),
	discount numeric(5,2),
	billingType numeric(1,0),
	refundableAmount numeric(10,2),
	
	constraint fk_stbtype_billtype FOREIGN KEY (billingtype) REFERENCES billingtype (id)
);

insert into SetUpBoxTypesBox values (1, 'Standard', '','30 x 20 x 5', 4000.00, 150.50, 0, 2.0, 0, 1000);
insert into SetUpBoxTypesBox values (2, 'High Definition (HD)', '', '30 x 20 x 5', 5500.00, 100.00, 100, 2.2, 1, 0);
insert into SetUpBoxTypesBox values (3, 'High Definition Recorder HD+', '', '30 x 20 x 5', 6000.00, 50.00, 170, 4.0, 1, 0);
insert into SetUpBoxTypesBox values (4, 'IPTV', '','30 x 20 x 5', 7500.00, 50.00, 1000, 10, 0, 1000);
