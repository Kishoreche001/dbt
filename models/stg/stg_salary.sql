{{
    config(materialized='table',
    database = 'dev')
}}
select
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    JOB_TITLE,
    DEPARTMENT_NAME,
    CITY,
    COUNTRY_NAME,
    REGION_NAME,
    SALARY_DATE,
    HRA,
    ALLOWANCES,
    PF,
    LOAD_TIME
from {{source('hr','salary')}}