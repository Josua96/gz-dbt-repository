SELECT
    orders_margin.date_date as date_date,
    COUNT(orders_margin.orders_id) as number_transactions,
    ROUND(AVG(orders_margin.revenue),2) as average_basket,
    ROUND(SUM(operational_margin.operational_margin),2) as operational_margin,
    ROUND(SUM(orders_margin.purchase_cost),2) as total_purchase_cost,
    ROUND(SUM(operational_margin.shipping_fee),2) as total_shipping_fees,
    ROUND(SUM(operational_margin.logcost),2) as total_log_cost,
    ROUND(SUM(orders_margin.quantity),2) as total_product_quantity
FROM {{ ref('int_orders_margin') }} as orders_margin
    LEFT JOIN {{ ref('int_orders_operational') }} as operational_margin
        ON orders_margin.orders_id = operational_margin.orders_id
    GROUP BY date_date