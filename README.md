### Partie 1 : README

---

# Take-Home Challenge

Ce projet a été réalisé dans le cadre d'un défi technique pour le poste de Data Analyst / BI Engineer chez Astrafy. L'objectif était de démontrer mes compétences en analyse de données et en ingénierie BI en utilisant **dbt** et **BigQuery**.

## Contexte

Le défi se compose de plusieurs exercices visant à analyser des données de commandes et de ventes pour les années 2022 et 2023. Les exercices incluent :
1. Le calcul du nombre total de commandes.
2. L'analyse mensuelle des commandes.
3. Le calcul du nombre moyen de produits par commande.
4. La segmentation des commandes.
5. La création de tables enrichies avec des informations supplémentaires.

## Technologies Utilisées

- **dbt (Data Build Tool)** : Outil de transformation de données permettant de créer et de gérer des modèles SQL.
- **BigQuery** : Entrepôt de données de Google Cloud pour stocker et analyser les données.

## Structure du Projet

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

1. **Installation de dbt** :
   Suivez les [instructions officielles](https://docs.getdbt.com/docs/introduction).
   
2. **Configuration de la connexion BigQuery** :
   Configurez votre profil dbt en suivant ce [guide](https://docs.getdbt.com/docs/connecting-to-databases#bigquery).

3. **Exécution des modèles** :
   Dans le répertoire du projet, exécutez :
   ```bash
   dbt run --full-refresh
   ```
   Cela générera les tables ou vues dans BigQuery.

---

### Partie 2 : Résultats

---

## Résultats

1. **Nombre total de commandes en 2023** :  
   - **2 573 commandes**

2. **Nombre de commandes par mois en 2023** :

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

3. **Nombre moyen de produits par commande chaque mois en 2023** :

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

4. **Table des commandes 2022-2023 avec quantité de produits** :  
   Une table regroupant chaque commande de 2022 et 2023 avec la quantité totale de produits.

5. **Segmentation des commandes en 2023** :  
   Les commandes sont classées en :
   - **New** : 1ère commande dans les 12 derniers mois.
   - **Returning** : 2ᵉ à 4ᵉ commande dans les 12 derniers mois.
   - **VIP** : 5ᵉ commande ou plus dans les 12 derniers mois.

6. **Table enrichie des commandes 2023 avec segmentation** :  
   Une table a été créée pour 2023 avec une colonne indiquant le segment de chaque commande.

## Documentation

Pour plus de détails sur la mise en œuvre et la logique des modèles, veuillez consulter les fichiers SQL correspondants dans le répertoire `models`. Des commentaires détaillés sont inclus pour expliquer chaque étape du processus.
