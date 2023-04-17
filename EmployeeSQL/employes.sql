Create table department(
    dept_no varchar(5)  primary key,
	dept_name varchar(25) not null
);

Create table Salaries (
    emp_no int  primary key,
	salary int
);

create table Titles(
	title_id varchar(5) primary key,
	title varchar(20) not null
	);
	
create table Employees( 
	emp_no int primary key,
	emp_title_id varchar (50),
	birth_date date,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	sex varchar(2),
	hire_date date,
	Foreign key (emp_title_id) References Titles (title_id)
);
	
create table dept_emp(
	emp_no int not null Primary key,
	dept_no char(5),
	Foreign Key (dept_no) References department (dept_no)
);

create table dept_manager(
	emp_no int primary key,
	dept_no varchar(5),
	FOREIGN KEY (dept_no) References department (dept_no),
	Foreign key (emp_no) References Employees (emp_no)
);


 -- Data analysis
 --List of employee number, last name, first name, sex and salary.
 select E.emp_no as "Employee Numbers",
  		E.first_name as "Employee First name",
		E.last_name as "Employee Last name",
		E.sex,
		S.salary
from Employees as E
inner join salaries as S on E.emp_no = S.emp_no;

--List of first name last name and hire date (hired) for those were who were hired in 1986.
select first_name as "Employee First name",
		last_name as "Employee Last name",
		hire_date as "Hiring Date"
from Employees
where EXTRACT (year from hire_date) = 1986;

---list the manager of each department along with their department number,  department name, employee number, last name, first name and department name.

select DM.dept_no as "Department Number",
        DN.dept_name as "Department Name",
		E.emp_no as "Employee Number",
		E.first_name as "Employee First Name",
		E.last_name as "Employee Last Name"
From dept_manager as DM
inner join Employees as E on DM.emp_no = E.emp_no
inner join Department as DN on DM.dept_no = DN.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select E.emp_no as "Employee Number",
		E.first_name as "Employee First Name",
		E.last_name as "Employee Last Name",
		DN.dept_name as "Department Name",
		DN.dept_no as "Department Number"
From dept_emp as DE
inner join Employees as E on DE.emp_no = E.emp_no
inner join Department as DN on DE.dept_no = DN.dept_no;

--List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select E.first_name as "Employee First Name",
		E.last_name as "Employee Last Name",
		E.sex
from Employees as E
where first_name = 'Hercules' and last_name like 'B%';

--list each employee in the Sales department, including their employee number, last name, and first name.
select E.first_name as "Employee First Name",
		E.last_name as "Employee Last Name",
		E.emp_no as "Employee Number",
		D.dept_name as "Department name"
		
from Department as D
inner join dept_emp on dept_emp.dept_no = D.dept_no
inner join Employees as E on E.emp_no = dept_emp.emp_no
where D.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select E.first_name as "Employee First Name",
		E.last_name as "Employee Last Name",
		E.emp_no as "Employee Number",
		D.dept_name as "Department name"
from Department as D
inner join dept_emp on dept_emp.dept_no = D.dept_no
inner join Employees as E on E.emp_no = dept_emp.emp_no
where D.dept_name in ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select count (emp_no) as "Number of count for employees with same last name", last_name
from Employees
group by last_name
order by count (emp_no) desc;

		
