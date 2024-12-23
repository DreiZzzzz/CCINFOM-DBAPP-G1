CREATE DATABASE dbtrains;

USE dbtrains;

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
    start_date DATE,
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
    salary DOUBLE, 
    effective_from DATE NOT NULL, 
    effective_to DATE DEFAULT NULL,
	FOREIGN KEY(driver_id) REFERENCES drivers(driver_id)
);


-- Train Lines Record
INSERT INTO train_lines
VALUES (1, "LRT-1", "Light Rail Transit Authority (LRTA)", TRUE),
       (2, "LRT-2", "Light Rail Transit Authority (LRTA)", TRUE),
       (3, "MRT-3", "Metro Rail Transit Corporation (MRTC)", TRUE),
       (4, "PNR", "Government", FALSE),
       (5, "MRT-7", "San Miguel Corporation (SMC)", FALSE);

-- Train Station Records
INSERT INTO train_stations
VALUES (1, "Vito Cruz", 1, "Manila City", '1984-12-01', FALSE), 
       (2, "EDSA", 1, "Pasay City", '1984-12-01', FALSE),
       (3, "Recto", 2, "Manila City", '2004-10-29', TRUE),
       (4, "Araneta-Cubao", 2, "Quezon City", '2003-04-05', TRUE),
       (5, "Taft Ave", 3, "Pasay City", '2000-07-20', FALSE);

-- station_status_history
INSERT INTO station_status_history
VALUES (1, 1, 'Operational', '1984-12-01', NULL),
       (2, 2, 'Operational', '1984-12-01', NULL),
       (3, 3, 'Operational', '2004-10-29', NULL),
       (4, 4, 'Under Construction', '2003-04-05', NULL),
       (5, 5, 'Under Maintenance', '2000-07-20', NULL);

-- Train Records
INSERT INTO trains
VALUES (1, 1, '1st', 8, 208, '1984-12-01', '1999-12-31'),
       (2, 4, '1st', 8, 208, '1975-11-24', '1994-02-25'),
       (3, 4, '2nd', 10, 280, '1992-06-07', '2024-03-28'),
       (4, 4, '4th', 12, 420, '2011-10-22', '2024-03-28'),
       (5, 1, '3rd', 12, 360, '2000-01-01', NULL),
       (6, 2, '3rd', 12, 360, '2003-04-05', NULL),
       (7, 3, '2nd', 10, 280, '1999-12-15', NULL);

-- Train Status Records
INSERT INTO train_status_log
VALUES (1, 1, 'Retired', '1984-12-01', '1999-12-31'),
       (2, 2, 'Incident Report', '2004-12-12', '2004-12-12'),
       (3, 3, 'Incident Report', '2006-11-13', '2006-11-13'),
       (4, 2, 'Operational', '2000-01-01', NULL),
       (5, 3, 'Operational', '2003-04-05', NULL),
       (6, 4, 'Operational', '1999-12-15', NULL),
       (7, 5, 'Under Maintenance', '1985-10-25', '1985-12-03'),
       (8, 6, 'Under Maintenance', '2001-04-20', '2001-05-10'),
       (9, 5, 'Retired', '1975-11-24', '1994-02-25'),
       (10, 6, 'Retired', '1992-06-07', '2024-03-28'),
       (11, 7, 'Retired', '2011-10-22', '2024-03-28');
SELECT * FROM train_status_log JOIN trains ON train_status_log.train_id = trains.train_id;

-- Drivers Records
INSERT INTO drivers
VALUES (1, "Jasper", "Lee", "leejasper68@yahoo.com"),
       (2, "Emman", "Dela Paz", "0927 064 6942"),
       (3, "Ren", "Perez", "rcperez444@ymail.com"),
       (4, "Albert", "Manuel", "bert_manuel@gmail.com"),
       (5, "Tyler", "Sales", "tylermakessales@gmail.com"),
       (6, "Kyle", "Ong", "kyle_ong_91@ymail.com"),
       (7, "Rafael", "Borja", "borja_raphael@yahoo.com"),
       (8, "Enzo", "Rivera", "0966 286 4853");
SELECT * FROM drivers;

-- Train Driver Records
INSERT INTO train_driver_log
VALUES (1, 1, 2, '1999-11-11', NULL),
       (2, 2, 3, '1988-09-21', NULL),
       (3, 3, 2, '2012-02-03', NULL),
       (4, 4, 4, '2016-07-26', NULL),
       (5, 5, 3, '2019-04-30', NULL),
       (6, 6, 4, '2014-01-10', NULL),
       (7, 7, 4, '2007-03-18', NULL),
       (8, 8, 4, '2022-12-10', NULL);
SELECT * FROM train_driver_log JOIN drivers ON train_driver_log.driver_id = drivers.driver_id JOIN trains ON train_driver_log.train_id = trains.train_id;

-- Salary
INSERT INTO salary
VALUES (1, 1, 5200, '1999-11-11', '2006-02-17'),
       (2, 1, 7500, '2006-02-18', NULL),
       (3, 2, 4300, '1988-09-21', '1998-05-04'),
       (4, 2, 6100, '1998-05-05', '2011-08-07'),
       (5, 2, 7700, '2011-08-08', NULL),
       (6, 3, 7650, '2012-02-03', NULL),
       (7, 4, 8200, '2016-07-26', NULL),
       (8, 5, 7120, '2019-04-30', NULL),
       (9, 6, 6900, '2014-01-10', NULL),
       (10, 7, 7300, '2007-03-18', '2021-10-11'),
       (11, 7, 7800, '2021-10-12', NULL),
       (12, 8, 6850, '2022-12-10', NULL);
SELECT * FROM salary JOIN drivers ON salary.driver_id = drivers.driver_id;



    
    

