# Take-Home Challenge

Ce projet a été réalisé dans le cadre d'un défi technique pour le poste de Data Analyst / BI Engineer chez Astrafy. L'objectif était de démontrer mes compétences en analyse de données et en ingénierie BI en utilisant dbt et BigQuery.

## Contexte

Le défi se compose de plusieurs exercices visant à analyser des données de commandes et de ventes pour les années 2022 et 2023. Les exercices incluent le calcul du nombre de commandes, l'analyse mensuelle des commandes, le calcul du nombre moyen de produits par commande, la segmentation des commandes et la création de tables enrichies avec des informations supplémentaires.

## Technologies Utilisées

- **dbt (Data Build Tool)** : Outil de transformation de données permettant de créer et de gérer des modèles de données dans un entrepôt de données.
- **BigQuery** : Service d'entrepôt de données de Google Cloud utilisé pour le stockage et l'analyse des données.

## Structure du Projet

Le projet est structuré comme suit :

```
take_home_challenge/
├── models/
│   ├── avg_products_per_order.sql
│   ├── order_segmentation.sql
│   ├── orders_2022_2023_with_qty.sql
│   ├── orders_2023.sql
│   ├── orders_2023_with_segmentation.sql
│   └── orders_by_month.sql
├── data/
│   ├── orders_recrutement.csv
│   ├── orders_recrutement.xlsx
│   ├── sales_recrutement.csv
│   └── sales_recrutement.xlsx
├── dbt_project.yml
└── README.md
```

- **models/** : Contient les modèles dbt définis pour chaque exercice.
- **data/** : Contient les fichiers de données sources utilisés pour les transformations.
- **dbt_project.yml** : Fichier de configuration principal pour le projet dbt.
- **README.md** : Ce fichier de documentation.

## Instructions

1. **Installation de dbt** : Assurez-vous que dbt est installé sur votre machine. Vous pouvez l'installer en suivant les instructions officielles : https://docs.getdbt.com/docs/introduction.
2. **Configuration de la connexion BigQuery** : Configurez votre connexion à BigQuery en suivant les instructions de dbt : https://docs.getdbt.com/docs/connecting-to-databases#bigquery.
3. **Exécution des modèles** : Dans le répertoire du projet, exécutez la commande suivante pour exécuter tous les modèles avec un rafraîchissement complet :
   ```bash
   dbt run --full-refresh
   ```
   Cette commande exécutera tous les modèles définis dans le projet et mettra à jour les tables ou vues correspondantes dans BigQuery.

## Résultats

Après l'exécution des modèles, les résultats seront disponibles dans votre projet BigQuery. Vous pouvez interroger les tables ou vues créées pour analyser les données transformées.

## Documentation

Chaque modèle dbt est documenté avec des commentaires expliquant sa logique et son objectif. De plus, des docstrings sont inclus dans le code pour fournir des informations supplémentaires sur les transformations effectuées.

## Remarques

- Assurez-vous que votre compte Google Cloud dispose des autorisations nécessaires pour créer et modifier des tables dans BigQuery.
- Si vous rencontrez des erreurs lors de l'exécution des modèles, vérifiez les messages d'erreur pour identifier et corriger les problèmes potentiels.

Pour toute question ou clarification supplémentaire, n'hésitez pas à me contacter. 
