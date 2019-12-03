#start the database in-secure
#mysqld --initialize-insecure

mysql -u root -p root

CREATE DATABASE cts_iiht_capsule;

CREATE TABLE Parent_Task (
	Parent_id BIGINT(10) NOT NULL AUTO_INCREMENT,
	Parent_Task VARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY (parent_id)
);

CREATE TABLE Task (
	Task_id BIGINT(10) NOT NULL AUTO_INCREMENT,
	Parent_id BIGINT(10) NULL DEFAULT NULL,
	Task VARCHAR(50) NULL DEFAULT NULL,
	Start_Date VARCHAR(10) NULL DEFAULT NULL,
	End_Date VARCHAR(10) NULL DEFAULT NULL,
	Priority VARCHAR(2) NULL DEFAULT NULL,
	Status BIGINT(2) NULL DEFAULT NULL,
	User VARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY (Task_id),
	CONSTRAINT FK_TASK_PT FOREIGN KEY (Parent_id) REFERENCES Parent_Task (Parent_id)
);

CREATE TABLE Project (
	Project_ID BIGINT(10) NOT NULL AUTO_INCREMENT,
	Project VARCHAR(50) NULL DEFAULT NULL,
	Start_Date VARCHAR(10) NULL DEFAULT NULL,
	End_Date VARCHAR(10) NULL DEFAULT NULL,
	Priority VARCHAR(2) NULL DEFAULT NULL,
	Status BIGINT(2) NULL DEFAULT NULL,
	Manager VARCHAR(20) NULL DEFAULT NULL,
	PRIMARY KEY (Project_ID)
);

CREATE TABLE Users (
	User_ID BIGINT(10) NOT NULL,
	First_Name VARCHAR(50) NULL DEFAULT NULL,
	Last_Name VARCHAR(50) NULL DEFAULT NULL,
	Employee_ID BIGINT(10) NOT NULL,
	Project_ID BIGINT(10) NULL DEFAULT NULL,
	Task_id BIGINT(10) NULL DEFAULT NULL,
	PRIMARY KEY (Employee_ID),
	CONSTRAINT FK_PROJECTS_PROJECT_ID FOREIGN KEY (Project_ID) REFERENCES Project (Project_ID),
	CONSTRAINT FK_PROJECTS_TASK_ID FOREIGN KEY (Task_id) REFERENCES Task (Task_id)
);

USE CTS_IIHT_CAPSULE;

SELECT * FROM Parent_Task;
SELECT * FROM Task;
SELECT * FROM Project;
SELECT * FROM Users;
