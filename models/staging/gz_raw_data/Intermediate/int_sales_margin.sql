-- SELECT *,
-- (quantity * purchase_price) AS purchase_cost,
-- (revenue - purchase_price) AS margin
-- FROM {{ ref('stg_gz_raw_data__raw_gz_sales') }} AS sales
--     LEFT JOIN {{ ref('stg_gz_raw_data__raw_gz_product') }} AS product
--         on sales.products_id=product.products_id

SELECT 
    sales.orders_id,
    sales.products_id AS sales_products_id,  -- Avoids column name conflict
    sales.quantity,
    sales.revenue,
    product.products_id AS product_products_id,  -- Alias to avoid duplication
    product.purchase_price,
    COALESCE(sales.quantity, 0) * COALESCE(product.purchase_price, 0) AS purchase_cost,
    COALESCE(sales.revenue, 0) - COALESCE(product.purchase_price, 0) AS margin
FROM {{ ref('stg_gz_raw_data__raw_gz_sales') }} AS sales
LEFT JOIN {{ ref('stg_gz_raw_data__raw_gz_product') }} AS product
    ON sales.products_id = product.products_id
