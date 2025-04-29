-- Step 1: Combine Data
WITH hotels AS (
    SELECT * FROM Project.dbo.['2018$']
    UNION
    SELECT * FROM Project.dbo.['2019$']
    UNION
    SELECT * FROM Project.dbo.['2020$']
)

  SELECT 
    arrival_date_year,
    hotel,
    SUM((stays_in_week_nights + stays_in_weekend_nights) * adr) AS revenue,
    CONCAT(ROUND((SUM(required_car_parking_spaces) / 
          SUM(stays_in_week_nights + stays_in_weekend_nights)) * 100, 2), '%') AS parking_percentage
FROM hotels
GROUP BY arrival_date_year, hotel;
