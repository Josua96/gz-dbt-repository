SELECT 
    sales.orders_id,
    MAX(sales.date_date) AS date_date,  -- Assuming you need one date per order (e.g., latest)
    SUM(sales.revenue) AS sum_revenue,
    SUM(sales.quantity) AS sum_quantity,
    SUM(COALESCE(sales.quantity, 0) * COALESCE(product.purchase_price, 0)) AS sum_purchase_cost,
    SUM(COALESCE(sales.revenue, 0) - COALESCE(product.purchase_price, 0)) AS sum_margin
FROM {{ ref('stg_gz_raw_data__raw_gz_sales') }} AS sales
LEFT JOIN {{ ref('stg_gz_raw_data__raw_gz_product') }} AS product
    ON sales.products_id = product.products_id
GROUP BY sales.orders_id
