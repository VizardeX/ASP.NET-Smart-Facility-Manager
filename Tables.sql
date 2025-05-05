--DROP DATABASE M2
--CREATE DATABASE M2
USE M2;

CREATE TABLE Room(
room_id INT IDENTITY,
type VARCHAR(20),
floor INT,
status VARCHAR(20),
PRIMARY KEY(room_id)
);

CREATE TABLE Users(
id INT IDENTITY,
f_Name VARCHAR(20),
l_Name VARCHAR(20),
password VARCHAR(10),
email VARCHAR(50),
preference VARCHAR(100),
room INT,
type VARCHAR(20), 
birthdate DATETIME,
age AS (YEAR(CURRENT_TIMESTAMP) - YEAR(birthdate)),
PRIMARY KEY(id),
FOREIGN KEY(room) REFERENCES Room(room_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Admin(
admin_id INT,
no_of_guests_allowed INT DEFAULT 30,
salary DECIMAL(10,3),
PRIMARY KEY(admin_id),
FOREIGN KEY(admin_id) REFERENCES Users(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Guest(
guest_id INT,
guest_of INT,
address VARCHAR(50),
arrival_date DATETIME,
departure_date DATETIME,
residential VARCHAR(20),
PRIMARY KEY(guest_id),
FOREIGN KEY(guest_id) REFERENCES Users(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY(guest_of) REFERENCES Admin(admin_id) ON DELETE no action ON UPDATE no action
);


CREATE TABLE Task(
task_id INT IDENTITY,
name VARCHAR(20),
creation_date DATETIME,
due_date DATETIME,
category VARCHAR(20),
creator INT,
status VARCHAR(20),
reminder_date DATETIME,
priority INT,
PRIMARY KEY(task_id),
FOREIGN KEY(creator) REFERENCES Admin(admin_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Assigned_to(
admin_id INT,
task_id INT,
user_id INT,
PRIMARY KEY(admin_id,task_id,user_id),
FOREIGN KEY(admin_id) REFERENCES Admin(admin_id) ON DELETE no action ON UPDATE no action,
FOREIGN KEY(task_id) REFERENCES Task(task_id) ON DELETE no action ON UPDATE no action,
FOREIGN KEY(user_id) REFERENCES Users(id) ON DELETE no action ON UPDATE no action
);

CREATE TABLE Calendar(
event_id INT,
user_assigned_to INT,
name VARCHAR(50),
describtion VARCHAR(200),
location VARCHAR(40),
reminder_date DATETIME,
PRIMARY KEY(event_id, user_assigned_to),
FOREIGN KEY(user_assigned_to) REFERENCES Users(id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Notes(
id INT,
user_id INT,
content VARCHAR(400),
creation_date DATETIME,
title VARCHAR(40)
PRIMARY KEY(id),
FOREIGN KEY(user_id) REFERENCES Users(id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Travel(
trip_no INT,
hotel_name VARCHAR(40),
destination VARCHAR(40),
ingoing_flight_num varchar(30),
outgoing_flight_num varchar(30),
ingoing_flight_date DATETIME,
outgoing_flight_date DATETIME,
ingoing_flight_airport VARCHAR(50),
outgoing_flight_airport VARCHAR(50),
transport VARCHAR(50),
PRIMARY KEY(trip_no)
);  

CREATE TABLE User_trip(
trip_no INT,
user_id INT,
hotel_room_no INT,
in_going_flight_seat_number INT,
out_going_flight_seat_number INT,
PRIMARY KEY(trip_no, user_id),
FOREIGN KEY(trip_no) REFERENCES Travel(trip_no) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(user_id) REFERENCES Users(id) ON DELETE CASCADE ON UPDATE CASCADE
);                                                         

CREATE TABLE Finance(
payment_id INT IDENTITY,
user_id INT,
type VARCHAR(20),
amount DECIMAL(13,4),
currency VARCHAR(10),
method VARCHAR(30),
status VARCHAR(30),
date DATETIME,
receipt_no INT,
deadline DATETIME,
penalty INT,
PRIMARY KEY(payment_id),
FOREIGN KEY(user_id) REFERENCES Users(id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Health(
date DATETIME,
activity VARCHAR (30),
user_id INT,
hours_slept INT,
food VARCHAR (30),      
PRIMARY KEY (date,activity),
FOREIGN KEY(user_id) REFERENCES Users(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Communication(
message_id INT IDENTITY, 
sender_id INT, 
receiver_id INT,
content VARCHAR (500),
time_sent DATETIME, 
time_received DATETIME, 
time_read DATETIME,  
title VARCHAR (30), 
PRIMARY KEY (message_id),
FOREIGN KEY(sender_id) REFERENCES Users(id) ON DELETE no action ON UPDATE no action,
FOREIGN KEY (receiver_id) REFERENCES Users(id) ON DELETE no action ON UPDATE no action
);


CREATE TABLE Device(
device_id INT, 
room INT, 
type VARCHAR (30),
status VARCHAR (30), 
battery_status INT,
PRIMARY KEY (device_id),
FOREIGN KEY (room) REFERENCES Room (room_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE RoomSchedule(
creator_id INT,
action VARCHAR (50),
room INT, 
start_time DATETIME, 
end_time DATETIME, 
PRIMARY KEY(creator_id, start_time),
FOREIGN KEY (creator_id) REFERENCES Users(id) ON DELETE no action ON UPDATE no action,
FOREIGN KEY (room) REFERENCES Room(room_id) ON DELETE CASCADE ON UPDATE CASCADE
);

Create Table Log (
room_id int,
device_id int,
user_id int,
activity varchar(30),
date datetime,
duration time,
primary key(room_id,device_id,user_id, date),
foreign key(room_id) references Room(room_id) on delete no action on update no action,
foreign key(device_id) references Device(device_id) on delete no action on update no action,
foreign key(user_id) references Users(id) on delete cascade on update cascade
);

Create Table Consumption (
device_id int,
consumption int,
date datetime,
primary key(device_id, date),
foreign key(device_id) references Device(device_id) on delete cascade on update cascade
);

Create Table Preferences (
user_id int,
category varchar(30),
preference_no int,
content varchar(100),
primary key(user_id , preference_no),
foreign key(user_id) references Users(id) on delete cascade on update cascade
);

Create Table Recommendation (
recommendation_id int identity,
user_id int,
category varchar(30),
preference_no int,
content varchar(100),
primary key(recommendation_id),
foreign key(user_id, preference_no) references Preferences on delete cascade on update cascade
);

Create Table Inventory (
supply_id int,
name varchar(50),
quantity int,
expiry_date datetime,
price decimal(10,2),
manufacturer varchar(50),
category varchar(30),
primary key(supply_id)
);

Create Table Camera (
monitor_id int,
camera_id int,
room_id int,
primary key(monitor_id),
foreign key(monitor_id) references Users(id) on delete cascade on update cascade,
foreign key(room_id) references Room(room_id) on delete no action on update no action
);

--

