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
<jsp:useBean id="miLogin" class="Autentication.cLogin" scope="session">
            
</jsp:useBean>
 <%
         miLogin.setaUsuario(usuario);
         miLogin.setaContrase�a("*****");
         miLogin.Salir();
              
         sesionOk.invalidate();
               
  %>
<jsp:forward page="index.jsp" />