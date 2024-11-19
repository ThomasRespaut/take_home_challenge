

  create or replace view `takehomechallenge`.`orders_recrutement`.`orders_by_month`
  OPTIONS()
  as SELECT
    EXTRACT(MONTH FROM date_date) AS month,
    COUNT(*) AS total_orders
FROM
    takehomechallenge.orders_recrutement.orders
WHERE
    EXTRACT(YEAR FROM date_date) = 2023
GROUP BY
    month
ORDER BY
    month;

