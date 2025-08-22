WITH daily_weather AS (

SELECT
DATE(TIME) as daily_weather,
weather,
temp,
pressure,
humidity,
clouds

FROM
{{ source('demo', 'weather') }}
limit 100
),

daily_weather_agg as (
SELECT
daily_weather,
weather,
ROUND(AVG(temp),2) AS AVG_TEMP,
ROUND(AVG(pressure),2) AS AVG_PRESSURE,
ROUND(AVG(humidity),2) AS AVG_HUMIDITY,
ROUND(AVG(clouds),2) AS AVG_CLOUDS

FROM daily_weather

GROUP BY daily_weather, weather

QUALIFY ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) DESC) = 1

)

SELECT * from daily_weather_agg