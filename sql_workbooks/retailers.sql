
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
select * from retailers;

