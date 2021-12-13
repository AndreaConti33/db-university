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
`cfu` bit not null,
`degrees_id` int,
primary key (`id`),
foreign key (`degrees_id`) references `degrees` (`id`)
);

-- Tabella ponte Student_Exams
create table `vote` (
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
