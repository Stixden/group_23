-- Создать таблицу employees
-- - id. serial,  primary key,
-- - employee_name. Varchar(30), not null
create table employees (
	id serial primary key,
	employee_name varchar (30) not null
);

-- Наполнить таблицу employee строками.
insert into employees (id, employee_name) values 
(default, 'Alex C');


-- Создать таблицу salary
-- - id. Serial  primary key,
-- - monthly_salary. Int, not null
create table salary (
	id serial primary key,
	monthly_salary int not null
);

-- Наполнить таблицу salary строками
insert into salary (id, monthly_salary) values
(default, 1000);


-- Создать таблицу employee_salary
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique
-- - salary_id. Int, not null
create table employee_salary (
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

-- Наполнить таблицу employee_salary строками:
insert into employee_salary (id, employee_id, salary_id) values
(default, 1, 16);


-- Создать таблицу roles
-- - id. Serial  primary key,
-- - role_name. int, not null, unique
create table roles (
	id serial primary key,
	role_name int not null unique
);

-- Поменять тип столба role_name с int на varchar(30)
alter table roles
alter column role_name type varchar(30)
using role_name::varchar(30);

-- Наполнить таблицу roles строками
insert into roles (id, role_name) values
(default, 'Junior Python developer');


-- Создать таблицу roles_employee
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- - role_id. Int, not null (внешний ключ для таблицы roles, поле id)
create table roles_employee (
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key (employee_id)
		references employees (id),
	foreign key (role_id)
		references roles (id)
);

-- Наполнить таблицу roles_employee строками
insert into roles_employee (id, employee_id, role_id) values 
(default, 1, 16);

-- Вывести имя сотрудника + роль
select e.employee_name, r.role_name from roles_employee re
join employees e on re.employee_id = e.id
join roles r on re.role_id = r.id


