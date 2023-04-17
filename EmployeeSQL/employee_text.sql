Dpartment
-
dept_no PK Varchar
dept_Name Varchar

Dept_Emp
-
emp_no int PK FK >- Employees.emp_no
dpt_no Varchar FK >- Dpartment.dept_no

Dept_Manager
-
Dept_Manager_no PK
emp_no int FK >- Employees.emp_no
dept_no Varchar FK >- Dpartment.dept_no

Employees
-
emp_no PK int FK - Salaries.Emp_no
Emp_title_ID Varchar FK >- Title.Title_ID
Brith_Date Date(mm/dd/yy)
First_name Varchar
Last_name Varchar
Sex Varcchar
Hire_date Date(mm/dd/yy)

Salaries
-
Emp_no PK int
Salary int

Title
-
Title_ID PK Varchar
Title Varchar
