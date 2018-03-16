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
  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
             
            <%
                String Nombre = "Magna";//request.getParameter("UsuarioD");
                MongoClient clienteMongo = new MongoClient("127.0.0.1", 27017);
                MongoDatabase baseDatos = clienteMongo.getDatabase("yptBD");
                MongoCollection<Document> miColeccion = baseDatos.getCollection("Usuarios");
                MongoCursor<Document> cursor;
                cursor = miColeccion.find().iterator();
                String Apellido = "";
                String Email = "";
                String Telefono = "";
                String Ocupacion = "";
                String Pais = "";
                String Ciudad = "";
                String Imagen = "";
                while (cursor.hasNext()) {
                            BasicDBObject G = BasicDBObject.parse( cursor.next().toJson());
                            if (G.getString("nombre").equals(Nombre.toString())){
                                Apellido = G.getString("apellido");
                                Email =G.getString("email");
                                Telefono = G.getString("telefono");
                                Ocupacion =G.getString("ocupacion");
                                Pais =  G.getString("pais");
                                Ciudad = G.getString("ciudad");
                                Imagen = G.getString("foto");
                                break;
                              }
                            }
                            
             cursor.close();
            %>     
    <div class="w3-container">
        <hr>
         <div class="w3-container">
            
          <img id="yulip" src="04muestraImg.jsp?imagen=<%=Imagen%>" style="width:100%" alt="Avatar">
         
           <ul id ="yuli123" class="nav nav-tabs">
            <li><h2 id="yuli1_2" class="w3-opacity"><%=" "+ Nombre + " "+ Apellido     %></h2></li>
           </ul> 
         
        </div>
        
        <hr>
        <div class="w3-container">
          <p><i class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-blue-grey"></i><%=Ocupacion%></p>
          <p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-blue-grey"></i><%=Ciudad+", "+Pais%></p>
          <p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-blue-grey"></i><%=Email%></p>
          <p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-blue-grey"></i><%=Telefono%></p>
          <br>
        </div>
    </div>
    </body>
</html>
