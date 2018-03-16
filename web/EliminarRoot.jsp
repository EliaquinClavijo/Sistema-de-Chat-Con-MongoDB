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
    <body >
        <form class="form-horizontal" method="post"  role="form" action="EliminarRootMain.jsp" >
                                <h3> Usuarios </h3>
                                <%
                                    MongoClient clienteMongo = new MongoClient("127.0.0.1", 27017);
                                    MongoDatabase baseDatos = clienteMongo.getDatabase("yptBD");
                                    MongoCollection<Document> miColeccion = baseDatos.getCollection("Usuarios");
                                    MongoCursor<Document> cursor;
                                    cursor = miColeccion.find().iterator();
                                    String A  = "";
                                    String B = "" ;
                                    while (cursor.hasNext()) {
                                    BasicDBObject G = BasicDBObject.parse( cursor.next().toJson());
                                    if (!G.getString("nombre").equals(usuario.toString()))
                                    {
                                        A =G.getString("foto");
                                        B =G .getString("nombre");
                                        

                                    %>
                                            <li class="w3-padding-16" >
                                            <img src="04muestraImg.jsp?imagen=<%=A%>" class="w3-circle w3-margin-right" style="width:25px">

                                            
                                                <label><input type="checkbox" name ="Agregar" value="<%=B%>"><%=" "+B%></label>
                                            

                                     
                                            <br>
                                            </li> 

                                            <%
                                       } }
                                cursor.close();
                                %>
                                
                                
                                <button type="submit" value="enviar" href="#" class="w3-button w3-block">Eliminar</button>
                              <br>
                              </form>
    </body>
</html>
