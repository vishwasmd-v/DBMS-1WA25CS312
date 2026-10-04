create database Insurance_DB;

use Insurance_DB;

Create table Person(
    driver_id varchar(30),
    name varchar(30) not null,
    address varchar(100),

    primary key(driver_id)
);

describe Person;

insert into Person values
("101", "suresh", "benglore"),
("102", "rakesh", "mysore"),
("103", "mahesh", "manglore"),
("104", "raju", "mandya");

select * from Person;

alter table Person add column phone_num int;

update Person set phone_num=123 where driver_id="103";
ALTER table Person drop column phone_num;

alter table car modify model varchar(30) not null;

Create table car(
    reg_num varchar(30) primary key,
    model char(30) not null,
    year int
);

Create table owns(
    driver_id varchar(30),
    reg_num varchar(30),
    foreign key(driver_id) references Person(driver_id),
    foreign key(reg_num) references car(reg_num)
);

Create table Accident(
    report_num varchar(30),
    accident_date date,
    location char(30),

    primary key(report_num,accident_date,location)
);

Create table participated(
    driver_id varchar(30),
    reg_num varchar(30),
    report_num varchar(30),
    damage_amount int,

    primary key(driver_id,reg_num,report_num),

    foreign key(driver_id) references Person(driver_id),
    foreign key(reg_num) references car(reg_num),
    foreign key(report_num) references Accident(report_num)
);

select * from participated;

insert into car values
("KA7","BMW",2010),
("KA15","porsche",2015),
("KA19","Mercedes",2040),
("KA11","tata",2020);
insert into Accident values
(12, "2003-01-01", "mysore"),
(15, "2004-04-05", "banglore"),
(19, "2005-11-09", "manglore"),
(20, "2006-01-19", "mandya");
insert into participated values
("101", "KA7", 12, 10000),
("102", "KA15", 15, 25000),
("103", "KA19", 19, 35000),
("104", "KA11", 20, 45000);

insert into owns values
("101", "KA7"),
("102", "KA15"),
("103", "KA19"),
("104", "KA11");

select * from participated;
select * from car;
select * from owns;


update participated set damage_amount=10000 where reg_num="KA7" and report_num=12;-- 4

update participated set damage_amount=25000 where reg_num="KA15"; -- 4

select * from participated;

alter table Accident add column new_accident varchar(30); -- 5

select accident_date ,location from Accident; -- 6


select * from participated
where damage_amount >=25000; -- 7
