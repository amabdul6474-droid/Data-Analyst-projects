CREATE DATABASE banking;

USE banking;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50)
);

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(30),
    balance DECIMAL(12,2),
    opening_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(12,2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_type VARCHAR(30),
    loan_amount DECIMAL(12,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

USE banking;


INSERT INTO customers VALUES
(1, 'Rahul Sharma', 25, 'Male', 'Hyderabad'),
(2, 'Priya Reddy', 32, 'Female', 'Warangal'),
(3, 'Arjun Kumar', 28, 'Male', 'Karimnagar'),
(4, 'Sneha Patel', 35, 'Female', 'Hyderabad'),
(5, 'Vikram Singh', 42, 'Male', 'Bangalore'),
(6, 'Anjali Rao', 29, 'Female', 'Warangal'),
(7, 'Rohit Verma', 38, 'Male', 'Mumbai'),
(8, 'Pooja Gupta', 31, 'Female', 'Delhi'),
(9, 'Aman Khan', 27, 'Male', 'Karimnagar'),
(10, 'Neha Das', 45, 'Female', 'Chennai'),
(11, 'Karan Mehta', 36, 'Male', 'Delhi'),
(12, 'Meena Rani', 40, 'Female', 'Mumbai');

INSERT INTO accounts VALUES
(101, 1, 'Savings', 125000.00, '2022-01-15'),
(102, 1, 'Current', 85000.00, '2023-05-20'),
(103, 2, 'Savings', 210000.00, '2021-03-10'),
(104, 3, 'Savings', 75000.00, '2023-07-12'),
(105, 4, 'Current', 180000.00, '2020-11-25'),
(106, 5, 'Savings', 350000.00, '2019-06-18'),
(107, 6, 'Savings', 95000.00, '2022-09-05'),
(108, 7, 'Current', 275000.00, '2021-12-01'),
(109, 8, 'Savings', 145000.00, '2023-02-14'),
(110, 9, 'Savings', 60000.00, '2024-01-20'),
(111, 10, 'Current', 420000.00, '2018-08-30'),
(112, 11, 'Savings', 195000.00, '2022-04-11'),
(113, 12, 'Savings', 310000.00, '2020-05-17'),
(114, 3, 'Current', 55000.00, '2024-03-08'),
(115, 5, 'Current', 125000.00, '2022-10-22');

INSERT INTO transactions VALUES
(1001, 101, 'Deposit', 25000.00, '2025-01-05'),
(1002, 101, 'Withdrawal', 5000.00, '2025-01-15'),
(1003, 102, 'Deposit', 40000.00, '2025-02-10'),
(1004, 103, 'Deposit', 50000.00, '2025-01-20'),
(1005, 103, 'Withdrawal', 10000.00, '2025-02-05'),
(1006, 104, 'Deposit', 15000.00, '2025-03-12'),
(1007, 105, 'Withdrawal', 20000.00, '2025-03-18'),
(1008, 106, 'Deposit', 100000.00, '2025-01-25'),
(1009, 106, 'Withdrawal', 25000.00, '2025-02-20'),
(1010, 107, 'Deposit', 30000.00, '2025-04-05'),
(1011, 108, 'Deposit', 75000.00, '2025-04-15'),
(1012, 108, 'Withdrawal', 15000.00, '2025-05-02'),
(1013, 109, 'Deposit', 45000.00, '2025-05-10'),
(1014, 110, 'Withdrawal', 5000.00, '2025-05-20'),
(1015, 111, 'Deposit', 120000.00, '2025-06-01'),
(1016, 111, 'Withdrawal', 30000.00, '2025-06-15'),
(1017, 112, 'Deposit', 55000.00, '2025-06-20'),
(1018, 113, 'Deposit', 80000.00, '2025-07-05'),
(1019, 114, 'Withdrawal', 10000.00, '2025-07-15'),
(1020, 115, 'Deposit', 35000.00, '2025-07-25');

INSERT INTO loans VALUES
(201, 1, 'Home Loan', 2500000.00, 'Active'),
(202, 2, 'Personal Loan', 500000.00, 'Active'),
(203, 4, 'Car Loan', 800000.00, 'Closed'),
(204, 5, 'Home Loan', 3500000.00, 'Active'),
(205, 7, 'Personal Loan', 300000.00, 'Active'),
(206, 8, 'Education Loan', 600000.00, 'Active'),
(207, 10, 'Home Loan', 4500000.00, 'Active'),
(208, 11, 'Car Loan', 900000.00, 'Closed'),
(209, 12, 'Personal Loan', 400000.00, 'Active'),
(210, 3, 'Education Loan', 250000.00, 'Closed');



select count(customer_id) as total_customers from customers

select count(account_id) as total_accounts from accounts

select sum(balance) as total_balance from accounts

select avg(balance) as avg_balance from accounts 

select balance from accounts order by balance desc limit 1

select gender,count(*) from customers 
group by gender

select  city , count(*) as total_customers 
from customers 
group by city
 
select  account_type , count(*) as accounts
from accounts
group by account_type

select sum(loan_amount) as total_loans from loans 

select status, count(*) from loans group by status

select customer_id ,balance 
from accounts 
order by balance desc limit 5

select customers.city ,sum(accounts.balance) as total_balance 
from customers 
join accounts on customers.customer_id =accounts.customer_id
group by customers.city

select account_type ,avg(balance) from accounts group by account_type

select balance from accounts where balance > 100000

SELECT customers.customer_id, customers.customer_name,
COUNT(accounts.account_id) AS account_count 
FROM customers
JOIN accounts ON customers.customer_id = accounts.customer_id
GROUP BY customers.customer_id, customers.customer_name
HAVING COUNT(accounts.account_id) > 1;

select account_id,sum(balance) as deposit_amount
from accounts
group by account_id

select transaction_id,sum(amount)  as withdraw_amount
from transactions
group by transaction_id

select month(transaction_date) as month_transaction , sum(amount) monthly_transaction_amount
from transactions
group by month(transaction_date)

SELECT customers.customer_id, customers.customer_name
FROM customers
LEFT JOIN accounts
ON customers.customer_id = accounts.customer_id
LEFT JOIN transactions
ON accounts.account_id = transactions.account_id
WHERE transactions.transaction_id IS NULL;

select distinct accounts.account_id, loans.loan_id 
from accounts 
join loans on loans.customer_id = accounts.customer_id

select customers.city ,accounts.balance 
from customers 
join accounts on customers.customer_id = accounts.customer_id 
order by balance desc limit 3
 
select customers.customer_id ,accounts.balance 
from customers 
join accounts on customers.customer_id = accounts.customer_id 
order by balance desc 
  
select transaction_id, sum(amount) as total_transaction 
from transactions 
group by transaction_id 
order by sum(amount) desc

select transaction_id, amount 
from transactions 
where transactions.amount>(select avg(amount) from transactions)

select balance
from accounts 
order by balance desc limit 1 offset 1

SELECT customer_id, balance,
(balance / (SELECT SUM(balance) FROM accounts)) * 100 AS percentage_contribution
FROM accounts;

select customer_id ,loan_amount 
from loans 
order by loan_amount desc limit 1

select loan_type, sum(loan_amount) total_loan_amount, 
avg(loan_amount) as average_loan_amount
from loans 
group by loan_type

SELECT accounts.customer_id
FROM accounts
JOIN loans ON accounts.customer_id = loans.customer_id
GROUP BY accounts.customer_id
HAVING COUNT(DISTINCT accounts.account_id) > 1;

SELECT MONTH(transaction_date) AS month,
SUM(CASE WHEN transaction_type='Deposit' THEN amount ELSE 0 END) AS deposits,
SUM(CASE WHEN transaction_type='Withdrawal' THEN amount ELSE 0 END) AS withdrawals
FROM transactions
GROUP BY MONTH(transaction_date);