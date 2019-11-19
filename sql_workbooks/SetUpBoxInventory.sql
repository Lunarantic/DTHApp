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

insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 1, '01-000000', '0000-0000-0000-0000', 0, null, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 1, '01-000001', '0000-0000-0000-0001', 0, null, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 1, '01-000002', '0000-0000-0000-0002', 0, null, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 1, '01-000003', '0000-0000-0000-0003', 0, null, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 1, '01-000004', '0000-0000-0000-0004', 0, null, null, null);

insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 2, '02-000000', '0000-0000-0000-0005', 0, null, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 2, '02-000001', '0000-0000-0000-0006', 0, null, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 2, '02-000002', '0000-0000-0000-0007', 0, null, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 2, '02-000003', '0000-0000-0000-0008', 0, null, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 2, '02-000004', '0000-0000-0000-0009', 0, null, null, null);

insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 3, '03-000000', '0000-0000-0000-000A', 0, null, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 3, '03-000001', '0000-0000-0000-000B', 0, null, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 3, '03-000002', '0000-0000-0000-000C', 0, null, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 3, '03-000003', '0000-0000-0000-000D', 0, null, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 3, '03-000004', '0000-0000-0000-000E', 0, null, null, null);

insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 4, '04-000000', '0000-0000-0000-000F', 0, null, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 4, '04-000001', '0000-0000-0000-000G', 0, null, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 4, '04-000002', '0000-0000-0000-000H', 0, null, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 4, '04-000003', '0000-0000-0000-000I', 0, null, null, null);
insert into SETUPBOXINVENTORY values (SETUPBOXINV_SEQ.NEXTVAL, 4, '04-000004', '0000-0000-0000-000J', 0, null, null, null);