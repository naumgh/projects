DROP TABLE IF EXISTS CAMPAIGN;
DROP TABLE IF EXISTS PHASE;
DROP TABLE IF EXISTS VOLUNTEER;
DROP TABLE IF EXISTS EVENT;
DROP TABLE IF EXISTS DONATOR;
DROP TABLE IF EXISTS DONATES;
DROP TABLE IF EXISTS EXPENSE1;
DROP TABLE IF EXISTS EXPENSE2;
DROP TABLE IF EXISTS PARTICIPATES;

CREATE TABLE CAMPAIGN(
  CID bigint PRIMARY KEY,
  Name varchar(33) NOT NULL,
  campaignBudget real,
  mission text,
  startDate DATE,
  endDate DATE
);

CREATE TABLE PHASE(
  phaseID bigint PRIMARY KEY,
  pushMethod varchar(33),
  startDate Date,
  endDate Date,
  CID bigint,
  FOREIGN KEY (CID) REFERENCES CAMPAIGN(CID)
);

CREATE TABLE DONATOR(
  DID bigint PRIMARY KEY,
  Name VARCHAR(33),
  Email VARCHAR(33),
  Ddate DATE,
  CID bigint,
  FOREIGN KEY (CID) REFERENCES CAMPAIGN(CID)
);

CREATE TABLE DONATES(
  CID bigint,
  DID bigint,
  total real NOT NULL,
  PRIMARY KEY (CID, DID),
  FOREIGN KEY (CID) REFERENCES CAMPAIGN(CID),
  FOREIGN KEY (DID) REFERENCES DONATOR(DID)
);

CREATE TABLE EVENT(
  EVID bigint PRIMARY KEY,
  Name VARCHAR(33),
  dDate DATE,
  Location VARCHAR(255),
  CID bigint,
  FOREIGN KEY (CID) REFERENCES CAMPAIGN(CID)
);

CREATE TABLE EXPENSE1(
  EID bigint PRIMARY KEY,
  Name VARCHAR(33),
  eDate DATE,
  Total REAL,
  --CID bigint,
  EVID bigint,
  FOREIGN KEY (EVID) REFERENCES Event(EVID)
);

CREATE TABLE EXPENSE2(
  EID2 bigint PRIMARY KEY,
  Name VARCHAR(33),
  eDate DATE,
  Total REAL,
  --CID bigint,
  phaseID bigint,
  FOREIGN KEY (phaseID) REFERENCES PHASE(phaseID)
);

CREATE TABLE VOLUNTEER (
  VID bigint PRIMARY KEY,
  Name varchar(33) NOT NULL,
  Email varchar(55) NOT NULL,
  tierLevel int,
  Salary real
);

CREATE TABLE PARTICIPATES (
  CID bigint,
  VID bigint,
  startDate DATE,
  endDate DATE,
  role varchar(25),
  PRIMARY KEY (CID, VID),
  FOREIGN KEY (CID) REFERENCES CAMPAIGN(CID),
  FOREIGN KEY (VID) REFERENCES VOLUNTEER(VID)
);

-- campaign
INSERT INTO CAMPAIGN VALUES (100,'green-love',  5000, 'to make trees great again', '2024-03-18', '2024-04-18');
INSERT INTO CAMPAIGN VALUES (101,'generic-protest', 4000, 'we are just protesting to protest', '2024-02-11', '2024-03-02');
INSERT INTO CAMPAIGN VALUES (102, 'idk',  2000,'idk im having trouble coming up with mission statements', '2024-01-02', '2024-02-02');
INSERT INTO CAMPAIGN VALUES (103,'final-countdown',500,'this is the final countdown', '2024-01-02', '2024-02-02');
INSERT INTO CAMPAIGN VALUES (104,'i-just-want-to-slide',2055,'parties in the sky like its 2055', '2055-01-02', '2055-02-02');
-- volunteer
INSERT INTO VOLUNTEER VALUES (927502, 'Clark Davidson', 'clark@gmail.com', 2, 35);
INSERT INTO VOLUNTEER VALUES (927503, 'Dave Hoffman', 'dave@gmail.com',1,NULL);
INSERT INTO VOLUNTEER VALUES (927504, 'Ava Huntington', 'ava@gmail.com', 1,  NULL);
INSERT INTO VOLUNTEER VALUES (927505, 'Clack Clarkson', 'clack@gmail.com',2, NULL);
INSERT INTO VOLUNTEER VALUES (927506, 'Black White', 'black@gmail.com',1,NULL );
INSERT INTO VOLUNTEER VALUES (927507, 'Ivan Naskov', 'ots@gmail.com',2, NULL);
INSERT INTO VOLUNTEER VALUES (927508, 'Debil Naskov', 'Debil@gmail.com',1, NULL);
-- participates
INSERT INTO PARTICIPATES (CID,VID,startDate, endDate, role) VALUES (100, 927502,'2024-03-18','2024-03-25','Campaign Employee');
INSERT INTO PARTICIPATES (CID,VID,startDate, endDate, role) VALUES (101, 927502, '2024-02-11','2024-03-18','Campaign Employee');
INSERT INTO PARTICIPATES (CID,VID,startDate, endDate, role) VALUES (100, 927503, '2024-01-02', '2024-03-18','Campaign Volunteer');
INSERT INTO PARTICIPATES (CID,VID,startDate, endDate, role) VALUES (100, 927504, '2024-01-02', '2024-03-18','Campaign Volunteer');
INSERT INTO PARTICIPATES (CID,VID,startDate, endDate, role) VALUES (100, 927505, '2024-01-04', '2024-03-18','Campaign Volunteer');
INSERT INTO PARTICIPATES (CID,VID,startDate, endDate, role) VALUES (102, 927506, '2024-01-03', '2024-03-18','Campaign Volunteer');
INSERT INTO PARTICIPATES (CID,VID,startDate, endDate, role) VALUES (103, 927502, '2024-01-02', '2024-03-18','Campaign Employee');
INSERT INTO PARTICIPATES (CID,VID,startDate, endDate, role) VALUES (102, 927505, '2024-01-02', '2024-03-18','Campaign Volunteer');
INSERT INTO PARTICIPATES (CID,VID,startDate, endDate, role) VALUES (103, 927507, '2024-01-02', '2024-03-18','Campaign Volunteer');
-- event
INSERT INTO EVENT VALUES (800000, 'event1', '2024-03-18', '1004 Broad St, Victoria, BC V8W 1Z9, Canada', 100);
INSERT INTO EVENT VALUES (800001, 'event2', '2024-03-23', '1227 Broad St, Victoria, BC V8W 2A4, Canada', 100);
INSERT INTO EVENT VALUES (800002, 'event3', '2024-03-25', '230 Menzies St #105, Victoria, BC V8V 2G7, Canada', 100);
INSERT INTO EVENT VALUES (800003, 'event4', '2024-02-18', '753 Yates St, Victoria, BC V8W 1L6, Canada', 101);
INSERT INTO EVENT VALUES (800004, 'event5', '2024-02-23', '753 Yates St, Victoria, BC V8W 1L6, Canada', 101);
--DONATOR
INSERT INTO DONATOR VALUES (5000, 'Naum Hoffman','naumhoffman@gmail.com','2023-03-02',100);
INSERT INTO DONATOR VALUES (5001, 'Tim Cook','timcook@gmail.com','2023-03-02',100);
INSERT INTO DONATOR VALUES (5002, 'Bill Gates','billgates@gmail.com','2023-03-02',100);
INSERT INTO DONATOR VALUES (5003, 'Musa Ali','musaali@gmail.com','2023-03-02',100);
INSERT INTO DONATOR VALUES (5004, 'Ali Murat','alimurat@gmail.com','2023-03-02',100);
INSERT INTO DONATOR VALUES (5005, 'Sarp Aki','sarpaki@gmail.com','2023-03-02',100);
--DONATES
INSERT INTO DONATES VALUES (100, 5000, 100);
INSERT INTO DONATES VALUES (100, 5001, 10000);
INSERT INTO DONATES VALUES (100, 5002, 2000);
INSERT INTO DONATES VALUES (100, 5003, 30);
INSERT INTO DONATES VALUES (100, 5004, 40);
INSERT INTO DONATES VALUES (100, 5005, 50);
-- phase
INSERT INTO PHASE VALUES (7000, 'first-phase','2023-02-15','2023-02-24',100);
INSERT INTO PHASE VALUES (7001, 'second-phase','2023-02-24','2024-03-16',100);
INSERT INTO PHASE VALUES (7002, 'final-phase','2024-03-16','2024-03-18',100);
INSERT INTO PHASE VALUES (7004, 'third-phase','2024-03-02','2024-03-04',102);
INSERT INTO PHASE VALUES (7003, 'fourth-phase','2024-03-06','2024-03-08',100);
-- expense1 (for our events)
INSERT INTO EXPENSE1 VALUES (300, 'transportation', '2024-03-02',50,800000);
INSERT INTO EXPENSE1 VALUES (301, 'beer', '2024-03-03',20,800001);
INSERT INTO EXPENSE1 VALUES (302, 'lunch', '2024-03-04',20.33,800002);
INSERT INTO EXPENSE1 VALUES (303, 'seeds', '2024-03-07',45.56,800003);
INSERT INTO EXPENSE1 VALUES (304, 'oranges', '2024-03-19',55.76,800003);
INSERT INTO EXPENSE1 VALUES (305, 'crispy creme', '2024-03-19',55.76,800003);
-- expense2 (for our phases)
INSERT INTO EXPENSE2 VALUES (600, 'FORD-F150', '2024-03-02',8000.53,7003);
INSERT INTO EXPENSE2 VALUES (601, 'dj', '2024-03-03',3000.53,7001);
INSERT INTO EXPENSE2 VALUES (602, 'signs', '2024-03-04',20.33,7004);
INSERT INTO EXPENSE2 VALUES (603, 'postcards', '2024-03-07',45.56,7004);
INSERT INTO EXPENSE2 VALUES (604, 'tables', '2024-03-19',55.76,7000);