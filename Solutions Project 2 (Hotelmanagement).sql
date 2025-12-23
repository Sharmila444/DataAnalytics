-- Question - 1] The accounts team wants to check payments made via UPI to measure digital adoption.
select * from hotelsalesdb.payments 
where paymentmethod = 'UPI';

-- Question - 2] List all unique first names of customers for a duplicate check. 
select distinct firstname from hotelsalesdb.customers;

-- Question - 3] Delete all rooms with Capacity = 1.
DELETE FROM hotelsalesdb.rooms
WHERE Capacity = 1;

-- Question - 4] Display each customer’s name and phone number together using CONCAT.
select concat(c.firstname, ' ', c.lastname) as customerName, c.phone 
from hotelsalesdb.customers as c;

-- Question - 5] The booking office wants to see bookings where RoomID = 10 to check utilization of a specific room.
select b.customerid, b.checkindate, b.checkoutdate, b.Totalamount,r.roomid from hotelsalesdb.bookings as b
join hotelsalesdb.rooms as r
on b.roomid = r.RoomID
where r.roomid = 10;

-- Question - 6] Identify rooms whose Capacity is greater than the average Capacity of all rooms. (Rooms subquery)
SELECT roomid, roomtype, capacity
FROM hotelsalesdb.rooms
WHERE capacity > (
    SELECT AVG(capacity)
    FROM hotelsalesdb.rooms
);

-- Question - 7] Create a VIEW StaffContact showing Staff FirstName, LastName, Role, and Phone.
CREATE VIEW StaffContact AS 
SELECT firstname, lastname, role, phone
FROM hotelsalesdb.staff;
SELECT * FROM  StaffContact;


-- Question - 8] The receptionist wants to offer Suite rooms under ₹7000 to business travelers. 
select  roomid, roomtype, pricepernight 
from hotelsalesdb.rooms where roomtype = 'suite'
and PricePerNight < '7000';


-- Question - 9] The admin wants to see email addresses sorted by LastName from the Customers table. 
SELECT email, lastname, firstname
FROM hotelsalesdb.customers
WHERE email LIKE '%@gmail.com'
ORDER BY lastname;


-- Question - 10] Show staff full names combined into one column. 
select s.staffid, Concat(s.firstname, ' ', s.lastname) AS Staff_Name from hotelsalesdb.staff as s;


-- Question -  11] Display all payment details in one line using CONCAT_WS. 
SELECT CONCAT_WS(' | ', paymentid, bookingid, paymentdate, paymentmethod,amount) AS PaymentDetails
FROM hotelsalesdb.payments;

-- Question - 12] The hotel wants to display the 2 most expensive rooms for VIP guests. 
SELECT roomid, roomtype, pricepernight
FROM hotelsalesdb.rooms
ORDER BY pricepernight DESC
LIMIT 2;


-- Question - 13] Show each BookingID with its CheckIn and CheckOut dates combined.
select concat_ws(' | ', bookingid, checkindate, checkoutdate) as Bookingdetails 
from hotelsalesdb.bookings;

-- Question - 14] Finance wants to calculate the average Amount per PaymentMethod. 
SELECT paymentmethod, AVG(amount) AS AverageAmount
FROM hotelsalesdb.payments
GROUP BY paymentmethod;


-- Question - 15] The analytics team wants to find the city where average CustomerID is greater than 50. 
SELECT city, 
       AVG(customerid) AS AverageCustomerID
FROM hotelsalesdb.customers
GROUP BY city
HAVING AVG(customerid) > 50;

-- Question - 16] Find bookings where TotalAmount exceeds the average TotalAmount. (Bookings subquery) 
select bookingid, sum(totalamount)as TotalAmount from hotelsalesdb.bookings group by bookingid 
having sum(TotalAmount) > (SELECT AVG(totalamount) FROM hotelsalesdb.bookings);

-- Question - 17] Display the last 2 added rooms from the Rooms table. 
select roomid, roomtype from hotelsalesdb.rooms 
order by RoomType desc limit 2;

-- Question - 18] The cashier wants a report of payments where Amount < ₹1500 for small transactions. 
select paymentid, bookingid, paymentmethod, amount 
from hotelsalesdb.payments 
where amount < 1500 group by PaymentMethod;

-- Question - 19] Management wants to list all customers who have made more than 5 bookings. 
select concat(c.firstname, ' ', c.lastname) as CustomerName,c.CustomerID, Count(b.bookingid) as Bookingcount 
from hotelsalesdb.customers as c 
join hotelsalesdb.bookings as b 
on c.CustomerID = b.CustomerID 
group by concat(c.firstname, ' ', c.lastname) 
having Count(b.bookingid) > 5;

-- Question - 20] Identify customers who live in the same city. (Customers self join) 
SELECT 
  c1.customerid as Customer1, concat(c1.firstname, ' ', c1.lastname) as CustomerName1, 
  concat(c2.firstname, ' ', c2.lastname) as CustomerName2, 
  c1.city from hotelsalesdb.customers as c1 
  join hotelsalesdb.customers as c2 
  on c1.city = c2.city 
  and c1.customerid = c2.customerid 
  order by c1.city;

-- Question - 21] Show the total revenue handled by each StaffID. 
select s.staffid,concat(s.firstname, ' ', s.lastname) as staff_name, 
Sum(b.TotalAmount) as TotalRevenue from hotelsalesdb.staff as s 
join hotelsalesdb.bookings as b 
on s.StaffID = b.staffID 
group by s.StaffID;


-- Question - 22] The manager wants to see all customers from Mumbai to check city-wise marketing campaigns. 
select concat(firstname, ' ', lastname)as CustomerName, city 
from hotelsalesdb.customers 
where city = 'Mumbai';

-- Question - 23] Display the 3 lowest booking amounts. 

SELECT bookingid, totalamount
FROM hotelsalesdb.bookings
ORDER BY totalamount ASC
LIMIT 3;


-- Question - 24] Insert 5 new room records with type, price, and capacity into the Rooms table. 
INSERT INTO hotelsalesdb.rooms (roomtype, pricepernight, capacity) 
VALUES 
    ('Deluxe', 5600, 3),
    ('Standard', 3500, 2),
    ('Suite', 10000, 3),
    ('Pre.Suite', 14000, 4),
    ('FamilySuite', 11000, 4);
    
    
-- Question - 25] Show all unique CustomerIDs from bookings. 
select distinct b.customerid, concat(c.firstname, ' ' , c.lastname) as Customername 
from hotelsalesdb.customers as c 
join hotelsalesdb.bookings as b 
on b.CustomerID = c.CustomerID;

-- Question - 26] Create a trigger to automatically delete a payment when its corresponding booking is deleted. 

-- Question - 27] The marketing team wants to update the FirstName of CustomerID = 30 to 'Rahul'. 
Update hotelsalesdb.customers 
set firstname ='Rahul'
where customerid = 30;

-- Question - 28] List all bookings ordered by CheckInDate. 
select bookingid, checkindate 
from hotelsalesdb.bookings 
order by CheckInDate;

-- Question - 29] Show all rooms where capacity is greater than 2. 
select roomid, roomtype, capacity 
from hotelsalesdb.rooms
where Capacity > 2;

-- Question - 30] List staff emails ordered by their roles.
select staffid, concat(firstname, ' ', lastname) as staffname, role, email 
from hotelsalesdb.staff 
order by role;

-- Question - 31] Display each customer’s full name and city using CONCAT_WS. 
select concat_ws(' | ', firstname, ' ', lastname, city) as Customer_Details 
from hotelsalesdb.customers;

-- Question - 32] Show the first 4 customers’ full names only. 
select concat(firstname, ' ', lastname)as Customer_Name 
from hotelsalesdb.customers 
order by customerid limit 4;

-- Question - 33] Show each staff’s role with their full name. 
select concat(firstname, ' ', lastname) as Staff_Name, 
role from hotelsalesdb.staff;

-- Question - 34] Management wants to find the average StaffID per role. 
select concat(firstname, ' ', lastname) as Staff_Name, role, Avg(staffid) 
from hotelsalesdb.staff 
group by  concat(firstname, ' ', lastname) 
having (select Avg(staffid) from hotelsalesdb.staff);


-- Question - 35] List all bookings handled by StaffID = 2. 
select * from hotelsalesdb.bookings
where staffid = 2;

-- Question - 36] Display the first 3 staff alphabetically by their first names. 
select concat(firstname, ' ', lastname) as Staff 
from hotelsalesdb.staff 
order by firstname 
and staffid asc limit  3;

-- Question - 37] The front desk manager wants to see customers where FirstName = 'Amit' AND City = 'Nagpur' for personal attention. 
select customerid, firstname, lastname, city 
from hotelsalesdb.customers 
where firstname = 'Amit' 
and City = 'Nagpur';

-- Question - 38] Show all unique payment methods in descending order. 
select distinct paymentmethod 
from hotelsalesdb.payments 
order by PaymentMethod desc;

-- Question - 39] Insert 5 staff members into the Staff table with their role, phone, and email. 

insert into hotelsalesdb.staff (role, phone, email)
Values ('receptionist', 8549756240, 'ayan.sen@gmail.com'),
('Housekeeping', 9986512345, 'karan.sharmak@gmail.com'),
('Chef', 8546528255, 'rohan.tyagi@gmail.com'), 
('DutyManager', 9865932541, 'mohan.sharma85@gmail.com'), 
('Manager', 9865432144, 'arohi.sharma@gmail.com');

-- Question - 40] The hotel manager wants to review bookings where CheckInDate is after '2024-01-01' to analyze recent occupancy. 
select checkindate, bookingid 
from hotelsalesdb.bookings 
where checkindate > '2024-01-01' 
group by checkindate 
order by checkindate;

-- Question - 41] List all customers whose FirstName is 'Rahul' for a loyalty program. 
select * from hotelsalesdb.customers 
where firstname = 'Rahul';

-- Question - 42] Show all unique room types offered by the hotel. 
select distinct roomtype 
from hotelsalesdb.rooms;

-- Question - 43] Identify customers who spent more than 50,000 in total. 
select p.bookingid, p.amount, concat(c.firstname, ' ', c.lastname) as CustomerName, c.customerid 
from hotelsalesdb.customers as c 
join hotelsalesdb.payments as p 
on c.customerid = p.bookingid  
group by p.amount 
having p.amount > '50000';

-- Question - 44] Delete all customers from the city 'TestCity'. 
Delete	from hotelsalesdb.customers
where city = testcity;

-- Question - 45] Find rooms that have the same PricePerNight. (Rooms self join) 
select r1.roomtype as roomtype1, r2.roomtype as roomtype2, r1.pricepernight 
from hotelsalesdb.rooms as r1 
join hotelsalesdb.rooms as r2 
on r1.pricepernight = r2.pricepernight
AND r1.roomid < r2.roomid;

-- Question - 46] The manager wants to see staff whose Email ends with '@tcs.in' for corporate tie-ups. 
select concat(firstname, ' ', lastname) as StaffName, email 
from hotelsalesdb.staff 
where email like '%@tcs.in';

-- Question - 47] The analytics team wants to list all cities where maximum CustomerID is more than 100. 
select city, max(customerid) as Customeridcount 
from hotelsalesdb.customers 
group by city 
having max(customerid) > 100 ;

-- Question - 48] Show all unique capacities in descending order. 
select distinct capacity 
from hotelsalesdb.rooms 
order by capacity desc;

-- Question - 49] List staff working as Managers.
select concat(firstname, ' ', lastname) as staffName, role  
from hotelsalesdb.staff 
where role = 'manager';

-- Question - 50] Display each payment’s ID, Method, Amount in one line. 
select concat_ws(' | ' , paymentid, paymentmethod, amount) from hotelsalesdb.payments;

-- Question - 51] Show the first 4 payments only. 
select Amount, paymentmethod from hotelsalesdb.payments limit 4;

-- Question - 52] The hotel manager wants to review rooms where PricePerNight is between ₹2000 and ₹4000 to offer discounts. 
select roomtype, pricepernight from hotelsalesdb.rooms 
where pricepernight between '2000' and '4000';


-- Question - 53] List all bookings ordered by CheckInDate. 
select bookingid, checkindate from hotelsalesdb.bookings 
order by checkindate;

-- Question - 54] Display all unique CustomerIDs from bookings. 
select distinct customerid from hotelsalesdb.customers;

-- Question - 55] The hotel manager wants to add new customer details. Insert 5 records with full details into the Customers table.
insert into hotelsalesdb.customers(firstname, lastname, email, phone, city)
values('Sweta', 'Panda', 'sweta.panda@gmail.com', '8932586421', 'Bhubaneswar'), 
('Arav', 'Desai', 'arav.desai@gmail.com', '9869853152', 'Mumbai'),
('Roshan', 'Padhi', 'roshan.padhi@gmail.com', '9898426531', 'Balasore'),
('Ranjana', 'Singh', 'ranjana.singh@gmail.com', '8752512362', 'Patna'),
('Babita', 'Pal', 'babita.pal@gmail.com', '7856821525', 'Kolkata');

-- Question - 56] Show the last 2 staff hired. 
select staffid, concat(firstname, ' ', lastname)as StaffName from hotelsalesdb.staff order by staffid desc limit 2;

-- Question - 57] Identify rooms with PricePerNight higher than the maximum PricePerNight of rooms with Capacity = 2. (Rooms subquery)
select roomtype, pricepernight, capacity from hotelsalesdb.rooms 
where pricepernight > (select max(pricepernight) as Maximumpricepernight 
from hotelsalesdb.rooms 
where capacity = 2);

-- Question - 58] The HR team wants to see staff whose Role is not 'Chef' for role reallocation.
select concat(firstname, ' ', lastname) as staffname, role 
from hotelsalesdb.staff 
where role != 'chef';

-- Question - 59] Show all unique cities in descending order from the Customers table. 
select distinct city from hotelsalesdb.customers 
order by city desc;

-- Question - 60] Display the phone number of the Waiter only. 
select phone from hotelsalesdb.staff where role = 'waiter';

-- Question - 61] Display the last 2 bookings in the table. 
select bookingid from	hotelsalesdb.bookings order by bookingid desc limit 2;

-- Question - 62] The marketing team wants to see customers living in Delhi or Chennai for targeted promotions.
select concat(firstname, ' ', lastname) as customername, city from hotelsalesdb.customers where city = 'delhi' or 'chennai';
 
-- Question - 63] Show all rooms where RoomType != 'Family' to plan renovations. 
select * from hotelsalesdb.rooms where roomtype != 'family';

-- Question - 64] List staff emails ordered by their roles. 
select email, role from hotelsalesdb.staff order by role;

-- Question - 65] Display all unique payment methods. 
select distinct paymentmethod from hotelsalesdb.payments;

-- Question - 66] The receptionist wants a list of customers whose Phone starts with '98' for mobile offers. 
select concat(firstname, ' ', lastname) as customername, phone from hotelsalesdb.customers where phone like '98%';

-- Question - 67] Show the 3 cheapest rooms available for budget travelers.
select roomtype, pricepernight from hotelsalesdb.rooms order by pricepernight limit 3;

-- Question - 68] Display the last 2 payments. 
select * from hotelsalesdb.payments order by amount ASC limit 2;

-- Question - 69] Management wants to know which unique cities customers come from. 
select distinct city, concat(firstname, ' ', lastname) as customername from hotelsalesdb.customers;

-- Question - 70] List all bookings where TotalAmount > 5000.
select * from hotelsalesdb.bookings where TotalAmount > 5000;

-- Question - 71] Display each staff’s Role with their Email in one column. 
select concat_ws(' | ', firstname, lastname, Role, Email) from hotelsalesdb.staff;	

-- Question - 72] Show the first 4 staff full names. 
select concat(firstname, ' ', lastname) as staffname from hotelsalesdb.staff limit 4;

-- Question - 73] Find bookings where TotalAmount is greater than all bookings made by CustomerID = 10. (Bookings subquery) 
select bookingid, totalamount from hotelsalesdb.bookings where Totalamount > (select Max(totalamount) where customerid = 10); 

-- Question - 74] List rooms with capacity >= 3 for family bookings. 
select roomtype, capacity from hotelsalesdb.rooms where capacity >= 3 order by roomtype;

-- Question - 75] Display the RoomType and Price of only Suite rooms.
select roomtype, pricepernight from hotelsalesdb.rooms where roomtype = 'suite';
 
-- Question - 76] The cashier wants to see payments with Amount between ₹2000 and ₹7000 for mid-range billing checks.
select paymentid, amount from hotelsalesdb.payments where amount between 2000 and 7000;
 
-- Question - 77] Insert 5 booking records into the Bookings table with all details. 
INSERT INTO hotelsalesdb.bookings
(CustomerID, RoomID, StaffID, CheckInDate, CheckOutDate, TotalAmount)
VALUES
(125, 44, 65, '2025-12-01', '2025-12-03', 8895),
(137, 68, 78, '2024-04-08', '2024-04-09', 1789),
(97, 90, 35, '2022-05-14', '2022-05-16', 5866),
(260, 168, 49, '2023-08-22', '2023-08-25', 12856),
(249, 59, 79, '2025-07-18', '2025-07-22', 13850);


-- Question - 78] Display the 3 lowest payments made by customers. 
select paymentid, min(amount) from hotelsalesdb.payments group by paymentid order by min(amount) limit 3;

-- Question - 79] Show each booking’s BookingID with TotalAmount using CONCAT. 
select concat(bookingid, ' | ', totalamount) as bookinginfo from hotelsalesdb.bookings;

-- Question - 80] Show all unique RoomIDs in descending order. 
select distinct roomid from hotelsalesdb.rooms order by roomid desc;

-- Question - 81] Display each room’s RoomType and Price using CONCAT_WS. 
select concat_ws(' | ',RoomType, PricePerNight) from hotelsalesdb.rooms;

-- Question - 82] The admin wants to delete all bookings handled by StaffID = 3. 
Delete from hotelsalesdb.bookings
where staffid = 3;

-- Question - 83] Show customers whose FirstName length > 5 characters for a name-pattern study. 
select concat(firstname, ' ', lastname)as customername from hotelsalesdb.customers where length(firstname) > 5;

-- Question - 84] Show all unique roles available in the hotel. 
select distinct role from hotelsalesdb.staff;

-- Question - 85] List all rooms where capacity is greater than 2. 
select roomid, roomtype, capacity from hotelsalesdb.rooms where capacity > 2;

-- Question - 86] Display each payment’s ID with Amount using CONCAT. 
select concat_ws(' | ', paymentid, amount) from hotelsalesdb.payments;

-- Question - 87] List all Card payments from the Payments table.
select distinct paymentmethod from hotelsalesdb.payments;

-- Question - 88] Delete all customers whose Email ends with '@test.com' as invalid. 
Delete from hotelsalesdb.customers
where email	like'%@test.com';

-- Question - 89] The hotel manager wants to review bookings where CheckOutDate before '2023-12-31' to measure old occupancy. 
select bookingid, checkoutdate from hotelsalesdb.bookings where checkoutdate < '2023-12-31';

-- Question - 90] The front office manager needs to list rooms with capacity = 2 for couples. 
select * from hotelsalesdb.rooms where capacity = 2;

-- Question - 91] Show all unique capacities in descending order.
select distinct capacity from hotelsalesdb.rooms order by capacity desc;
 
-- Question - 92] The operations team wants to find the minimum TotalAmount in bookings. 
select min(totalamount) as minamount from hotelsalesdb.bookings;

-- Question - 93] Display all rooms by capacity in ascending order. 
select roomtype, capacity from hotelsalesdb.rooms  group by roomtype order by capacity asc ;

-- Question - 94] Show each booking’s BookingID with TotalAmount using CONCAT. 
select concat(bookingid, ' | ', totalamount) as bookinginfo from hotelsalesdb.bookings;

-- Question - 95] The operations head wants to see rooms with Capacity = 4 AND PricePerNight > ₹6000 for premium family packages. 
select roomtype, capacity, pricepernight from hotelsalesdb.rooms where capacity = 4 and pricepernight > 6000;

-- Question - 96] Show staff full names combined into one column. 
select concat(firstname, ' ', lastname) as staffname from hotelsalesdb.staff;

-- Question - 97] The accounts team wants to see bookings where the TotalAmount is greater than ₹10,000 to track high-value customers. 
select * from hotelsalesdb.bookings where Totalamount > 10000;

-- Question - 98] Show all unique payment methods in descending order. 
select distinct paymentmethod from hotelsalesdb.payments order by paymentmethod desc;

-- Question - 99] List staff members who share the same Role. (Staff self join) 
select concat(s1.firstname, ' ', s2.lastname)as staffmember1, concat(s2.firstname, ' ', s2.lastname)as staffmember2, s1.role, s1.staffid from hotelsalesdb.staff as s1 join hotelsalesdb.staff as s2 on s1.role = s2.role AND s1.staffid < s2.staffid
ORDER BY s1.role;

-- Question - 100] Show customer first name, last name, and TotalAmount of their bookings using JOIN between Customers and Bookings.
select concat(c.firstname, ' ', c.lastname) as CustomerName, b.TotalAmount from hotelsalesdb.customers as c join hotelsalesdb.bookings as b on c.customerid = b.customerid;

-- Question - 101] Display the first 4 bookings only. 
select * from hotelsalesdb.bookings order by bookingid limit 4;

-- Question - 102] Show all unique staff first names. 
select distinct firstname from hotelsalesdb.staff;

-- Question - 103] Insert 5 new room records with type, price, and capacity into the Rooms table. 
insert into hotelsalesdb.rooms(RoomType, PricePerNight, Capacity) Values ('Standard', 3975, 2), ('SuperDeluxe', 5800, 3), ('Deluxe', 7866, 3), ('Familysuite', 10500, 4), ('Premiumsuite', 12750, 4);

-- Question - 104] Display each customer’s full name and city using CONCAT_WS. 
select concat_ws(' | ', concat(firstname, ' ', lastname), city) as Customerinfo from hotelsalesdb.customers;

-- Question - 105] Show all unique cities in descending order from the Customers table. 
select distinct city from hotelsalesdb.customers order by city desc;

-- Question - 106] The analytics team wants to list all cities where maximum CustomerID is more than 100. 
select city, max(Customerid) as Maxcustomerid from hotelsalesdb.customers group by city having max(customerid) > 100;

-- Question - 107] The HR team wants to see staff whose FirstName is 'Priya' for employee recognition. 
select firstname, lastname from hotelsalesdb.customers where firstname = 'priya';

-- Question - 108] Display the last 2 staff members from the Staff table. 
select staffid, concat(firstname, ' ', lastname)as staffname from hotelsalesdb.staff order by staffid desc limit 2;

-- Question - 109] Create a VIEW BookingSummary showing BookingID, CustomerID, RoomID, and TotalAmount. 
create view hotelsalesdb.BookingSummary as
select bookingid, Customerid, Roomid, Totalamount from hotelsalesdb.bookings;

select * from hotelsalesdb.bookingsummary;

-- Question - 110] Show all unique RoomIDs in descending order. 
select distinct roomid from hotelsalesdb.rooms order by roomid desc;

-- Question - 111] Display each staff’s role with their full name. 
select concat(firstname, ' ', lastname) as staffname, role from hotelsalesdb.staff;

-- Question - 112] The receptionist wants to offer Suite rooms under ₹7000 to business travelers.
select roomtype, pricepernight from hotelsalesdb.rooms where roomtype = 'suite' and pricepernight < 7000;

-- Question - 113] Display the first 3 staff alphabetically by their first names. 
select firstname, lastname from hotelsalesdb.staff order by staffid asc limit 3;

-- Question - 114] List all bookings ordered by CheckInDate. 
select * from hotelsalesdb.bookings order by checkindate;

-- Question - 115] Show all unique StaffIDs from the bookings. 
select distinct staffid from hotelsalesdb.staff;

-- Question - 116] Display the first 4 customers’ full names only. 
select concat(firstname, ' ', lastname) as customerName from hotelsalesdb.customers order by customerid limit 4;

-- Question - 117] Show all unique room types offered by the hotel. 
select distinct roomtype from hotelsalesdb.rooms;

-- Question - 118] Display the phone number of the Waiter only. 
select role, phone from hotelsalesdb.staff where role = 'waiter';

-- Question - 119] Show all bookings where TotalAmount > 5000. 
select * from hotelsalesdb.bookings where TotalAmount > 5000;

-- Question - 120] The HR team wants to update Role = 'Senior Manager' where StaffID = 12. 
Update hotelsalesdb.staff set role = 'SeniorManager' where staffid = 12;

-- Question - 121] List all staff working as Managers. 
select concat(firstname, ' ', lastname) as staffname, role from hotelsalesdb.staff where role = 'manager';

-- Question - 122] Show the last 2 registered customers for follow-up. 
select * from hotelsalesdb.customers order by customerid desc limit 2;

-- Question - 123] Display each booking’s BookingID with TotalAmount using CONCAT. 
select concat(bookingid, ' | ', TotalAmount) as bookinginfo from hotelsalesdb.bookings;

-- Question - 124] Insert 5 staff members into the Staff table with their role, phone, and email.
insert into hotelsalesdb.staff( firstname, lastname, role, phone, email) Values
('Shruti', 'Reddy', 'waitress', 8925862435, 'shruti.reddy@gmail.com'), 
('Raj', 'Saxena', 'housekeeping', 7864825864, 'raj.saxena@gmail.com'), 
('Pabitra', 'Anand', 'Security', 7984526846, 'pabitra.anand@gmail.com'), 
('Vishal', 'Adhikari', 'DutyManager', 8754266884, 'vishal.adhikari@gmail.com'),
('Govind', 'Adhikari', 'Chef', 9852448625, 'govind.adhikari@gmail.com');

-- Question - 125] Display the RoomType and Price of only Suite rooms. 
select roomtype, pricepernight from hotelsalesdb.rooms where roomtype = 'suite';

-- Question - 126] The admin wants to delete all payments linked to BookingID = 15.
Delete from hotelsalesdb.payments 
where BookingID = 15;


-- Question - 127] Display all unique capacities in descending order. 
select distinct capacity from hotelsalesdb.rooms order by capacity desc;

-- Question - 128] Show the first 4 rooms sorted alphabetically by RoomType. 
select roomtype from hotelsalesdb.rooms order by roomtype asc limit 4;

-- Question - 129] The cashier wants a report of payments where Amount < ₹1500 for small transactions. 
select * from hotelsalesdb.payments where amount < 1500;

-- Question - 130] Show each booking’s BookingID with TotalAmount using CONCAT. 
select concat(bookingid, '  | ', totalamount)as bookinginfo from hotelsalesdb.bookings;

-- Question - 131] Display the last 2 added rooms from the Rooms table. 
select * from hotelsalesdb.rooms order by roomid desc limit 2;

-- Question - 132] List all customers whose FirstName = 'Amit' AND City = 'Nagpur' for personal attention. 
select firstname, lastname, city from hotelsalesdb.customers where firstname = 'Amit' and city = 'Nagpur';

-- Question - 133] Insert 5 new customer details into the Customers table. 
insert into hotelsalesdb.customers(FirstName, LastName, Email, Phone, City) Values 
('Raghav', 'Bajaj', 'raghav.bajaj@gmail.com', 8956253645, ' Noida'),
('Sunita', 'Chauhan', 'sunita.chauhan@gmail.com', 7852558625, 'Delhi'),
('Pawan', 'Rathod', 'pawan.rathod@gmail.com', 8369711236, 'Mumbai'),
('Monika', 'Rathi', 'monika.rathi@gmail.com', 7985634590, 'Surat'),
('Naresh', 'Tripathy', 'naresh.tripathy@gmail.com', 8759325822, 'Varanasi');


-- Question - 134] Show staff full names combined into one column. 
select concat(firstname, ' ', lastname) as StaffName from hotelsalesdb.staff;

-- Question - 135] Show all room details separated by commas using CONCAT_WS. 
select concat_ws(' , ', roomid, roomtype, pricepernight, capacity) as roominfo from hotelsalesdb.rooms;

-- Question - 136] Display each customer’s name and phone number together using CONCAT. 
select concat(firstname, ' ', lastname, ' | ', phone)  as CustomerInfo from hotelsalesdb.customers;

-- Question - 137] Display all payment details in one line using CONCAT_WS. 
select concat_ws(' | ', PaymentID, BookingID, PaymentDate, PaymentMethod, Amount) as PaymentDetails from hotelsalesdb.payments;

-- Question - 138] Show the last 2 bookings in the table. 
use hotelsalesdb;
select * from bookings order by checkindate limit 2;

-- Question - 139] List all payments ordered by PaymentDate. 
select * from payments order by paymentdate;

-- Question - 140] Show the 2 highest payments received. 
select * from payments order by amount desc limit 2;

-- Question - 141] The marketing team wants to check customers whose FirstName is 'Rahul' for a loyalty program. 
select * from customers where firstname = 'Rahul';

-- Question - 142] Display each PaymentID with its method using CONCAT. 
select concat(paymentid,'-', paymentmethod) from payments;

-- Question - 143] The operations team wants to list all PaymentMethods used more than 5 times. 
SELECT CONCAT(paymentmethod, '-', COUNT(*)) AS PaymentMethod_Count FROM payments GROUP BY paymentmethod HAVING COUNT(*) > 5;

-- Question - 144] Show the 2 most expensive rooms for VIP guests. 
select concat(RoomType,'-',pricepernight) from rooms where RoomType = 'Deluxe' order by pricepernight desc limit 2 ;

-- Question - 145] Show each room’s RoomType and Price using CONCAT_WS. 
select concat_ws(' | ', roomtype, pricepernight) as Roominfo from hotelsalesdb.rooms;

-- Question - 146] Display the first 3 staff alphabetically by their first names.
select firstname from staff where firstname is not null order by firstname asc limit 3;

-- Question - 147] List all bookings handled by StaffID = 2. 
SELECT b.*, c.firstname, c.lastname, c.city FROM bookings b
INNER JOIN customers c ON b.CustomerID = c.CustomerID
WHERE b.StaffID = 2;

-- Question - 148] The analytics team wants to find the city where average CustomerID is greater than 50. 
select city, avg(customerid) as Averagecustomerid from hotelsalesdb.customers 
group by city 
having avg(customerid) > 50;

-- Question - 149] The hotel wants to display the 2 most expensive rooms for VIP guests. 
Select roomtype, pricepernight
From hotelsalesdb.rooms
order by pricepernight desc
Limit 2;


-- Question - 150] Show all unique first names of customers for a duplicate check.
select distinct firstname from hotelsalesdb.customers; 

-- Question - 151] Show all unique roles in descending order. 
select distinct role from hotelsalesdb.staff
order by role desc;

-- Question - 152] Identify rooms whose Capacity is greater than the average Capacity of all rooms. (Rooms subquery) 
select roomtype, capacity from hotelsalesdb.rooms where capacity > (select avg(capacity) from hotelsalesdb.rooms);

-- Question - 153] Display all rooms by capacity in ascending order. 
select roomtype, capacity from hotelsalesdb.rooms order by capacity asc;

-- Question - 154] Display the first 4 payments only. 
select * from hotelsalesdb.payments 
order by paymentid limit 4;

-- Question - 155] Show each payment’s ID, Method, Amount in one line. 
select concat_ws(' | ', paymentid, paymentmethod, amount) from hotelsalesdb.payments;

-- Question - 156] List all bookings where TotalAmount > 5000.
select * from hotelsalesdb.bookings 
where TotalAmount > 5000;

-- Question - 157] Find all customers whose CustomerID is greater than the average CustomerID. (Customers subquery) 
select * from hotelsalesdb.customers where customerid > (select avg(customerid) from hotelsalesdb.customers);

-- Question - 158] The HR manager wants to see staff whose Role is not 'Chef' for role reallocation. 
select * from hotelsalesdb.staff where role != 'chef';

-- Question - 159] The accounts team wants to check bookings where TotalAmount is greater than ₹10,000. 
select * from hotelsalesdb.bookings where TotalAmount > 10000;

-- Question - 160] Display each staff’s role with their full name. 
select concat(firstname, ' ', lastname) as staffname, role from hotelsalesdb.staff;

-- Question - 161] List staff members who share the same Role. (Staff self join) 
select concat(s1.firstname, ' ', s1.lastname) as staff1, Concat(s2.firstname, ' ', s2.lastname) as staff2, s1.role from hotelsalesdb.staff;

-- Question - 162] Show Customer Name and Payment Amount by joining Customers, Bookings, and Payments.
SELECT 
    CONCAT(c.firstname, ' ', c.lastname) AS customername,
    p.amount AS payment_amount
FROM customers c
JOIN bookings b 
    ON c.customerid = b.customerid
JOIN payments p 
    ON b.bookingid = p.bookingid;


-- Question - 163] Display all bookings where TotalAmount > 5000.
Select * from bookings where TotalAmount > 5000;

-- Question - 164] The front desk wants to see customers whose Phone starts with '98'. 
select concat(firstname, ' ', lastname) as CustomerName, phone from hotelsalesdb.customers where phone like '98%';

-- Question - 165] Identify customers who live in the same city. (Customers self join) 
select concat(c1.firstname, ' ', c1.lastname) as customer1, concat(c2.firstname, ' ', c2.lastname) as customer2, c1.city 
from hotelsalesdb.customers as c1
join hotelsalesdb.customers as c2
on c1.city = c2.city
and c1.CustomerID > c2.customerid;

-- Question - 166] The operations manager wants to check bookings with CheckOutDate before '2023-12-31'.
select * from bookings where   CheckOutDate < '2023-12-31';

-- Question - 167] Display all unique StaffIDs from the bookings. 
select distinct staffid from hotelsalesdb.bookings;

-- Question - 168] Create a VIEW OnlinePayments showing all payments made by PaymentMethod = 'Online'. 
Create View hotelsalesdb.OnlinePayments as 
select * from hotelsalesdb.payments
where PaymentMethod in ('UPI' ,'Netbanking');

select * from hotelsalesdb.OnlinePayments;

drop view hotelsalesdb.onlinepayments;
-- Question - 169] Display all unique payment methods in descending order. 
select distinct paymentmethod 
from hotelsalesdb.payments 
order by PaymentMethod desc;

-- Question - 170] Display each payment’s ID with Amount using CONCAT. 
select concat(paymentid, ' | ', amount) as paymentinfo from hotelsalesdb.payments;

-- Question - 171] Show all unique RoomIDs in descending order. 
select distinct roomid 
from hotelsalesdb.rooms 
order by roomid desc;

-- Question - 172] The analytics team wants to list all cities where maximum CustomerID is more than 100. 
select city, max(customerid) as Maximum_CustomerID 
from hotelsalesdb.customers 
group by city 
having max(customerid) > 100;


-- Question - 173] List staff emails ordered by their roles. 
select role, email from hotelsalesdb.staff 
order by role;

-- Question - 174] Find bookings where TotalAmount exceeds the average TotalAmount. (Bookings subquery) 
select * from hotelsalesdb.bookings where TotalAmount > (select avg(totalamount)as Averageamount from hotelsalesdb.bookings);

-- Question - 175] Show all rooms where PricePerNight > ₹5000 for premium customer recommendations. 
select * from hotelsalesdb.rooms
where PricePerNight > 5000;

-- Question - 176] Show all unique capacities in descending order. 
select distinct capacity from hotelsalesdb.rooms
order by Capacity desc;

-- Question - 177] Display the first 4 rooms sorted alphabetically by RoomType. 
select * from hotelsalesdb.rooms 
order by RoomType asc limit 4;

-- Question - 178] Show all unique staff first names. 
select distinct firstname from hotelsalesdb.staff;

-- Question - 179] Identify rooms with PricePerNight higher than the maximum PricePerNight of rooms with Capacity = 2. (Rooms subquery) 
select * from hotelsalesdb.rooms where PricePerNight > (Select max(PricePerNight) as MaximumPrice from hotelsalesdb.rooms where Capacity = 2);

-- Question - 180] Show all unique cities in descending order from the Customers table.
Select distinct city from hotelsalesdb.customers 
order by city desc;

-- Question - 181] List all bookings where TotalAmount > 5000. 
select * from hotelsalesdb.bookings 
where TotalAmount > 5000;

-- Question - 182] Show PaymentID, Customer Name, and BookingID for payments made using 'Credit Card'. 
select p.paymentid, p.bookingid, p.PaymentMethod, concat(c.firstname, ' ', lastname)as customername 
from hotelsalesdb.payments as p
join hotelsalesdb.customers as c
on p.PaymentID = c.CustomerID
and p.bookingid = c.CustomerID
where p.PaymentMethod = 'card';


-- Question - 183] Display each booking’s BookingID with TotalAmount using CONCAT. 
select concat(bookingid, ' | ', totalamount) as bookinginfo 
from hotelsalesdb.bookings;

-- Question - 184] Show all bookings handled by StaffID = 2. 
select * from hotelsalesdb.bookings 
where StaffID = 2;

-- Question - 185] Display the last 2 added rooms from the Rooms table. 
select * from hotelsalesdb.rooms 
order by roomid desc limit 2;

-- Question - 186] List all rooms where capacity is greater than 2. 
select * from hotelsalesdb.rooms where capacity > 2;

-- Question - 187] Display the last 2 staff members from the Staff table. 
select * from hotelsalesdb.staff 
order by staffid desc limit 2;

-- Question - 188] Show all unique roles available in the hotel.
select	distinct role from hotelsalesdb.staff; 

-- Question - 189] Display the last 2 payments. 
select * from hotelsalesdb.payments 
order by paymentid desc limit 2;

-- Question - 190] The manager wants to see bookings where CustomerID IN (2,4,6,8) to track repeat guests. 
select * from hotelsalesdb.bookings where CustomerID IN (2,4,6,8);

-- Question - 191] Show all unique first names of customers for a duplicate check. 
select distinct FirstName from hotelsalesdb.customers;

-- Question - 192] Display all bookings where TotalAmount > 5000. 
select * from hotelsalesdb.bookings where TotalAmount > 5000;

-- Question - 193] The admin wants to delete all payments where Amount < 1000. 

-- Question - 194] Display all unique RoomIDs in descending order. 
select distinct roomid from hotelsalesdb.rooms order by roomid desc;

-- Question - 195] List customers who made more than 5 bookings. 
select concat(firstname, ' ', lastname) as customername,
COUNT(b.bookingid) AS total_bookings
FROM hotelsalesdb.customers c
JOIN hotelsalesdb.bookings b
    ON c.customerid = b.customerid
GROUP BY c.customerid, c.firstname, c.lastname
HAVING COUNT(b.bookingid) > 5;

-- Question - 196] Display all rooms by capacity in ascending order. 
select * from hotelsalesdb.rooms order by Capacity asc;

-- Question - 197] Show each booking’s BookingID with TotalAmount using CONCAT. 
select concat(bookingid, ' | ', totalamount) as bookinginfo 
from hotelsalesdb.bookings;

-- Question - 198] List all staff working as Managers. 
select * from hotelsalesdb.staff where role = 'manager';

-- Question - 199] Show customers whose FirstName length > 5 characters for a name-pattern study. 
select * from hotelsalesdb.customers where length(firstname) > 5;

-- Question - 200] Display all unique capacities in descending order.
select distinct capacity from hotelsalesdb.rooms order by Capacity desc ;

-- Question - 201] List staff members who share the same Role. (Staff self join) 
select concat(s1.firstname, ' ', s2.lastname) as staff1, concat(s1.firstname, ' ', s2.lastname) as staff2, s1.role from hotelsalesdb.staff as s1
join hotelsalesdb.staff as s2
on s1.role = s2.role;

-- Question - 202] Show PaymentID, Customer Name, and BookingID for payments made using 'Credit Card'. 

-- Question - 203] Display the first 4 payments only. 
select * from hotelsalesdb.payments order by paymentid asc limit 4;

-- Question - 204] Show each payment’s ID, Method, Amount in one line. 
select concat_ws(' | ', paymentid, paymentmethod, amount) as Paymentinfo from hotelsalesdb.payments;

-- Question - 205] Create a VIEW HighValueBookings showing all bookings with TotalAmount > 20,000. 
Create view hotelsalesdb.HighValueBookings as
select * from hotelsalesdb.bookings
where TotalAmount > 20000;

select * from hotelsalesdb.Highvaluebookings;

-- Question - 206] Create a trigger to automatically delete a payment when its corresponding booking is deleted. 
CREATE TRIGGER delete_payment_after_booking_delete
AFTER DELETE ON bookings
FOR EACH ROW
BEGIN
    DELETE FROM payments
    WHERE bookingid = OLD.bookingid
END;

-- Question - 207] Create a trigger to prevent insertion of a booking where CheckOutDate < CheckInDate. 

-- Question - 208] Create a trigger to automatically update TotalAmount in Bookings when a payment is inserted in Payments.



