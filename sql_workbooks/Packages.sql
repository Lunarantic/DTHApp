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
