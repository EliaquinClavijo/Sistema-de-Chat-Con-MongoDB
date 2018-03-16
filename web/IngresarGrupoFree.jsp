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
            String Grupo = request.getParameter("GrupoD");
    
                NewPart.setaNombreGrupo(Grupo);
                NewPart.setaNombre(usuario);
                NewPart.setaAdmi("0");
                NewPart.Insertar();
            
            
        %>
        
<jsp:forward page="ChatGrupalMain.jsp">
    <jsp:param name="NameGrupo" value="<%=Grupo%>"/>
</jsp:forward>
