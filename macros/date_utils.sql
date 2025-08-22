{% macro get_season(x) %}
CASE
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (12,1,2) THEN 'Winter'
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (3,4,5)  THEN 'Spring'
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (6,7,8)  THEN 'Summer'
    ELSE 'Autumn' 
    END
{% endmacro %}

{% macro day_type(x) %}
CASE
    WHEN DAYNAME(TO_TIMESTAMP({{x}})) IN ('Sat','Sun')
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
    END
{% endmacro %}