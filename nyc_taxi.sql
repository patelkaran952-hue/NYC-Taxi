-- Project NYC Taxi

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE "D:/Project NYC Taxi/cleaned_nyc_taxi.csv"
INTO TABLE cleaned_nyc_taxi
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

rename table cleaned_nyc_taxi to nyc_taxi;

select * from nyc_taxi limit 10;

-- Standardising columns

update nyc_taxi
set trip_duration = ROUND(trip_duration);

update nyc_taxi
set total_amount = ROUND(total_amount, 2);


-- Total trips in each hour of the day

CREATE VIEW one as
SELECT pickup_hour, COUNT(*) AS total_trips
FROM nyc_taxi
GROUP BY pickup_hour
ORDER BY total_trips DESC;


-- Total revenue in each hour of the day

CREATE VIEW two as
SELECT pickup_hour, SUM(total_amount) AS revenue
FROM nyc_taxi
GROUP BY pickup_hour
ORDER BY revenue DESC;


-- Total trips in each day of the week

-- CREATE VIEW three as
SELECT pickup_day, COUNT(*) AS total_trips
FROM nyc_taxi
GROUP BY pickup_day
ORDER BY total_trips DESC;


-- Total revenue in each day of the week

CREATE VIEW four as
SELECT pickup_day, SUM(total_amount) AS revenue
FROM nyc_taxi
GROUP BY pickup_day
ORDER BY revenue DESC;


-- Top pickup locations

-- CREATE VIEW five as
select Zone_x, count(*) as trips
from nyc_taxi
group by Zone_x
order by trips desc limit 10;


-- Top pickup boroughs

CREATE VIEW six as
select Borough_x, count(*) as trips
from nyc_taxi
group by Borough_x
order by trips desc limit 10;


-- Top drofoff locations

CREATE VIEW seven as
select Zone_y, count(*) as trips
from nyc_taxi
group by Zone_y
order by trips desc limit 10;


-- Distance vs Fare

-- CREATE VIEW eight as
SELECT ROUND(trip_distance, 0) AS distance_bucket,
AVG(fare_amount) AS avg_fare
FROM nyc_taxi
GROUP BY distance_bucket
ORDER BY distance_bucket;


-- Tip Ananlysis

CREATE VIEW nine as
SELECT ROUND(trip_distance,0) AS distance,
AVG(tip_amount) AS avg_tip
FROM nyc_taxi
GROUP BY distance
ORDER BY distance;


-- Pickup Borough wise revenue

CREATE VIEW ten as
SELECT Borough_x, SUM(total_amount) AS revenue, COUNT(Borough_x) AS trips
FROM nyc_taxi
GROUP BY Borough_x
ORDER BY revenue DESC;


-- Pickup Zone wise revenue

-- CREATE VIEW eleven as
SELECT Zone_x, SUM(total_amount) AS revenue,  COUNT(Zone_x) AS trips
FROM nyc_taxi
GROUP BY Zone_x
ORDER BY revenue DESC LIMIT 10;


-- Pickup Service zone wise revenue

CREATE VIEW twelwe as
SELECT service_zone_x, SUM(total_amount) AS revenue,  COUNT(service_zone_x) AS trips
FROM nyc_taxi
GROUP BY service_zone_x
ORDER BY revenue DESC LIMIT 10;


-- Vendor wise revenue

CREATE VIEW therteen as
SELECT vendorid, SUM(total_amount) AS revenue,  COUNT(vendorid) AS trips
FROM nyc_taxi
GROUP BY vendorid
ORDER BY revenue DESC LIMIT 10;


-- Price surge by hour

CREATE VIEW fourteen as
SELECT pickup_hour,
AVG(fare_amount / trip_distance) AS price_per_km, count(pickup_hour) AS Trips
FROM nyc_taxi
GROUP BY pickup_hour
ORDER BY price_per_km DESC;


-- Average trip duration in each hour

-- CREATE VIEW fifteen as
SELECT pickup_hour,
AVG(trip_duration) AS avg_duration, count(pickup_hour) AS Trips
FROM nyc_taxi
GROUP BY pickup_hour;


-- Pickup Borough wise average toll amount

CREATE VIEW sixteen as
SELECT Borough_x,
AVG(trip_duration) AS avg_duration, AVG(tolls_amount)
FROM nyc_taxi
WHERE tolls_amount > 0
GROUP BY Borough_x;


-- Pickup zone wise average airport fee

CREATE VIEW seventeen as
SELECT Zone_x, AVG(airport_fee) AS avg_airport_fee
FROM nyc_taxi
GROUP BY Zone_x
HAVING COUNT(Zone_x) > 50000
ORDER BY avg_airport_fee DESC;


-- Pickup zone wise average tip

CREATE VIEW eighteen as
select Zone_x, avg(tip_amount) as avg_tip, count(Zone_x) as trips
from nyc_taxi
group by Zone_x
having trips > 50000
order by avg_tip desc limit 10;


-- Dropoff zone wise average tip

CREATE VIEW nineteen as
select Zone_y, avg(tip_amount) as avg_tip, count(Zone_x) as trips
from nyc_taxi
group by Zone_y
having trips > 50000
order by avg_tip desc limit 10;


-- Pickup hour wise average tip amount

CREATE VIEW twenty as
select pickup_hour, count(*) as rides, avg(tip_amount) as avg_tip
from nyc_taxi
group by pickup_hour
order by avg_tip desc;



select Zone_x, count(*) as rides
from nyc_taxi
where store_and_fwd_flag = 'Y'
group by Zone_x;

select pickup_hour, count(*) as rides
from nyc_taxi
where store_and_fwd_flag = 'Y'
group by pickup_hour;






