create table school (
    school_id INTEGER PRIMARY KEY not null,
    name varchar(255)
);

create table major (
    major_id Integer primary key not null,
    name varchar(255),
    school_id INTEGER,
    FOREIGN KEY(school_id)
        REFERENCES school(school_id)
);

create table Course(
    course_id INTEGER primary key not null,
    name varchar(255),
    major_id integer,
    CONSTRAINT fk_major
        FOREIGN KEY(major_id)
            REFERENCES major(major_id)
);

create table teacher (
    teacher_id Integer primary key not null,
    firstname varchar(255),
    lastname varchar(255),
    dob DATE,
    nationality varchar(255),
    email varchar(255),
    major_id integer,
    CONSTRAINT fk_major
        FOREIGN KEY(major_id)
            REFERENCES major(major_id)
);

create table student (
    student_id Integer primary key null,
    firstname varchar(255),
    lastname varchar(255),
    dob Date,
    gender varchar(255),
    nationality varchar(255),
    email varchar(255),
    year_of_study Integer,
    teacher_id integer,
    major_id integer,
    CONSTRAINT fk_teacher
        FOREIGN KEY(teacher_id)
            REFERENCES teacher(teacher_id),
    CONSTRAINT fk_major
        FOREIGN KEY(major_id)
            REFERENCES major(major_id)
);

insert into school (school_id, name) values (1, 'SENG');
insert into school (school_id, name) values (2, 'SST');
insert into school (school_id, name) values (3, 'SSH');

insert into major (major_id, name, school_id) values (1, 'Computer Science', 1);
insert into major (major_id, name, school_id) values (2, 'Mathematics', 2);
insert into major (major_id, name, school_id) values (3, 'Physics', 2);
insert into major (major_id, name, school_id) values (4, 'History', 3);

insert into course (course_id, name, major_id) values (1, 'Programing Languages', 1);
insert into course (course_id, name, major_id) values (2, 'Operating Systems', 1);
insert into course (course_id, name, major_id) values (3, 'Abstract Algebra', 2);
insert into course (course_id, name, major_id) values (4, 'Astronomy', 3);
insert into course (course_id, name, major_id) values (5, 'Astrophysics', 3);
insert into course (course_id, name, major_id) values (6, 'History of Kazakhstan', 4);

insert into teacher (teacher_id, firstname, lastname, dob, nationality, email, major_id)
values (1, 'Askar', 'Boranbayev', '1970-01-01', 'Kazakh', 'askar.boranbayev@gmail.com', 1);

insert into teacher (teacher_id, firstname, lastname, dob, nationality, email, major_id)
values (2, 'Bob', 'Smith', '1970-01-01', 'American', 'bob.smith@gmail.com', 2);

insert into teacher (teacher_id, firstname, lastname, dob, nationality, email, major_id)
values (3, 'Alice', 'Nicolas', '1970-01-01', 'Philippine', 'alice.smith@gmail.com', 3);

insert into teacher (teacher_id, firstname, lastname, dob, nationality, email, major_id)
values (4, 'Ken', 'Tyson', '1970-01-01', 'American', 'ken.smith@gmail.com', 4);

insert into teacher (teacher_id, firstname, lastname, dob, nationality, email, major_id)
values (5, 'Ken', 'Tyson', '2007-01-01', 'American', 'ken.smith@gmail.com', 4);

insert into student (student_id, firstname, lastname, dob, gender, nationality, email, year_of_study, teacher_id, major_id)
values (1, 'Makhambet', 'Torezhan', '1970-01-01', 'male', 'Kazakh', 'mtorezhan@gmail.com', 4, 1, 1);

insert into student (student_id, firstname, lastname, dob, gender, nationality, email, year_of_study, teacher_id, major_id)
values (2, 'Ali', 'Maksut', '1970-01-01', 'male', 'Kazakh', 'ali@gmail.com', 4, 2, 2);

insert into student (student_id, firstname, lastname, dob, gender, nationality, email, year_of_study, teacher_id, major_id)
values (3, 'Adam', 'Smith', '1970-01-01', 'male', 'Kazakh', 'adam@gmail.com', 3, 2, 3);

insert into student (student_id, firstname, lastname, dob, gender, nationality, email, year_of_study, teacher_id, major_id)
values (4, 'Tom', 'Jerry', '1970-01-01', 'male', 'US American', 'tom.jerry@gmail.com', 1, 4, 4);

insert into student (student_id, firstname, lastname, dob, gender, nationality, email, year_of_study, teacher_id, major_id)
values (5, 'Nurdaulet', 'Jerry', '1970-01-01', 'male', 'US American', 'tom.jerry@gmail.com', 1, 4, 4);

insert into student (student_id, firstname, lastname, dob, gender, nationality, email, year_of_study, teacher_id, major_id)
values (6, 'Nursultan', 'Jerry', '1970-01-01', 'male', 'US American', 'tom.jerry@gmail.com', 1, 4, 3);

insert into student (student_id, firstname, lastname, dob, gender, nationality, email, year_of_study, teacher_id, major_id)
values (7, 'Alibek', 'Jerry', '1970-01-01', 'male', 'US American', 'tom.jerry@gmail.com', 1, 3, 4);

insert into student (student_id, firstname, lastname, dob, gender, nationality, email, year_of_study, teacher_id, major_id)
values (8, 'Alice', 'Jerry', '1970-01-01', 'female', 'US American', 'tom.jerry@gmail.com', 1, 3, 4);

insert into student (student_id, firstname, lastname, dob, gender, nationality, email, year_of_study, teacher_id, major_id)
values (9, 'Clara', 'Jerry', '1970-01-01', 'female', 'US American', 'tom.jerry@gmail.com', 1, 3, 4);

insert into student (student_id, firstname, lastname, dob, gender, nationality, email, year_of_study, teacher_id, major_id)
values (10, 'Clara', 'Tom', '1970-01-01', 'female', 'US American', 'tom.jerry@gmail.com', 1, 3, 4);

select * from school;
select * from major;
select * from course;
select * from teacher;
select * from student;

select COUNT(firstname) from (select * from student where firstname like 'Ali%' or firstname like 'Nur%') as StudentName;

select * from student where extract(year from student.dob) > (select AVG(extract(year from student.dob)) from student);


select s.firstname || ' ' || s.lastname as Student, m.name as Major
from student s
join major m on s.major_id = m.major_id;

select s.name as School, m.name as Major from school s
join major m on s.school_id = m.school_id;

select s.firstname, s.lastname, s.dob, t.firstname, t.lastname from student s
join teacher t on t.teacher_id = s.teacher_id;

select max(count) from (select gender, count(gender) as count from student group by gender order by count desc) as numberbygender;

select count(s.firstname) as count, s.firstname from student s group by s.firstname order by count desc;

select s.student_id, s.firstname from student s where s.firstname in (select firstname from teacher) order by s.student_id;

/*1. output teachers older than 20*/
select * from teacher t where date_part('year', age(t.dob)) > 20;


/*2. REVISED. print students in history class */
select * from student
join major m on student.major_id = m.major_id
where m.name = 'History';


/*4. select major with most students*/
select majorname,count from (select count(1) as count, m.name as majorname
                        from student s
                                 join major m on s.major_id = m.major_id
                        group by majorname) as majorcount
where count = (select max(count) from (select count(1) as count, m.name as majorname
                        from student s
                                 join major m on s.major_id = m.major_id
                        group by majorname) as majorcount);

/*5. REVISED. select major with least students*/
select min(count) from (select count(1) as count, m.name as majorname
                        from student s
                                 join major m on s.major_id = m.major_id
                        group by majorname) as majorcount;


/*6. select students with similar names*/
select s1.student_id, firstname from student s1
where firstname in (select firstname from student s2 where s1.student_id <> s2.student_id) ;

select count(s.firstname), s.firstname from student s group by s.firstname having count(s.firstname) > 1 ;



UPDATE student s SET year_of_study = 2 from major m where m.major_id = s.major_id and m.name = 'Computer Science';

UPDATE student SET year_of_study = 3 where gender = 'female';











/*create table teacher_course (
    CONSTRAINT fk_major
        FOREIGN KEY(major_id)
            REFERENCES major(major_id),
    CONSTRAINT fk_course
        FOREIGN KEY(course_id)
            REFERENCES major(course_id)
);*/