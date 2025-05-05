INSERT INTO Room VALUES('Bedroom', 2, 'Available') 
INSERT INTO Room VALUES('Bedroom', 2, 'Available')
INSERT INTO Room VALUES('Bedroom', 2, 'Available')
INSERT INTO Room VALUES('Bedroom', 2, 'Available')
INSERT INTO Room VALUES('Bedroom', 2, 'Available')
INSERT INTO Room VALUES('Living room', 1, 'Available')
INSERT INTO Room VALUES('Kitchen', 1, 'Available')
INSERT INTO Room VALUES('Garden', 1, 'Available')

INSERT INTO Users(f_Name, l_Name, password, email, preference, type, birthdate) 
VALUES('Abdulrahman', 'Mohammed', 'Abdl1234', 'abdulrahman@gmail.com', 'Male', 'Admin', '12/27/2004')

INSERT INTO Users(f_Name, l_Name, password, email, preference, type, birthdate) 
VALUES('Jasmine', 'Hani', 'Jasm2345', 'jasmine@gmail.com', 'Female', 'Admin', '3/27/2004')

INSERT INTO Users(f_Name, l_Name, password, email, preference, type, birthdate) 
VALUES('Mariam', 'Fayed', 'Mar3456', 'mariam@gmail.com', 'Female', 'Admin', '1/10/2005')

INSERT INTO Users(f_Name, l_Name, password, email, preference, type, birthdate) 
VALUES('Ahmed', 'Meligi','Mel4567', 'meligi@gmail.com', 'Male', 'Admin', '10/7/2004')

INSERT INTO Users(f_Name, l_Name, password, email, preference, type, birthdate) 
VALUES('Malak', 'Fouad', 'Mal5678', 'malak@gmail.com', 'Female', 'Admin', '3/5/2004')

INSERT INTO Users(f_Name, l_Name, password, email, preference, type, birthdate) 
VALUES('Khaled', 'Abdullah', 'Kha6789', 'khaled@gmail.com', 'Male', 'Guest', '12/3/2007')

INSERT INTO Users(f_Name, l_Name, password, email, preference, type, birthdate) 
VALUES('Mohammed', 'Yassir', 'Moh7890', 'mohammed@gmail.com', 'Male', 'Guest', '2/8/2013')

INSERT INTO Users(f_Name, l_Name, password, email, preference, type, birthdate) 
VALUES('Omar', 'Abdulkarim', 'Oma8901', 'omar@gmail.com', 'Male','Guest', '9/5/2010')

INSERT INTO Users(f_Name, l_Name, password, email, preference, type, birthdate) 
VALUES('Amani', 'Mohammed', 'Ama9012', 'amani@gmail.com', 'Female','Guest', '4/5/2000')

INSERT INTO Users(f_Name, l_Name, password, email, preference, type, birthdate) 
VALUES('Joury', 'Mubarak', 'Jou0123', 'joury@gmail.com', 'Female','Guest', '3/6/2007')

INSERT INTO Admin(admin_id, no_of_guests_allowed, salary) VALUES(1, 50, 8000.00)
INSERT INTO Admin(admin_id, no_of_guests_allowed, salary) VALUES(2, 50, 8000.00)
INSERT INTO Admin(admin_id, no_of_guests_allowed, salary) VALUES(3, 50, 8000.00)
INSERT INTO Admin(admin_id, no_of_guests_allowed, salary) VALUES(4, 50, 8000.00)
INSERT INTO Admin(admin_id, no_of_guests_allowed, salary) VALUES(5, 50, 8000.00)

INSERT INTO Guest(guest_id, guest_of, address, residential) 
VALUES(6 ,1 , 'Cairo, Alrehab 1', 'Apartment')

INSERT INTO Guest(guest_id, guest_of, address, residential) 
VALUES(7, 2, 'Cairo, Sheihk Zayed','Apartment')

INSERT INTO Guest(guest_id, guest_of, address, residential) 
VALUES(8, 3, 'Cairo, El-tagamoe El-Khames', 'Apartment')

INSERT INTO Guest(guest_id, guest_of, address, residential) 
VALUES(9, 4, 'Cairo, Alrehab 2', 'Apartment')

INSERT INTO Guest(guest_id, guest_of, address, residential) 
VALUES(10, 5, 'Cairo, Madinaty', 'Apartment')

INSERT INTO Device VALUES(1, 1, 'Tablet','Fully charged', 100)
INSERT INTO Device VALUES(2, 2, 'Laptop','Fully charged', 100)
INSERT INTO Device VALUES(3, 3, 'Phone','Fully charged', 100)
INSERT INTO Device VALUES(4, 4, 'Phone','Fully charged', 100)
INSERT INTO Device VALUES(5, 6, 'Tablet', 'Fully charged', 100)
INSERT INTO Device VALUES(6, 6, 'Tablet', 'Out of battery', 0)
INSERT INTO Device VALUES(7, 6, 'Phone', 'Out of battery', 0)
INSERT INTO Device VALUES(8, 6, 'Phone', 'Out of battery', 0)
INSERT INTO Device VALUES(9, 4, 'Phone', 'Out of battery', 0)
INSERT INTO Device VALUES(10, 3, 'Laptop', 'Out of battery', 0)


INSERT INTO Calendar 
VALUES(1, 1, 'GIU Career fair', 'Get a chance to gain real work experience!', 'GIU University', '11/23/2023')

INSERT INTO Calendar 
VALUES(2, 2, 'Talks on AI', 'Get to know how AI changed our life', 'GIU University', '12/25/2023')

INSERT INTO Task 
VALUES('Generate a table', CURRENT_TIMESTAMP, '1/1/2024', 'Milestone 2', 1, 'Not finished', '12/1/2023', 2)

INSERT INTO Task 
VALUES('Insert values', CURRENT_TIMESTAMP, '1/1/2024', 'Milestone 2', 2, 'Not finished', '12/1/2023', 3)

INSERT INTO Task 
VALUES('Create procedures', CURRENT_TIMESTAMP, '1/1/2024', 'Milestone 2', 3, 'Not finished', '12/1/2023', 1)

INSERT INTO Assigned_to VALUES(1, 1, 6)
INSERT INTO Assigned_to VALUES(2, 2, 7)
INSERT INTO Assigned_to VALUES(3, 3, 8)

INSERT INTO Notes VALUES(1, 1, 'This is the first note', CURRENT_TIMESTAMP, 'First Note')
INSERT INTO Notes VALUES(2, 2, 'This is the second note', CURRENT_TIMESTAMP, 'Second Note')

INSERT INTO Finance VALUES(1, 'Transfer', 750.00, 'EGP', 'Online', 'Done', CURRENT_TIMESTAMP, 1, '1/1/2024', 50)
INSERT INTO Finance VALUES(2, 'Transfer', 750.00, 'EGP', 'Online', 'Done', CURRENT_TIMESTAMP, 1, '1/1/2024', 50)

INSERT INTO Communication VALUES(1, 2, 'Hello! Welcome to the team', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Welccome')
INSERT INTO Communication VALUES(2, 1, 'Hello! Welcome to the team too', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Welccome')


INSERT INTO RoomSchedule VALUES(1, 'Cooking', 7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)

INSERT INTO Log VALUES(1, 1, 1, 'Watching Youtube', CURRENT_TIMESTAMP, '04:00:15')







--
