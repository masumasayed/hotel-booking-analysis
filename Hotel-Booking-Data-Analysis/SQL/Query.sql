-- Step 1: Combine Data
WITH hotels AS (
    SELECT * FROM Project.dbo.['2018$']
    UNION
    SELECT * FROM Project.dbo.['2019$']
    UNION
    SELECT * FROM Project.dbo.['2020$']
)

-- Calculate Revenue and Parking Analysis
SELECT *
FROM hotels
LEFT JOIN dbo.market_segment$ 
  ON hotels.market_segment = market_segment$.market_segment
LEFT JOIN dbo.meal_cost$
  ON hotels.meal = meal_cost$.meal;

-- Prepare Dataset for Power BI Integration
WITH hotels AS (
    SELECT * FROM Project.dbo.['2020$']
    UNION ALL
    SELECT * FROM Project.dbo.['2020$']
    UNION ALL
    SELECT * FROM Project.dbo.['2020$']
)
SELECT *
FROM hotels
LEFT JOIN dbo.market_segment$ 
  ON hotels.market_segment = market_segment$.market_segment
LEFT JOIN dbo.meal_cost$
  ON hotels.meal = meal_cost$.meal;
