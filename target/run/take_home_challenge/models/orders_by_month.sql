

  create or replace view `takehomechallenge`.`orders_recrutement`.`orders_by_month`
  OPTIONS()
  as -- Exercice 2 : Calculer le nombre de commandes par mois en 2023.

-- La fonction EXTRACT permet d'extraire le mois à partir de la colonne date_date.
-- La fonction COUNT(*) compte le nombre total de commandes pour chaque mois.

SELECT
    EXTRACT(MONTH FROM date_date) AS month, -- Extraire le mois à partir de la date de chaque commande et renommer la colonne en "month".
    COUNT(*) AS total_orders -- Compter le nombre total de commandes pour chaque mois et renommer la colonne en "total_orders".
FROM
    takehomechallenge.orders_recrutement.orders -- Table contenant les données des commandes.
WHERE
    EXTRACT(YEAR FROM date_date) = 2023 -- Filtrer les commandes pour l'année 2023 uniquement.
GROUP BY
    month -- Grouper les résultats par mois pour obtenir un total distinct de commandes pour chaque mois.
ORDER BY
    month -- Trier les résultats dans l'ordre croissant des mois.;

