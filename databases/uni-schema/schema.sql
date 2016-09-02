-- you can run this file by issuing:
-- sqlite3 uni.db < schema.sql

CREATE TABLE students (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name varchar(255),
  email varchar(255)
);
CREATE INDEX my_student_email_index ON students (email);

CREATE TABLE "enrollments" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "student_id" integer,
  "section_id" integer,
  "course_id" integer,
  "final_grade" varchar(255),
  FOREIGN KEY(student_id) REFERENCES students(id),
  FOREIGN KEY(section_id) REFERENCES sections(id)
);

CREATE INDEX students_student_id ON enrollments(student_id);
CREATE INDEX students_student_id ON enrollments(course_id);
-- CREATE INDEX students_section_id ON enrollments(section_id);
CREATE INDEX students_section_id_student_id ON enrollments(section_id, course_id);
CREATE INDEX students_section_id_student_id ON enrollments(course_id, student_id);

CREATE INDEX students_section_id_student_id_course_id ON enrollments(section_id, student_id, course_id);



CREATE TABLE "sections" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "course_id" integer,
  "teacher_id" integer,
  "name" varchar(255),
  "start_at" datetime,
  "ends_at" datetime,
  "days_of_week" varchar(255),
  FOREIGN KEY(course_id) REFERENCES courses(id),
  FOREIGN KEY(teacher_id) REFERENCES teachers(id)
);


CREATE TABLE "courses" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "name" varchar(255),
  "description" text
);

CREATE TABLE "teachers" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "name" varchar(255),
  "email" varchar(255)
);

CREATE TABLE "departments" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "name" varchar(255)
);

CREATE TABLE "department_courses" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "department_id" integer,
  "course_id" integer
);


CREATE UNIQUE INDEX student_id_course_id ON enrollments(student_id, course_id);
