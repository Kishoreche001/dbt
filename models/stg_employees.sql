{{
    config(materialized='incremental',
    incremental_strategy = 'delete+insert',
    unique_key='EMPLOYEE_ID')
}}
Select 
    {{ dbt_utils.generate_surrogate_key(['EMPLOYEE_ID', 'FIRST_NAME']) }} as surrogate_key,
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    PHONE_NUMBER,
    HIRE_DATE,
    JOB_ID,
    SALARY,
    COMMISSION_PCT,
    MANAGER_ID,
    DEPARTMENT_ID,
    current_timestamp as LOAD_TIME
from {{ source('hr','employees') }} as src

{% if is_incremental() %}

    where src.LOAD_TIME > (select coalesce(max(LOAD_TIME),'1900-01-01 00:00:00') from {{this}})

{% endif %}