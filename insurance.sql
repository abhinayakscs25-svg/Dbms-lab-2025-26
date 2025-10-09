create database insurance;
use insurance;
create table person (driver_id varchar(10),
name varchar(20),  address varchar(30), primary key(driver_id));
create table car(reg_num varchar(10),model varchar(10),year int, primary key(reg_num));
create table accident(report_num int, accident_date date, location varchar(20),primary key(report_num));
CREATE TABLE OOWNS (
    driver_id VARCHAR(50),
    reg_num VARCHAR(50),
    PRIMARY KEY (driver_id, reg_num)  
);

create table participated(driver_id varchar(10), reg_num varchar(10),
report_num int, damage_amount int, 
primary key(driver_id, reg_num, report_num), 
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num));
insert into accident values(11, '2003-01-01', 'Mysore road');
insert into accident values(12, '2004-02-02','South end Circle');
insert into accident values(13,'2003-01-21','Bull temple Road');
insert into accident values(14,'2008-02-17','Mysore Road');
insert into accident values(15,'2004-03-05','Kanakapura Road');
select * from accident;

INSERT INTO participated (driver_id, reg_num, report_num, damage_amount) 
VALUES
('A01', 'KA052250', 11, 10000),
('A02', 'KA053408', 12, 5000),
('A03', 'KA095477', 13, 25000),
('A04', 'KA031181', 14, 3000),
('A05', 'KA041702', 15, 5000),
('A06', 'KA123456', 16, 1000);
select * from participated;
use insurance;
select * from participated;
insert into car values ('ka052250', 'indica', 1990);
insert into car values('ka331990', 'h5', 1995);
insert into car values('ka012350', 'toyota', 1998);
insert into car values('ka053408', 'tata', 2008);
insert into car values('ka041702', 'audi', 2005);
select * from car;
insert into person values
('A01','john','banglore'),
('A02','smith','mysore'),
('A03','david','hubli'),
('A04','ravi','tumkur'),
('A05','arun','mandya');
select * from person;
create table ownss(driver_id varchar(10),reg_num varchar(10),
primary key(driver_id, reg_num),foreign key(driver_id) references person(driver_id),foreign key(reg_num) references car(reg_num));
INSERT INTO OOWNS (driver_id, reg_num) VALUES
('A01', 'ka052250'),
('A02', 'ka331990'),
('A03', 'ka012350'),
('A04', 'ka053408'),
('A05', 'ka041702');
select * from oowns;


update participated set damage_amount=25000 where reg_num = 'KA053408' and report_num=12;
insert into accident values(16, '2008-03-08','damlur');
select * from car order by year asc;
select count(report_num) CNT from car c,participated p where c.reg_num=p.reg_num and
model='indica';

select count(distinct driver_id) CNT
from participated a
join accident b on a.report_num = b.report_num
where b.accident_date like '2008%';
SELECT * FROM PARTICIPATED ORDER BY DAMAGE_AMOUNT DESC;
SELECT AVG(DAMAGE_AMOUNT) FROM PARTICIPATED;

DELETE FROM PARTICIPATED
WHERE DAMAGE_AMOUNT < (
    SELECT avg_damage FROM (
        SELECT AVG(DAMAGE_AMOUNT) AS avg_damage FROM PARTICIPATED
    ) AS temp
);

SELECT NAME FROM PERSON A, PARTICIPATED B WHERE A.DRIVER_ID = B.DRIVER_ID
AND DAMAGE_AMOUNT>(SELECT AVG(DAMAGE_AMOUNT) FROM PARTICIPATED);
SELECT MAX(DAMAGE_AMOUNT) FROM PARTICIPATED;
select accident_date,location from accident;
select distinct driver_id from participated where damage_amount>=25000;
select * from participated;
