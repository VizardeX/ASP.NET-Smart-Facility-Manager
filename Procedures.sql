-- Section 1.1, Register on the website with a unique email along with the needed information
-- Student Name: Mariam Fayed
GO
create procedure UserRegister
@usertype varchar(20),
@email varchar(50),
@first_name varchar(20),
@last_name varchar(20),
@birth_date datetime,
@password varchar(10),
@user_id INT output
as
begin 
if(@usertype <> 'Admin')
BEGIN
print 'The user must be an Admin'
SET @user_id = -1
END

ELSE
IF EXISTS(SELECT * FROM Users WHERE email = @email)
BEGIN
print 'This email is already used'
SET @user_id = -1
END

ELSE
BEGIN
insert into Users(f_Name, l_Name, password, email, type, birthdate) 
values(@first_name, @last_name, @password, @email, @usertype, @birth_date)

insert into admin(admin_id) VALUES(SCOPE_IDENTITY())

select @user_id = id
from Users
where email = @email
END

end


-- Section 2.1, Login using my email and password
-- Student Name: Mariam Fayed
GO
create procedure UserLogin
@email varchar(50),
@password varchar(10),
@success_bit bit output,
@user_id int output
as
begin
if exists(
select 1
from Users
where email = @email and password = @password
)
begin
set @success_bit = 1
set @user_id = (select id from Users where email = @email)
end

else
begin
set @success_bit = 0
set @user_id = -1
end
END


-- Section 2.2, View all the details of my profile
-- Student Name: Mariam Fayed
GO
CREATE PROCEDURE ViewProfile
@user_id INT
AS
BEGIN
SELECT *
FROM Users
WHERE id = @user_id
END
GO

-- Section 2.3
-- (deleted from the user story)


-- Section 2.4, viewing tasks
-- Student Name: Mariam Fayed
go
create procedure ViewMyTask
@user_id int
as
BEGIN
UPDATE t
SET t.status = 'Done'
FROM Task t INNER JOIN Assigned_to ast ON t.task_id = ast.task_id
INNER JOIN Users u ON u.id = ast.user_id
WHERE CURRENT_TIMESTAMP > t.due_date AND u.id = @user_id

SELECT t.*
FROM Task t INNER JOIN Assigned_to ast ON t.task_id = ast.task_id
INNER JOIN Users u ON u.id = ast.user_id
WHERE u.id = @user_id

end


-- Section 2.5, finishing tasks
-- Student Name: Mariam Fayed
go
create procedure FinishMyTask
@user_id int,
@title varchar(50)
AS
BEGIN
UPDATE t
SET t.status = 'Done'
FROM Task t INNER JOIN Assigned_to ast ON t.task_id = ast.task_id
INNER JOIN Users u ON u.id = ast.user_id
WHERE u.id = @user_id AND t.name = @title
END


-- Section 2.6, view task status
-- Student Name: Mariam Fayed
go
create procedure ViewTask
@user_id int,
@creator int
as
begin
SELECT t.status
FROM Task t INNER JOIN Assigned_to ast ON t.task_id = ast.task_id
INNER JOIN Users u ON u.id = ast.user_id
WHERE u.id = @user_id AND t.creator = @creator
ORDER BY t.creation_date
END

-- Section 2.7, view device charge
-- Student Name: Mariam Fayed
go
create procedure ViewMyDeviceCharge
@device_id int
as
begin
SELECT battery_status
FROM Device
WHERE device_id = @device_id
end


-- Section 2.8, book room with other users
-- Student Name: Mariam Fayed
go
create procedure AssignRoom
@user_id int,
@room_id int
AS
BEGIN

UPDATE Room
SET status = 'Booked'
WHERE room_id = @room_id

UPDATE Users
SET room = @room_id
WHERE id = @user_id

END

-- Section 2.9, create events 
-- Student Name: Mariam Fayed
go
create procedure CreateEvent
@event_id int,
@user_id int,
@name varchar(50),
@description varchar(200),
@location varchar(40),
@reminder_date datetime,
@other_user_id int
AS
BEGIN
INSERT INTO Calendar(event_id, user_assigned_to, name, describtion, location, reminder_date)
VALUES(@event_id, @user_id, @name, @description, @location, @reminder_date)

IF @other_user_id IS NOT NULL
BEGIN
INSERT INTO Calendar(event_id, user_assigned_to, name, describtion, location, reminder_date)
VALUES(@event_id, @other_user_id, @name, @description, @location, @reminder_date)
END
END


-- Section 2.10, assign user to attend event
-- Student Name: Mariam Fayed
go
create procedure AssignUser
@user_id int,
@event_id int
AS
BEGIN
declare @name VARCHAR(50), @description VARCHAR(200), @location VARCHAR(40), @reminder_date DATETIME
SELECT @name = name, @description = describtion, @location = location, @reminder_date = reminder_date
FROM Calendar
WHERE event_id = @event_id

INSERT INTO Calendar(event_id, user_assigned_to, name, describtion, location, reminder_date)
VALUES(@event_id, @user_id, @name, @description, @location, @reminder_date)

END


-- Section 2.11, Add a reminder to a task
-- Student Name: Ahmed Elmeligy
go
create procedure AddReminder
@task_id INT,
@reminder DATETIME

AS 
BEGIN 
UPDATE Task
SET reminder_date = @reminder
WHERE task_id = @task_id;
END

-- Section 2.12, uninvite a specific user to an event
-- Student Name: Ahmed Elmeligy
go 
create procedure Uninvited 
@event_id INT,
@user_id INT
AS 
BEGIN
DELETE FROM Calendar
WHERE user_assigned_to = @user_id AND event_id = @event_id
END	


-- 2.13 update the deadline of a specific task
-- Student Name: Ahmed Elmeligy
go
create procedure UpdateTaskDeadline
@deadline DATETIME, 
@task_id INT
AS 
BEGIN
UPDATE Task
SET due_date = @deadline
WHERE task_id = @task_id
END


-- Section 2.14, View their event given the @event_id 
-- Student Name: Ahmed Elmeligy
go
create procedure ViewEvent
@User_id INT,
@Event_id INT
AS 
BEGIN

IF not exists(select event_id from Calendar where event_id = @Event_id) 
BEGIN
SELECT *
FROM Calendar 
WHERE user_assigned_to = @User_id
ORDER BY reminder_date
END 

ELSE
BEGIN
SELECT *
FROM Calendar
WHERE user_assigned_to = @User_id AND event_id = @Event_id
ORDER BY reminder_date
END
END


-- Section 2.15, View users that have no recommendations
-- Student Name: Ahmed Elmeligy
go
create procedure ViewRecommendation
AS 
BEGIN 
SELECT *
FROM Users u
LEFT OUTER JOIN Recommendation r ON u.id = r.user_id
WHERE r.user_id IS NULL
END


-- Section 2.16, Create a new Note 
-- Student Name: Ahmed Elmeligy
go
create procedure CreateNote
@User_id int, 
@note_id int, 
@title varchar(50), 
@Content varchar(500), 
@creation_date datetime
AS
BEGIN
INSERT INTO Notes(id, user_id ,content ,creation_date ,title ) 
VALUES (@note_id, @User_id,@Content, @creation_date, @title )
END

 -- Section 2.17, Receive a transaction
 -- Student Name: Ahmed Elmeligy
 go
 create procedure ReceiveMoney
@receiver_id INT,
@type VARCHAR(30),
@amount DECIMAL(13,2),
@status VARCHAR(10),
@date DATETIME
AS
BEGIN 
INSERT INTO Finance(user_id, type, amount, status, date)
VALUES (@receiver_id, @type, @amount, @status, @date)
END



--Section 2.18, Create a payment on a specific date.
-- Student Name: Ahmed Elmeligy
go 
create procedure PlanPayment
@sender_id int, 
@reciever_id int , 
@type varchar(30), 
@amount decimal(13,2), 
@status varchar(10), 
@deadline datetime
AS 
BEGIN
INSERT INTO Finance (user_id, type, amount, status, date, deadline)
VALUES (@sender_id, @type, @amount, @status, GETDATE(), @deadline)
INSERT INTO Finance (user_id, type, amount, status, date, deadline)
VALUES (@reciever_id, @type, @amount, @status, GETDATE(), @deadline)
END



-- Section 2.19, send message to user 
-- Student Name: Ahmed Elmeligy

go
create procedure SendMessage
@sender_id int, 
@receiver_id int, 
@title varchar(30),
@content Varchar(200), 
@timesent time,
@timereceived time
AS
BEGIN
INSERT INTO Communication (sender_id, receiver_id, content, time_sent, time_received, title)
VALUES (@sender_id, @receiver_id, @content, @timesent, @timereceived, @title)
END


-- Section 2.20, Change note title for all notes user created
-- Student Name: Ahmed Elmeligy
go 
create procedure NoteTitle
 @user_id int,
 @note_title varchar(50)
 AS 
 BEGIN
 UPDATE Notes
 SET title = @note_title
 WHERE user_id = @user_id
 END

-- Section 2.21, Show all messages received from a specific user
-- Student Name: Ahmed Elmeligy
go
create procedure ShowMessages
@user_id int,
@sender_id int  
AS
BEGIN 
SELECT *
FROM Communication
WHERE receiver_id = @user_id AND sender_id = @sender_id
END

-- Section 3.1, See details of all users and filter them by @user_type
-- Student Name: Malak Fouad
GO 
CREATE PROCEDURE ViewUsers
@user_type VARCHAR(20)
AS 
BEGIN
SELECT *
FROM Users
WHERE type= @user_type
END 

-- Section 3.2, Remove an event from the system
-- Student Name: Malak Fouad
GO 
CREATE PROCEDURE RemoveEvent
@event_id INT, 
@user_id INT
AS
BEGIN
DELETE FROM Calendar
WHERE event_id = @event_id AND user_assigned_to = @user_id
END

-- Section 3.3, Create schedule for the rooms
-- Student Name: Malak Fouad
GO 
CREATE PROCEDURE CreateSchedule
@creator_id INT,
@room_id INT,
@start_time DATETIME,
@end_time DATETIME,
@action VARCHAR(20)
AS
BEGIN

INSERT INTO RoomSchedule(creator_id, action, room, start_time, end_time) 
VALUES (@creator_id, @action, @room_id, @start_time, @end_time)
END


-- Section 3.4, Remove a guest from the system
-- Student Name: Malak Fouad
GO 
CREATE PROCEDURE GuestRemove
@guest_id INT,
@admin_id INT,
@number_of_allowed_guests INT OUTPUT
AS 
BEGIN

SELECT @number_of_allowed_guests = no_of_guests_allowed
FROM Admin
WHERE admin_id = @admin_id

DELETE FROM Guest
WHERE guest_id = @guest_id 

DELETE FROM Users
WHERE id = @guest_id

set @number_of_allowed_guests = @number_of_allowed_guests+1

UPDATE Admin
SET no_of_guests_allowed = @number_of_allowed_guests
WHERE admin_id = @admin_id
END


-- Section 3.5, Recommend travel destinations for guests under certain age
-- Student Name: Malak Fouad
GO 
CREATE PROCEDURE RecommendTD
@Guest_id INT,
@destination VARCHAR(10),
@age INT,
@preference_no INT
AS
BEGIN 
declare @tmpAge int
SELECT @tmpAge = age
FROM Users
WHERE id = @Guest_id

IF @tmpAge < @age 
BEGIN
INSERT INTO Recommendation (user_id, category, preference_no) 
VALUES (@Guest_id, @destination,@preference_no)
END

END



-- Section 3.6, Access cameras in the house
-- Student Name: Malak Fouad
GO 
CREATE PROCEDURE Servailance
@user_id INT,
@location INT,
@camera_id INT
AS 
BEGIN
INSERT INTO Camera (monitor_id, camera_id, room_id) 
VALUES (@user_id, @camera_id, @location)
END

-- Section 3.7, Change status of room
-- Student Name: Malak Fouad
GO 
CREATE PROCEDURE RoomAvailability
@location INT,
@status VARCHAR(40)
AS
BEGIN
UPDATE Room
SET status= @status
WHERE room_id = @location
END 

-- Section 3.8, Create an inventory for a specific item
-- Student Name: Malak Fouad
GO 
CREATE PROCEDURE Sp_Inventory 
@item_id INT,
@name VARCHAR(30),
@quantity INT,
@expirydate DATETIME,
@price DECIMAL(10,2),
@manufacturer VARCHAR(30),
@category VARCHAR(20)
AS
BEGIN 
INSERT INTO Inventory (supply_id, name,quantity, expiry_date, price, manufacturer, category) 
VALUES (@item_id, @name,@quantity,@expirydate,@price, @manufacturer,@category)
END

-- Section 3.9, Calculate price of purchasing a certain item.
-- Student Name: Malak Fouad
GO 
CREATE PROCEDURE Shopping
@id INT,
@quantity INT,
@total_price DECIMAL (10,2) OUTPUT
AS 
BEGIN 
DECLARE @unit_price DECIMAL(10,2)
SELECT @unit_price = price
FROM Inventory
WHERE supply_id = @id
SET @total_price = @quantity * @unit_price
END


-- Section 3.10, If current user had an activity set its duration to 1 hour
-- Student Name: Malak Fouad
GO 
CREATE PROCEDURE LogActivityDuration
@room_id INT,
@device_id INT,
@user_id INT, 
@date DATETIME,
@duration VARCHAR(50)
AS
BEGIN
UPDATE Log 
SET duration = '01:00:00'
WHERE room_id= @room_id AND user_id = @user_id 
AND device_id = @device_id AND date = @date AND activity IS NOT NULL 

UPDATE Log 
SET duration = @duration
WHERE room_id= @room_id AND user_id = @user_id 
AND device_id = @device_id AND date = @date AND activity IS NULL 

END

-- Section 3.11, Set device consumption for all tablets
-- Student Name: Malak Fouad
GO 
CREATE PROCEDURE TabletConsumption
@consumption INT 
AS
BEGIN 
UPDATE c
SET c.consumption = @consumption
FROM Consumption c INNER JOIN Device d ON c.device_id = d.device_id
WHERE d.type = 'Tablet'
END

-- Section 3.12, Make preferences for Room temperature to be 30 if a user is older then 40
-- Student Name: Jasmine Hany
GO
CREATE PROCEDURE MakePreferencesRoomTemp
@user_id int,
@category varchar(20),
@preferences_number int
AS
BEGIN
declare @tmpAge int

SELECT @tmpAge = age
FROM Users
WHERE id = @user_id

IF @tmpAge > 40
INSERT INTO Preferences 
VALUES(@user_id, @category, 'Room temperature should be 30',@preferences_number)
END

--Section 3.13, View Log entries involving the user
-- Student Name: Jasmine Hany
GO
CREATE PROCEDURE ViewMyLogEntry
@user_id int
AS
BEGIN
SELECT *
FROM Log
WHERE user_id = @user_id
END

-- Section 3.14, Update log entries involving the user
-- Student Name: Jasmine Hany
GO
CREATE PROCEDURE UpdateLogEntry
@user_id int, 
@room_id int, 
@device_id int,
@activity varchar(30)
AS
BEGIN
UPDATE Log
SET room_id = @room_id, device_id = @device_id, activity = @activity
WHERE user_id = @user_id
END

-- Section 3.15, View rooms that are not being used
-- Student Name: Jasmine Hany
GO
CREATE PROCEDURE ViewRoom
AS
BEGIN
SELECT *
FROM Room
WHERE status = 'Available'
END

-- Section 3.16, View the details of the booked rooms
-- Student Name: Jasmine Hany
GO
CREATE PROCEDURE ViewMeeting
@room_id int, 
@user_id int
AS
BEGIN
declare @tmpstatus VARCHAR(50)

SELECT @tmpstatus = status
FROM Room
WHERE room_id = @room_id

IF(@tmpstatus <> 'Booked')
BEGIN
SELECT r.*
FROM Users u INNER JOIN Room r ON u.room = r.room_id
WHERE u.id = @user_id and r.status = 'Booked'
END

ELSE
BEGIN
SELECT r.*
FROM Users u INNER JOIN Room r ON u.room = r.room_id
WHERE u.id = @user_id and r.room_id = @room_id
END

END

-- Section 3.17, Add to the tasks
-- Student Name: Jasmine Hany
GO
CREATE PROCEDURE AdminAddTask
@user_id int , 
@creator int ,
@name varchar(30),
@category varchar(20), 
@priority Int,
@status varchar(20), 
@reminder datetime , 
@deadline datetime , 
@other_user varchar(20)
AS 
BEGIN

INSERT INTO Task VALUES(@name, CURRENT_TIMESTAMP, @deadline, @category, @creator, @status, @reminder, @priority)
INSERT INTO Assigned_to VALUES(@creator, SCOPE_IDENTITY(), @user_id)

END

-- Section 3.18,  Add Guests to the system
-- Student Name: Jasmine Hany
GO
CREATE PROCEDURE AddGuest
@email varchar(30), 
@first_name varchar(10) ,
@address varchar (30),
@password varchar(30),
@guest_of int,
@room_id int,
@number_of_allowed_guests int output
AS
BEGIN

declare @numofguests int

SELECT @numofguests = no_of_guests_allowed
FROM Admin
WHERE admin_id = @guest_of

IF(@numofguests < 1)
BEGIN
print 'cannot use this admin due to having maximum guests' 
SET @number_of_allowed_guests = @numofguests
END

ELSE
BEGIN
INSERT INTO Users(f_Name, password, email, room)
VALUES(@first_name, @password, @email, @room_id)

INSERT INTO Guest(guest_id, guest_of, address)
VALUES(SCOPE_IDENTITY(), @guest_of, @address)
UPDATE Admin
SET no_of_guests_allowed = @numofguests - 1
WHERE admin_id = @guest_of
SET @number_of_allowed_guests = @numofguests - 1
END

END


-- Section 3.19, Assign task to a specific User
-- Student Name: Jasmine Hany
GO
CREATE PROCEDURE AssignTask
@user_id int , 
@task_id int , 
@creator_id int
AS
BEGIN
INSERT INTO Assigned_to VALUES(@creator_id, @task_id, @user_id) 
END

-- Section 3.20, Delete last message sent
-- Student Name: Jasmine Hany
GO
CREATE PROCEDURE DeleteMsg
AS
BEGIN

DELETE  FROM Communication
WHERE time_sent = (SELECT MAX(time_sent) FROM Communication)

END

-- Section 3.21, Add outgoing flight itinerary for a specific flight
-- Student Name: Jasmine Hany
GO
CREATE PROCEDURE AddItinerary
@trip_no int,
@flight_num varchar(30) ,
@flight_date datetime ,
@destination varchar(40)
AS
BEGIN

INSERT INTO Travel(trip_no, outgoing_flight_num, outgoing_flight_date, destination) 
VALUES(@trip_no, @flight_num, @flight_date, @destination)

END

-- Section 3.22,  Change flight date to next year for all flights in current year
-- Student Name: Jasmine Hany
GO
CREATE PROCEDURE ChangeFlight
AS
BEGIN

UPDATE Travel
SET outgoing_flight_date = DATEADD(YEAR, 1, outgoing_flight_date)
WHERE YEAR(outgoing_flight_date) = YEAR(CURRENT_TIMESTAMP)

UPDATE Travel
SET ingoing_flight_date = DATEADD(YEAR, 1, ingoing_flight_date)
WHERE YEAR(ingoing_flight_date) = YEAR(CURRENT_TIMESTAMP)

END


-- Section 3.23, Update incoming flights
-- Student Name: Abdulrahman Alawbathani
GO 
CREATE PROCEDURE UpdateFlight
@date datetime, 
@trip_no int, 
@destination varchar(15)
AS
BEGIN
UPDATE Travel
SET ingoing_flight_date = @date, destination = @destination
WHERE trip_no = @trip_no

END

-- Section 3.24, add a new device
-- Student Name: Abdulrahman Alawbathani
GO

CREATE PROCEDURE AddDevice
@device_id INT, 
@status varchar(20), 
@battery int,
@location int, 
@type varchar(20)

AS
BEGIN
INSERT INTO Device(device_id, room, type, status, battery_status) 
VALUES(@device_id, @location, @type, @status, @battery)
END

-- Section 3.25, Find the location of all devices out of battery
-- Student Name: Abdulrahman Alawbathani
GO

CREATE PROCEDURE OutOfBattery
AS
BEGIN
SELECT r.room_id, r.floor, r.type, r.status
FROM Device d inner join Room r on d.room = r.room_id
WHERE d.battery_status = 0
END

drop procedure OutOfBattery

-- Section 3.26, Set the status of all devices out of battery to charging
-- Student Name: Abdulrahman Alawbathani
GO 

CREATE PROCEDURE Charging
AS
BEGIN
UPDATE Device
SET status = 'Charging'
WHERE battery_status = 0
END

-- Section 3.27, Set the number of allowed guests for an admin
-- Student Name: Abdulrahman Alawbathani
Go
CREATE PROCEDURE GuestsAllowed
@admin_id int,
@number_of_guests int
AS
BEGIN
UPDATE Admin
SET no_of_guests_allowed = @number_of_guests
WHERE admin_id = @admin_id
END

-- Section 3.28, Add a penalty for all unpaid transactions where the deadline has passed
-- Student Name: Abdulrahman Alawbathani
GO

CREATE PROCEDURE Penalize
@Penalty_amount int
AS
BEGIN
UPDATE Finance
SET penalty = @Penalty_amount
WHERE CURRENT_TIMESTAMP > deadline AND status = 'Unpaid'
END

-- Section 3.29, Get the number of all guests currently present for a certain admin
-- Student Name: Abdulrahman Alawbathani
GO
CREATE PROCEDURE GuestNumber
@admin_id int
AS
BEGIN
SELECT COUNT(*)
FROM Guest g INNER JOIN Admin a ON g.guest_of = a.admin_id
WHERE g.guest_of = @admin_id
END


-- Section 3.30, Get the youngest user in the system
-- Student Name: Abdulrahman Alawbathani
GO

CREATE PROCEDURE Youngest
AS
BEGIN
SELECT TOP 1 *
FROM Users
ORDER BY age 
END

-- Section 3.31, Get the users whose average income per month is greater then a specific amount
-- Student Name: Abdulrahman Alawbathani
GO

CREATE PROCEDURE AveragaPayment
@amount decimal (10,2)
AS
BEGIN
SELECT u.f_Name, u.l_Name
FROM Users u INNER JOIN Admin a ON u.id = a.admin_id 
WHERE a.salary > @amount
END

-- Section 3.32, Get the sum of all purchases needed in the home inventory
-- Student Name: Abdulrahman Alawbathani
GO

CREATE PROCEDURE Purchase
AS
BEGIN
SELECT SUM(price)
FROM Inventory
WHERE category = 'Needed'
END

-- Section 3.33, Get the location where more than two devices have a dead battery
-- Student Name: Abdulrahman Alawbathani
GO
CREATE PROCEDURE NeedCharge
AS
BEGIN
SELECT d.device_id, r.room_id, r.floor, r.type, r.status
FROM 
Device d INNER JOIN  Room r ON d.room = r.room_id
WHERE  ( SELECT COUNT(device_id) 
         FROM Device 
          WHERE room = d.room AND battery_status = 0
        ) > 2
END

drop procedure NeedCharge


-- Section 3.34, Get the admin with more than 2 guests
-- Student Name: Abdulrahman Alawbathani
GO

CREATE PROCEDURE Admins
AS
BEGIN
SELECT u.f_Name, u.l_Name
FROM Users u INNER JOIN Admin a ON u.id = a.admin_id
INNER JOIN Guest g ON g.guest_of = a.admin_id
GROUP BY u.f_Name, u.l_Name
HAVING COUNT(g.guest_id) > 2
END

go  

create procedure CheckAdmin
@admin_id int,
@num int output,
@salary decimal(10,3) output
as
begin
select @num = no_of_guests_allowed, @salary = salary from Admin where admin_id = @admin_id
end

drop procedure CheckAdmin

go

create procedure CheckType
@user_id int,
@type varchar(50) output
as
begin
select @type = type from Users where id = @user_id
end

go

create procedure GetResAddrGuestof
@user_id int,
@residential varchar(20) output,
@address varchar(50) output,
@guest_of int output
as
begin
select @residential = residential, @address = address, @guest_of = guest_of
from Guest where guest_id = @user_id
end

go

create procedure GetIdLocation
@device_id_test int,
@room_id_test int,
@location bit output,
@id_found bit output
as
begin
if exists(select device_id from Device where device_id = @device_id_test)
set @id_found = 1
else
set @id_found = 0

if exists(select room_id from Room where room_id = @room_id_test)
set @location = 1
else
set @location = 0


end

drop procedure GetIdLocation

go

create procedure CheckGuestOfAdmin
@admin_id int, 
@guest_id int,
@bool bit output
as
begin

declare @guestOf int
select @guestOf = guest_of from Guest where guest_id = @guest_id

if(@guestOf = @admin_id)
set @bool = 1
else
set @bool = 0

end

GO
CREATE PROCEDURE ViewRooms
@user_id INT
AS
BEGIN
SELECT *
FROM Room R
INNER JOIN Users U ON R.room_id = U.room
WHERE U.id =@user_id
END







 
--