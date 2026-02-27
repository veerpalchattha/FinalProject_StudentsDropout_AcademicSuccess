
Use  students;
CREATE TABLE IF NOT EXISTS `students` (
	`student_id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`age_of_enrollment` INT NOT NULL,
	`displaced` INT NOT NULL,
	`international` INT NOT NULL,
	`students_outcomes_id` INT NOT NULL,
	`gender_id` INT NOT NULL,
	`financial_status_id` INT NOT NULL,
	`education_special_needs_id` INT,
	PRIMARY KEY(`student_id`)
);

ALTER TABLE curricular_units
RENAME COLUMN curricular_units_grade TO curricular_units_1st_sem_grade;

ALTER TABLE education_special_needs
RENAME COLUMN special_needs TO educational_special_needs;

ALTER TABLE curricular_units
ADD COLUMN curricular_units_2nd_sem_credited INT,
ADD COLUMN curricular_units_2nd_sem_enrolled INT,
ADD COLUMN curricular_units_2nd_sem_evaluations INt,
ADD COLUMN curricular_units_2nd_sem_approved INT,
ADD COLUMN curricular_units_2nd_sem_grade INT,
ADD COLUMN curricular_units_2nd_sem_without_evaluations INt;

ALTER TABLE students
DROP COLUMN curricular_units_2nd_sem_credited,
DROP COLUMN curricular_units_2nd_sem_enrolled,
DROP COLUMN curricular_units_2nd_sem_evaluations,
DROP COLUMN curricular_units_2nd_sem_approved,
DROP COLUMN curricular_units_2nd_sem_grade,
DROP COLUMN curricular_units_2nd_sem_without_evaluations;

ALTER TABLE curricular_units
DROP COLUMN semester_id;


CREATE TABLE IF NOT EXISTS `courses` (
	`course_id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`course_name` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`course_id`)
);


CREATE TABLE IF NOT EXISTS `students_courses` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`student_id` INT NOT NULL,
	`course_id` INT NOT NULL,
	PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `students_outcomes` (
	`students_outcomes_id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`target` CHAR(1) NOT NULL,
	PRIMARY KEY(`students_outcomes_id`)
);


CREATE TABLE IF NOT EXISTS `gender` (
	`gender_id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`gender` CHAR(1),
	PRIMARY KEY(`gender_id`)
);


CREATE TABLE IF NOT EXISTS `financial_status` (
	`financial_status_id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`debtor` INT NOT NULL,
	`scholarship_holder` INT NOT NULL,
	`tution_fees_upto_date` INT NOT NULL,
	PRIMARY KEY(`financial_status_id`)
);


CREATE TABLE IF NOT EXISTS `parents` (
	`parents_id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`mothers_quallifications` INT NOT NULL,
	`mothers_occupation` INT NOT NULL,
	`fathers_qualification` INT NOT NULL,
	`fathers_occupation` INT NOT NULL,
	PRIMARY KEY(`parents_id`)
);


CREATE TABLE IF NOT EXISTS `parents_students` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`student_id` INT NOT NULL,
	`parents_id` INT NOT NULL,
	PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `nationality` (
	`nationality_id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`nationality` CHAR(1) NOT NULL,
	`countries_id` INT NOT NULL,
	PRIMARY KEY(`nationality_id`)
);


CREATE TABLE IF NOT EXISTS `students_nationality` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`student_id` INT NOT NULL,
	`nationality_id` INT NOT NULL,
	PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `countries` (
	`country_id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`name` CHAR(1),
	`economic_indicators_id` INT,
	PRIMARY KEY(`country_id`)
);


CREATE TABLE IF NOT EXISTS `economic_indicators` (
	`economic_indicators_id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`gdp` FLOAT NOT NULL,
	`unemployment_rate` FLOAT NOT NULL,
	`inflation_rate` FLOAT NOT NULL,
	PRIMARY KEY(`economic_indicators_id`)
);


CREATE TABLE IF NOT EXISTS `admission` (
	`admission_id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`application_mode` INT NOT NULL,
	`attendance_type` INT NOT NULL,
	`application_order` INT NOT NULL,
	`previous_qualification` INT NOT NULL,
	`previous_qualification_grade` INT NOT NULL,
	`admission_grade` INT NOT NULL,
	`student_id` INT NOT NULL,
	PRIMARY KEY(`admission_id`)
);


CREATE TABLE IF NOT EXISTS `education_special_needs` (
	`education_special_needs_id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`special_needs` INT NOT NULL,
	PRIMARY KEY(`education_special_needs_id`)
);


CREATE TABLE IF NOT EXISTS `curricular_units` (
	`curricular_units_id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`curricular_units_credited` INT NOT NULL,
	`curricular_units_evaluations` INT NOT NULL,
	`curricular_units_enrolled` INT,
	`curricular_units_grade` INT,
	`curricular_units_without_evaluation` INT,
	PRIMARY KEY(`curricular_units_id`)
);


CREATE TABLE IF NOT EXISTS `semester` (
	`semester_id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`semester_number` INT NOT NULL,
	`curricular_units_id` INT NOT NULL,
	PRIMARY KEY(`semester_id`)
);

drop table semester;
ALTER TABLE curricular_units
DROP COLUMN semester_id;
ALTER TABLE curricular_units
DROP FOREIGN KEY fk_cu_semester;

CREATE TABLE IF NOT EXISTS `curricural_units_courses` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`curricural_units_id` INT NOT NULL,
	`courses_id` INT NOT NULL,
	PRIMARY KEY(`id`)
);


ALTER TABLE `students`
ADD FOREIGN KEY(`student_id`) REFERENCES `students_courses`(`student_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `courses`
ADD FOREIGN KEY(`course_id`) REFERENCES `students_courses`(`course_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `students`
ADD FOREIGN KEY(`students_outcomes_id`) REFERENCES `students_outcomes`(`students_outcomes_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `students`
ADD FOREIGN KEY(`gender_id`) REFERENCES `gender`(`gender_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `gender`
ADD FOREIGN KEY(`gender_id`) REFERENCES `students`(`gender_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `students`
ADD FOREIGN KEY(`financial_status_id`) REFERENCES `financial_status`(`financial_status_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `parents_students`
ADD FOREIGN KEY(`parents_id`) REFERENCES `parents`(`parents_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `parents_students`
ADD FOREIGN KEY(`student_id`) REFERENCES `students`(`student_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `students_nationality`
ADD FOREIGN KEY(`student_id`) REFERENCES `students`(`student_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `nationality`
ADD FOREIGN KEY(`nationality_id`) REFERENCES `students_nationality`(`nationality_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `nationality`
ADD FOREIGN KEY(`countries_id`) REFERENCES `countries`(`country_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `countries`
ADD FOREIGN KEY(`economic_indicators_id`) REFERENCES `economic_indicators`(`economic_indicators_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE students_courses
ADD CONSTRAINT fk_sc_student
FOREIGN KEY (student_id)
REFERENCES students(student_id)
ON UPDATE CASCADE
ON DELETE CASCADE;


ALTER TABLE students_courses 
ADD CONSTRAINT fk_sc_course 
FOREIGN KEY (course_id) 
REFERENCES courses(course_id) 
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE curricular_units 
ADD COLUMN semester_id INT NOT NULL;

ALTER TABLE curricular_units 
ADD CONSTRAINT fk_cu_semester 
FOREIGN KEY (semester_id) 
REFERENCES semester(semester_id) 
ON UPDATE CASCADE 
ON DELETE RESTRICT;

ALTER TABLE `curricural_units_courses`
ADD FOREIGN KEY(`courses_id`) REFERENCES `courses`(`course_id`)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `curricural_units_courses`
ADD FOREIGN KEY(`curricural_units_id`) REFERENCES `curricular_units`(`curricular_units_id`)
ON UPDATE CASCADE ON DELETE CASCADE;