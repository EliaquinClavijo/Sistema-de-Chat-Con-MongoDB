
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.DB"%>
<%@page import ="com.mongodb.BasicDBObject"%>
          <%@page import ="com.mongodb.Block"%>
        <%@page import ="com.mongodb.MongoClient"%>
        <%@page import ="com.mongodb.client.FindIterable"%>
        <%@page import ="com.mongodb.client.MongoCollection"%>
        <%@page import ="com.mongodb.client.MongoCursor"%>
        <%@page import ="com.mongodb.client.MongoDatabase"%>
        
        <%@page import ="org.bson.Document"%>
         <%@page import ="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
        <%@page import ="java.io.File"%>
        <%@page import ="java.util.ArrayList"%>
        <%@page import ="java.util.Scanner"%>
        <%@page import ="java.util.Set"%>
        <%@page import ="java.util.regex.Pattern"%>
        <%@page import ="javax.swing.JFileChooser"%>
        <%@page import ="javax.swing.filechooser.FileNameExtensionFilter"%>

        <jsp:useBean id="Encriptar" class="cSeguridad.cMD" scope="page"/>
<%  
    
   
            MongoClient clienteMongo = new MongoClient("127.0.0.1", 27017);
            
            MongoDatabase baseDatos = clienteMongo.getDatabase("yptBD");
            
            MongoCollection<Document> miColeccion = baseDatos.getCollection("Usuarios");
            String usuario = "";
    String clave = "";
    String clave1 = "";
    if (request.getParameter("usuario") != null) {
        usuario = request.getParameter("usuario");
    }
    if (request.getParameter("clave") != null) {
        clave1 = request.getParameter("clave");
    }
    clave=Encriptar.getStringMessageDigest(clave1, Encriptar.SHA256);
    %>
        <jsp:useBean id="miLogin" class="Autentication.cLogin" scope="session">
            
        </jsp:useBean>
        <%
            miLogin.setaUsuario(usuario);
            miLogin.setaContraseña(clave);
         if(miLogin.ValidarLogIn()){
        HttpSession sesionOK = request.getSession();  
        
        sesionOK.setAttribute("usuario", usuario);
        sesionOK.setAttribute("isLogin", "true");
        if (usuario.equals("Yuliza")) {     
        %>
        
        <jsp:forward page="pagina_principale.jsp" />
        <%
        } else {
        %>
                <jsp:forward page="pagina_principale.jsp" />
        <%
        }
        }
else {
%>
<jsp:forward page="index.jsp">
    <jsp:param name="error" value="Usuario y/o clave incorrectos.<br>Vuelve a intentarlo."/>
</jsp:forward>
<%    }
%>