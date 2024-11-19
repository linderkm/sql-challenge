Source: (1)

-- data imported from 'Resources/titles.csv'
CREATE TABLE titles (
    title_id VARCHAR(30) PRIMARY KEY NOT NULL,
    title VARCHAR(30) NOT NULL
);


-- data imported from 'Resources/employees.csv'
CREATE TABLE employees (
    emp_no int  PRIMARY KEY NOT NULL,
    emp_title VARCHAR(30) NOT NULL,
    birth_date VARCHAR(30) NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex VARCHAR(30) NOT NULL,
    hire_date VARCHAR(30) NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);


-- data imported from 'Resources/salaries.csv'
CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


-- data imported from 'Resources/departments.csv'
CREATE TABLE departments(
	dept_no VARCHAR(30) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(30) NOT NULL
);


-- data imported from 'Resources/dept_emp.csv'
CREATE TABLE dept_emp (
	emp_no int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


-- data imported from 'Resources/dept_manager.csv'
CREATE TABLE dept_manager(
	dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


















