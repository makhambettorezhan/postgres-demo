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
insert into major (major_id, name) values (2, 'Mathematics', 2);
insert into major (major_id, name) values (3, 'Physics', 2);
insert into major (major_id, name) values (3, 'History', 3);

/*create table teacher_course (
    CONSTRAINT fk_major
        FOREIGN KEY(major_id)
            REFERENCES major(major_id),
    CONSTRAINT fk_course
        FOREIGN KEY(course_id)
            REFERENCES major(course_id)
);*/