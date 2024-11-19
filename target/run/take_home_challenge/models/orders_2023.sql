

  create or replace view `takehomechallenge`.`orders_recrutement`.`orders_2023`
  OPTIONS()
  as SELECT
    COUNT(*) AS total_orders_2023
FROM
    takehomechallenge.orders_recrutement.orders
WHERE
    EXTRACT(YEAR FROM date_date) = 2023;

