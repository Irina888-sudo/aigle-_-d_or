<%@page import="mouvement.MouvementEmployeComplet"%>
<%@page import="affichage.PageRecherche"%>
<%@ page import="java.util.Map" %> 
<%@ page import="java.util.HashMap" %>
<%@ page import="affichage.Liste" %>
<%@ page import="bean.TypeObjet" %>


<% try{

        MouvementEmployeComplet mvcomp = new MouvementEmployeComplet();

        // 2. On définit les colonnes à afficher
    String[] listeCrt = {"id", "nom", "prenom", "type_mouvement", "date_mouvement"};
    String[] libEntete = {"ID", "Nom", "Prénom", "Type", "Date"};

    PageRecherche pr = new PageRecherche(mvcomp, request, listeCrt, new String[]{}, 3, libEntete, libEntete.length);

    pr.setTitre("Historique des Mouvements des Employés");
    pr.setUtilisateur((user.UserEJB) session.getValue("u"));
    pr.setLien((String) session.getValue("lien"));
    pr.setApres("paie/log/mouvementemploye-liste.jsp");

    pr.creerObjetPage(libEntete, null);

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

