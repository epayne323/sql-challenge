---
noteId: "59e867d01d4a11ea8421bf71ed8bf405"
tags: []

---

# sql-challenge
Creation of tables and queries to analyze employee information using postgres, plus plotting with pandas and matplotlib in jupyter notebook.


## note on ERD diagram
I used dbdiagrams.io instead of QuickDBD because the latter alternated its image zoom level between 10% and 200% with a hair trigger. In dbdiagram, you can mouse over a relationship line to show the type of relationship between table columns, but the png export does not show these types. From emp_no in the employees table to emp_no in any other table (excluding departments) are one-to-many relationships; likewise, from dept_no in the departments table to dept_no in the dept_emp and dept_manager tables are also one-to-many relationships.

## note on ERD export
The export of my diagram to postgres unexpectedly included alter table statements which changed emp_no and dept_no to foreign keys referencing primary tables employees and departments (except in those tables) after creating tables with emp_no and dept_no as primary keys, rather than creating those columns as primary keys initially. Instead, I rmoved these alter statements and changed emp_no and dept_no in non-primary tables to primary keys referecing their respective columns in the primary tables.