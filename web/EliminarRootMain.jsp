<jsp:useBean id="NewPart" class="Autentication.cRegistro" scope = "session">
</jsp:useBean>
        <%
           
            String[] Name =request.getParameterValues("Agregar");
            
            for (int a = 0;a < Name.length ; a++)
            {
                NewPart.setaNombre(Name[a].toString());
                NewPart.Eliminar();
            }
            
        %>
        
<jsp:forward page="Root.jsp"/>

