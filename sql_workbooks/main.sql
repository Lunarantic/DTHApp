drop sequence SETUPBOXINV_SEQ;

drop table SETUPBOXINVENTORY;
drop table SetUpBoxTypesBox;
drop table PackageChannels;
drop table PACKAGES;
drop table CHANNELS;
drop table customers;
drop table billingtype;
drop table PACKAGESALES;
drop table retailers;
drop table SetUpBoxBills;


---------------CHANNELS--------------
CREATE TABLE channels (id NUMERIC, 
					name VARCHAR(100), 
					charge NUMERIC(6,2), 
					channel_type NUMERIC, 
					PRIMARY KEY(id));
					
INSERT INTO channels(id, name, charge, channel_type) VALUES (1, 'HBO', 10, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (2, 'Cartoon Network', 15, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (3, 'Comedy Central', 12, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (4, 'National Geographic', 10, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (5, 'Animal Planet', 10, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (6, 'ESPN', 20, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (7, 'STAR Sports', 20, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (8, 'Nickelodeon', 15, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (9, 'BBC', 10, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (10, 'Discovery', 10, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (11, 'Food Network', 10, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (12, 'ABC', 0, 0);
INSERT INTO channels(id, name, charge, channel_type) VALUES (13, 'NBC', 0, 0);
INSERT INTO channels(id, name, charge, channel_type) VALUES (14, 'FOX', 0, 0);
INSERT INTO channels(id, name, charge, channel_type) VALUES (15, 'MTV', 10, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (16, 'BabyTV', 30, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (17, 'Hallmark', 15, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (18, 'History TV', 10, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (19, 'Cooking Channel', 10, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (20, 'CBS', 0, 0);


-------------------Customers----------------
create table Customers(
	CustomerId NUMBER primary key,
	FirstName VARCHAR(20),
	LastName VARCHAR(20),
	EmailId VARCHAR(20),
	State VARCHAR(20),
	Password VARCHAR(20),
	ReatailorId NUMBER,
	Amount numeric(12,2)
);

INSERT INTO CUSTOMERS VALUES(1, 'john', 'cena', 'johncena@mail.com', 'Virginia', 'jona', 1, 10000.0);
INSERT INTO CUSTOMERS VALUES(2, 'dan', 'smith', 'dansmith@mail.com', 'Milford', 'dath', 2, 15000.0);
INSERT INTO CUSTOMERS VALUES(3, 'peter', 'pan', 'peterpan@mail.com', 'Delaware', 'pean', 3, 11000.0);
INSERT INTO CUSTOMERS VALUES(4, 'sandra', 'anders', 'sandranders@mail.com', 'Florida', 'sars', 4, 20000.0);
INSERT INTO CUSTOMERS VALUES(5, 'marian', 'gold', 'mariangold@mail.com', 'California', 'mald', 5, 25000.0);
INSERT INTO CUSTOMERS VALUES(6, 'kim', 'wild', 'kimwild@mail.com', 'Kentucy', 'kild', 1, 20050.0);


--------------------PACKAGES---------------------------
create table Packages(id NUMBER primary key,
                      name varchar(20),
                      category varchar(20),
                      chargingtype number,
                      Datefrom DATE,
                      Dateto DATE
);
INSERT into PACKAGES values(1,'Kids','Kids',0,'09-APR-19','09-APR-22');
INSERT into PACKAGES values(2,'Sports','Sports',1,'05-JUN-19','05-JUN-24');
INSERT into PACKAGES values(3,'Entertainment','Entertainment',1,'25-Aug-18','25-Aug-29');
INSERT into PACKAGES values(4,'local','local',1,'09-JAN-18','09-JAN-22');
INSERT into PACKAGES values(5,'News','News',1,'31-May-18','09-APR-25');
INSERT into PACKAGES values(6,'Lifestyle','Lifestsyle',1,'12-Sep-18','09-Sep-26');


--------------------PACKAGECHANNELS-------------------------
CREATE table PackageChannels (
	PackageID number NOT NULL,
	ChannelID number NOT NULL,
	
	constraint fk_pc_pkgid FOREIGN KEY (PackageID) REFERENCES packages (id),
	constraint fk_pc_chnid FOREIGN KEY (ChannelID) REFERENCES channels (id)
);

insert into PackageChannels values(1, 2);
insert into PackageChannels values(1, 8);
insert into PackageChannels values(1, 16);
insert into PackageChannels values(2, 6);
insert into PackageChannels values(2, 7);
insert into PackageChannels values(3, 1);
insert into PackageChannels values(3, 3);
insert into PackageChannels values(4, 12);
insert into PackageChannels values(4, 20);
insert into PackageChannels values(5, 14);
insert into PackageChannels values(6, 11);
insert into PackageChannels values(6, 19);

--------------------PACKAGE SALES--------------------------------------
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


-----------------------RETAILERS----------------------------
create table retailers(id number primary key,
                        name varchar(20),
                        stblimit number,
                         creditlimit number,
                         commission number,
                         servicecharge number,
                        totalcost number);
INSERT into retailers values('1','John',30,50,2,2,200);
INSERT into retailers values('2','Smith',50,40,3,3,300);
INSERT into retailers values('3','Lida',20,30,1,5,600);
INSERT into retailers values('4','Kate',60,50,2,3,300);
INSERT into retailers values('5','Zen',40,30,2,4,200);


---------------------SETUPBOXBILLS-------------------------
create table SetUpBoxBills (
	id number primary key,
	customerId number,
	setupboxId number
	);
	
insert into SetUpBoxBills values (1, 20001, 12121); 
insert into SetUpBoxBills values (2, 20002, 12122); 
insert into SetUpBoxBills values (3, 20003, 12123); 
insert into SetUpBoxBills values (4, 20004, 12124); 
insert into SetUpBoxBills values (5, 20005, 12125); 
insert into SetUpBoxBills values (6, 20006, 12126); 
insert into SetUpBoxBills values (7, 20007, 12127); 
insert into SetUpBoxBills values (8, 20008, 12128); 
insert into SetUpBoxBills values (9, 20009, 12129); 


--------------------SETUPBOXINVENTORY-----------------------------------
create sequence SETUPBOXINV_SEQ start with 1 increment by 1 nocache nocycle;

create table SETUPBOXINVENTORY (
	SetUpBoxID number (10,0) primary key,	
	TypeID number (3,0) not null,
	SerialNo nvarchar2 (9) not null,
	MACID nvarchar2 (19) not null,
	Status number (1, 0) not null,
	RetailerID number (10, 0),
	CustomerID number (10, 0),
	PurchaseDate timestamp with time zone
);

insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 1, '01-000000', '0000-0000-0000-0000', 0, 1, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 1, '01-000001', '0000-0000-0000-0001', 0, 2, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 1, '01-000002', '0000-0000-0000-0002', 0, 3, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 1, '01-000003', '0000-0000-0000-0003', 0, 4, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 1, '01-000004', '0000-0000-0000-0004', 0, 5, null, null);

insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 2, '02-000000', '0000-0000-0000-0005', 0, 1, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 2, '02-000001', '0000-0000-0000-0006', 0, 2, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 2, '02-000002', '0000-0000-0000-0007', 0, 3, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 2, '02-000003', '0000-0000-0000-0008', 0, 4, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 2, '02-000004', '0000-0000-0000-0009', 0, 5, null, null);

insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 3, '03-000000', '0000-0000-0000-000A', 0, 1, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 3, '03-000001', '0000-0000-0000-000B', 0, 1, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 3, '03-000002', '0000-0000-0000-000C', 0, 2, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 3, '03-000003', '0000-0000-0000-000D', 0, 2, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 3, '03-000004', '0000-0000-0000-000E', 0, 3, null, null);

insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 4, '04-000000', '0000-0000-0000-000F', 0, 3, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 4, '04-000001', '0000-0000-0000-000G', 0, 4, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 4, '04-000002', '0000-0000-0000-000H', 0, 5, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 4, '04-000003', '0000-0000-0000-000I', 0, 5, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 4, '04-000004', '0000-0000-0000-000J', 0, 4, null, null);


----------------SETUPBOXTYPES------------------------------
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

---------------------------------------------------
