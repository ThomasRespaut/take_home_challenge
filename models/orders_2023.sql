-- Exercice 1 : Calculer le nombre total de commandes passées en 2023.

-- Utilisation de la fonction COUNT(*) pour compter toutes les lignes dans la table "orders".
-- Chaque ligne représente une commande unique.

SELECT
    COUNT(*) AS total_orders_2023 -- Renommer le résultat sous le nom "total_orders_2023" pour indiquer le nombre total de commandes.
FROM
    takehomechallenge.orders_recrutement.orders -- Table contenant les données des commandes.
WHERE
    EXTRACT(YEAR FROM date_date) = 2023 -- Filtrer uniquement les commandes dont la date se situe en 2023.
