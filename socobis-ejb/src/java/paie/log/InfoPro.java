package paie.log;

import bean.ClassMAPTable;
import java.sql.Connection;

public class InfoPro extends ClassMAPTable {
    // 1. Les attributs (identiques aux colonnes de ta table SQL)
    private String id, id_personnel, id_poste_actuel, id_departement_actuel;

    // 2. Le constructeur (le lien avec la table SQL)
    public InfoPro() {
        super.setNomTable("INFO_PRO"); 
    }

    // 3. La génération de l'ID
    @Override
    public void construirePK(Connection c) throws Exception {
        this.preparePk("INF", "GET_SEQ_INFO_PRO"); // Préfixe INF + Séquence
        this.setId(makePK(c));
    }

    // 4. Les méthodes obligatoires du framework
    @Override
    public String getTuppleID() { return id; }
    @Override
    public String getAttributIDName() { return "id"; }

    // 5. Les Getters et Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId_personnel() {
        return id_personnel;
    }

    public void setId_personnel(String id_personnel) {
        this.id_personnel = id_personnel;
    }

    public String getId_poste_actuel() {
        return id_poste_actuel;
    }

    public void setId_poste_actuel(String id_poste_actuel) {
        this.id_poste_actuel = id_poste_actuel;
    }

    public String getId_departement_actuel() {
        return id_departement_actuel;
    }

    public void setId_departement_actuel(String id_departement_actuel) {
        this.id_departement_actuel = id_departement_actuel;
    }
}