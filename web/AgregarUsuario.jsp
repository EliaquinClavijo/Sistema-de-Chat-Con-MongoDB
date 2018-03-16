<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<%@ page session="true" %>


<jsp:useBean id="Encriptar" class="cSeguridad.cMD" scope="page"/>
<% 
        
    String Nombre = "";
    String Apellido = "";
    String Email = "";
    String Clave = "";
    String Telefono = "";
    String Ocupacion = "";
    String Pais = "";
    String CodigoInit = "";
    String Cuidad = "";
    String Foto= "defaul.jpg";

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
    if (request.getParameter("CodigoInit") != null) {
         CodigoInit = request.getParameter("CodigoInit");
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
    boolean Procede = false;
    MongoClient clienteMongo1 = new MongoClient("127.0.0.1", 27017);
                DB baseDatos1 =  clienteMongo1.getDB("yptBD");
                DBCollection miColeccion1 = baseDatos1.getCollection("Claves");
                DBCursor cursor1 = miColeccion1.find();;
           
                
                while (cursor1.hasNext()) {
                    
                        DBObject G = cursor1.next();
                        if (G.get("codigo").toString().equals(CodigoInit) && G.get("use").toString().equals("0"))
                        {
                            Procede = true;
                            BasicDBObject Mens_update = new BasicDBObject();
                            Mens_update.append("$set", new BasicDBObject().append("use", 1));
                            miColeccion1.update(G,Mens_update);
                        }
                }
    

    String Clave1 = Encriptar.getStringMessageDigest(Clave, Encriptar.SHA256); 

    %>
        <jsp:useBean id="NewUser" class="Autentication.cRegistro" scope = "session">
                
        </jsp:useBean>
     <%
         NewUser.setaNombre(Nombre);
         NewUser.setaApellido(Apellido);
         NewUser.setaContrasena(Clave1);
         NewUser.setaCiudad(Cuidad);
         NewUser.setaOcupacion(Ocupacion);
         NewUser.setaPais(Pais);
         NewUser.setaTelefono(Telefono);
         NewUser.setaFoto(Foto);
         NewUser.setaEmail(Email);
         if (Procede){
         NewUser.Insertar();}
     %>



<jsp:forward page="index.jsp" />



 