<%@page import="affichage.PageRecherche"%>
<%@page import="personnel.EmployeListe"%>

<% try{
    EmployeListe t = new EmployeListe();
    t.setNomTable("v_employe_liste");

    // Bloc 1 : noms EXACTS des colonnes de la vue
    String listeCrt[] = {"id","nom","prenom","matricule","fonction",
                         "direction_lib","service_lib","contrat_lib"};

    String listeInt[] = {"dateembauche"};

    String libEntete[] = {"id","nom","prenom","matricule","fonction",
                          "direction_lib","service_lib","dateembauche","contrat_lib"};

    // Bloc 2 : titres lisibles, déclarés AVANT leur utilisation, même taille que libEntete
    String libEnteteAffiche[] = {"ID","Nom","Pr&eacute;nom","Matricule","Fonction",
                                 "Direction","Service","Date d'embauche","Contrat"};

    // Bloc 3 : création de la page
    PageRecherche pr = new PageRecherche(t, request, listeCrt, listeInt, 3, libEntete, libEntete.length);
    pr.setTitre("Liste des employ&eacute;s");
    pr.setUtilisateur((user.UserEJB) session.getValue("u"));
    pr.setLien((String) session.getValue("lien"));
    pr.setApres("paie/employe/employe-liste.jsp");
    String[] colSomme = null;
    pr.creerObjetPage(libEntete, colSomme);

    // Bloc 4 : lien cliquable sur l'id + titres affichés
    String lienTableau[] = {pr.getLien() + "?but=paie/employe/employe-fiche.jsp"};
    String colonneLien[] = {"id"};
    pr.getTableau().setLien(lienTableau);
    pr.getTableau().setColonneLien(colonneLien);
    pr.getTableau().setLibelleAffiche(libEnteteAffiche);
%>

<div class="content-wrapper">
    <section class="content-header">
        <h1><%= pr.getTitre() %></h1>
    </section>
    <section class="content">
        <form action="<%=pr.getLien()%>?but=<%= pr.getApres() %>" method="post">
            <%
                out.println(pr.getFormu().getHtmlEnsemble());
            %>
        </form>
        <%
            out.println(pr.getTableauRecap().getHtml());%>
        <br>
        <%
            out.println(pr.getTableau().getHtml());
            out.println(pr.getBasPage());
        %>
    </section>
</div>
<%
    }catch(Exception e){
        e.printStackTrace();
    }
%>