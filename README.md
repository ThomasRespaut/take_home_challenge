# Take-Home Challenge

Ce projet a été réalisé dans le cadre d'un défi technique pour le poste de Data Analyst / BI Engineer chez Astrafy. Il vise à démontrer mes compétences en analyse de données et en ingénierie BI en utilisant **dbt** et **BigQuery**.

---

## Résumé des Objectifs

L'objectif principal est d'analyser et de transformer des données de commandes et de ventes pour les années 2022 et 2023. Le projet couvre :

1. Calcul du nombre total de commandes.
2. Analyse mensuelle des commandes.
3. Calcul du nombre moyen de produits par commande.
4. Segmentation des commandes.
5. Création de tables enrichies avec des informations supplémentaires.

---

## Données Sources

Les données sont stockées dans deux fichiers principaux :

- `orders_recrutement.csv` : Contient les lignes de commandes pour 2022 et 2023.
- `sales_recrutement.csv` : Contient les lignes de ventes détaillées par produit pour 2022 et 2023.

Ces fichiers ont été chargés dans BigQuery dans deux datasets distincts :

1. **orders_recrutement.orders** : Table des commandes.
2. **sales_recrutement.sales** : Table des ventes.

---

## Processus d'Exécution

1. **Charger les Données dans BigQuery**
   Importez les fichiers CSV dans BigQuery. Remplacez `<project_id>` par votre ID de projet Google Cloud :

   ```bash
   bq load --source_format=CSV --autodetect <project_id>:orders_recrutement.orders orders_recrutement.csv
   bq load --source_format=CSV --autodetect <project_id>:sales_recrutement.sales sales_recrutement.csv
   ```

2. **Configurer dbt**
   Configurez votre fichier `profiles.yml` pour connecter dbt à votre projet BigQuery. [Guide de configuration]([https://docs.getdbt.com/docs/connecting-to-databases#bigquery](https://docs.getdbt.com/docs/introduction)).

3. **Exécuter les Modèles dbt**
   Dans le répertoire racine du projet, exécutez la commande suivante pour transformer les données et créer les tables/vues nécessaires :

   ```bash
   dbt run --full-refresh
   ```

4. **Explorer les Résultats**
   Les résultats des modèles seront disponibles dans les datasets BigQuery configurés.

---

## Résultats Clés

Voici les modèles créés et leur description :

| Modèle                       | Description                                           |
|------------------------------|-------------------------------------------------------|
| `orders_by_month`            | Nombre de commandes par mois en 2023.                |
| `avg_products_per_order`     | Moyenne de produits par commande chaque mois en 2023. |
| `orders_2023_with_segmentation` | Commandes 2023 avec une segmentation par type.      |
| `orders_2022_2023_with_qty`  | Commandes de 2022 et 2023 avec quantité totale de produits. |
| `orders_2023`                | Filtrage des commandes de l'année 2023.              |
| `order_segmentation`         | Segmentation des commandes de 2023.                  |

Les tables/vues générées peuvent être visualisées directement dans BigQuery dans les datasets suivants :

- `orders_recrutement`
- `sales_recrutement`

---

## Résultats en Détails

### Nombre total de commandes en 2023

**2 573 commandes**

### Nombre de commandes par mois en 2023

| Mois | Nombre de commandes |
|------|---------------------|
| 1    | 232                 |
| 2    | 176                 |
| 3    | 203                 |
| 4    | 188                 |
| 5    | 172                 |
| 6    | 169                 |
| 7    | 193                 |
| 8    | 167                 |
| 9    | 212                 |
| 10   | 223                 |
| 11   | 389                 |
| 12   | 249                 |

### Moyenne des produits par commande chaque mois en 2023

| Mois | Moyenne de produits par commande |
|------|-----------------------------------|
| 1    | 1,59                              |
| 2    | 1,59                              |
| 3    | 1,66                              |
| 4    | 1,75                              |
| 5    | 1,71                              |
| 6    | 1,78                              |
| 7    | 1,80                              |
| 8    | 1,73                              |
| 9    | 1,73                              |
| 10   | 1,73                              |
| 11   | 1,64                              |
| 12   | 1,77                              |

### Table des commandes 2022-2023 avec quantité de produits

Une table regroupant chaque commande de 2022 et 2023 avec la quantité totale de produits par commande a été créée sous le nom `orders_2022_2023_with_qty`.

### Segmentation des commandes en 2023

Les commandes de 2023 ont été segmentées en trois catégories :

- **New** : Première commande dans les 12 derniers mois.
- **Returning** : 2ᵉ à 4ᵉ commande dans les 12 derniers mois.
- **VIP** : 5ᵉ commande ou plus dans les 12 derniers mois.

### Commandes 2023 avec Segmentation

Une table enrichie (`orders_2023_with_segmentation`) contient toutes les commandes de 2023 avec leur segment associé.

---

## Documentation des Modèles SQL

### Segmentation des Commandes

- Utilisation d'une fonction analytique `COUNT(*) OVER()` pour compter les commandes précédentes dans une fenêtre glissante de 12 mois.
- Une condition CASE est appliquée pour classer chaque commande en `New`, `Returning` ou `VIP`.

### Moyenne des Produits par Commande

- Calcul basé sur un regroupement par mois (`GROUP BY`) et une agrégation (`AVG`) sur les données de `sales_recrutement.sales`.

---

## Conformité avec les Exigences

- Utilisation de **dbt** pour organiser et transformer les données.
- Stockage et interrogation des données dans **BigQuery**.
- Documentation complète fournie dans ce README.
- Résultats disponibles sous forme de modèles SQL dans BigQuery.

---

## Contact

Pour toute question ou suggestion, contactez-moi à : [thomas.respaut@gmail.com](mailto:thomas.respaut@gmail.com).
