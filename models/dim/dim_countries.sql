{{
    config(materialized='incremental',
    unique_key = 'COUNTRY_ID',
    incremental_strategy = 'delete+insert',
    tags = ['dim'],
    schema = 'dim')
}}
Select
    COUNTRY_ID,
    COUNTRY_NAME,
    REGION_ID,
    current_timestamp as LOAD_TIME
from {{ ref('stg_countries')}}

{% if is_incremental()%}

{{incr()}}

{% endif %}