SELECT *,
(quantity * purchase_price) AS purchase_cost,
(revenue - purchase_price) AS margin
FROM {{ ref('stg_gz_raw_data__raw_gz_sales') }} AS sales
    LEFT JOIN {{ ref('stg_gz_raw_data__raw_gz_product') }} AS product
        on sales.products_id=product.products_id
