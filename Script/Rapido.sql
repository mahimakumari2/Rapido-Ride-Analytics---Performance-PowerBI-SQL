SHOW VARIABLES LIKE 'secure_file_priv';


CREATE DATABASE Rapido;
USE Rapido;

CREATE TABLE Bookings (
    Date DATE,
    Time TIME,
    Booking_ID VARCHAR(20),
    Booking_Status VARCHAR(50),
    Customer_ID VARCHAR(20),
    Vehicle_Type VARCHAR(30),
    Pickup_Location VARCHAR(100),
    Drop_Location VARCHAR(100),
    V_TAT INT,
    C_TAT INT,
    Canceled_Rides_by_Customer VARCHAR(100),
    Canceled_Rides_by_Driver VARCHAR(100),
    Incomplete_Rides INT,
    Incomplete_Rides_Reason VARCHAR(100),
    Booking_Value INT,
    Payment_Method VARCHAR(30),
    Ride_Distance FLOAT,
    Driver_Ratings FLOAT,
    Customer_Rating FLOAT,
    Vehicle_Images TEXT
);

LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Bookings.csv'
INTO TABLE Bookings
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;



SET GLOBAL local_infile = 1;

SHOW VARIABLES LIKE 'local_infile';

SELECT COUNT(*) FROM Bookings;

SHOW WARNINGS;

SELECT * FROM Bookings LIMIT 5;
use rapido;

#1. Retrieve all successful bookings:
Create View Successful_Bookings As
SELECT * FROM bookings 
WHERE Booking_Status = 'Success';

#2. Find the average ride distance for each vehicle type:
Create View ride_distance_for_each_vehicle As
SELECT Vehicle_Type, AVG(Ride_Distance)
as avg_distance FROM bookings
GROUP BY Vehicle_Type;

#3. Get the total number of cancelled rides by customers:
Create View cancelled_rides_by_customers As
SELECT COUNT(*) FROM bookings
WHERE Booking_Status = 'cancelled by Customer';

#4. List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customers As
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Rides_cancelled_by_Drivers_P_C_Issues As
SELECT COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

#7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payment As
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';

#8. Find the average customer rating per vehicle type:
Create View AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';

#10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';

#1. Retrieve all successful bookings:
Select * From Successful_Bookings;
#2. Find the average ride distance for each vehicle type:
Select * from ride_distance_for_each_vehicle;
#3. Get the total number of cancelled rides by customers:
Select * from cancelled_rides_by_customers;
#4. List the top 5 customers who booked the highest number of rides:
Select * from Top_5_Customers;
#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Select * from Rides_cancelled_by_Drivers_P_C_Issues;
#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Select * from Max_Min_Driver_Rating;
#7. Retrieve all rides where payment was made using UPI:
Select * from UPI_Payment;
#8. Find the average customer rating per vehicle type:
Select * from AVG_Cust_Rating;
#9. Calculate the total booking value of rides completed successfully:
Select * from total_successful_ride_value;
#10. List all incomplete rides along with the reason:
Select * from Incomplete_Rides_Reason;
