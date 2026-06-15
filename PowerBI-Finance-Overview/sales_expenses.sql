CREATE TABLE sales_expenses (
    transaction_date DATE,
    description VARCHAR(255),
    category VARCHAR(100),
    fund_class VARCHAR(100),
    payment_method VARCHAR(100),
    amount NUMERIC(12,2)
);

select * from sales_expenses;

--(1)TOTAL AMOUNT BY CATEGORY
create view category_amount as
select category, sum(amount) as Tot_Amount
from sales_expenses
group by category;

--(2) TOTAL AMOUNT BY PAYMENT METHOD
create view payment_amount as
select payment_method, sum(amount) as Tot_Amount
from sales_expenses
group by payment_method;

--(3) TOTAL AMOUNT BY FUND CLASS
create view fund_amount as
select fund_class,sum(amount) as Tot_Amount
from sales_expenses
group by fund_class;

--(4)Monthly Total Amount
create view month_amount as
select to_char(transaction_date,'month') as Month, sum(amount) as Tot_Amount
from sales_expenses
group by to_char(transaction_date,'month');
