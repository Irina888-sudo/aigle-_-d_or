# Récapitulatif des pages d'aigledor

> ⚠️ Écrit à partir des captures de menus et des noms de fichiers.
> Le code n'a pas encore été lu. À vérifier dans ton navigateur.

**Fil rouge de tous les exemples :** une boutique de chaussures (KENDI, DERAINA, DIARISOA...).

---

## 0. Les bases

### Modèle commun de presque tous les écrans

| Fichier | Rôle | Analogie |
|---|---|---|
| `xxx-liste.jsp` | Tableau des éléments | Le registre |
| `xxx-saisie.jsp` | Formulaire pour créer | La fiche à remplir |
| `apresXxx.jsp` | Traite le formulaire, enregistre en base | Le guichet qui tamponne |
| `xxx-fiche.jsp` | Détail d'un élément | Le récépissé |
| `xxx-modif.jsp` | Formulaire pour modifier | Corriger la fiche |

```
liste --clic "Saisie"--> saisie --"Valider"--> apresXxx --> fiche
                                                             |
                                                   "Modifier" --> modif
```

### L'URL

`module.jsp?but=vente/vente-saisie-directe-apj.jsp`

- `module.jsp` = le cadre (menu, en-tête).
- `but=` = la page affichée dans le cadre (`pages/vente/...`).

### Le cycle global

```
Fournisseur --Achat--> STOCK --Vente--> Client --paie--> TRÉSORERIE
```

---

## 1. PRODUIT

| Page | Rôle | Exemple |
|---|---|---|
| Liste des produits | Catalogue : ID, désignation, référence, code barre, modèle, pointure, couleur | Tu cherches « KENDI » : tu vois les pointures 30, 31... |
| Saisie d'un produit | Créer un produit | Nouvelle chaussure « DERAINA », pointure 25, code barre 1205124341625 |
| Fiche produit | Détail d'un produit (clic sur l'ID) | Clic sur `INGAGR259` |

---

## 2. VENTE (on vend au client)

| Page | Rôle | Exemple |
|---|---|---|
| **Enregistrement direct** | Caisse du comptoir : panier, paiement, ticket, tout en un écran | Un client entre, prend 1 paire, paie 50 000 Ar en espèces. Fini. |
| **Proforma** | Devis. Ne change ni stock ni argent | « 50 paires = 2 000 000 Ar, valable 15 jours » |
| **Commande** | La demande du client, version simple | Le client dit « je veux 50 paires » |
| **Bon de commande** | Commande officielle, suit le cycle complet (livraison, facture, carton) | Le client accepte le devis : il devient bon de commande |
| **Bon de livraison** | On sort la marchandise. **Le stock baisse** | On livre 50 paires : stock −50 |
| **Factures** | 1 ligne par facture | Facture n°12, client X, 2 000 000 Ar |
| **Factures détaillées** | 1 ligne par produit vendu | Facture n°12 : ligne KENDI × 30, ligne DERAINA × 20 |
| **Éditer ristourne** | Créer des ristournes (formulaire) | Client X a acheté 200 000 Ar : ristourne de 5 % |
| **Liste ristourne** | Voir toutes les ristournes | Tableau des ristournes du mois |
| **Avoir** | Crédit qui corrige une facture sans la supprimer | Le client rend 1 paire cassée : avoir de 100 000 Ar |
| **Analyse** | Chiffres et graphiques de vente | CA par mois, par client, par article |
| **Paiement avance** | Le client paie avant de recevoir | Acompte de 500 000 Ar sur une grosse commande |
| **Remise programmée** | Réduction préparée à l'avance, **pendant** la vente | −10 % sur les sandales pendant les soldes |
| **Tarif par client** | Prix selon la catégorie de client | Particulier 100 000 Ar, grossiste 85 000 Ar |

### Flux de vente

```
Proforma --accepté--> Bon de commande --> Bon de livraison --> Facture --> Paiement
                                          (stock −)                         (caisse +)

Raccourci : Enregistrement direct (tout d'un coup)
```

### Différences à ne pas confondre

| Paire | Différence | Exemple |
|---|---|---|
| Commande / Bon de commande | La demande / le document officiel complet | « Je prends une pizza » / le ticket de commande |
| Facture / Facture détaillée | Total / produit par produit | Total du ticket / chaque article |
| Remise / Ristourne | **Pendant** la vente / **après** la vente | Soldes affichées / cashback reçu plus tard |
| Ristourne / Avoir | Récompenser / corriger | « Merci d'avoir acheté beaucoup » / « Pardon, la paire était cassée » |

> Pourquoi un avoir et non la suppression de la facture ? Une facture est un
> document officiel (comptabilité, impôts). On ne l'efface pas, on la corrige
> avec un nouveau document.

---

## 3. ACHAT (on achète au fournisseur)

| Page | Rôle | Exemple |
|---|---|---|
| **Demande d'achat** | Besoin interne | Le magasinier : « il manque des KENDI pointure 30 » |
| **Demande de prix** | On demande un prix à plusieurs fournisseurs | Mail à 3 fournisseurs : « combien pour 100 paires ? » |
| **Proforma** | Le devis **reçu** du fournisseur | Fournisseur A : 80 000 Ar/paire. Fournisseur B : 75 000 Ar/paire |
| **Bon de commande** | Commande officielle au fournisseur | On commande 100 paires chez B |
| **Bon de réception** | On reçoit la marchandise. **Le stock monte** | 100 paires arrivent : stock +100 |
| **Facture** | Ce qu'on doit payer au fournisseur | 7 500 000 Ar à payer |
| **Dépenses diverses** | Dépenses hors marchandise | Facture d'électricité, transport |
| **Tableau de bord / Analyse** | Chiffres d'achat | Dépenses par fournisseur |

### Flux d'achat

```
Demande d'achat -> Demande de prix -> Proforma -> Bon de commande
   -> Bon de réception (stock +) -> Facture -> Paiement (caisse −)
```

> Le mot **Proforma** change de sens : en Vente c'est **toi** qui fais le devis,
> en Achat c'est **le fournisseur**.

---

## 4. STOCK

| Page | Rôle | Exemple |
|---|---|---|
| **État de stock** | Combien il reste de chaque produit, par magasin | KENDI pointure 30 : 12 paires au magasin A |
| **Mouvement de stock** | Journal des entrées et sorties | +100 (réception), −50 (livraison) |
| **Inventaire** | Compter le stock réel et corriger les écarts | Le système dit 12, tu comptes 10 : écart de −2 |
| **Demande de transfert** | Demander à déplacer du stock | Magasin B demande 5 paires au magasin A |
| **Transfert** | Le déplacement effectif | A envoie 5 paires, B les reçoit |

---

## 5. TRÉSORERIE (l'argent)

| Page | Rôle | Exemple |
|---|---|---|
| **État de trésorerie** | Solde de chaque caisse | Caisse principale : 1 200 000 Ar |
| **Mouvement de trésorerie** | Chaque entrée ou sortie d'argent | +50 000 (vente comptoir), −7 500 000 (paiement fournisseur) |
| **Virement intra trésorerie** | Argent d'une caisse vers une autre | 200 000 Ar de la caisse magasin vers la caisse principale |
| **Report de trésorerie** | Solde de départ d'une période | Début de mois : on repart avec 1 000 000 Ar |
| **Clôture de trésorerie** | Fermer la caisse en fin de journée | Le soir, on compte, on compare, on ferme |

---

## 6. HISTORIQUE

| Page | Rôle | Exemple |
|---|---|---|
| **Liste des historiques** | Journal des actions des utilisateurs, filtrable par dates | « Jean a modifié le produit X le 10/11/2026 » |

---

## 7. CONFIGURATION

| Page | Rôle | Exemple |
|---|---|---|
| Caisse | Définir les caisses | Créer « Caisse magasin B » |
| Point | Définir les points de vente / magasins | Créer le point « Analakely » |
| Tiers | Clients et fournisseurs | Ajouter un nouveau client |
| Avoir | Catégories et motifs d'avoir | Motif « produit défectueux » |
| Modèle | Modèles de produits | Modèle « KENDI » |
| Synchronisation | Échanger des données entre serveurs | Envoyer les ventes du magasin vers le serveur central |
| Site | Réglages du site | Informations de la société |

---

## 8. Histoire complète en 1 exemple

1. **Achat** : on commande 100 paires KENDI chez un fournisseur (bon de commande).
2. **Réception** : elles arrivent, stock +100.
3. **Facture fournisseur** payée : trésorerie −7 500 000 Ar.
4. **Vente** : un client demande un proforma, accepte, bon de commande.
5. **Livraison** : stock −50.
6. **Facture client** : 2 000 000 Ar.
7. **Paiement** : trésorerie +2 000 000 Ar.
8. Le client rend 1 paire cassée : **avoir** de 100 000 Ar.
9. Fin de journée : **clôture de trésorerie**.

---

## À retenir

- Presque tout écran = liste → saisie → apres → fiche.
- Achat : stock **monte**. Vente : stock **baisse**. Les deux finissent en trésorerie.
- Proforma = devis. Il ne change ni le stock ni l'argent.
- L'URL te donne le nom du fichier JSP à ouvrir.
