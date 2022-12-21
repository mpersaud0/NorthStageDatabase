-- This database will be used for the purpose of having North Stage event organizers access records of all drivers submitting applications to drive at the event and
-- will allow organizers to approve or deny applications submitted by drivers. 

-- CREATE DATABASE north_stage;
USE north_stage;

-- selecting from tables
SELECT * FROM drivers;
SELECT * FROM applications;
SELECT * FROM events;
SELECT * FROM vehicles;

-- create driver table
CREATE TABLE drivers(
driver_id INT AUTO_INCREMENT NOT NULL,
first_name CHAR (255) NOT NULL,
last_name CHAR (255) NOT NULL,
experience INT NOT NULL,
image VARCHAR (255),
PRIMARY KEY (driver_id));

-- add column to driver table
ALTER TABLE drivers
ADD email VARCHAR (255) NOT NULL;

-- populate driver table
INSERT INTO drivers (first_name, last_name, experience, image, email)
VALUES 
('Michael', 'Persaud', '3', 'https://assets.bigcartel.com/theme_images/74323380/DSC06931.jpeg?auto=format&fit=max&w=2136', 'mikey.walkerrr@gmail.com'),
('Justin', 'Small', '6', 'https://assets.bigcartel.com/theme_images/76498674/NSR2_-54.jpeg?auto=format&fit=max&w=2136', 'jsmall123@gmail.com'),
('Jason', 'Tegtmeyer', '10', 'https://imgur.com/ALAXohT', 'jteg123@gmail.com'),
('kj', 'bands', '1', 'https://64.media.tumblr.com/tumblr_ltqskyq2Po1r3dqvso1_500.jpg', 'kjbands@gmail.com'),
('Allana', 'Cooper', '0', 'https://64.media.tumblr.com/bf7cb0962dcf2fc7332cbf854fec5082/tumblr_oslpu1CDXi1vym8fuo1_500.jpg', 'acoops@gmail.com'),
('Mike', 'Francois', '2', 'https://64.media.tumblr.com/df386d8ef7950ab4768490f62cf883a6/tumblr_osw4skY5lH1r95dlho1_500.jpg', 'mfriz@gmail.com'),
('Dacotah', 'Halliwell', '2', 'https://64.media.tumblr.com/640d6f9b4834a7967ad4be5d940de932/tumblr_osvqhmiaBI1tq22hpo1_500.jpg', 'kodasoda@gmail.com'),
('Tony', 'McCue', 6, 'https://64.media.tumblr.com/913d8a5fcdeb6ebfbd12cab6ce23c656/tumblr_os4bw18vhs1rpqn0wo1_500.jpg', 'tmccue1@blogger.com'),
('Tom', 'Davies', 2, 'https://64.media.tumblr.com/9ef113fd67e82cbc1ef0af0cd150d725/tumblr_oq3c4r3Erg1qeim6oo1_500.jpg', 'tdaves123@blogger.com'),
('Seb', 'Edwards', 1, 'https://64.media.tumblr.com/6e6179091c36799dcb76d0d71211d229/tumblr_oq9t9h1BGR1rpqn0wo1_500.jpg', 'seddy@hotmail.com'),
('Tony', 'Geeman', 3, 'https://64.media.tumblr.com/d0cdb0b886ca29d8df314c2b2044c00c/tumblr_ntrfiaBJJE1rs58dao1_500.jpg', 'tonygman@windows.com'),
('Sam', 'Smithers', 8, 'https://64.media.tumblr.com/d8554167be994d425cb21b4bd55a9c1d/tumblr_o13x1pTw2f1qm6egko1_500.png', 'smithers@gmail.com'),
('Ed', 'Johnson', 3.5, 'https://64.media.tumblr.com/3ba2837a6b0a051d40f7d29003ddd02a/tumblr_nsf8g3kg4t1tfho41o1_500.jpg', 'ej205@msn.com'),
('Courtney', 'Wilson', 6, 'https://64.media.tumblr.com/16d5f1554807695106e9f5081649c0cf/tumblr_nvi2lacPmy1r0brpio1_500.jpg', 'cwilson@auto.com'),
('Austin', 'Parker', 4, 'https://64.media.tumblr.com/5965bf956ec757f5f3d1bc6776f8ec6e/tumblr_nug75zCPBX1sp08b8o1_500.jpg', 'aparks@blogger.com'),
('Alex', 'Jones', 7, 'https://64.media.tumblr.com/af951ec9dacb26e43f98ebe36fe156ad/tumblr_nv4am39Mfg1tfho41o1_500.jpg', 'ajones@motormavens.com');

-- populate column within driver table
UPDATE drivers 
SET email = 'jteg123@gmail.com'
WHERE driver_id=3;

-- create vehicle table
CREATE TABLE vehicles(
vehicle_id INT AUTO_INCREMENT NOT NULL,
driver_id INT NOT NULL,
make CHAR (30),
model CHAR (100),
vehicle_year INT NOT NULL,
engine_mods TEXT NOT NULL,
suspension_mods TEXT NOT NULL,
interior_mods TEXT NOT NULL,
cosmetic_mods TEXT NOT NULL,
image VARCHAR (255),
PRIMARY KEY (vehicle_id),
CONSTRAINT fk_vehicle_driver_id
	FOREIGN KEY (driver_id)
    REFERENCES drivers (driver_id));
    
-- populate vehicle table
INSERT INTO vehicles (driver_id, make, model, vehicle_year, engine_mods, suspension_mods, interior_mods, cosmetic_mods, image)
VALUES (1, 'Toyota', 'JZX90', '1991', '1JZ Single Turbo, Forged Pistons and Rods, HKS Cams', 'JIC Magic Coilovers, Modded knuckles, Serialnine Arms', 'Bride LowMax Driver Seat, Vertex Steering Wheel, Bubble Shift Knob', 'Vertex Bodykit, Gramlight 57D, Livery', 'https://64.media.tumblr.com/tumblr_ltqskyq2Po1r3dqvso1_500.jpg'),
(2, 'Infiniti', 'G35s', '2007', 'VQ35HR, K&N Intakes', 'Godspeed Mono SS Coilovers, FDF Mini Mantis Angle Kit, ISR Multilink', 'NRG Prisma Driver Seat, Chasebays Hydro Ebrake', 'Work Emotion T7R, JDM Taillights', 'https://assets.bigcartel.com/theme_images/76498674/NSR2_-54.jpeg?auto=format&fit=max&w=2136'),
(3, 'Nissan', '240SX', '1990', 'KA24DE, Tomei Fuel Pressure Regulator, Fuel Cell, Custom Intake, ISR Headers', 'BC Racing Coilovers, ISR Multilink, HeatMaker B-Knuckle', 'NRG Driver Seat, Steering Wheel, GForce Harnesses', 'BN Sports Bodykit, GT Wing, MB Battle 17/18x9.5 +12, Livery, Combat Eye Silvia Front End', 'https://assets.bigcartel.com/theme_images/76498653/DSC03098.jpeg?auto=format&fit=max&w=2136'),
(4, 'Toyota', 'GT86', '2017', 'Tomei ExpremeTi Exhaust, Tomei Headers, Tune', 'BC Racing Coilovers, PBM Subframe Risers, PBM Rear Multilink', 'Bride Zeta 1, Bride Brix, Keys Racing Steering Wheel', 'Greddy Lip Kit, AVS Model 5, Clear Taillights, Street Style Livery', 'https://assets.bigcartel.com/theme_images/74323383/DSC02525-2.jpeg?auto=format&fit=max&w=2136'),
(5, 'Nissan', 'Skyline', '1991', 'SR20DET Swap, GT28RS, HKS Cams, 3 Inch Straight Pipe', 'Tein Coilovers, ISR Multilink, GKTech Rack Spacers', 'Bride Ergo Driver Seat, Mooneyes Steering Wheel', 'Uras Bodykit, Pink Paint, Blitz 03 17/18, Livery', 'https://64.media.tumblr.com/bf7cb0962dcf2fc7332cbf854fec5082/tumblr_oslpu1CDXi1vym8fuo1_500.jpg'),
(6, 'Nissan', 'Silvia', '1996', 'GT28RS, 3 Inch Straight Pipe, Tial Wastegate', 'Kei Office Coilovers, Yashio Factory Multilink, Heatmaker B-Knuckle', 'Bride Brix Seats, Vertex Steering Wheel', 'Vertex Edge Bodykit, Red Paint, Nismo LMGT4 17/18, Livery', 'https://64.media.tumblr.com/df386d8ef7950ab4768490f62cf883a6/tumblr_osw4skY5lH1r95dlho1_500.jpg'),
(7, 'BMW', '328i', '1991', 'Motor Mount Spacers, Blastpipe Exhaust', 'Scale Coilovers', 'Sparco Seats, Grip Royal Steering wheel','Helrot Red, Don Musk Overfenders, VSKF 17x10/11', 'https://64.media.tumblr.com/df386d8ef7950ab4768490f62cf883a6/tumblr_osw4skY5lH1r95dlho1_500.jpg');


-- create event table
CREATE TABLE events(
event_id INT AUTO_INCREMENT NOT NULL,
published_at DATETIME,
event_date DATE,
title VARCHAR (50),
description VARCHAR (255),
location VARCHAR (255),
image VARCHAR (255),
PRIMARY KEY (event_id));

-- populate event table
INSERT INTO events (published_at, event_date, title, description, location, image)
VALUES 
('2022-12-12 06:08:00',	'2023-06-29', 'NORTH STAGE 2023 SEASON OPENER', 'ADVANCED COURSE ONLY, FULL WEEKEND W/ CAMPING, ALL SKILL LEVELS ENCOURAGED','Centralia Airport', 'https://assets.bigcartel.com/product_images/328727766/2022flyerevent1+copy.jpg?auto=format&fit=max&w=1300'),
('2022-12-23 03:08:00',	'2023-05-24', 'NORTH STAGE LONG WEEKEND DRIFT',	'SKID PAD EVENT, FULL WEEKEND W/ CAMPING, ALL SKILL LEVELS ENCOURAGED',	'Shannonville Skidpad',	'https://static.wikia.nocookie.net/initiald/images/2/27/Chapter_003_Comixology.png/revision/latest?cb=20200419175253'),
('2022-11-22 9:08', '2023-08-27', 'NORTH STAGE ALL STAR MEETING', 'AIRPORT EVENT, HIGH SKILL LEVEL REQUIRED', 'Centralia Airport', 'https://assets.bigcartel.com/product_images/339318387/augustflyerr+copy.jpg?auto=format&fit=max&w=1300');

-- create applications table
CREATE TABLE applications(
application_id INT AUTO_INCREMENT NOT NULL,
applied_at TIMESTAMP,
approval_status BOOLEAN,
driver_id INT NOT NULL,
event_id INT NOT NULL,
PRIMARY KEY (application_id),
CONSTRAINT fk_driver_id
	FOREIGN KEY (driver_id)
    REFERENCES drivers (driver_id),
CONSTRAINT fk_event_id
	FOREIGN KEY (event_id)
    REFERENCES events (event_id));
    
-- populate applications table
INSERT INTO applications (driver_id, event_id)
VALUES 
('1', '1'),
('1', '2'),
('1', '3'),
('2', '1'),
('2', '2'),
('2', '3'),
('3', '1'),
('3', '2'),
('3', '3'),
('4', '1'),
('4', '2'),
('4', '3'),
('5', '1'),
('5', '2'),
('5', '3'),
('6', '1'),
('6', '2'),
('6', '3'),
('7', '1'),
('7', '2'),
('7', '3'),
('8', '3'),
('9', '1'),
('9', '2'),
('10', '1'),
('10', '2'),
('11', '1'),
('11', '2'),
('12', '1'),
('12', '2'),
('12', '3'),
('13', '2'),
('13', '3'),
('14', '1'),
('14', '3'),
('15', '1'),
('15', '2'),
('16', '1'),
('16', '3');

-- show all drivers names, experience levels and images who applied for North Stage 2023 Season Opener
SELECT first_name, last_name, experience, email, drivers.image
FROM drivers
JOIN applications
ON drivers.driver_id = applications.driver_id
JOIN events
ON applications.event_id = events.event_id
WHERE events.title LIKE "%season opener%";

-- show all drivers names, vehicles and emails who applied for North Stage 2023 Season Opener that have their vehicle profiles uploaded
SELECT application_id, drivers.driver_id, first_name, last_name, make, model, email
FROM drivers
JOIN applications
ON drivers.driver_id = applications.driver_id
JOIN vehicles
ON drivers.driver_id = vehicles.driver_id
JOIN events
ON applications.event_id = events.event_id
WHERE events.title LIKE "%season opener%";

-- approve these drivers for North Stage 2023 Season Opener
UPDATE applications
SET approval_status = 1
WHERE application_id in (1,4,7,10,13,16,19);


-- find drivers for LONG WEEKEND DRIFT event with more than 2 years of experience
SELECT first_name, last_name, email, experience, application_id, events.title
FROM drivers
JOIN applications
ON drivers.driver_id = applications.driver_id
JOIN events
ON applications.event_id = events.event_id
WHERE experience >= 2
AND applications.event_id = 2;

-- approve these drivers applications
UPDATE applications
SET approval_status = 1
WHERE application_id in (2,5,8,17,20,24,28,30,32,37);


-- show all drivers who do not have enough experience (less than 5 years) for the ALL STAR MEETING event
SELECT first_name, last_name, email, experience, application_id, events.title
FROM drivers
JOIN applications
ON drivers.driver_id = applications.driver_id
JOIN events
ON applications.event_id = events.event_id
WHERE experience < 5
AND applications.event_id = 3;

-- deny these applications
UPDATE applications
SET approval_status = 0
WHERE application_id in (3,12,15,18,21,33);


-- show first name, last name, image of all drivers attending LONG WEEKEND DRIFT
SELECT first_name, last_name, drivers.image, events.title
FROM drivers
JOIN applications
ON drivers.driver_id = applications.driver_id
JOIN events
ON applications.event_id = events.event_id
WHERE approval_status = 1
AND applications.event_id = 2;

-- timestamp for application is unnecessary, delete this column
ALTER TABLE applications
DROP COLUMN applied_at;

-- create vehicle and owner view
CREATE VIEW vehicle_owner AS
SELECT first_name, last_name, make, model, vehicle_year
FROM drivers
JOIN vehicles
ON drivers.driver_id = vehicles.driver_id;

-- use vehicle and owner view
SELECT * FROM vehicle_owner;