{{
    config(materialized='table')
}}
Select
    JOB_ID,
    JOB_TITLE,
    MIN_SALARY,
    MAX_SALARY,
    LOAD_TIME
from {{source('hr','jobs')}}