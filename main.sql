CREATE TABLE PoliceStation(
    police_station_id INT PRIMARY KEY NOT NULL,
    location VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL
    );
DESCRIBE PoliceStation;

CREATE TABLE CrimeRecords (
    crime_records_id INT PRIMARY KEY NOT NULL,
    date_of_crime DATE NOT NULL,
    date_filed DATE NOT NULL,
    crime_status VARCHAR(100) NOT NULL,
    date_exonerated DATE,
    date_dismissed DATE,
    type_of_crime VARCHAR(100) NOT NULL,
    location_of_crime VARCHAR(100) NOT NULL,
    description VARCHAR(300) NOT NULL,
    police_station_id INT NOT NULL,
    FOREIGN KEY (police_station_id) REFERENCES PoliceStation(police_station_id)
    );
DESCRIBE CrimeRecords;

CREATE TABLE Lawyer (
    lawyer_id INT PRIMARY KEY NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100)
    );
DESCRIBE Lawyer;

CREATE TABLE Criminal (
    criminal_id INT PRIMARY KEY NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    lawyer_id INT,
    FOREIGN KEY(lawyer_id) REFERENCES Lawyer(lawyer_id)
    );
DESCRIBE Criminal;


CREATE TABLE CrimeRecords_Criminal(
    crime_records_id INT NOT NULL,
    criminal_id INT NOT NULL,
    PRIMARY KEY (crime_records_id, criminal_id),
    FOREIGN KEY (crime_records_id) REFERENCES CrimeRecords(crime_records_id),
    FOREIGN KEY (criminal_id) REFERENCES Criminal(criminal_id)
    );
DESCRIBE CrimeRecords_Criminal;

CREATE TABLE CrimeRecords_PoliceStation(
    crime_records_id INT NOT NULL,
    police_station_id INT NOT NULL,
    PRIMARY KEY(crime_records_id, police_station_id),
    FOREIGN KEY(crime_records_id) REFERENCES CrimeRecords(crime_records_id)
    );
DESCRIBE CrimeRecords_PoliceStation;

CREATE TABLE Complainant (
    complainant_id INT PRIMARY KEY NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    lawyer_id INT,
    FOREIGN KEY(lawyer_id) REFERENCES Lawyer(lawyer_id)
    );
DESCRIBE Complainant;

CREATE TABLE Complainant_PoliceStation (
    complainant_id INT NOT NULL,
    police_station_id INT NOT NULL,
    PRIMARY KEY (complainant_id, police_station_id),
    FOREIGN KEY(complainant_id) REFERENCES Complainant(complainant_id),
    FOREIGN KEY(police_station_id) REFERENCES PoliceStation(police_station_id)
    );
DESCRIBE Complainant_PoliceStation;

CREATE TABLE CrimeRecords_Complainant (
    crime_records_id INT NOT NULL,
    complainant_id INT NOT NULL,
    PRIMARY KEY (crime_records_id, complainant_id),
    FOREIGN KEY(crime_records_id) REFERENCES CrimeRecords(crime_records_id),
    FOREIGN KEY(complainant_id) REFERENCES Complainant(complainant_id)
    );
DESCRIBE CrimeRecords_Complainant;

CREATE TABLE CrimeRecords_Lawyer (
    crime_records_id INT NOT NULL,
    lawyer_id INT NOT NULL,
    PRIMARY KEY(crime_records_id, lawyer_id),
    FOREIGN KEY(crime_records_id) REFERENCES CrimeRecords(crime_records_id),
    FOREIGN KEY(lawyer_id) REFERENCES Lawyer(lawyer_id)
    );
DESCRIBE CrimeRecords_Lawyer;

CREATE TABLE Investigator (
    investigator_id INT PRIMARY KEY NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    police_station_id INT,
    FOREIGN KEY(police_station_id) REFERENCES PoliceStation(police_station_id)
    );
DESCRIBE Investigator;

CREATE TABLE CrimeRecords_Investigator (
    crime_records_id INT NOT NULL,
    investigator_id INT NOT NULL,
    PRIMARY KEY (crime_records_id, investigator_id),
    FOREIGN KEY(crime_records_id) REFERENCES CrimeRecords(crime_records_id),
    FOREIGN KEY(investigator_id) REFERENCES Investigator(investigator_id)
    );
DESCRIBE CrimeRecords_Investigator;

CREATE TABLE Officer (
    officer_id INT PRIMARY KEY NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    title VARCHAR(100),
    position_of_officer VARCHAR(100) NOT NULL,
    police_station_id INT NOT NULL,
    FOREIGN KEY(police_station_id) REFERENCES PoliceStation(police_station_id)
    );
DESCRIBE Officer;

CREATE TABLE CrimeRecord_Officer (
    crime_records_id INT NOT NULL,
    officer_id INT NOT NULL,
    PRIMARY KEY(crime_records_id, officer_id),
    FOREIGN KEY(crime_records_id) REFERENCES CrimeRecords(crime_records_id),
    FOREIGN KEY(officer_id) REFERENCES Officer(officer_id)
    );
DESCRIBE CrimeRecord_Officer;

INSERT INTO PoliceStation VALUES
(1, 'Lucena City', 'Allery St. Brgy. 5'),
(2, 'Sariaya', 'Sariaya Municipal Police'),
(3, 'Candelaria', 'Candelaria Town Station'),
(4, 'Barangay Gulang-Gulang, Lucena', 'Near St. Anne College'),
(5, 'Barangay San Roque, Lucena City', 'Near Lucena Cathedral'),
(6, 'Diversion Road, Sariaya', 'Beside Jollibee Sariaya'),
(7, 'Poblacion, Candelaria', 'Across Mercury Drug'),
(8, 'Barangay Dalahican, Lucena', 'Coastal area police outpost'),
(9, 'Poblacion Zone III, Gumaca', 'Behind Gumaca Public Market'),
(10, 'Barangay Ibabang Dupay, Lucena', 'Near Pacific Mall'),
(11, 'Barangay Masin Sur, Catanauan', 'Highway detachment'),
(12, 'Barangay Poblacion, Tiaong', 'In front of Tiaong Plaza'),
(13, 'Barangay Mayao Crossing, Lucena', 'Beside bus terminal');


INSERT INTO Lawyer VALUES
(1, 'Reyes', 'Ana', 'Santos'),
(2, 'Gomez', 'Luis', 'Dela Cruz'),
(3, 'Tan', 'Michelle', NULL),
(4, 'Chua', 'James', 'Yu'),
(5, 'Reyes', 'Ana', 'Gonzales'),
(6, 'Dela Cruz', 'Marco', 'Antonio'),
(7, 'Torres', 'Lucia', 'Marie'),
(8, 'Tan', 'Kevin', 'Lim'),
(9, 'Santos', 'Bianca', NULL),
(10, 'Villanueva', 'Ramon', 'Dela Paz'),
(11, 'Garcia', 'Paolo', 'Miguel'),
(12, 'Lopez', 'Andrea', 'Manalo'),
(13, 'Fernandez', 'Carmen', NULL);

INSERT INTO Criminal VALUES
(1, 'Santos', 'Jose', 'Ramos', 1),
(2, 'Torres', 'Marco', NULL, 2),
(3, 'Rivera', 'Nico', 'T.', 3),
(4, 'Lim', 'Erwin', 'James', 4),
(5, 'Castro', 'Jonas', 'Lee', 5),
(6, 'Morales', 'Andrew', 'S.', 6),
(7, 'Toribio', 'Elaine', NULL, 7),
(8, 'Navarro', 'Mike', 'D.', 8),
(9, 'Serrano', 'Keith', NULL, 9),
(10, 'Jimenez', 'Tina', 'Ramos', 10),
(11, 'Flores', 'Armand', NULL, 11),
(12, 'Salvador', 'Lian', 'Grace', 12),
(13, 'Uy', 'Rachel', NULL, 13);

INSERT INTO Complainant VALUES
(1, 'Dela Cruz', 'Maria', 'Gonzales', 2),
(2, 'Fernandez', 'Carlos', NULL, 1),
(3, 'Silva', 'Liza', 'D.', 3),
(4, 'Ramos', 'Jorge', 'Santos', 4),
(5, 'Lopez', 'Julia', 'M.', 5),
(6, 'Aquino', 'Victor', NULL, 6),
(7, 'Pascual', 'Rhea', 'Joy', 7),
(8, 'Buenaventura', 'Dennis', 'C.', 8),
(9, 'Cruz', 'Alyssa', NULL, 9),
(10, 'Gomez', 'Ivan', 'Ramos', 10),
(11, 'De Leon', 'Mara', NULL, 11),
(12, 'Diaz', 'Roberto', 'Antonio', 12),
(13, 'Silva', 'Claire', 'Jean', 13);


INSERT INTO Investigator VALUES
(1, 'Mendoza', 'Lea', 'P.', 1),
(2, 'Cruz', 'David', 'M.', 2),
(3, 'Velasco', 'Trina', 'Mae', 3),
(4, 'Alvarez', 'Francis', NULL, 4),
(5, 'Santos', 'Leo', 'Ramos', 5),
(6, 'Rivera', 'Celine', NULL, 6),
(7, 'Lagman', 'Eduardo', 'T.', 7),
(8, 'Dionisio', 'Hannah', 'M.', 8),
(9, 'Ramirez', 'Carlos', NULL, 9),
(10, 'Dela Peña', 'Joseph', 'L.', 10),
(11, 'Tan', 'Elaine', NULL, 11),
(12, 'Go', 'Manuel', 'Y.', 12),
(13, 'Diaz', 'Lance Gabriel', 'M.', 13);

INSERT INTO Officer VALUES
(1, 'Bautista', 'Evan', 'Q.', 'Chief', 'Station Commander', 1),
(2, 'Navarro', 'Chris', NULL, 'Inspector', 'Investigator', 2),
(3, 'Rosales', 'Vincent', 'M.', 'PO1', 'Investigator', 3),
(4, 'Mercado', 'Jaycee', 'M.', 'PO1', 'Investigator', 4),
(5, 'Bautista', 'Mario', 'D.', 'SPO1', 'Desk Officer', 5),
(6, 'Lee', 'Stephanie', 'C.', 'PO3', 'Traffic Officer', 6),
(7, 'Sison', 'Kevin', 'A.', 'SPO2', 'Investigator', 7),
(8, 'Delos Reyes', 'Camille', NULL, 'PO2', 'Duty Officer', 8),
(9, 'Ortiz', 'Brian', 'P.', 'SPO1', 'Case Handler', 9),
(10, 'Marquez', 'Diana', 'B.', 'PO1', 'Patroller', 10),
(11, 'Yap', 'Julio', NULL, 'PO3', 'Watch Commander', 11),
(12, 'Francisco', 'Lara', 'T.', 'SPO4', 'Operations Chief', 12),
(13, 'Chan', 'Erika', NULL, 'PO2', 'Records Officer', 13);

INSERT INTO CrimeRecords VALUES
(1, '2024-02-10', '2024-02-12', 'Ongoing', NULL, NULL, 'Theft', 'Lucena City', 'Reported theft in a sari-sari store.', 1),
(2, '2024-03-01', '2024-03-05', 'Dismissed', NULL, '2024-04-10', 'Assault', 'Sariaya', 'Bar fight near marketplace.', 2),
(3, '2024-01-20', '2024-01-22', 'Resolved', '2024-03-15', NULL, 'Fraud', 'Candelaria', 'Fake identity used in transaction.', 3),
(4, '2024-04-05', '2024-04-06', 'Ongoing', NULL, NULL, 'Robbery', 'Lucena City', 'Armed robbery in grocery store.', 1),
(5, '2024-03-12', '2024-03-13', 'Ongoing', NULL, NULL, 'Burglary', 'Sariaya', 'Break-in reported in residential area.', 2),
(6, '2024-02-28', '2024-03-03', 'Resolved', '2024-04-01', NULL, 'Illegal Drugs', 'Candelaria', 'Possession of illegal substances.', 3),
(7, '2024-01-18', '2024-01-20', 'Dismissed', NULL, '2024-02-05', 'Vandalism', 'Lucena City', 'Spray-painted public school wall.', 1),
(8, '2024-04-08', '2024-04-09', 'Ongoing', NULL, NULL, 'Theft', 'Gumaca', 'Stolen mobile phone in bus terminal.', 9),
(9, '2024-03-22', '2024-03-25', 'Ongoing', NULL, NULL, 'Assault', 'Catanauan', 'Bar altercation involving multiple persons.', 11),
(10, '2024-01-29', '2024-02-01', 'Resolved', '2024-02-20', NULL, 'Cybercrime', 'Lucena City', 'Scam through social media platform.', 10),
(11, '2024-02-15', '2024-02-16', 'Dismissed', NULL, '2024-03-01', 'Trespassing', 'Tiaong', 'Unauthorized entry into private property.', 12),
(12, '2024-03-07', '2024-03-10', 'Ongoing', NULL, NULL, 'Theft', 'Lucena City', 'Bike stolen from garage.', 13),
(13, '2024-04-01', '2024-04-02', 'Ongoing', NULL, NULL, 'Fraud', 'Lucena City', 'Fake documents used for land claim.', 10);


INSERT INTO CrimeRecords_Criminal VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13);

INSERT INTO CrimeRecords_PoliceStation VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 2),
(6, 3),
(7, 1),
(8, 9),
(9, 11),
(10, 10),
(11, 12),
(12, 13),
(13, 10);

INSERT INTO CrimeRecords_Complainant VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13);

INSERT INTO CrimeRecords_Lawyer VALUES
(1, 1),
(2, 2),
(3,13),
(4, 3),
(5, 4),
(6, 5),
(7, 6),
(8, 7),
(9, 8),
(10, 9),
(11, 10),
(12, 11),
(13, 12);

INSERT INTO Complainant_PoliceStation VALUES
(1, 4),
(2, 2),
(3, 3),
(4, 1),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13);


INSERT INTO CrimeRecords_Investigator VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 1),
(5, 2),
(6, 3),
(7, 4),
(8, 9),
(9, 11),
(10, 10),
(11, 12),
(12, 13),
(13, 10);

INSERT INTO CrimeRecord_Officer VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 1),
(5, 2),
(6, 3),
(7, 4),
(8, 9),
(9, 11),
(10, 10),
(11, 12),
(12, 13),
(13, 10);

SELECT criminal_id, last_name FROM Criminal WHERE last_name = 'Toribio';
SELECT * FROM CrimeRecords_Criminal;

SELECT 
    crc.crime_records_id,
    cr.type_of_crime,
    cr.date_of_crime,
    crim.criminal_id,
    crim.last_name,
    crim.first_name
FROM CrimeRecords_Criminal crc
JOIN CrimeRecords cr on crc.crime_records_id = cr.crime_records_id
JOIN Criminal crim on crc.criminal_id = crim.criminal_id
ORDER BY crim.last_name asc;

UPDATE Criminal 
SET first_name = 'Dave'
WHERE last_name = 'Lim';

SELECT * FROM Criminal WHERE last_name = 'Lim';

UPDATE Criminal 
SET first_name = 'Faye'
WHERE last_name LIKE 'S%';

SELECT * FROM Criminal WHERE last_name LIKE 'S%';

SELECT 
off.first_name,
off.last_name,
COUNT(co.crime_records_id) AS number_of_cases
FROM CrimeRecord_Officer co
JOIN Officer off on co.officer_id = off.officer_id
GROUP BY off.officer_id, off.first_name, off.last_name;

SELECT 
    CONCAT(crim.first_name, ' ', crim.last_name) AS criminal_name,
    cr.crime_records_id,
    cr.type_of_crime
FROM CrimeRecords_Criminal crc
JOIN Criminal crim ON crc.criminal_id = crim.criminal_id
JOIN CrimeRecords cr ON crc.crime_records_id = cr.crime_records_id;

SELECT 
    CONCAT(crim.last_name, ', ', crim.first_name, ' ', COALESCE(crim.middle_name, '')) AS criminal_name,
    cr.crime_records_id,
    cr.type_of_crime
FROM CrimeRecords_Criminal crc
JOIN Criminal crim ON crc.criminal_id = crim.criminal_id
JOIN CrimeRecords cr ON crc.crime_records_id = cr.crime_records_id
ORDER BY crim.last_name asc;