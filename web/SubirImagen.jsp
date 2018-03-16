<%-- 
    Document   : pagina_principale
    Created on : 10-gen-2018, 1.01.10
    Author     : User
--%>
<%@page import="com.mongodb.DB"%>
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


<%@page import="cConexion.cBD"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="org.bson.types.ObjectId"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.gridfs.model.GridFSUploadOptions"%>
<%@page import="com.mongodb.client.gridfs.GridFSBuckets"%>
<%@page import="com.mongodb.client.gridfs.GridFSBucket"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="org.apache.tomcat.util.http.fileupload.util.Streams"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItemStream"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItemIterator"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
            
                    
            // creando nuevo archivo para manejar las subidas
            ServletFileUpload paSubir = new ServletFileUpload();
            // gestionando el o los archivos subidos
            FileItemIterator iter = paSubir.getItemIterator(request);
            while (iter.hasNext()) {
                FileItemStream item = iter.next();
                InputStream stream = item.openStream();
                if (item.isFormField()) {
                    out.println(Streams.asString(stream) + " detectado.<BR>");
                } else {//desde este modulo podemos hacer loq ue querramos con el INPUTSTREAM
                    out.println(item.getName() + " ha sido subido a la BD.<br>");
                    String nombreArch = item.getName();

                    //INSERTAR EN BD
                    //conexio a base de datos
                    MongoClient miCliente = new MongoClient("127.0.0.1", 27017);
                    MongoDatabase baseDatos = miCliente.getDatabase("yptBD");
                    GridFSBucket gridFSBucket = GridFSBuckets.create(baseDatos, "misArchivos");

                    GridFSUploadOptions opciones = new GridFSUploadOptions()
                            .chunkSizeBytes(1024)
                            
                           .metadata(new Document("tipo", "imagen"));
                    ObjectId fileId = gridFSBucket.uploadFromStream(nombreArch, stream, opciones);
                    
                    DB baseDatos1 = miCliente.getDB("yptBD");
                    DBCollection C = baseDatos1.getCollection("Usuarios");
                    
                    BasicDBObject query = new BasicDBObject();
                    query.put("nombre", usuario);
                    
                    BasicDBObject act = new BasicDBObject();
                    act.append("$set", new BasicDBObject().append("foto", nombreArch));
                    C.update(query, act);
                    
                    stream.close();
                }
            }
            
        %>

<jsp:forward page="pagina_principale.jsp" />