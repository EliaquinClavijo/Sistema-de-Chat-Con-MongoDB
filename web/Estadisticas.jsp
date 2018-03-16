<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.DBCollection"%>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%   
        MongoClient clienteMongo = new MongoClient("127.0.0.1", 27017);
        MongoDatabase baseDatos = clienteMongo.getDatabase("yptBD");
        MongoCollection<Document> miColeccion = baseDatos.getCollection("Usuarios");
        MongoCursor<Document> cursor;
        cursor = miColeccion.find().iterator();
        String Usuario  = "";
        String Enviados = "" ;
        String Recibidos = "" ;
        %>
        <script>  var myVinyls=[];  </script>
        <%
        while (cursor.hasNext()) 
        {
                    BasicDBObject G = BasicDBObject.parse( cursor.next().toJson());
              
                    Usuario = G.getString("nombre");
                    Enviados = G.getString("enviados");
                    out.print("<script>"
                            + "var elm= "+Usuario+":"+Integer.valueOf(Enviados)+";"
                            + "myVinyls.push(elm);"
                            + "</script>");
                    
                    Recibidos = G.getString("recibidos");
                    
                    out.println(Usuario+" envio: "+Enviados+ "  recibio :"+Recibidos + " Mensajes.");
                    %>
                    <br>
                    <%
        }
          %>
         
        <canvas id="myCanvas" style="background: white;"></canvas>
        <legend for="myCanvas"></legend>
        <script type="text/javascript" src="script.js"></script>
    </body>
</html>
