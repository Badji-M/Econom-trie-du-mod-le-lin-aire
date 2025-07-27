/**********************************************************************
***    Projet : Analyse économétrique sur les déterminants de la croissance
***    Auteur : Pape Mamadou BADJI & Moïse Attisso & Marc Mare AS2 2025
***    Date   : Juillet 2025
***    Module  : Econométrie du Modéle linéaire
**********************************************************************/

clear all


/* ========================================================================
   1. Importation et exploration initiale des données  
   ======================================================================== 
*/

/* Importation de la base de données Excel */
import excel "C:\Users\hp\OneDrive\Bureau\EML PROJECT\Base.xlsx", firstrow clear

/* Vérification des valeurs manquantes */
misstable summarize


/* ========================================================================
   2. Estimation du modèle de régression linéaire simple  
   ======================================================================== 
*/

/* 2.1 Régression multiple avec toutes les variables explicatives */
regress croiss_pop pop_18 tbm tbn esper_vie taux_fec pop_urb preval_contr Nouv

/* Test  : Facteurs d'inflation de la variance (VIF) */
estat vif

/* 2.2 Régression avec les variables explicatives pertinentes retenues */ 
reg croiss_pop tbn esper_vie


/* ========================================================================
   3. Vérification de la normalité des résidus (2 tests)  
   ======================================================================== 
*/

/* Calcul des résidus */
predict resid, residuals

/* Test graphique : Histogramme avec courbe normale */
histogram resid, normal title("Histogramme des résidus")

/* Test 1 : Shapiro-Wilk */
swilk resid

/* Test 2 : Q-Q plot des résidus */
qnorm resid, title("Q-Q Plot des résidus")


/* ========================================================================
   4. Test d'homoscédasticité (variance constante des erreurs)  
   ======================================================================== 
*/

/* Test 1 : Breusch-Pagan */
estat hettest

/* Test 2 : White (robuste aux formes fonctionnelles) */
estat imtest, white


/* ========================================================================
   5. Vérification de la multicolinéarité (2 méthodes)  
   ======================================================================== 
*/

/* Test 1 : Facteurs d'inflation de la variance (VIF) */
estat vif

/* Test 2 : Matrice de corrélation entre les variables explicatives */
correl tbn esper_vie


/* ========================================================================
   6. Test de spécification correcte du modèle (2 tests)  
   ======================================================================== 
*/

/* Test 1 : Test de Ramsey RESET */
// estat ovtest

/* Test 2 : Analyse graphique des résidus vs valeurs ajustées */
rvfplot, title("Graphique des résidus vs valeurs ajustées")


/* ========================================================================
   7. Prédiction et évaluation graphique 
   ======================================================================== 
*/

* Prédire les valeurs ajustées 
predict yhat

* Tracer les valeurs observées vs. les valeurs prédites
twoway (scatter croiss_pop yhat, msymbol(circle)) ///
       (line yhat yhat, sort lcolor(red)), ///
       title("Valeurs observées vs prédites") ///
       xtitle("Prédite (yhat)") ytitle("Observée (croiss_pop)")

* Exporter le graphique en PNG (à insérer dans LaTeX)
graph export "graph_obs_vs_pred.png", replace








