# Bank-Sphere-Internal-Capstone
# 🏦 BankSphere – Digital Banking Platform

**A Console-Based Digital Banking Application using Python and MySQL**

## 📌 Project Overview

BankSphere is a console-based Digital Banking Platform developed as part of the Hexaware technical training case study.

The application is designed to manage retail banking operations, including customer registration, savings and checking accounts, financial transactions, payment card management, fraud detection, and transaction reporting.

The project focuses on applying Object-Oriented Programming (OOP), database management, advanced Python programming concepts, exception handling, and unit testing to develop a structured and reliable banking application.

## 🎯 Project Objectives

- Develop a console-based digital banking application.
- Implement customer and account management.
- Process deposits, withdrawals, and fund transfers.
- Maintain accurate account balances with transaction validation.
- Manage payment cards and their statuses.
- Identify suspicious transaction patterns.
- Generate account statements and banking reports.
- Apply OOP principles and layered application architecture.
- Integrate Python with a MySQL database.
- Implement exception handling and unit testing.

## ✨ Key Features

### 1. Customer Management
- Register new customers.
- Retrieve customer information.
- Update customer details.
- Delete customer records.
- Maintain unique National ID and email information.

### 2. Account Management
- Create Savings and Checking accounts.
- Retrieve account information.
- Update account details.
- Freeze or close accounts.
- Maintain account balances and statuses.

### 3. Transaction Processing
- Deposit money.
- Withdraw money.
- Transfer money between accounts.
- Validate transaction amounts.
- Check available balances before transactions.
- Maintain transaction records.

### 4. Card Management
- Issue payment cards.
- Retrieve cards associated with accounts.
- Block payment cards.
- Validate card expiry and status before authorization.

### 5. Fraud Detection
- Identify suspicious transaction patterns.
- Flag potentially fraudulent activities.
- Maintain fraud flag records.
- Support manual review of flagged transactions.

### 6. Reporting
- Generate account statements for a specified date range.
- Calculate monthly transaction volume.
- Identify top-spending customers.
- Display unreviewed fraud flags.

## 🛠️ Technology Stack

| Category | Technology |
|---|---|
| Programming Language | Python 3.13 |
| Database | MySQL |
| Database Connectivity | mysql-connector-python |
| Database Configuration | configparser |
| OOP and Abstraction | Python Classes, abc.ABC |
| Unit Testing | unittest |
| Mocking | unittest.mock |
| Version Control | Git |
| Repository Hosting | GitHub |
| IDE | Visual Studio Code |

## 🗄️ Database Design

The project uses a relational MySQL database named `BANKSPHEREDB`.

It consists of six main entities:

| Table | Purpose |
|---|---|
| Customer | Stores customer information |
| Account | Stores savings and checking account details |
| Transaction | Maintains deposit, withdrawal, and transfer records |
| Branch | Stores bank branch information |
| Card | Maintains payment card details |
| FraudFlag | Stores suspicious transaction flags |

### Database Relationships

- Customer → Account: One-to-Many
- Account → Transaction: One-to-Many
- Account → Card: One-to-Many
- Transaction → FraudFlag: One-to-Many

### Database Constraints

- Primary Key constraints
- Foreign Key constraints
- Unique constraints
- CHECK constraints
- DEFAULT constraints

The database schema is designed to maintain data integrity and consistency.

## 🏗️ Project Architecture

The application follows a layered architecture to separate business logic, database operations, utility functions, and testing.

```text
BankSphere/
│
├── entity/
│   └── Customer, Account, Transaction, etc.
│
├── dao/
│   └── Service interfaces and implementations
│
├── exception/
│   └── Custom exceptions
│
├── util/
│   ├── PropertyUtil
│   └── DBConnection
│
├── main/
│   └── MainModule
│
├── tests/
│   └── Unit test cases
│
├── database/
│   └── BankSphere.sql
│
├── README.md
└── requirements.txt
```

*The structure represents the planned application architecture and will be populated as development progresses.*

## 📅 Development Plan – Agile Sprints

The project is developed across four sprints.

### Sprint 1 – Database Design and Development
- Repository and project setup.
- Database schema design.
- ER diagram with six entities and four relationships.
- Creation of six MySQL tables.
- Primary Key, Foreign Key, UNIQUE, CHECK, and DEFAULT constraints.
- Insertion of at least 10 sample records into every table.
- Database schema verification.

### Sprint 2 – Object-Oriented Programming
- Development of entity classes.
- Constructors, getters, and setters.
- Encapsulation and inheritance.
- Abstract classes and interfaces using Python's `abc` module.
- Implementation of domain-level business rules.
- Console demonstration of the domain model.

### Sprint 3 – Advanced Programming
- Implementation of service interfaces.
- Development of custom exceptions.
- Collection-based service implementation.
- Implementation of ReportGenerator.
- Exception handling and business rule validation.
- Code review and refactoring.

### Sprint 4 – Database Connectivity, Testing and Integration
- MySQL database connectivity.
- Implementation of PropertyUtil and DBConnection.
- Database operations using parameterized SQL queries.
- Integration of service implementations.
- Development of the menu-driven MainModule.
- Unit testing using unittest and unittest.mock.
- Final integration and documentation.

## ⚙️ Installation and Setup

### Prerequisites

Make sure the following are installed:

- Python 3.13
- MySQL Server
- MySQL Workbench
- Visual Studio Code
- Git

### 1. Clone the Repository

```bash
git clone <YOUR_GITHUB_REPOSITORY_URL>
```

### 2. Navigate to the Project Directory

```bash
cd BankSphere
```

### 3. Create a Virtual Environment

```bash
python3 -m venv venv
```

### 4. Activate the Virtual Environment

For macOS/Linux:

```bash
source venv/bin/activate
```

For Windows:

```bash
venv\Scripts\activate
```

### 5. Install Dependencies

```bash
pip install mysql-connector-python
```

### 6. Configure MySQL

- Start your MySQL Server.
- Open MySQL Workbench.
- Execute the SQL script available in the `database/` directory.
- Configure the database connection settings in the configuration file.

**Note:** Database credentials should be stored in the configuration file and not hard-coded into the Python source code.

## 🧪 Testing

The project uses Python's `unittest` framework and `unittest.mock` for testing.

Testing will cover:

- Customer registration and validation.
- Account operations.
- Deposit and withdrawal validation.
- Fund transfers.
- Insufficient balance handling.
- Account status validation.
- Card expiry and blocking.
- Fraud detection.
- Database connection failures.
- Report generation.

The case study requires at least 20 test cases in total.

## 🔒 Important Business Rules

- Customer National IDs must be unique.
- Account balances must not become negative, subject to the configured Checking account overdraft rules.
- Transaction amounts must be greater than zero.
- Frozen or closed accounts cannot perform transactions.
- Blocked or expired cards cannot authorize transactions.
- Transfers must validate both source and destination accounts.
- Suspicious transaction patterns must be flagged for review.

## 📈 Project Status

**Development approach:** Four-sprint implementation.

- Sprint 1 – Database design and sample data.
- Sprint 2 – Object-Oriented Programming.
- Sprint 3 – Advanced Programming.
- Sprint 4 – Database Connectivity, Unit Testing and Integration.

Features will be updated as each sprint is completed.

## 👨‍💻 Developer

**Abdullah R.**

AI & Data Science  
Saveetha Engineering College

## 📄 Project Reference

Developed based on the Hexaware case study:

**BankSphere – Digital Banking Platform**

---

⭐ *This project demonstrates the application of Python programming, Object-Oriented Design, relational database management, and software engineering practices in a real-world banking scenario.*
