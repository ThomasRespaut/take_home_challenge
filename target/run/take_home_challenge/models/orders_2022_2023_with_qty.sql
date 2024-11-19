

  create or replace view `takehomechallenge`.`orders_recrutement`.`orders_2022_2023_with_qty`
  OPTIONS()
  as -- Exercice 4 : Créer une table avec une ligne par commande pour les années 2022 et 2023,
-- en ajoutant une colonne `qty_product` qui donne la quantité totale de produits par commande.

SELECT
    o.date_date AS order_date, -- Renommer la colonne `date_date` en `order_date` pour plus de clarté.
    o.customers_id, -- Inclure l'identifiant du client associé à la commande.
    o.orders_id, -- Inclure l'identifiant unique de la commande.
    o.CA_ht, -- Inclure le chiffre d'affaires hors taxes associé à la commande.
    SUM(s.qty) AS qty_product -- Calculer la quantité totale de produits pour chaque commande.
FROM
    takehomechallenge.orders_recrutement.orders o -- Table contenant les informations sur les commandes.
JOIN
    takehomechallenge.sales_recrutement.sales s -- Table contenant les détails des ventes par produit.
ON
    o.customers_id = s.client_id -- Faire correspondre les clients entre les tables `orders` et `sales`.
    AND o.orders_id = s.transaction_id -- Associer chaque commande à ses produits via `orders_id` et `transaction_id`.
WHERE
    EXTRACT(YEAR FROM o.date_date) IN (2022, 2023) -- Filtrer les commandes des années 2022 et 2023 uniquement.
GROUP BY
    o.date_date, -- Grouper par la date de commande.
    o.customers_id, -- Grouper par l'identifiant du client.
    o.orders_id, -- Grouper par l'identifiant de la commande.
    o.CA_ht -- Grouper par le chiffre d'affaires hors taxes.
ORDER BY
    o.date_date, -- Trier les résultats par date de commande pour un affichage chronologique.
    o.orders_id; -- Trier également par l'identifiant de la commande pour un ordre cohérent.;

