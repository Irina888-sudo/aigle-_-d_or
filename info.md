aigledor=# SELECT table_name FROM information_schema.tables
aigledor-# WHERE table_schema = 'public'
aigledor-# AND (table_name ILIKE '%personnel%' OR table_name ILIKE '%fonction%'
aigledor(#   OR table_name ILIKE '%contrat%' OR table_name ILIKE '%avancement%'
aigledor(#   OR table_name ILIKE '%poste%' OR table_name ILIKE '%service%')
aigledor-# ORDER BY table_name;
           table_name
--------------------------------
 as_recettefablibservice
 categ_quali_contrat
 categ_quali_contrat_2
 chargepersonnel_cpl
 chargepersonneltemp
 effectif_log_personnel
 enfantpersonnel
 enfantpersonnel_cpl
 fiche_poste
 fiche_poste_competences
 fiche_poste_competences_lib
 fiche_poste_competences_vide
 fiche_poste_fille
 fiche_poste_lib
 insertion_vente_personnel
 insertion_vente_personnel_vide
 log_personnel
 log_personnel_avecconge
 log_personnel_fin
 log_personnel_fin_a_valider
 log_personnel_fin_conge
 log_personnel_fin_valide
 log_personnel_graphe
 log_personnel_infocomplet
 log_personnel_infocomplet3
 log_personnel_infopointage
 log_personnel_non_valide
 log_personnel_v
 log_personnel_v2
 log_personnel_v2_user
 log_personnel_v_frais_medicaux
 log_service
 log_service_crt
 log_service_lib
 log_service_libelle
 paie_avancement
 paie_avancement_libelle2
 paie_avancement_libelle4
 paie_fonction
 paie_fonctionlibelle
 paie_groupefonction
 paie_info_pers_histo_contrat
 paie_info_personnel
 paie_info_personnel_enfant
 paie_info_personnel_groupe
 paie_info_personnel_historic_3
 paie_info_personnel_libcomplet
 paie_info_personnel_sb
 paie_info_personnel_spec
 paie_info_personneldirect
 paie_personnel_elementpaie
 paie_personnel_elementpaie_lib
 personnel
 personnel_matricule
 personneldemaintenance
 poste
 service
 servicemaintenance
 st_ingredientsautoservice
 type_avancement
 type_contrat
 utilisateur_personnel
 v_moyenne_salaire_par_fonction
 v_moyenne_salaire_parfonction
 vue_contrat_lib
(65 lignes)


aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=# SELECT table_name, column_name, data_type
aigledor-# FROM information_schema.columns
aigledor-# WHERE table_schema = 'public'
aigledor-# AND table_name IN ('personnel','paie_info_personnel','paie_avancement',
aigledor(#   'type_avancement','paie_info_pers_histo_contrat','poste','service',
aigledor(#   'paie_fonction','type_contrat')
aigledor-# ORDER BY table_name, ordinal_position;
          table_name          |        column_name         |          data_type
------------------------------+----------------------------+-----------------------------
 paie_avancement              | id                         | character varying
 paie_avancement              | id_logpers                 | character varying
 paie_avancement              | date_application           | timestamp without time zone
 paie_avancement              | direction                  | character varying
 paie_avancement              | service                    | character varying
 paie_avancement              | idfonction                 | character varying
 paie_avancement              | idcategorie                | character varying
 paie_avancement              | echelon                    | numeric
 paie_avancement              | datedecision               | timestamp without time zone
 paie_avancement              | remarque                   | character varying
 paie_avancement              | refdecision                | character varying
 paie_avancement              | classee                    | character varying
 paie_avancement              | indicegrade                | numeric
 paie_avancement              | indice_fonctionnel         | numeric
 paie_avancement              | matricule_patron           | character varying
 paie_avancement              | statut                     | character varying
 paie_avancement              | droit_hs                   | character varying
 paie_avancement              | vehiculee                  | numeric
 paie_avancement              | etat                       | numeric
 paie_avancement              | ctg                        | character varying
 paie_avancement              | motif                      | character varying
 paie_avancement              | iduser                     | character varying
 paie_avancement              | indice_ct                  | numeric
 paie_avancement              | code_banque                | character varying
 paie_avancement              | region                     | character varying
 paie_avancement              | contrat                    | character varying
 paie_avancement              | typepersonnel              | character varying
 paie_avancement              | dureecontrat               | numeric
 paie_avancement              | modepaiement               | character varying
 paie_avancement              | idtypeavancement           | character varying
 paie_avancement              | unite                      | character varying
 paie_fonction                | id                         | character varying
 paie_fonction                | val                        | character varying
 paie_fonction                | desce                      | character varying
 paie_fonction                | idgroupefonction           | character varying
 paie_fonction                | gratification              | character varying
 paie_fonction                | idemploie                  | character varying
 paie_fonction                | idconfig                   | character varying
 paie_info_pers_histo_contrat | id                         | text
 paie_info_pers_histo_contrat | idpersonnel                | character varying
 paie_info_pers_histo_contrat | datesaisie                 | timestamp without time zone
 paie_info_pers_histo_contrat | matricule                  | character varying
 paie_info_pers_histo_contrat | lieu_naissance_commune     | character varying
 paie_info_pers_histo_contrat | lieu_delivrance_cin        | character varying
 paie_info_pers_histo_contrat | situation_matrimonial      | character varying
 paie_info_pers_histo_contrat | initiale                   | character varying
 paie_info_pers_histo_contrat | cturgence_nom_prenom       | text
 paie_info_pers_histo_contrat | cturgence_telephone1       | character varying
 paie_info_pers_histo_contrat | cturgence_telephone2       | character varying
 paie_info_pers_histo_contrat | cturgence_telephone3       | character varying
 paie_info_pers_histo_contrat | idconjoint                 | character varying
 paie_info_pers_histo_contrat | code_agence_banque         | character varying
 paie_info_pers_histo_contrat | banque_numero_compte       | character varying
 paie_info_pers_histo_contrat | banque_compte_cle          | character varying
 paie_info_pers_histo_contrat | dateembauche               | timestamp without time zone
 paie_info_pers_histo_contrat | idfonction                 | character varying
 paie_info_pers_histo_contrat | idcategorie                | character varying
 paie_info_pers_histo_contrat | mode_paiement              | character varying
 paie_info_pers_histo_contrat | classee                    | character varying
 paie_info_pers_histo_contrat | indicegrade                | numeric
 paie_info_pers_histo_contrat | indice_fonctionnel         | numeric
 paie_info_pers_histo_contrat | matricule_patron           | character varying
 paie_info_pers_histo_contrat | statut                     | character varying
 paie_info_pers_histo_contrat | droit_hs                   | character varying
 paie_info_pers_histo_contrat | vehiculee                  | numeric
 paie_info_pers_histo_contrat | echelon                    | numeric
 paie_info_pers_histo_contrat | etat                       | numeric
 paie_info_pers_histo_contrat | ctg                        | character varying
 paie_info_pers_histo_contrat | iduser                     | character varying
 paie_info_pers_histo_contrat | indice_ct                  | numeric
 paie_info_pers_histo_contrat | datepromotion              | timestamp without time zone
 paie_info_pers_histo_contrat | numero_cnaps               | character varying
 paie_info_pers_histo_contrat | numero_ostie               | character varying
 paie_info_pers_histo_contrat | temporaire                 | numeric
 paie_info_pers_histo_contrat | n_embauche                 | character varying
 paie_info_pers_histo_contrat | date_depart                | timestamp without time zone
 paie_info_pers_histo_contrat | n_depart                   | character varying
 paie_info_pers_histo_contrat | nbenfant                   | numeric
 paie_info_pers_histo_contrat | heurejournalier            | numeric
 paie_info_pers_histo_contrat | heurehebdomadaire          | numeric
 paie_info_pers_histo_contrat | heuremensuel               | numeric
 paie_info_pers_histo_contrat | indesirable                | numeric
 paie_info_pers_histo_contrat | duree                      | numeric
 paie_info_pers_histo_contrat | telephone                  | character varying
 paie_info_pers_histo_contrat | mail                       | character varying
 paie_info_pers_histo_contrat | adresse_ligne1             | character varying
 paie_info_pers_histo_contrat | adresse_ligne2             | character varying
 paie_info_pers_histo_contrat | code_postal                | character varying
 paie_info_pers_histo_contrat | region                     | character varying
 paie_info_pers_histo_contrat | idcategorie_paie           | character varying
 paie_info_pers_histo_contrat | idqualification            | character varying
 paie_info_pers_histo_contrat | formation                  | character varying
 paie_info_pers_histo_contrat | discipline                 | character varying
 paie_info_pers_histo_contrat | anneeexperience            | character varying
 paie_info_pers_histo_contrat | personnel_etat             | numeric
 paie_info_pers_histo_contrat | periode_essai              | numeric
 paie_info_pers_histo_contrat | permis_conduire            | character varying
 paie_info_pers_histo_contrat | chemin_permis              | character varying
 paie_info_pers_histo_contrat | remarque                   | character varying
 paie_info_pers_histo_contrat | id_pers                    | character varying
 paie_info_pers_histo_contrat | nom                        | character varying
 paie_info_pers_histo_contrat | prenom                     | character varying
 paie_info_pers_histo_contrat | date_naissance             | timestamp without time zone
 paie_info_pers_histo_contrat | sexe                       | character
 paie_info_pers_histo_contrat | sexepdf                    | text
 paie_info_pers_histo_contrat | pronompersonnelsujet       | text
 paie_info_pers_histo_contrat | genrepdf                   | text
 paie_info_pers_histo_contrat | numero_cin                 | character varying
 paie_info_pers_histo_contrat | date_cin                   | timestamp without time zone
 paie_info_pers_histo_contrat | date_dupl_cin              | timestamp without time zone
 paie_info_pers_histo_contrat | nationalite                | character varying
 paie_info_pers_histo_contrat | adresse                    | character varying
 paie_info_pers_histo_contrat | fokotany                   | character varying
 paie_info_pers_histo_contrat | acte_naissance             | character varying
 paie_info_pers_histo_contrat | direction                  | character varying
 paie_info_pers_histo_contrat | service                    | character varying
 paie_info_pers_histo_contrat | montant                    | numeric
 paie_info_pers_histo_contrat | categorie_qualificationlib | character varying
 paie_info_pers_histo_contrat | categorie_paielib          | character varying
 paie_info_pers_histo_contrat | date_debut                 | timestamp without time zone
 paie_info_pers_histo_contrat | date_fin                   | timestamp without time zone
 paie_info_pers_histo_contrat | avenant                    | text
 paie_info_pers_histo_contrat | fonctionlib                | character varying
 paie_info_pers_histo_contrat | debutcontrat               | timestamp without time zone
 paie_info_pers_histo_contrat | fincontrat                 | timestamp without time zone
 paie_info_pers_histo_contrat | numero                     | text
 paie_info_pers_histo_contrat | idcontrat_avant            | text
 paie_info_personnel          | id                         | character varying
 paie_info_personnel          | datesaisie                 | timestamp without time zone
 paie_info_personnel          | matricule                  | character varying
 paie_info_personnel          | lieu_naissance_commune     | character varying
 paie_info_personnel          | lieu_delivrance_cin        | character varying
 paie_info_personnel          | situation_matrimonial      | character varying
 paie_info_personnel          | initiale                   | character varying
 paie_info_personnel          | cturgence_nom_prenom       | character varying
 paie_info_personnel          | cturgence_telephone1       | character varying
 paie_info_personnel          | cturgence_telephone2       | character varying
 paie_info_personnel          | cturgence_telephone3       | character varying
 paie_info_personnel          | idconjoint                 | character varying
 paie_info_personnel          | code_agence_banque         | character varying
 paie_info_personnel          | banque_numero_compte       | character varying
 paie_info_personnel          | banque_compte_cle          | character varying
 paie_info_personnel          | dateembauche               | timestamp without time zone
 paie_info_personnel          | idfonction                 | character varying
 paie_info_personnel          | idcategorie                | character varying
 paie_info_personnel          | mode_paiement              | character varying
 paie_info_personnel          | classee                    | character varying
 paie_info_personnel          | indicegrade                | numeric
 paie_info_personnel          | indice_fonctionnel         | numeric
 paie_info_personnel          | matricule_patron           | character varying
 paie_info_personnel          | statut                     | character varying
 paie_info_personnel          | droit_hs                   | character varying
 paie_info_personnel          | vehiculee                  | numeric
 paie_info_personnel          | echelon                    | numeric
 paie_info_personnel          | etat                       | numeric
 paie_info_personnel          | ctg                        | character varying
 paie_info_personnel          | iduser                     | character varying
 paie_info_personnel          | indice_ct                  | numeric
 paie_info_personnel          | datepromotion              | timestamp without time zone
 paie_info_personnel          | numero_cnaps               | character varying
 paie_info_personnel          | numero_ostie               | character varying
 paie_info_personnel          | temporaire                 | numeric
 paie_info_personnel          | n_embauche                 | character varying
 paie_info_personnel          | date_depart                | timestamp without time zone
 paie_info_personnel          | n_depart                   | character varying
 paie_info_personnel          | nbenfant                   | numeric
 paie_info_personnel          | heurejournalier            | numeric
 paie_info_personnel          | heurehebdomadaire          | numeric
 paie_info_personnel          | heuremensuel               | numeric
 paie_info_personnel          | indesirable                | numeric
 paie_info_personnel          | duree                      | numeric
 paie_info_personnel          | telephone                  | character varying
 paie_info_personnel          | mail                       | character varying
 paie_info_personnel          | adresse_ligne1             | character varying
 paie_info_personnel          | adresse_ligne2             | character varying
^CRequête d'annulation envoyée
aigledor=# \d personnel
                            Table ½ public.personnel ╗
    Colonne    |          Type          | Collationnement | NULL-able | Par dÚfaut
---------------+------------------------+-----------------+-----------+------------
 id            | character varying(255) |                 | not null  |
 nom           | character varying(255) |                 |           |
 telephone     | character varying(255) |                 |           |
 mail          | character varying(255) |                 |           |
 adresse       | character varying(255) |                 |           |
 remarque      | character varying(255) |                 |           |
 compte        | character varying(100) |                 |           |
 iddepartement | character varying(50)  |                 |           |
Index :
    "personnel_pkey" PRIMARY KEY, btree (id)
Contraintes de clÚs ÚtrangÞres :
    "sys_c00413984" FOREIGN KEY (iddepartement) REFERENCES departementmaintenance(id) NOT VALID
RÚfÚrencÚ par :
    TABLE "attributionelement" CONSTRAINT "fk_attrelement_pers" FOREIGN KEY (idpersonnel) REFERENCES personnel(id) NOT VALID
    TABLE "fabricationfille" CONSTRAINT "fk_fabfille_operateur" FOREIGN KEY (operateur) REFERENCES personnel(id) NOT VALID
    TABLE "inspectionmere" CONSTRAINT "fk_inspecteur" FOREIGN KEY (idinspecteur) REFERENCES personnel(id) NOT VALID
    TABLE "travauxfille" CONSTRAINT "fk_trafille_operateur" FOREIGN KEY (operateur) REFERENCES personnel(id) NOT VALID
    TABLE "demandetravaux" CONSTRAINT "sys_c00413821" FOREIGN KEY (demandeur) REFERENCES personnel(id) NOT VALID
    TABLE "historiqueinspectionmere" CONSTRAINT "sys_c00413905" FOREIGN KEY (idinspecteur) REFERENCES personnel(id) NOT VALID


aigledor=# \d paie_avancement
                              Table ½ public.paie_avancement ╗
      Colonne       |            Type             | Collationnement | NULL-able | Par dÚfaut
--------------------+-----------------------------+-----------------+-----------+------------
 id                 | character varying(50)       |                 | not null  |
 id_logpers         | character varying(50)       |                 | not null  |
 date_application   | timestamp without time zone |                 |           |
 direction          | character varying(50)       |                 |           |
 service            | character varying(50)       |                 |           |
 idfonction         | character varying(50)       |                 |           |
 idcategorie        | character varying(50)       |                 |           |
 echelon            | numeric                     |                 |           |
 datedecision       | timestamp without time zone |                 |           |
 remarque           | character varying(255)      |                 |           |
 refdecision        | character varying(255)      |                 |           |
 classee            | character varying(50)       |                 |           |
 indicegrade        | numeric                     |                 |           |
 indice_fonctionnel | numeric                     |                 |           |
 matricule_patron   | character varying(50)       |                 |           |
 statut             | character varying(50)       |                 |           |
 droit_hs           | character varying(20)       |                 |           |
 vehiculee          | numeric                     |                 |           |
 etat               | numeric                     |                 |           |
 ctg                | character varying(50)       |                 |           |
 motif              | character varying(50)       |                 |           |
 iduser             | character varying(50)       |                 |           |
 indice_ct          | numeric                     |                 |           |
 code_banque        | character varying(100)      |                 |           |
 region             | character varying(500)      |                 |           |
 contrat            | character varying(255)      |                 |           |
 typepersonnel      | character varying(255)      |                 |           |
 dureecontrat       | numeric                     |                 |           |
 modepaiement       | character varying(255)      |                 |           |
 idtypeavancement   | character varying(255)      |                 |           |
 unite              | character varying(255)      |                 |           |
Index :
    "paie_avancement_pkey" PRIMARY KEY, btree (id)


aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=# \d paie_info_personnel
                              Table ½ public.paie_info_personnel ╗
        Colonne         |            Type             | Collationnement | NULL-able | Par dÚfaut
------------------------+-----------------------------+-----------------+-----------+------------
 id                     | character varying(50)       |                 | not null  |
 datesaisie             | timestamp without time zone |                 |           |
 matricule              | character varying(50)       |                 |           |
 lieu_naissance_commune | character varying(50)       |                 |           |
 lieu_delivrance_cin    | character varying(50)       |                 |           |
 situation_matrimonial  | character varying(50)       |                 |           |
 initiale               | character varying(50)       |                 |           |
 cturgence_nom_prenom   | character varying(255)      |                 |           |
 cturgence_telephone1   | character varying(50)       |                 |           |
 cturgence_telephone2   | character varying(50)       |                 |           |
 cturgence_telephone3   | character varying(50)       |                 |           |
 idconjoint             | character varying(50)       |                 |           |
 code_agence_banque     | character varying(50)       |                 |           |
 banque_numero_compte   | character varying(50)       |                 |           |
 banque_compte_cle      | character varying(50)       |                 |           |
 dateembauche           | timestamp without time zone |                 |           |
 idfonction             | character varying(50)       |                 |           |
 idcategorie            | character varying(50)       |                 |           |
 mode_paiement          | character varying(50)       |                 |           |
 classee                | character varying(50)       |                 |           |
 indicegrade            | numeric                     |                 |           |
 indice_fonctionnel     | numeric                     |                 |           |
 matricule_patron       | character varying(50)       |                 |           |
 statut                 | character varying(50)       |                 |           |
 droit_hs               | character varying(1)        |                 |           |
 vehiculee              | numeric                     |                 |           |
 echelon                | numeric                     |                 |           |
 etat                   | numeric                     |                 |           |
 ctg                    | character varying(50)       |                 |           |
 iduser                 | character varying(50)       |                 |           |
 indice_ct              | numeric                     |                 |           |
 datepromotion          | timestamp without time zone |                 |           |
 numero_cnaps           | character varying(50)       |                 |           |
 numero_ostie           | character varying(50)       |                 |           |
 temporaire             | numeric                     |                 |           |
 n_embauche             | character varying(50)       |                 |           |
 date_depart            | timestamp without time zone |                 |           |
 n_depart               | character varying(50)       |                 |           |
 nbenfant               | numeric                     |                 |           |
 heurejournalier        | numeric(30,2)               |                 |           |
 heurehebdomadaire      | numeric(30,2)               |                 |           |
 heuremensuel           | numeric(30,2)               |                 |           |
 indesirable            | numeric                     |                 |           |
 duree                  | numeric(30,2)               |                 |           |
 telephone              | character varying(100)      |                 |           |
 mail                   | character varying(500)      |                 |           |
 adresse_ligne1         | character varying(100)      |                 |           |
 adresse_ligne2         | character varying(100)      |                 |           |
 code_postal            | character varying(100)      |                 |           |
 region                 | character varying(100)      |                 |           |
 idcategorie_paie       | character varying(500)      |                 |           |
 idqualification        | character varying(500)      |                 |           |
 formation              | character varying(1000)     |                 |           |
 discipline             | character varying(1000)     |                 |           |
 anneeexperience        | character varying(1000)     |                 |           |
 personnel_etat         | numeric                     |                 |           |
 periode_essai          | numeric                     |                 |           |
 debutcontrat           | timestamp without time zone |                 |           |
 fincontrat             | timestamp without time zone |                 |           |
 refuser                | numeric                     |                 |           |
 typecontrat            | character varying(100)      |                 |           |
 iddepartement          | character varying(255)      |                 |           |
 idbanque               | character varying(255)      |                 |           |
 idagence               | character varying(255)      |                 |           |
 idstatut               | character varying(100)      |                 |           |
 salairebase            | numeric(30,2)               |                 |           |
 tauxhoraire            | numeric(30,2)               |                 |           |
 unite                  | character varying(255)      |                 |           |
 retraitecompl          | numeric                     |                 |           |
Index :
    "paie_info_personnel_pkey" PRIMARY KEY, btree (id)
Contraintes de clÚs ÚtrangÞres :
    "categorie_paie_fk" FOREIGN KEY (idcategorie_paie) REFERENCES categorie_paie(id) NOT VALID
    "fk_paieinfo_agence" FOREIGN KEY (idagence) REFERENCES banque_agence(id) NOT VALID
    "fk_paieinfo_banque" FOREIGN KEY (idbanque) REFERENCES banque(id) NOT VALID
    "qualification_paie_fk" FOREIGN KEY (idqualification) REFERENCES qualification_paie(id) NOT VALID
RÚfÚrencÚ par :
    TABLE "demande" CONSTRAINT "demande_paieinfopers_id_fk" FOREIGN KEY (idpersonnel) REFERENCES paie_info_personnel(id) NOT VALID
    TABLE "chargepersonneltemp" CONSTRAINT "fk_charge_personnel" FOREIGN KEY (idpersonnel) REFERENCES paie_info_personnel(id) NOT VALID
    TABLE "entretienrh" CONSTRAINT "fk_ent_eval" FOREIGN KEY (idevaluateur) REFERENCES paie_info_personnel(id) NOT VALID
    TABLE "entretienrh" CONSTRAINT "fk_ent_pers" FOREIGN KEY (idpersonnel) REFERENCES paie_info_personnel(id) NOT VALID
    TABLE "historiquedemande" CONSTRAINT "histdemande_paieinfopers_id_fk" FOREIGN KEY (idpersonnel) REFERENCES paie_info_personnel(id) NOT VALID
    TABLE "mouvementabsence" CONSTRAINT "mvtabs_paieinfo_fk" FOREIGN KEY (idpersonnel) REFERENCES paie_info_personnel(id) NOT VALID
    TABLE "paie_archive" CONSTRAINT "paie_archive_personnel_fk" FOREIGN KEY (idpersonnel) REFERENCES paie_info_personnel(id) NOT VALID
    TABLE "ressourceparfabrication" CONSTRAINT "resparfab_ressource_fk" FOREIGN KEY (idressource) REFERENCES paie_info_personnel(id) NOT VALID
    TABLE "sanction" CONSTRAINT "sanction_paieinfo_fk" FOREIGN KEY (idpersonne) REFERENCES paie_info_personnel(id) NOT VALID
    TABLE "evaluation_a_chaud" CONSTRAINT "sys_c00413861" FOREIGN KEY (idpersonnel) REFERENCES paie_info_personnel(id) NOT VALID
    TABLE "evaluation_a_chaud" CONSTRAINT "sys_c00413862" FOREIGN KEY (idintervenant) REFERENCES paie_info_personnel(id) NOT VALID
    TABLE "paiementheuresup" CONSTRAINT "sys_c00413975" FOREIGN KEY (idpersonnel) REFERENCES paie_info_personnel(id) NOT VALID
    TABLE "pointage_magasinier" CONSTRAINT "sys_c00413991" FOREIGN KEY (idpersonnel) REFERENCES paie_info_personnel(id) NOT VALID


aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=#
aigledor=# SELECT * FROM type_avancement;
    id     |               val               |              desce
-----------+---------------------------------+---------------------------------
 TYPAV0001 | CHANGEMENT D' INDICE            | CHANGEMENT D' INDICE
 TYPAV0004 | CHANGEMENT DE FONCTION          | CHANGEMENT DE FONCTION
 TYPAV0005 | CHANGEMENNT DE REGION           | CHANGEMENNT DE REGION
 TYPAV0006 | CHANGEMENT D'AFFECTATION        | CHANGEMENT D'AFFECTATION
 TYPAV0007 | CHANGEMENNT DE MODE DE PAIEMENT | CHANGEMENNT DE MODE DE PAIEMENT
 TYPAV0008 | CHANGEMENT DE COMPTE            | CHANGEMENT DE COMPTE
 TYPAV0009 | CHANGEMENT DE CONTRAT           | CHANGEMENT DE CONTRAT
 TYPAV0010 | CHANGEMENT D'UNIT╔              | CHANGEMENT D'UNIT╔
 TYPAV0011 | CHANGEMENT DE SERVICE/SECTION   | CHANGEMENT DE SERVICE/SECTION
(9 lignes)


aigledor=# SELECT table_name, table_type FROM information_schema.tables
aigledor-# WHERE table_name IN ('paie_info_pers_histo_contrat','log_personnel','log_personnel_v');
          table_name          | table_type
------------------------------+------------
 log_personnel                | BASE TABLE
 log_personnel_v              | VIEW
 paie_info_pers_histo_contrat | VIEW
(3 lignes)


aigledor=# \d log_personnel
                              Table ½ public.log_personnel ╗
     Colonne     |            Type             | Collationnement | NULL-able | Par dÚfaut
-----------------+-----------------------------+-----------------+-----------+------------
 id              | character varying(50)       |                 | not null  |
 permis_conduire | character varying(255)      |                 |           |
 chemin_permis   | character varying(255)      |                 |           |
 remarque        | character varying(255)      |                 |           |
 id_pers         | character varying(50)       |                 |           |
 nom             | character varying(100)      |                 |           |
 prenom          | character varying(100)      |                 |           |
 date_naissance  | timestamp without time zone |                 |           |
 sexe            | character(1)                |                 |           |
 numero_cin      | character varying(100)      |                 |           |
 date_cin        | timestamp without time zone |                 |           |
 date_dupl_cin   | timestamp without time zone |                 |           |
 nationalite     | character varying(50)       |                 | not null  |
 adresse         | character varying(200)      |                 |           |
 fokotany        | character varying(50)       |                 |           |
 acte_naissance  | character varying(100)      |                 |           |
 direction       | character varying(50)       |                 | not null  |
 service         | character varying(50)       |                 | not null  |
 refuser         | numeric                     |                 |           |
 idsup           | character varying(100)      |                 |           |
 idhierarchie    | character varying(100)      |                 |           |
 cheminimage     | character varying(255)      |                 |           |
 idcivilite      | character varying(255)      |                 |           |
 mere            | character varying(255)      |                 |           |
 pere            | character varying(255)      |                 |           |
 telephone       | numeric                     |                 |           |
Index :
    "log_personnel_pkey" PRIMARY KEY, btree (id)
    "idx_service" btree (service)
Contraintes de clÚs ÚtrangÞres :
    "fk_log_personnel_civilite" FOREIGN KEY (idcivilite) REFERENCES civilite(id) NOT VALID
    "logpers_utilisateur_id_fk" FOREIGN KEY (refuser) REFERENCES utilisateur(refuser) NOT VALID
RÚfÚrencÚ par :
    TABLE "enfantpersonnel" CONSTRAINT "enfpers_log_fk" FOREIGN KEY (idpersonnel) REFERENCES log_personnel(id) NOT VALID
    TABLE "accident" CONSTRAINT "fk_accident_personnel" FOREIGN KEY (id_personnel) REFERENCES log_personnel(id) NOT VALID
    TABLE "checklist_mere" CONSTRAINT "fk_chkmere_personnel" FOREIGN KEY (idpersonnel) REFERENCES log_personnel(id) NOT VALID
    TABLE "info_pro" CONSTRAINT "fk_info_pro_personnel" FOREIGN KEY (id_personnel) REFERENCES log_personnel(id)
    TABLE "mouvement_employe" CONSTRAINT "fk_mouvement_personnel" FOREIGN KEY (id_personnel) REFERENCES log_personnel(id)
    TABLE "programme_integration_detail" CONSTRAINT "fk_prog_intervenant" FOREIGN KEY (idintervenant) REFERENCES log_personnel(id) NOT VALID
    TABLE "programme_integration" CONSTRAINT "fk_prog_personnel" FOREIGN KEY (idpersonnel) REFERENCES log_personnel(id) NOT VALID
    TABLE "utilisateur_personnel" CONSTRAINT "fk_up_personnel" FOREIGN KEY (idpersonnel) REFERENCES log_personnel(id) NOT VALID


aigledor=# SELECT count(*) FROM paie_avancement;
 count
-------
     0
(1 ligne)


aigledor=# SELECT count(*) FROM paie_avancement a JOIN log_personnel l ON l.id = a.id_logpers;
 count
-------
     0
(1 ligne)


aigledor=# SELECT count(*) FROM paie_avancement a JOIN paie_info_personnel p ON p.id = a.id_logpers;
 count
-------
     0
(1 ligne)


aigledor=# SELECT count(*) FROM personnel p JOIN paie_info_personnel i ON i.id = p.id;
 count
-------
     0
(1 ligne)


aigledor=# \d info_pro
                                Table ½ public.info_pro ╗
        Colonne        |         Type          | Collationnement | NULL-able | Par dÚfaut
-----------------------+-----------------------+-----------------+-----------+------------
 id                    | character varying(50) |                 | not null  |
 id_personnel          | character varying(50) |                 | not null  |
 id_poste_actuel       | character varying(50) |                 |           |
 id_departement_actuel | character varying(50) |                 |           |
Index :
    "info_pro_pkey" PRIMARY KEY, btree (id)
    "info_pro_id_personnel_key" UNIQUE CONSTRAINT, btree (id_personnel)
Contraintes de clÚs ÚtrangÞres :
    "fk_info_pro_personnel" FOREIGN KEY (id_personnel) REFERENCES log_personnel(id)


aigledor=# \d mouvement_employe
                          Table ½ public.mouvement_employe ╗
      Colonne       |         Type          | Collationnement | NULL-able | Par dÚfaut
--------------------+-----------------------+-----------------+-----------+------------
 id                 | character varying(50) |                 | not null  |
 id_personnel       | character varying(50) |                 | not null  |
 type_mouvement     | character varying(20) |                 |           |
 date_mouvement     | date                  |                 | not null  |
 id_poste_mouvement | character varying(50) |                 |           |
Index :
    "mouvement_employe_pkey" PRIMARY KEY, btree (id)
Contraintes de clÚs ÚtrangÞres :
    "fk_mouvement_personnel" FOREIGN KEY (id_personnel) REFERENCES log_personnel(id)


aigledor=# SELECT count(*) FROM log_personnel;
 count
-------
   465
(1 ligne)


aigledor=# SELECT count(*) FROM info_pro;
 count
-------
     0
(1 ligne)


aigledor=# SELECT count(*) FROM mouvement_employe;
 count
-------
     2
(1 ligne)


aigledor=# SELECT count(*) FROM paie_info_personnel p JOIN log_personnel l ON l.id = p.id;
 count
-------
   465
(1 ligne)


aigledor=# SELECT * FROM mouvement_employe;
    id     | id_personnel  | type_mouvement | date_mouvement | id_poste_mouvement
-----------+---------------+----------------+----------------+--------------------
 MVT000002 | PRS_TEMP_0201 | EMBAUCHE       | 2026-11-19     | 1
 MVT000003 | PRS_TEMP_0201 | EMBAUCHE       | 2026-11-19     | 1
(2 lignes)


aigledor=# \d poste
                           Table ½ public.poste ╗
 Colonne |          Type          | Collationnement | NULL-able | Par dÚfaut
---------+------------------------+-----------------+-----------+------------
 id      | character varying(100) |                 | not null  |
 val     | character varying(200) |                 |           |
 desce   | character varying(200) |                 |           |
Index :
    "poste_pkey" PRIMARY KEY, btree (id)
RÚfÚrencÚ par :
    TABLE "categorie_qualification" CONSTRAINT "categquali_poste_fk" FOREIGN KEY (idposte) REFERENCES poste(id) NOT VALID
    TABLE "qualification_paie" CONSTRAINT "fk_poste" FOREIGN KEY (idposte) REFERENCES poste(id) NOT VALID
    TABLE "as_ingredients" CONSTRAINT "ingredient_poste_fk" FOREIGN KEY (refpost) REFERENCES poste(id) NOT VALID
    TABLE "ressourceparfabrication" CONSTRAINT "resparfab_poste_fk" FOREIGN KEY (idposte) REFERENCES poste(id) NOT VALID


aigledor=# SELECT count(*) AS total, count(dateembauche) AS embauche, count(date_depart) AS depart, count(idfonction) AS fonction FROM paie_info_personnel;
 total | embauche | depart | fonction
-------+----------+--------+----------
   465 |      465 |      0 |      465
(1 ligne)


aigledor=# SELECT count(*) FROM poste;
 count
-------
    24
(1 ligne)


aigledor=# SELECT id, val FROM paie_fonction LIMIT 5;
    id     | val
-----------+-----
 PFNCT0001 | CA
 PFNCT0002 | MAG
 PFNCT0003 | CE
 PFNCT0004 | MT
 PFNCT0005 | AM
(5 lignes)


aigledor=#