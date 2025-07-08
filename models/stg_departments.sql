{{
    config(materialized='table')
}}

Select * from {{ source('hr','departments') }}