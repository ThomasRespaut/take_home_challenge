-- Exercice 5 : Segmentation des commandes
-- Les commandes de 2023 sont classées en 3 segments :
-- - 'New' : Première commande du client dans les 12 derniers mois.
-- - 'Returning' : Entre la 2ᵉ et la 4ᵉ commande du client dans les 12 derniers mois.
-- - 'VIP' : 5ᵉ commande ou plus du client dans les 12 derniers mois.

WITH order_counts AS (
    SELECT
        o.orders_id, -- Identifiant unique de la commande.
        o.customers_id AS client_id, -- Identifiant du client ayant passé la commande.
        o.date_date AS order_date, -- Date de la commande.
        COUNT(*) OVER (
            PARTITION BY o.customers_id -- Segmenter par client.
            ORDER BY o.date_date -- Trier les commandes par date.
            ROWS BETWEEN 12 PRECEDING AND CURRENT ROW -- Inclure les commandes des 12 derniers mois.
        ) AS orders_in_last_12_months -- Compte le nombre total de commandes passées par le client dans les 12 derniers mois.
    FROM
        takehomechallenge.orders_recrutement.orders o -- Table des commandes.
    WHERE
        EXTRACT(YEAR FROM o.date_date) = 2023 -- Filtrer pour les commandes passées uniquement en 2023.
)
SELECT
    o.orders_id, -- Identifiant de la commande.
    o.client_id, -- Identifiant du client.
    o.order_date, -- Date de la commande.
    CASE
        WHEN o.orders_in_last_12_months = 1 THEN 'New' -- Si c'est la première commande dans les 12 derniers mois.
        WHEN o.orders_in_last_12_months BETWEEN 2 AND 4 THEN 'Returning' -- Si c'est entre la 2ᵉ et la 4ᵉ commande.
        WHEN o.orders_in_last_12_months >= 5 THEN 'VIP' -- Si c'est la 5ᵉ commande ou plus.
        ELSE 'Unknown' -- Par défaut, si aucune des conditions ci-dessus n'est remplie.
    END AS order_segment -- Segment de la commande (New, Returning, VIP, ou Unknown).
FROM
    order_counts o -- Sous-requête contenant le comptage des commandes.
ORDER BY
    o.order_date, -- Trier les résultats par date de commande pour une chronologie claire.
    o.client_id; -- Trier également par identifiant de client pour regrouper les commandes par client.