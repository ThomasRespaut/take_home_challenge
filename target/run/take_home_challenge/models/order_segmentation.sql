

  create or replace view `takehomechallenge`.`orders_recrutement`.`order_segmentation`
  OPTIONS()
  as WITH order_counts AS (
    SELECT
        o.orders_id,
        o.customers_id AS client_id,
        o.date_date AS order_date,
        COUNT(*) OVER (
            PARTITION BY o.customers_id
            ORDER BY o.date_date
            ROWS BETWEEN 12 PRECEDING AND CURRENT ROW
        ) AS orders_in_last_12_months
    FROM
        takehomechallenge.orders_recrutement.orders o
    WHERE
        EXTRACT(YEAR FROM o.date_date) = 2023
)
SELECT
    o.orders_id,
    o.client_id,
    o.order_date,
    CASE
        WHEN o.orders_in_last_12_months = 1 THEN 'New'
        WHEN o.orders_in_last_12_months BETWEEN 2 AND 4 THEN 'Returning'
        WHEN o.orders_in_last_12_months >= 5 THEN 'VIP'
        ELSE 'Unknown'
    END AS order_segment
FROM
    order_counts o
ORDER BY
    o.order_date, o.client_id;

