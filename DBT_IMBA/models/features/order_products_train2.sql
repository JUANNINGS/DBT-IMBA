
with orders as (
    select * from {{ source('stg', 'orders') }}
),

order_products as (

    select * from {{ source('stg', 'order_products__train') }}

)

SELECT a.*, b.product_id,
    b.add_to_cart_order,
    b.reordered 
FROM orders a JOIN order_products b ON a.order_id = b.order_id
WHERE a.eval_set = 'train'