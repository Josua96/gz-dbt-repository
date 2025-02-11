SELECT 
*
FROM {{ ref('int_sales_margin') }} AS margin
    LEFT JOIN {{ ref('stg_gz_raw_data__raw_gz_ship') }} AS ship
    ON margin.orders_id = ship.orders_id