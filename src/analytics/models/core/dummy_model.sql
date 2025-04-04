{{ config(materialized='table') }}

SELECT *
FROM (
    SELECT 1 AS id, 'a' AS name
    UNION ALL
    SELECT 2 AS id, 'b' AS name
) AS dummy_data
