<jsp:useBean id="NewPart" class="Autentication.cGenerateUsers" scope = "session">
</jsp:useBean>
        <%
            String Grupo = request.getParameter("NameGrupo");
            String[] Name =request.getParameterValues("Agregar");
            
            for (int a = 0;a < Name.length ; a++)
            {
                NewPart.setaNombreGrupo(Grupo);
                NewPart.setaNombre(Name[a].toString());
                NewPart.setaAdmi("0");
                NewPart.Insertar();
            }
            
        %>
        
<jsp:forward page="ChatGrupalMain.jsp">
    <jsp:param name="NameGrupo" value="<%=Grupo%>"/>
</jsp:forward>
