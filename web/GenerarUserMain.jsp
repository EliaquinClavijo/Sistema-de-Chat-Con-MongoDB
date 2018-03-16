<%-- 
    Document   : GenerarUserMain
    Created on : 8-feb-2018, 10.47.15
    Author     : User
--%>

        <%
            String Name = "";
            String Codigo = "";

            if (request.getParameter("Nombre") != null){
                Name = request.getParameter("Nombre");
            }
            if (request.getParameter("Codigo") != null) {
                Codigo = request.getParameter("Codigo");
            }
            out.println(Name+" "+Codigo);
            
        %>
        <jsp:useBean id="NewUser" class="Autentication.cRegistroCodigo" scope = "session">
                
        </jsp:useBean>
     <%
         NewUser.setaNombre(Name);
         NewUser.setaCodigo(Codigo);
         NewUser.setaUser("0"); 
         NewUser.Insertar();
     %>

<jsp:forward page="Root.jsp" />