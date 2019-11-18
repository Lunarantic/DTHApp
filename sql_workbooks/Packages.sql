create table Packages(id NUMBER,
                      name varchar(20),
                      category varchar(20),
                      chargingtype number,
                      Datefrom DATE,
                      Dateto DATE
);
INSERT into PACKAGES values('1','Kids','Kids',0,'09-APR-18','09-APR-19');
INSERT into PACKAGES values('2','Sports','Sports',1,'05-JUN-18','05-JUN-19');
INSERT into PACKAGES values('1','Entertainment','Entertainment',1,'25-Aug-18','25-Aug-29');
INSERT into PACKAGES values('1','local','local',1,'09-JAN-18','09-JAN-22');
INSERT into PACKAGES values('1','News','News',1,'31-May-18','09-APR-25');
INSERT into PACKAGES values('1','Lifestyle','Lifestsyle',1,'12-Sep-18','09-Sep-26');
UPDATE PACKAGES
SET Dateto='09-APR-24'
WHERE id = 1;
UPDATE PACKAGES
SET Dateto='05-JUN-26'
WHERE id = 2;
UPDATE PACKAGES
SET id= 3
WHERE name='Entertainment';
UPDATE PACKAGES
SET id= 4
WHERE name='local';
UPDATE PACKAGES
SET id= 5
WHERE name='News';
UPDATE PACKAGES
SET id= 6
WHERE name='Lifestyle';
UPDATE PACKAGES
SET Dateto='25-Aug-29'
WHERE id = 3;
UPDATE PACKAGES
SET Dateto='09-APR-25'
WHERE id = 4;
UPDATE PACKAGES
SET Dateto='25-Aug-29'
WHERE id = 5;
UPDATE PACKAGES
SET Dateto='09-Sep-26'
WHERE id = 6;
