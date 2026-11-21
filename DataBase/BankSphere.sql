CREATE DATABASE BANKSPHEREDB;
USE BANKSPHEREDB;
CREATE TABLE Customer(
	CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    NationalID VARCHAR(30) UNIQUE
);

DESCRIBE Customer;

CREATE TABLE Account(
	AccountID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    AccountType VARCHAR(20) NOT NULL,
    Balance DECIMAL(15,2) NOT NULL,
    OpenedDate DATE NOT NULL,
    Status VARCHAR(20) DEFAULT "Active",
    FOREIGN KEY (CustomerID)
    REFERENCES Customer(CustomerID),
    
    CONSTRAINT check_acc_type
    CHECK (AccountType IN ('SAVINGS','CHECKING')),
    CONSTRAINT check_bal
    CHECK (Balance>=0),
    CONSTRAINT check_status_acc
    CHECK (Status IN ('Active','Frozen','Closed'))
);

CREATE TABLE Transaction(
	TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    AccountID INT NOT NULL,
    TransactionType Varchar(20) NOT NULL,
    Amount DECIMAL(15,2) NOT NULL,
    TransactionDate DATETIME NOT NULL,
    RelatedAccountID INT,
    FOREIGN KEY (AccountID)
    REFERENCES Account(AccountID),
    CONSTRAINT check_trans_type
    CHECK (TransactionType IN ('Deposit','Withdrawal','Transfer')),
    CONSTRAINT check_amt
    CHECK (Amount >0)
);

CREATE TABLE Branch(
	BranchID INT AUTO_INCREMENT PRIMARY KEY,
    BranchName VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE Card(
	CardID INT AUTO_INCREMENT PRIMARY KEY,
    AccountID INT NOT NULL,
    CardNumberMasked VARCHAR(20),
    ExpiryDate date NOT NULL,
    Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (AccountID)
    REFERENCES ACCOUNT(AccountID),
    CONSTRAINT check_status_card
    CHECK (Status IN ('Active','Blocked','Expired'))
);

CREATE TABLE FraudFlag(
	FlagID INT AUTO_INCREMENT PRIMARY KEY,
    TransactionID INT NOT NULL,
    Reason VARCHAR(200),
    FlaggedOn DATETIME NOT NULL,
    Reviewed BOOL DEFAULT False,
    FOREIGN KEY (TransactionID)
    REFERENCES Transaction(TransactionID)
);

INSERT INTO Customer (FirstName, LastName, Email, NationalID)
	VALUES('Arun', 'Kumar', 'arun@gmail.com', 'NID1001'),
('Priya', 'Sharma', 'priya@gmail.com', 'NID1002'),
('Rahul', 'Verma', 'rahul@gmail.com', 'NID1003'),
('Sneha', 'Reddy', 'sneha@gmail.com', 'NID1004'),
('Karthik', 'Raj', 'karthik@gmail.com', 'NID1005'),
('Divya', 'Mohan', 'divya@gmail.com', 'NID1006'),
('Vijay', 'Kumar', 'vijay@gmail.com', 'NID1007'),
('Ananya', 'Das', 'ananya@gmail.com', 'NID1008'),
('Rohit', 'Mehta', 'rohit@gmail.com', 'NID1009'),
('Meena', 'Joseph', 'meena@gmail.com', 'NID1010');


USE BANKSPHEREDB;

INSERT INTO Account
(CustomerID, AccountType, Balance, OpenedDate, Status)
VALUES
(1, 'SAVINGS', 25000.00, '2026-01-10', 'Active'),
(2, 'CHECKING', 40000.00, '2026-01-15', 'Active'),
(3, 'SAVINGS', 15000.00, '2026-02-05', 'Active'),
(4, 'CHECKING', 60000.00, '2026-02-12', 'Active'),
(5, 'SAVINGS', 30000.00, '2026-03-01', 'Active'),
(6, 'CHECKING', 45000.00, '2026-03-10', 'Active'),
(7, 'SAVINGS', 20000.00, '2026-04-05', 'Frozen'),
(8, 'CHECKING', 55000.00, '2026-04-15', 'Active'),
(9, 'SAVINGS', 35000.00, '2026-05-01', 'Active'),
(10, 'CHECKING', 50000.00, '2026-05-10', 'Closed');



INSERT INTO Transaction
(AccountID, TransactionType, Amount, TransactionDate, RelatedAccountID)
VALUES
(1, 'Deposit', 5000.00, '2026-06-01 10:30:00', NULL),
(2, 'Withdrawal', 2000.00, '2026-06-01 11:00:00', NULL),
(3, 'Deposit', 7500.00, '2026-06-02 09:15:00', NULL),
(4, 'Transfer', 3000.00, '2026-06-02 12:30:00', 5),
(5, 'Withdrawal', 1500.00, '2026-06-03 14:00:00', NULL),
(6, 'Deposit', 10000.00, '2026-06-03 15:30:00', NULL),
(7, 'Transfer', 2500.00, '2026-06-04 10:00:00', 8),
(8, 'Withdrawal', 4000.00, '2026-06-04 16:45:00', NULL),
(9, 'Deposit', 6000.00, '2026-06-05 09:00:00', NULL),
(10, 'Transfer', 5000.00, '2026-06-05 17:00:00', 1);

INSERT INTO Branch (BranchName, City)
VALUES
('Anna Nagar Branch', 'Chennai'),
('T Nagar Branch', 'Chennai'),
('Adyar Branch', 'Chennai'),
('Velachery Branch', 'Chennai'),
('Coimbatore Main Branch', 'Coimbatore'),
('Madurai Branch', 'Madurai'),
('Bangalore Central Branch', 'Bangalore'),
('Hyderabad Branch', 'Hyderabad'),
('Mumbai Main Branch', 'Mumbai'),
('Delhi Central Branch', 'Delhi');

INSERT INTO Card
(AccountID, CardNumberMasked, ExpiryDate, Status)
VALUES
(1, 'XXXX-XXXX-XXXX-1001', '2028-06-30', 'Active'),
(2, 'XXXX-XXXX-XXXX-1002', '2028-08-31', 'Active'),
(3, 'XXXX-XXXX-XXXX-1003', '2027-12-31', 'Blocked'),
(4, 'XXXX-XXXX-XXXX-1004', '2029-03-31', 'Active'),
(5, 'XXXX-XXXX-XXXX-1005', '2028-11-30', 'Expired'),
(6, 'XXXX-XXXX-XXXX-1006', '2029-05-31', 'Active'),
(7, 'XXXX-XXXX-XXXX-1007', '2028-09-30', 'Active'),
(8, 'XXXX-XXXX-XXXX-1008', '2027-10-31', 'Blocked'),
(9, 'XXXX-XXXX-XXXX-1009', '2029-01-31', 'Active'),
(10, 'XXXX-XXXX-XXXX-1010', '2028-04-30', 'Active');

INSERT INTO FraudFlag
(TransactionID, Reason, FlaggedOn, Reviewed)
VALUES
(1, 'Unusual deposit amount', '2026-06-06 09:00:00', FALSE),
(2, 'Multiple withdrawal attempts', '2026-06-06 09:15:00', TRUE),
(3, 'Unusual transaction pattern', '2026-06-06 09:30:00', FALSE),
(4, 'Large fund transfer', '2026-06-06 10:00:00', FALSE),
(5, 'Suspicious withdrawal', '2026-06-06 10:30:00', TRUE),
(6, 'High-value deposit requires review', '2026-06-06 11:00:00', FALSE),
(7, 'Frequent transfers detected', '2026-06-06 11:30:00', FALSE),
(8, 'Unusual withdrawal amount', '2026-06-06 12:00:00', TRUE),
(9, 'Transaction flagged for verification', '2026-06-06 12:30:00', FALSE),
(10, 'Large transfer to another account', '2026-06-06 13:00:00', FALSE);




