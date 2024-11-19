WITH order_counts AS (
    SELECT
        o.orders_id,
        o.customers_id AS client_id,
        o.date_date AS order_date,
        o.CA_ht,  -- Assurez-vous de sélectionner CA_ht dans la sous-requête
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
    o.CA_ht,
    CASE
        WHEN o.orders_in_last_12_months = 1 THEN 'New'
        WHEN o.orders_in_last_12_months BETWEEN 2 AND 4 THEN 'Returning'
        WHEN o.orders_in_last_12_months >= 5 THEN 'VIP'
        ELSE 'Unknown'
    END AS order_segmentation
FROM
    order_counts o
