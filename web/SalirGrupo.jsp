<%@ page session="true" %>

<%
    String usuario = "";
    String haySesion = "";
    HttpSession sesionOk = request.getSession();
    if (sesionOk.getAttribute("usuario") == null) {
%>

<jsp:forward page="index.jsp">
    <jsp:param name="error" value="Es obligatorio identificarse"/>
</jsp:forward>

<%    } else {
        usuario = (String) sesionOk.getAttribute("usuario");
        haySesion =  (String)sesionOk.getAttribute("haySesion");
    }
%>

<jsp:useBean id="NewPart" class="Autentication.cGenerateUsers" scope = "session">
</jsp:useBean>
        <%
            String Grupo = request.getParameter("NameGrupo");
            
            
            NewPart.setaNombreGrupo(Grupo);
            NewPart.setaNombre(usuario);
            NewPart.Eliminar();
            
            
        %>
        
<jsp:forward page="pagina_principale.jsp"/>

   