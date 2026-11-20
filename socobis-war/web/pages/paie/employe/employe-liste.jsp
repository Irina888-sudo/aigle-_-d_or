<%@page import="affichage.PageRecherche"%>
<%@page import="personnel.EmployeListe"%>

<% try{
    EmployeListe t = new EmployeListe();
    t.setNomTable("v_employe_liste");


    String listeCrt[] = {"id","nom","prenom","matricule","fonction",
                        "direction_lib","service_lib","contrat_lib"};
    
    String listeInt[] = { };
    // TODO : libEntete = colonnes affichées (noms exacts de la vue)
    String libEntete[] = {"ID","Nom","Prénom","Matricule","Fonction",
                          "Direction","Service","Contrat"};

    PageRecherche pr = new PageRecherche(t, request, listeCrt, listeInt, 3, libEntete, libEntete.length);
    pr.setTitre("Liste des employés");
    pr.setUtilisateur((user.UserEJB) session.getValue("u"));
    pr.setLien((String) session.getValue("lien"));
    pr.setApres("paie/employe/employe-liste.jsp");
    String[] colSomme = null;
    pr.creerObjetPage(libEntete, colSomme);

    String lienTableau[] = {pr.getLien() + "?but=paie/employe/employe-fiche.jsp"};
    String colonneLien[] = {"id"};

    pr.getTableau().setLien(lienTableau);
    pr.getTableau().setColonneLien(colonneLien);

    String libEnteteAffiche[] = {"ID","Nom","Prénom","Matricule","Fonction",
                          "Direction","Service","Contrat"};
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