

  create or replace view `takehomechallenge`.`orders_recrutement`.`orders_2022_2023_with_qty`
  OPTIONS()
  as SELECT
    o.date_date AS order_date,
    o.customers_id,
    o.orders_id,
    o.CA_ht,
    SUM(s.qty) AS qty_product  -- Calcul de la quantité totale de produits par commande
FROM
    takehomechallenge.orders_recrutement.orders o
JOIN
    takehomechallenge.sales_recrutement.sales s
ON
    o.customers_id = s.client_id
    AND o.orders_id = s.transaction_id  -- Lier chaque commande à ses produits
WHERE
    EXTRACT(YEAR FROM o.date_date) IN (2022, 2023)  -- Filtrer pour 2022 et 2023
GROUP BY
    o.date_date, o.customers_id, o.orders_id, o.CA_ht
ORDER BY
    o.date_date, o.orders_id;

