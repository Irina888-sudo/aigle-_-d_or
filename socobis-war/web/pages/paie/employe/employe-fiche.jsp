<%@ page import="personnel.EmployeListe" %>
<%@ page import="user.*" %>
<%@ page import="bean.*" %>
<%@ page import="utilitaire.*" %>
<%@ page import="affichage.*" %>

<%
  try{
    EmployeListe t = new EmployeListe();
    t.setNomTable("v_employe_liste");
    PageConsulte pc = new PageConsulte(t, request, (user.UserEJB) session.getValue("u"));
    String id = pc.getBase().getTuppleID();
    pc.setTitre("Fiche employ&eacute;");
    String lien = (String) session.getValue("lien");
    // TODO : titres lisibles avec pc.getChampByName("...").setLibelle("...")
%>
<div class="content-wrapper">
  <h1 class="box-title"><%=pc.getTitre()%></h1>
  <div class="box-fiche"><div class="box"><div class="box-body">
      <% out.println(pc.getHtml()); %>
      <% btn = "<a class='btn btn-secondary pull-right' href='" + lien + "?but=paie/employe/employe-modif.jsp&id=" + id + "' style='margin-right: 10px'>Modifier</a>"; %>
      <% out.println(btn); %>
       
      <%-- TODO : boutons Embauche / Débauche / Changement de poste --%>
  </div></div></div>
</div>
<%
  } catch (Exception e) { e.printStackTrace(); }
%>