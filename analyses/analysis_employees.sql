{{
    config(materialized='table')
}}
Select * from {{ ref('stg_employees')}}