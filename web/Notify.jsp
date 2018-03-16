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

                String Host = usuario;
                MongoClient clienteMongo = new MongoClient("127.0.0.1", 27017);
                DB baseDatos =  clienteMongo.getDB("yptBD");
                DBCollection miColeccion = baseDatos.getCollection("Mensajes");
                DBCursor cursor = miColeccion.find();;
           

                
                while (cursor.hasNext()) {
                    
                DBObject G = cursor.next();
                if (G.get("host").toString().equals(Host.toString())){
                    if(G.get("estado").toString().compareTo("0") == 0){
                                %>
                                <script>
                                    Notificate("<%=G.get("visit").toString()%>", "<%=G.get("mensaje").toString()%>");
                                </script>
                                <%
                                //Actualizar la base
                                BasicDBObject Mens_update = new BasicDBObject();
                                Mens_update.append("$set", new BasicDBObject().append("estado", 1));
                                miColeccion.update(G,Mens_update);
                            }        
                              }
                            }
                            
             cursor.close();
        
%>
