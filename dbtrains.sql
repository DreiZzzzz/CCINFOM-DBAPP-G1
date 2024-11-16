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

-- Drivers table
CREATE TABLE drivers(
	driver_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    contact_info VARCHAR(100) NOT NULL
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

-- create records below
-- min of 5 per table
-- read records creation message to produce meaningful records