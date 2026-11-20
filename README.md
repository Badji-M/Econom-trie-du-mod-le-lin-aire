# Déterminants de la croissance démographique en Afrique

Analyse économétrique des facteurs qui expliquent la croissance démographique des pays africains, par régression linéaire multiple.

**Auteur :** Pape Mamadou BADJI (ENSAE)
**Date :** juillet 2025
**Cours :** Économétrie du modèle linéaire

---

## Question de recherche

Quels facteurs démographiques et sociaux expliquent les différences de croissance démographique entre les pays africains ?

## Données

Données transversales par pays. Variables étudiées :

| Variable | Description |
|---|---|
| `croiss_pop` | Taux de croissance démographique (variable expliquée) |
| `tbn` | Taux brut de natalité |
| `tbm` | Taux brut de mortalité |
| `esper_vie` | Espérance de vie à la naissance |
| `taux_fec` | Indice synthétique de fécondité |
| `pop_18` | Part de la population de moins de 18 ans |
| `pop_urb` | Taux d'urbanisation |
| `preval_contr` | Prévalence de la contraception |

## Démarche

1. **Analyse exploratoire** : Analyse en Composantes Principales (ACP) pour étudier les corrélations entre variables et repérer la redondance.
2. **Modèle complet** : régression sur l'ensemble des variables explicatives.
3. **Sélection** : diagnostic de multicolinéarité (VIF), puis un modèle réduit aux variables pertinentes (natalité et espérance de vie).
4. **Validation des hypothèses des MCO** :
   - normalité des résidus : histogramme, test de Shapiro-Wilk, Q-Q plot ;
   - homoscédasticité : tests de Breusch-Pagan et de White ;
   - multicolinéarité : VIF et matrice de corrélation ;
   - spécification : test RESET de Ramsey et graphique des résidus contre les valeurs ajustées.
5. **Évaluation** : comparaison des valeurs observées et prédites.

## Contenu du dépôt

| Fichier | Description |
|---|---|
| `PROJET_EML - Déterminants de la croissance démographique en Afrique.do` | Script Stata complet : estimation et tests |
| `PROJET_EML - PARTIE ACP.html` | Analyse en composantes principales |
| `PROJET_EML - Déterminants de la croissance démographique en Afrique.pdf` | Rapport final |

## Reproduire l'analyse

1. Placer la base de données `Base.xlsx` dans le dossier du projet.
2. Modifier le chemin dans la commande `import excel` du fichier `.do`.
3. Exécuter le script dans Stata.

## Compétences mobilisées

Régression linéaire multiple, tests de diagnostic des MCO, analyse en composantes principales, interprétation économique des résultats, rédaction d'un rapport en LaTeX.
