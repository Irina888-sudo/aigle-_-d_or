TypeObjet est la classe mère (Unite extends TypeObjet, étape 1). mapping doit nommer la classe qui représente la table POSTE

[1] NAVIGATEUR demande la page
        ↓
[2] socobis-war/web/pages/vente/vente-liste.jsp         ← la page affichée
        ↓ (ligne ~42 : new VenteLib())
[3] socobis-ejb/src/java/vente/Vente.java                ← classe métier
        ↓ (setNomTable("VENTE_CPL"))
[4] Vue SQL "VENTE_CPL"                                  ← vue dans la base Oracle
        ↓
[5] PageRecherche (dans socobis-ejb/src/java/affichage/) ← moteur d'affichage
        ↓
[6] pr.getTableau().getHtml()                            ← le HTML sort