package personnel;

import java.sql.Connection;
import bean.ClassMAPTable;
import java.sql.Date;

public class EmployeListe extends ClassMAPTable {

    // Bloc 1 : un attribut par colonne de la vue (même nom exact)
    String id, matricule, nom, prenom, fonction,
           direction_lib, service_lib,
           contrat_lib;

    Date dateembauche, date_depart;

    // Bloc 2 : constructeur, il pointe vers la VUE
    public EmployeListe() {
        setNomTable("v_employe_liste");
    }

    // Bloc 3 : identifiant de la ligne
    @Override
    public String getTuppleID() { return id; }

    @Override
    public String getAttributIDName() { return "id"; }

    // Bloc 4 : vue en lecture seule, aucune clé à générer
    @Override
    public void construirePK(Connection c) throws Exception {
    }

    // Bloc 5 : mots-clés de recherche (listes identiques, colonnes texte seulement)
    @Override
    public String[] getMotCles() {
        return new String[]{"id","nom","prenom","matricule","fonction",
                            "direction_lib","service_lib","contrat_lib"};
    }

    @Override
    public String[] getValMotCles() {
        return new String[]{"id","nom","prenom","matricule","fonction",
                            "direction_lib","service_lib","contrat_lib"};
    }

    // Bloc 6 : getters et setters (get + nom de la colonne)
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getMatricule() { return matricule; }
    public void setMatricule(String matricule) { this.matricule = matricule; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getPrenom() { return prenom; }
    public void setPrenom(String prenom) { this.prenom = prenom; }

    public String getFonction() { return fonction; }
    public void setFonction(String fonction) { this.fonction = fonction; }

    public String getDirection_lib() { return direction_lib; }
    public void setDirection_lib(String direction_lib) { this.direction_lib = direction_lib; }

    public String getService_lib() { return service_lib; }
    public void setService_lib(String service_lib) { this.service_lib = service_lib; }

    public String getDateembauche() { return dateembauche; }
    public void setDateembauche(String dateembauche) { this.dateembauche = dateembauche; }

    public String getContrat_lib() { return contrat_lib; }
    public void setContrat_lib(String contrat_lib) { this.contrat_lib = contrat_lib; }

    public String getDate_depart() { return date_depart; }
    public void setDate_depart(String date_depart) { this.date_depart = date_depart; }
}