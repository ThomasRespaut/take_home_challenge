-- Exercice 3 : Calculer le nombre moyen de produits par commande pour chaque mois de l'année 2023.

SELECT
    EXTRACT(MONTH FROM date_date) AS month, -- Extraire le mois à partir de la date et renommer la colonne en "month".
    AVG(qty) AS avg_products_per_order -- Calculer la moyenne des quantités de produits par commande pour chaque mois.
FROM
    takehomechallenge.sales_recrutement.sales -- Table contenant les lignes de vente par produit.
WHERE
    EXTRACT(YEAR FROM date_date) = 2023 -- Filtrer uniquement les données pour l'année 2023.
GROUP BY
    month -- Grouper les résultats par mois pour calculer une moyenne distincte pour chaque mois.
ORDER BY
    month -- Trier les résultats dans l'ordre croissant des mois.
