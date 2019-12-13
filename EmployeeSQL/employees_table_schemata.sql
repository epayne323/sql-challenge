DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;

--primary table for employees
CREATE TABLE "employees" (
  "emp_no" VARCHAR NOT NULL PRIMARY KEY,
  "birth_date" DATE NOT NULL,
  "first_name" VARCHAR NOT NULL,
  "last_name" VARCHAR NOT NULL,
  "gender" VARCHAR NOT NULL,
  "hire_date" DATE NOT NULL
);

--primary table for departments
CREATE TABLE "departments" (
  "dept_no" VARCHAR NOT NULL PRIMARY KEY,
  "dept_name" VARCHAR NOT NULL
);

--junction table with composite primary key linking employees and department tables 
CREATE TABLE "dept_emp" (
  "emp_no" VARCHAR NOT NULL REFERENCES employees(emp_no),
  "dept_no" VARCHAR NOT NULL REFERENCES departments(dept_no),
  "from_date" DATE NOT NULL,
  "to_date" DATE NOT NULL,
  PRIMARY KEY ("emp_no", "dept_no")
);

CREATE TABLE "salaries" (
  "emp_no" VARCHAR NOT NULL PRIMARY KEY REFERENCES employees(emp_no),
  "salary" FLOAT,
  "from_date" DATE NOT NULL,
  "to_date" DATE NOT NULL
);

CREATE TABLE "titles" (
  "emp_no" VARCHAR NOT NULL PRIMARY KEY REFERENCES employees(emp_no),
  "title" VARCHAR NOT NULL,
  "from_date" DATE NOT NULL,
  "to_date" DATE NOT NULL
);

CREATE TABLE "dept_manager" (
  "dept_no" VARCHAR NOT NULL REFERENCES departments(dept_no),
  "emp_no" VARCHAR NOT NULL REFERENCES employees(emp_no),
  "from_date" DATE NOT NULL,
  "to_date" DATE NOT NULL,
  PRIMARY KEY ("emp_no", "dept_no")
);