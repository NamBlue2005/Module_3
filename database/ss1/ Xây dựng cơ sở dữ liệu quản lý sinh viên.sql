create database student_management;
use student_management;

create table class (
	id int primary key auto_increment,
    name varchar(100) not null
 );
create table teacher(
	id int primary key auto_increment,
    name varchar(100) not null,
	age int not null,
	country varchar(255) not null
);

insert into class (name) values
('Lớp 12A1'),
('Lớp 11A4'),
('Lớp 10A3');

insert into teacher (name, age, country) values
('Nguyễn Văn A', 40, 'Việt Nam'),
('Trần Thị B', 35, 'Việt Nam'),
('Lê Hoàng C', 50, 'Việt Nam');

select * from class;
select * from teacher;
