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


INSERT INTO CUSTOMERS VALUES(1, 'john', 'cena', 'johncena@mail.com', 'Virginia', 'jona', 1, 1000.0);

INSERT INTO CUSTOMERS VALUES(2, 'dan', 'smith', 'dansmith@mail.com', 'Milford', 'dath', 2, 15000.0);
INSERT INTO CUSTOMERS VALUES(3, 'peter', 'pan', 'peterpan@mail.com', 'Delaware', 'pean', 3, 11000.0);
INSERT INTO CUSTOMERS VALUES(4, 'sandra', 'anders', 'sandranders@mail.com', 'Florida', 'sars', 4, 20000.0);
INSERT INTO CUSTOMERS VALUES(5, 'marian', 'gold', 'mariangold@mail.com', 'California', 'mald', 5, 25000.0);
INSERT INTO CUSTOMERS VALUES(6, 'kim', 'wild', 'kimwild@mail.com', 'Kentucy', 'kild', 1, 20050.0);

