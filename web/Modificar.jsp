<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
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
<jsp:useBean id="Encriptar" class="cSeguridad.cMD" scope="page"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         
    </head>

    <body>
        
        

<% 
        
    String Nombre = "";
    String Apellido = "";
    String Email = "";
    String Clave = "";
    String ClaveNueva = "";
    String Telefono = "";
    String Ocupacion = "";
    String Pais = "";
    String Cuidad = "";
   

    if (request.getParameter("firstname") != null){
        Nombre=request.getParameter("firstname");
    }
    if (request.getParameter("lastname") != null) {
        Apellido = request.getParameter("lastname");
    }
    if (request.getParameter("email") != null) {
        Email = request.getParameter("email");
    }
    if (request.getParameter("clave") != null) {
        Clave = request.getParameter("clave");
    }
    if (request.getParameter("clavenueva") != null) {
        ClaveNueva = request.getParameter("clavenueva");
    }
    if (request.getParameter("telefono") != null) {
        Telefono = request.getParameter("telefono");
    }
    if (request.getParameter("ocupacion") != null) {
        Ocupacion = request.getParameter("ocupacion");
    }
    if (request.getParameter("ciudad") != null) {
        Cuidad = request.getParameter("ciudad");
    }
    if (request.getParameter("country") != null) {
        Pais = request.getParameter("country");
    }
    String Clave1 = "";
    
    
    Clave1 = Encriptar.getStringMessageDigest(Clave, Encriptar.SHA256); 
    
    
        
	MongoClient mCliente = new MongoClient("127.0.0.1",27017);
	DB db = mCliente.getDB("yptBD");
	DBCollection coleccion = db.getCollection("Usuarios");
	BasicDBObject doc = new BasicDBObject();
	doc.put("nombre", usuario);
	doc.put("clave", Clave1);
	DBCursor cursor = coleccion.find(doc);
	if(cursor.hasNext()){
	    BasicDBObject doc_update = new BasicDBObject();
            
            if (Nombre !=""){
                   BasicDBObject doc1 = new BasicDBObject();
                   doc1.put("nombre", Nombre);
                   DBCursor cursor1 = coleccion.find(doc1); 
                   if (!cursor1.hasNext()){
                   doc_update.append("$set", new BasicDBObject().append("nombre", Nombre));
                   HttpSession sesionOK = request.getSession();  
                   sesionOK.setAttribute("usuario", Nombre);
                  
                   coleccion.update(doc, doc_update);
                   
                   }
                   else{
                   %>
                   
                   <script type="text/javascript"> window.onload = alertName; </script>
                  
                   <%
                   }
            }
            
            if (Apellido !=""){
                   doc_update.append("$set", new BasicDBObject().append("apellido", Apellido));
                   coleccion.update(doc, doc_update);
            }
            if (Email !=""){
                   doc_update.append("$set", new BasicDBObject().append("email", Email));
                   coleccion.update(doc, doc_update);
            }
            
            if ( ClaveNueva!=""){
                
                   String ClaveNueva1 = Encriptar.getStringMessageDigest(ClaveNueva, Encriptar.SHA256);
                   doc_update.append("$set", new BasicDBObject().append("clave", ClaveNueva1));
                   coleccion.update(doc, doc_update);
            }
            
            if (Telefono !=""){
                   doc_update.append("$set", new BasicDBObject().append("telefono", Telefono));
                   coleccion.update(doc, doc_update);
            }
            
            if (Ocupacion !=""){
                   doc_update.append("$set", new BasicDBObject().append("ocupacion", Ocupacion));
                   coleccion.update(doc, doc_update);
            }
            if (Cuidad !=""){
                   doc_update.append("$set", new BasicDBObject().append("ciudad", Cuidad));
                   coleccion.update(doc, doc_update);
            }
            if (Pais !=""){
                   doc_update.append("$set", new BasicDBObject().append("pais",Pais));
                   coleccion.update(doc, doc_update);
            }
            mCliente.close();
	    %>
	    <jsp:forward page="pagina_principale.jsp"/>
	    <%
	} else{
	    %>
            out.print("Error");
	    <script>alert('Contraseña incorrecta. Inténtelo nuevamente');</script>
	    <jsp:forward page="pagina_principale.jsp"/>
	    <%
	}
        %>
    

    %>
    </body>
</html>
