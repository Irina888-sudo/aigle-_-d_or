# aigle-_-d_or
Gestion de ventes de sandales 

CREATE SEQUENCE GET_SEQ_INFO_PRO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE GET_SEQ_MVT_EMP START WITH 1 INCREMENT BY 1;


-- Fichier à créer : bdd/2026-11-15-creation-info-pro.sql
CREATE TABLE INFO_PRO (
    id VARCHAR(50) PRIMARY KEY,
    id_personnel VARCHAR(50) NOT NULL UNIQUE, 
    id_poste_actuel VARCHAR(50),              
    id_departement_actuel VARCHAR(50),              
    CONSTRAINT fk_info_pro_personnel FOREIGN KEY (id_personnel) 
    REFERENCES LOG_PERSONNEL(id)
);


CREATE TABLE MOUVEMENT_EMPLOYE (
    id VARCHAR(50) PRIMARY KEY,
    id_personnel VARCHAR(50) NOT NULL,
    type_mouvement VARCHAR(20), -- 'EMBAUCHE', 'MUTATION', 'DEBAUCHE'
    date_mouvement DATE NOT NULL,
    id_poste_mouvement VARCHAR(50), -- Le poste occupé à partir de cette date
    CONSTRAINT fk_mouvement_personnel FOREIGN KEY (id_personnel) REFERENCES LOG_PERSONNEL(id)
);


PS C:\Users\Mihaja> & "D:\don't touch\PostgreSQL\18\bin\psql.exe" -U postgres -d aigledor -f D:\creation.sql











<%@page import="paie.log.MouvementEmployeComplet"%>
<%@page import="affichage.PageRecherche"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<%
try {
    // 1. On instancie la classe VUE (celle qui a les noms)
    MouvementEmployeComplet obj = new MouvementEmployeComplet();
    
    // 2. On définit les colonnes à afficher
    String[] listeCrt = {"id", "nom", "prenom", "type_mouvement", "date_mouvement"};
    String[] libEntete = {"ID", "Nom", "Prénom", "Type", "Date"};
    
    // 3. On crée le moteur de recherche
    PageRecherche pr = new PageRecherche(obj, request, listeCrt, new String[]{}, 3, libEntete, libEntete.length);
    pr.setTitre("Historique des Mouvements");
    pr.setUtilisateur((user.UserEJB) session.getValue("u"));
    pr.setLien((String) session.getValue("lien"));
    pr.setApres("paie/log/mouvementemploye-liste.jsp");
    
    pr.creerObjetPage(libEntete, null);
    
    // 4. Le bouton pour aller vers la SAISIE
    pr.getFormu().setAnotherButton("<a class=\"btn btn-primary pull-right\" href=\"module.jsp?but=paie/log/mouvementemploye-saisie.jsp\">+ Nouveau Mouvement</a>");
%>

<div class="content-wrapper">
    <section class="content-header">
        <h1><%= pr.getTitre() %></h1>
    </section>
    <section class="content">
        <form action="<%=pr.getLien()%>?but=<%= pr.getApres() %>" method="post">
            <% out.println(pr.getFormu().getHtmlEnsemble()); %>
        </form>
        <br>
        <% out.println(pr.getTableau().getHtml()); %>
        <% out.println(pr.getBasPage()); %>
    </section>
</div>

<%
} catch(Exception e) {
    e.printStackTrace();
}
%>