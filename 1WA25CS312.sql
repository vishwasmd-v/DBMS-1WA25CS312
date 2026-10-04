
create database insurance_database;
use insurance_database;

create table person (
    driver_id varchar(10) primary key,
    name varchar(50) not null,
    address varchar(100)
);

create table car (
    reg_num varchar(15) primary key,
    model varchar(30) not null,
    year int check (year >= 1886)
);

create table accident (
    report_num int primary key,
    accident_date date not null,
    location varchar(100)
);

create table owns (
    driver_id varchar(10),
    reg_num varchar(15),
    primary key (driver_id, reg_num),
    foreign key (driver_id) references person(driver_id) on delete restrict,
    foreign key (reg_num) references car(reg_num) on delete restrict
);

create table participated (
    driver_id varchar(10),
    reg_num varchar(15),
    report_num int,
    damage_amount int check (damage_amount >= 0),
    primary key (driver_id, reg_num, report_num),
    foreign key (driver_id) references person(driver_id) on delete restrict,
    foreign key (reg_num) references car(reg_num) on delete restrict,
    foreign key (report_num) references accident(report_num) on delete restrict
);

-- 3. Insert tuples into each relation

insert into person (driver_id, name, address) values
('A01', 'Richard', 'Srinivas nagar'),
('A02', 'Pradeep', 'Rajaji nagar'),
('A03', 'Smith', 'Ashok nagar'),
('A04', 'Venu', 'NR Colony'),
('A05', 'Jhon', 'Hanumanth nagar');

insert into car (reg_num, model, year) values
('KA052250', 'Indica', 1990),
('KA031181', 'Lancer', 1957),
('KA095477', 'Toyota', 1998),
('KA053408', 'Honda', 2008),
('KA041702', 'Audi', 2005);

insert into owns (driver_id, reg_num) values
('A01', 'KA052250'),
('A02', 'KA053408'),
('A03', 'KA031181'),
('A04', 'KA095477'),
('A05', 'KA041702');

insert into accident (report_num, accident_date, location) values
(11, '2003-01-01', 'Mysore Road'),
(12, '2004-02-02', 'South end Circle'),
(13, '2003-01-21', 'Bull temple Road'),
(14, '2008-02-17', 'Mysore Road'),
(15, '2005-03-04', 'Kanakpura Road');

insert into participated (driver_id, reg_num, report_num, damage_amount) values
('A01', 'KA052250', 11, 10000),
('A02', 'KA053408', 12, 50000),
('A03', 'KA095477', 13, 25000),
('A04', 'KA031181', 14, 3000),
('A05', 'KA041702', 15, 5000);



update participated
set damage_amount = 25000
where reg_num = 'KA053408' and report_num = 12; -- 4



insert into accident (report_num, accident_date, location) values
(16, '2026-03-15', 'MG Road');-- 5



select accident_date, location 
from accident;



select distinct driver_id 
from participated 
where damage_amount >= 25000; -- 7