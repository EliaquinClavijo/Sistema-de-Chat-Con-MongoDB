<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@ page session="true" %>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                 
        <%
                String Host = usuario;
                String Visit = request.getParameter("UsuarioD");
                MongoClient clienteMongo = new MongoClient("127.0.0.1", 27017);
                DB baseDatos =  clienteMongo.getDB("yptBD");
                DBCollection miColeccion = baseDatos.getCollection("Mensajes");
                DBCursor cursor = miColeccion.find();;
           
                String Mensaje = "";
                String Host2 = "";
                String Fecha = "";
                String Tipo = "";
                String Estado = "";
                
         
                while (cursor.hasNext()) {
                    
                            DBObject G = cursor.next();
                            if ((G.get("host").toString().equals(Host.toString()) && G.get("visit").toString().equals(Visit.toString())) || (G.get("visit").toString().equals(Host.toString()) && G.get("host").toString().equals(Visit.toString()) )){
                                
                                
                                if(G.get("estado").toString().compareTo("0") == 0 && Visit.compareTo(G.get("visit").toString()) == 0){
					    
                                             //Actualizar la base
					    BasicDBObject Mens_update = new BasicDBObject();
					    Mens_update.append("$set", new BasicDBObject().append("estado", 1));
					    miColeccion.update(G,Mens_update);
					}        
                            %>
                                <div class="w3-container">
                                <%
                                Mensaje = G.get("mensaje").toString();
                                Host2 =G.get("visit").toString();
                                Fecha = G.get("fecha").toString();
                                Tipo =G.get("tipo").toString();
                                Estado =  G.get("estado").toString();
                                
                                %> 
                                <h5 class="w3-opacity"><b><%=Host2%></b></h5>
                                <h6 class="w3-text-teal"><%=Fecha%></h6>
                                
                                <% if (Tipo.equals("0")){ %> 
                                <p><%=Mensaje%></p>
                                <%} else {%>
                                
                                 <a href="DownloadArchivo.jsp?Name=<%=Mensaje%>" download="<%=Mensaje%>">
                                <p><%=Mensaje%></p>
                                </a>
                                <%}%>
                                <hr>
                                </div> 
                                <%
                              }
                            }
                            
             cursor.close();
        %>
        
    </body>
</html>
