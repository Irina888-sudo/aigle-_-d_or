<%@page import="paie.log.MouvementEmploye"%>
<%@page import="paie.log.LogPersonnel"%>
<%@ page import="user.*" %>
<%@ page import="bean.*" %>
<%@ page import="affichage.*" %>

<%
try {
    MouvementEmploye mvt = new MouvementEmploye();
    mvt.setNomTable("MOUVEMENT_EMPLOYE");

    // 2. Le framework prépare le formulaire
    PageInsert pi = new PageInsert(mvt, request, (user.UserEJB) session.getValue("u"));
    pi.setLien((String) session.getValue("lien"));

    // 3. On prépare les listes déroulantes (DropDown)
    Liste[] liste = new Liste[2];


    LogPersonnel log = new LogPersonnel();
    log.setNomTable("LOG_PERSONNEL"); 
    liste[0] = new Liste("id_personnel", log, "nom", "id"); 

     // Liste des types de mouvement (Hardcodé)
    liste[1] = new Liste("type_mouvement");
    liste[1].ajouterValeur(new String[]{"EMBAUCHE", "MUTATION", "DEBAUCHE"}, new String[]{"EMBAUCHE", "MUTATION", "DEBAUCHE"});

    // 4. On remplace les champs texte par les listes
    pi.getFormu().changerEnChamp(liste);


     // 5. On définit les libellés (les titres)
    pi.getFormu().getChamp("id_personnel").setLibelle("Employé");
    pi.getFormu().getChamp("type_mouvement").setLibelle("Type de mouvement");
    pi.getFormu().getChamp("date_mouvement").setLibelle("Date");
    pi.getFormu().getChamp("id_poste_mouvement").setLibelle("ID Poste (Optionnel)");

    // 6. Configuration de l'envoi
    String butApresPost = "mouvement/mouvementemploye-liste.jsp"; // Où aller après
    String classe = "paie.log.MouvementEmploye"; // Quelle classe appeler
    String nomTable = "MOUVEMENT_EMPLOYE"; // Quelle table


    pi.preparerDataFormu();
    pi.getFormu().makeHtmlInsertTabIndex();
%>

<div class="content-wrapper">
    <h1 align="center">Saisie d'un Mouvement</h1>
    <form action="<%=pi.getLien()%>?but=mouvement%2Fmouvementemploye-saisie.jsp" method="post" data-parsley-validate>
        <%
            out.println(pi.getFormu().getHtmlInsert());
        %>
        <!-- CHAMPS CACHÉS (Indispensables pour que le framework sache quoi faire) -->
        <input name="acte" type="hidden" value="insert">
        <input name="bute" type="hidden" value="<%= butApresPost %>">
        <input name="classe" type="hidden" value="<%= classe %>">
        <input name="nomtable" type="hidden" value="<%= nomTable %>">
    </form>
</div>

<%
} catch (Exception e) {
    e.printStackTrace();
%>
<script language="JavaScript"> alert('<%=e.getMessage()%>');
    history.back();</script>
<% } %>


