-- Schema
create database db_university_schema;
use db_university_schema;

-- Tabella Departments
create table `departments`(
`id` int not null auto_increment,
`name` varchar(100) not null,
`address` varchar(255),
`phone` varchar(13) not null,
`email` varchar(100),
`website` varchar(255) not null,
`head_of_department` varchar(100),
primary key (`id`)
);

-- Tabella Degrees
create table `degrees` (
`id` int not null auto_increment,
`name` varchar(100) not null,
`address` varchar(255),
`email` varchar(100),
`website` varchar(255) not null,
`level` varchar(100) not null,
`departments_id` int,
primary key (`id`),
foreign key(`departments_id`) references departments (`id`)
);

-- Tabella Student
create table `student` (
`id` int not null auto_increment,
`name` varchar(50) not null,
`surname` varchar(50) not null,
`date_of_birth` date not null,
`fiscal_code` char(16) not null,
`enrolment_date` date not null,
`registration_number` mediumint not null,
`email` varchar(100) not null,
`degrees_id` int,
primary key (`id`),
foreign key (`degrees_id`) references `degrees` (`id`)
);

-- Tabella Exams
create table `exams` (
`id` int not null auto_increment,
`date` date not null,
`hour` time not null,
`location` varchar(100),
`address` varchar(255) not null,
`courses_id` int,
primary key (`id`),
foreign key (`courses_id`) references `courses` (`id`)
);

-- Tabella Courses
create table `courses` (
`id` int not null auto_increment,
`name` varchar(100) not null,
`description` varchar(255),
`website` varchar(100) not null,
`cfu` int not null,
`degrees_id` int,
primary key (`id`),
foreign key (`degrees_id`) references `degrees` (`id`)
);

-- Tabella ponte Student_Exams
create table `vote` (
`vote` int not null,
`exams_id` INT not null,
`student_id` INT not null,
primary key(`student_id`, `exams_id`),
foreign key(`student_id`) references `student`(`id`),
foreign key(`exams_id`) references `exams`(`id`)
);

-- Tabella teachers
create table `teachers` (
`id` int not null auto_increment,
`name` varchar(100) not null,
`surname` varchar(100) not null,
`phone` varchar(13) not null,
`email` varchar(100) not null,
`office_address` varchar(255),
primary key (`id`)
);

-- Dati
-- Departments
insert into departments (name, address, phone, email, website, head_of_department) values ('Ingegneria', 'Viale dei caduti 123, Roma', '0557891012', 'ingegneria@uni.it', 'ingegneria.roma@uni.it', 'Conti Andrea');
insert into departments (name, address, phone, email, website, head_of_department) values ('Latteratura', 'Viale Firenze 98b, Napoli', '0557834312', 'letteratura@uni.it', 'letteratura.napoli@uni.it', 'Rossi Luca');
insert into departments (name, address, phone, email, website, head_of_department) values ('Economia', 'Piazza Marco 69s, Roma', '0516491012', 'economia@uni.it', 'economia.roma@uni.it', 'Pane Marco');

-- Degrees
insert into degrees (name, address, email, website, `level`) values ('Informatica', 'Viale dei caduti 123, Roma', 'ingegneria@uni.it', 'informatica.roma@uni.it', 'Triennale');
insert into degrees (name, address, email, website, `level`) values ('Robotica', 'Viale dei caduti 123, Roma', 'ingegneria@uni.it', 'informatica.roma@uni.it', 'Triennale');
insert into degrees (name, address, email, website, `level`) values ('Gestionale', 'Viale dei caduti 123, Roma', 'ingegneria@uni.it', 'informatica.roma@uni.it', 'Triennale');

-- Student
insert into student (name, surname, date_of_birth , fiscal_code , enrolment_date , registration_number, email) values ('Andrea', 'Conti', '1997-07-28', 'CNTNDR97L28F656G', '2021-12-13', 1, 'andrea.conti2333@gmail.com');
insert into student (name, surname, date_of_birth , fiscal_code , enrolment_date , registration_number, email) values ('Gianluca', 'Deri', '1968-11-12', 'CNTNDR97L28F656G', '2021-01-01', 1, 'andrea.conti1999@gmail.com');
insert into student (name, surname, date_of_birth , fiscal_code , enrolment_date , registration_number, email) values ('Marco', 'Neri', '1978-05-18', 'CNTNDR97L28F656G', '2019-04-01', 1, 'andrea.conti1969@gmail.com');

-- Exams
insert into exams (`date`, `hour`, location, address) values ('2022-03-01', '10:00', 'aula 3', 'Via Marco 13, Roma');
insert into exams (`date`, `hour`, location, address) values ('2023-12-18', '13:00', 'aula 5', 'Via Mattia 13, Pavia');
insert into exams (`date`, `hour`, location, address) values ('2024-05-09', '18:00', 'aula 9', 'Via Savio 13, Caserta');

-- Vote
insert into vote (vote, exams_id, student_id) values ('12', 1, 1);
insert into vote (vote, exams_id, student_id) values ('18', 2, 2);
insert into vote (vote, exams_id, student_id) values ('30', 3, 3);

-- Courses
insert into courses  (name, description, website, cfu) values ('Storia', 'Dalla prima alla seconda guerra mondiale', 'www.uni.storia.it', 0);
insert into courses  (name, description, website, cfu) values ('Inglese', 'Dalla prima alla seconda guerra mondiale, inglese', 'www.uni.inglese.it', 0);
insert into courses  (name, description, website, cfu) values ('Geografia', 'Dalla prima alla seconda guerra mondiale, strategie', 'www.uni.geografia.it', 0);

-- Teachers 
insert into teachers (name, surname, phone, email, office_address) values ('Jhon', 'Snow', '8290384937', 'iwejfiw@gmail.com', 'Viale Mazzini 1, Lucca');
insert into teachers (name, surname, phone, email, office_address) values ('Jhon', 'Snow', '8290384937', 'iwejfiw@gmail.com', 'Viale Mazzini 1, Lucca');
insert into teachers (name, surname, phone, email, office_address) values ('Jhon', 'Snow', '8290384937', 'iwejfiw@gmail.com', 'Viale Mazzini 1, Lucca');