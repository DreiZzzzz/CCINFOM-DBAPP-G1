-- Last edit @ 2:18 p.m by Drei
-- Last edit @ 3:13 a.m by Pat NOTE: sorry trying to fix adprg kaya late nakagawa


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
    status_rep ENUM('Incident Report', 'Operational', 'Under Maintenance', 'Retired', 'Under Construction') NOT NULL,
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
    status_rep ENUM('Incident Report', 'Operational', 'Under Maintenance', 'Retired') NOT NULL,
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
	   (4, "PNR", "Government", FALSE),
       (5, "MRT-7", "San Miguel Corporation (SMC)", FALSE),
       (6, "Metro Manila Subway (MRT-9)", "Government", FALSE);
SELECT * FROM train_lines;

-- Train Station Records
INSERT INTO train_stations
VALUES (1, "Vito Cruz", 1, "Manila City", '1984-12-01', FALSE), 
	   (2, "EDSA", 1, "Pasay City", '1984-12-01', FALSE),
       (3, "Recto", 2, "Manila City", '2004-10-29', TRUE),
       (4, "Araneta-Cubao", 2, "Quezon City", '2003-04-05', TRUE),
       (5, "Taft Ave", 3, "Pasay City", '2000-07-20', FALSE),
       (6, "Araneta-Cubao", 3, "Quezon City", '1999-12-15', FALSE),
       (7, "Vito Cruz", 4, "Manila City", '1975-11-24', FALSE),
       (8, "EDSA", 4, "Makati City", '2005-01-01', FALSE),
       (9, "North Ave", 5, "Quezon City", NULL, TRUE),
       (10, "Doña Carmen", 5, "Quezon City", NULL, TRUE),
       (11, "North Ave", 6, "Quezon City", NULL, TRUE),
       (12, "Bonifacio Global City", 6, "Taguig City", NULL, TRUE);
SELECT * FROM train_stations JOIN train_lines ON train_lines.train_line_id = train_stations.train_line_id;

-- Station Status Records
INSERT INTO station_status_history
VALUES (1, 1, 'Operational', '1984-12-01', NULL),
       (2, 2, 'Operational', '1984-12-01', NULL),
       (3, 3, 'Operational', '2004-10-29', NULL),
       (4, 4, 'Operational', '2003-04-05', NULL),
       (5, 5, 'Operational', '2000-07-20', NULL),
       (6, 6, 'Operational', '1999-12-15', NULL),
       (7, 7, 'Retired', '1975-11-24', '2024-03-28'),
       (8, 8, 'Retired', '2005-01-01', '2024-03-28'),
       (9, 9, 'Under Construction', NULL, NULL),
       (10, 10, 'Under Construction', NULL, NULL),
       (11, 11, 'Under Construction', NULL, NULL),
       (12, 12, 'Under Construction', NULL, NULL);
SELECT * FROM station_status_history JOIN train_stations ON station_status_history.station_id = train_stations.station_id;

-- Train Records
INSERT INTO trains
VALUES (),
       (),
       (),
       (),
       (),
       ();
SELECT * FROM trains JOIN train_lines ON trains.train_line_id = train_lines.train_line_id;

-- Train Status Records
INSERT INTO train_status_log
VALUES (),
       (),
       (),
       (),
       (),
       ();
SELECT * FROM train_status_log JOIN trains ON train_status_log.train_id = trains.train_id;

-- Drivers Records
INSERT INTO drivers
VALUES (),
       (),
       (),
       (),
       (),
       ();
SELECT * FROM drivers;

-- Train Driver Records
INSERT INTO train_driver_log
VALUES (),
       (),
       (),
       (),
       (),
       ();
SELECT * FROM train_driver_log JOIN drivers ON train_driver_log.driver_id = drivers.driver_id JOIN trains ON train_driver_log.train_id = trains.train_id;

-- Salary
INSERT INTO salary
VALUES (),
       (),
       (),
       (),
       (),
       ();
SELECT * FROM salary JOIN drivers ON salary.driver_id = drivers.train_id;