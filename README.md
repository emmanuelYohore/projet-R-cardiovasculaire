# Régression Logistique sous R - Prédiction de Maladie Cardiovasculaire

## Description
Ce projet présente une analyse statistique complète sous **R**, combinant **statistique descriptive, tests d'hypothèses** et **régression logistique binaire**, pour prédire la présence d'une **maladie cardiovasculaire** à partir de données cliniques issues du célèbre jeu de données **Heart Disease (UCI / Cleveland)**.
Le script couvre l'ensemble d'une démarche statistique rigoureuse : nettoyage des données, analyse univariée et bivariée, choix des tests statistiques adaptés, modélisation, optimisation et validation du modèle.

---

## Objectifs
* Nettoyer et recoder le jeu de données `processed.cleveland.data` (valeurs manquantes, encodage des facteurs, étiquetage des modalités).
* Réaliser une analyse descriptive univariée (tableaux de fréquence, moyennes, écarts-types) et des visualisations (histogrammes, boîtes à moustaches, diagrammes en barres).
* Étudier les associations entre variables explicatives et la variable cible (maladie cardiovasculaire) via des **tests du Khi²**.
* Tester la normalité des variables quantitatives (**test de Shapiro-Wilk**) et comparer les groupes avec les tests adaptés (**Mann-Whitney**, **test de Student**).
* Construire un modèle de **régression logistique binaire** (`glm`) et l'optimiser par sélection pas à pas (minimisation de l'AIC).
* Évaluer le modèle : matrice de confusion, **test de Hosmer-Lemeshow**, **courbe ROC** et AUC.

---

## Technologies utilisées
* R
* dplyr
* caTools
* caret
* performance
* pROC

---

## Structure du projet
```
.
├── projetR.R
└── README.md
```
*(les données sont chargées directement depuis le dépôt UCI Machine Learning Repository)*

---

## Résultats
* Après nettoyage (suppression des valeurs manquantes sur `ca` et `thal`) et recodage de la cible en variable binaire (maladie présente / absente), les tests du **Khi²** mettent en évidence des associations significatives entre la maladie cardiovasculaire et plusieurs variables cliniques (type de douleur thoracique, angine d'effort, pente du segment ST, nombre de vaisseaux colorés, thalassémie).
* Les tests de **Shapiro-Wilk** révèlent que certaines variables quantitatives (âge, tension artérielle, dépression du segment ST) ne suivent pas une distribution normale, justifiant l'usage du **test de Mann-Whitney** pour ces variables, tandis que le **test de Student** est utilisé pour le cholestérol et la fréquence cardiaque maximale.
* Le modèle de régression logistique, optimisé par sélection descendante (réduction de l'AIC de 202,23 à **177,71**), ne conserve que les variables les plus pertinentes (dont le type de douleur thoracique).
* Le modèle final est validé par un **test de Hosmer-Lemeshow** (bon ajustement) et affiche une **aire sous la courbe ROC (AUC) de 0,928**, traduisant une très bonne capacité de discrimination entre patients malades et non malades.

---

## Lancement
1. Cloner le dépôt ou télécharger le script R.
2. Installer les packages nécessaires :
```r
install.packages(c("dplyr", "caTools", "caret", "performance", "pROC"))
```
3. Ouvrir `analyse_cardiovasculaire.R` dans RStudio.
4. Exécuter le script dans l'ordre (les données sont téléchargées automatiquement depuis l'UCI Repository).

---

## Compétences développées
* Statistique descriptive (tableaux de fréquence, mesures de tendance centrale et de dispersion)
* Visualisation de données sous R (barplots, histogrammes, boîtes à moustaches, courbe ROC)
* Tests d'hypothèses : Khi², Shapiro-Wilk, Mann-Whitney, Student
* Régression logistique binaire et sélection de modèle par AIC
* Évaluation de modèles : matrice de confusion, test de Hosmer-Lemeshow, courbe ROC/AUC
* Programmation statistique avec R

---

## Auteur
Emmanuel YOHORE
