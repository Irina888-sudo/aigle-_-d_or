package paie.log;

import java.sql.Date;
import bean.ClassMAPTable;
import java.sql.Connection;

public class MouvementEmploye  extends ClassMAPTable{
   
    private String id, id_personnel, type_mouvement, id_poste_mouvement;
    private Date date_mouvement;


     public MouvementEmploye() {
        super.setNomTable("MOUVEMENT_EMPLOYE"); 
    }

    @Override
    public void construirePK(Connection c) throws Exception {
        this.preparePk("MVT", "GET_SEQ_MVT_EMP"); 
        this.setId(makePK(c));
    }

    @Override
    public String getTuppleID() { return id; }
    @Override
    public String getAttributIDName() { return "id"; }

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

    public String getType_mouvement() {
        return type_mouvement;
    }

    public void setType_mouvement(String type_mouvement) {
        this.type_mouvement = type_mouvement;
    }

    public String getId_poste_mouvement() {
        return id_poste_mouvement;
    }

    public void setId_poste_mouvement(String id_poste_mouvement) {
        this.id_poste_mouvement = id_poste_mouvement;
    }

     public Date getDate_mouvement() {
        return date_mouvement;
    }

    public void setDate_mouvement(Date date_mouvement) {
        this.date_mouvement = date_mouvement;
    }

}
