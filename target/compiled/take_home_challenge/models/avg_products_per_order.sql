SELECT
    EXTRACT(MONTH FROM date_date) AS month,
    AVG(qty) AS avg_products_per_order
FROM
    takehomechallenge.sales_recrutement.sales
WHERE
    EXTRACT(YEAR FROM date_date) = 2023
GROUP BY
    month
ORDER BY
    month