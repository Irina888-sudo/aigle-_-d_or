=====================================================
 SCHEMA : QUELLE TABLE JOINDRE ? (v_employe_liste)
=====================================================

REGLE : on part de log_personnel (l), puis on ajoute un JOIN
        par code a traduire en libelle.

-----------------------------------------------------
1) TABLE DE DEPART
-----------------------------------------------------
  log_personnel (l)   = identite de l'employe
  colonnes utiles : id, nom, prenom, direction (code), service (code)

-----------------------------------------------------
2) LES 5 TABLES A JOINDRE (1 lien = 1 schema)
-----------------------------------------------------

LIEN A : JOIN  paie_info_personnel (p)      [meme id]

  log_personnel (l)                  paie_info_personnel (p)
  +---------------+---------+        +---------------+-----------+
  | id            | nom     |        | id            | matricule |
  +---------------+---------+        +---------------+-----------+
  | PRS_TEMP_0001 | HARISOA | <----> | PRS_TEMP_0001 | 37A       |
  +---------------+---------+        +---------------+-----------+

  JOIN paie_info_personnel p ON p.id = l.id


LIEN B : LEFT JOIN  paie_fonction (f)

  paie_info_personnel (p)            paie_fonction (f)
  +---------------+------------+     +-----------+-----------+
  | id            | idfonction |     | id        | val       |
  +---------------+------------+     +-----------+-----------+
  | PRS_TEMP_0001 | (code)     | --> | (code)    | MANOEUVRE |
  +---------------+------------+     +-----------+-----------+

  LEFT JOIN paie_fonction f ON f.id = p.idfonction
  on lit : f.val


LIEN C : LEFT JOIN  log_direction (d)       <-- PAS la table "direction"

  log_personnel (l)                  log_direction (d)
  +---------------+-----------+      +----------+--------------+
  | id            | direction |      | id       | val          |
  +---------------+-----------+      +----------+--------------+
  | PRS_TEMP_0001 | DIR00001  | ---> | DIR00001 | ANTANANARIVO |
  +---------------+-----------+      +----------+--------------+

  LEFT JOIN log_direction d ON d.id = l.direction
  on lit : d.val


LIEN D : LEFT JOIN  log_service (s)         <-- PAS la table "service"

  log_personnel (l)                  log_service (s)
  +---------------+---------+        +-------+--------------------+
  | id            | service |        | id    | libelle            |
  +---------------+---------+        +-------+--------------------+
  | PRS_TEMP_0001 | SERV1   | -----> | SERV1 | Direction Generale |
  +---------------+---------+        +-------+--------------------+

  LEFT JOIN log_service s ON s.id = l.service
  on lit : s.libelle


LIEN E : LEFT JOIN  type_contrat (t)

  paie_info_personnel (p)            type_contrat (t)
  +---------------+-------------+    +------------+-------+
  | id            | typecontrat |    | id         | val   |
  +---------------+-------------+    +------------+-------+
  | PRS_TEMP_0001 | TYP0000001  | -> | TYP0000001 | CDD   |
  +---------------+-------------+    +------------+-------+

  LEFT JOIN type_contrat t ON t.id = p.typecontrat
  on lit : t.val


-----------------------------------------------------
3) RECAPITULATIF : QUELLE TABLE, QUELLE CLE, QUEL LIBELLE
-----------------------------------------------------

  Je veux afficher  | Table a joindre | Alias | Lien (ON)               | Colonne a lire
  ------------------+-----------------+-------+-------------------------+---------------
  fonction          | paie_fonction   |  f    | f.id = p.idfonction     | f.val
  direction         | log_direction   |  d    | d.id = l.direction      | d.val
  service           | log_service     |  s    | s.id = l.service        | s.libelle
  type de contrat   | type_contrat    |  t    | t.id = p.typecontrat    | t.val


-----------------------------------------------------
4) LES TABLES A NE PAS UTILISER (pieges)
-----------------------------------------------------

  direction  (1 seule ligne : DIR42)   -> ne contient pas DIR00001
  service    (SERV0001, SERV0002...)   -> ne contient pas SERV1

  Les employes utilisent les tables qui commencent par log_ :
  log_direction et log_service.


-----------------------------------------------------
5) CE QU'IL FAUT ECRIRE DANS LA VUE (a toi de le faire)
-----------------------------------------------------

  Dans le SELECT : 2 lignes a ajouter (avec virgule)
     ligne direction   : d.????  AS direction_lib,
     ligne service     : s.????  AS service_lib,

  Dans le FROM : 2 LEFT JOIN a ajouter, AVANT type_contrat
     LEFT JOIN ???? d ON d.???? = l.????
     LEFT JOIN ???? s ON s.???? = l.????

  (remplace les ???? en lisant les liens C et D ci-dessus)


-----------------------------------------------------
6) SCHEMA GLOBAL
-----------------------------------------------------

                  log_personnel (l)   <-- depart
                   |        |      |
        A (id=id)  |        |      |
     +-------------+        |      +------------+
     v                      v C                 v D
 paie_info_personnel (p)   log_direction (d)  log_service (s)
     |            |
     v B          v E
 paie_fonction (f)  type_contrat (t)

=====================================================