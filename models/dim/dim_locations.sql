{{
    config(materialized='incremental',
    unique_key = 'LOCATION_ID',
    incremental_strategy = 'delete+insert',
    tags = ['dim'],
    schema = 'dim')
}}

Select
    LOCATION_ID,
    STREET_ADDRESS,
    POSTAL_CODE,
    CITY,
    STATE_PROVINCE,
    COUNTRY_ID,
    current_timestamp as LOAD_TIME
from {{ref('stg_locations')}}

{% if is_incremental()%}

{{incr()}}

{% endif %}