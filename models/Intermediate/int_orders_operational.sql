SELECT 
    order_margin.orders_id, 
    order_margin.date_date,
    (order_margin.margin + COALESCE(shipping.shipping_fee, 0) 
        - COALESCE(shipping.logcost, 0) 
        - COALESCE(shipping.ship_cost, 0)) AS operational_margin,
    shipping.shipping_fee as shipping_fee,
    shipping.logcost as logcost,
FROM {{ ref('int_orders_margin') }} AS order_margin
LEFT JOIN {{ ref('stg_gz_raw_data__raw_gz_ship') }} AS shipping
    ON order_margin.orders_id = shipping.orders_id