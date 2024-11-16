-- Last edit @ 2:18 p.m by Drei



CREATE DATABASE dbtrains;

-- Train Lines Table
CREATE TABLE train_lines(
	train_line_id INT PRIMARY KEY, 
    line_name VARCHAR(100) NOT NULL,
    company_handler VARCHAR(100),
    is_operational BOOLEAN
);

-- Train Stations
CREATE TABLE train_stations (
	station_id INT PRIMARY KEY, 
    station_name VARCHAR(100) NOT NULL,
    train_line_id INT NOT NULL,
    station_location VARCHAR(100), 
	founding_date DATE,
    is_pwd_friendly BOOLEAN,
    FOREIGN KEY (train_line_id) REFERENCES train_lines(train_line_id)
);

-- Station Status History Table
CREATE TABLE station_status_history(
	station_status_id INT PRIMARY KEY,
	station_id INT,
    status_rep ENUM('Incident Report', 'Operational', 'Under Maintenance') NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE DEFAULT NULL,
    FOREIGN KEY (station_id) REFERENCES train_stations(station_id)
);

-- Trains Table
CREATE TABLE trains(
	train_id INT PRIMARY KEY,
	train_line_id INT,
    train_generation ENUM('1st', '2nd', '3rd', '4th'),
    cart_total INT NOT NULL, 
    maximum_capacity INT,
    date_acquired DATE NOT NULL, 
    date_retired DATE DEFAULT NULL,
    FOREIGN KEY (train_line_id) REFERENCES train_lines(train_line_id)
);

-- Train Status History Table
CREATE TABLE train_status_log(
	train_status_id INT PRIMARY KEY,
	train_id INT NOT NULL,
    status_rep ENUM('Incident Report', 'Operational', 'Under Maintenance') NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE DEFAULT NULL,
    FOREIGN KEY (train_id) REFERENCES trains(train_id)
);

-- Drivers table
CREATE TABLE drivers(
	driver_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    contact_info VARCHAR(100) NOT NULL
);

-- Train Driver Log Table
CREATE TABLE train_driver_log(
	log_id INT PRIMARY KEY, 
    driver_id INT,
    train_id INT,
    start_date DATE NOT NULL,
    end_date DATE DEFAULT NULL,
    FOREIGN KEY (train_id) REFERENCES trains(train_id),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);

-- Salary Table
CREATE TABLE salary(
	salary_id INT PRIMARY KEY,
    driver_id INT, 
    salary INT, 
    effective_from DATE NOT NULL, 
    effective_to DATE DEFAULT NULL,
	FOREIGN KEY(driver_id) REFERENCES drivers(driver_id)
)
-- VIEW tables
SELECT * FROM drivers;
SELECT * FROM salary;
SELECT * FROM station_status_history;
SELECT * FROM train_driver_log;
SELECT * FROM train_lines;
SELECT * FROM train_stations;
SELECT * FROM train_status_log;
SELECT * FROM trains;

-- create records below
-- min of 5 per table
-- read records creation message to produce meaningful records

-- Train Lines Record
INSERT INTO train_lines
VALUES (1, "LRT-1", "Light Rail Transit Authority (LRTA)", TRUE),
	   (2, "LRT-2", "Light Rail Transit Authority (LRTA)", TRUE),
	   (3, "MRT-3", "Metro Rail Transit Corporation (MRTC)", TRUE),
	   (4, "PNR", "Government", FALSE);
SELECT * FROM train_lines;

-- Train Station Records
INSERT INTO train_stations
VALUES (), 
		(),
        ()