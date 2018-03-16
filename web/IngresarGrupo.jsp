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
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>    
    </head>
    <body >
        
        <%
        MongoClient clienteMongo = new MongoClient("127.0.0.1", 27017);
        MongoDatabase baseDatos = clienteMongo.getDatabase("yptBD");
        MongoCollection<Document> miColeccion = baseDatos.getCollection("Grupos");
        MongoCursor<Document> cursor;
        cursor = miColeccion.find().iterator();
        String Nombre  = "";
        String Foto = "" ;
       
   
   
    
           %>
            <div class="w3-container w3-padding-64 w3-center" id="team">
                  <h2 class="w3-text-grey w3-padding-16"> Grupos</h2>
                  <p class="w3-text-grey w3-padding-16"> Comparte experiencias con nosotros y con los tuyos </p>
                <form id="users" name="Yuli11" method="post" action="IngresarGrupoFree.jsp" >
                  <div class="w3-row"><br>
                     <%
                      while (cursor.hasNext()) {
                    
                    BasicDBObject G = BasicDBObject.parse( cursor.next().toJson());
                
                    Nombre =G.getString("nombre");
                    Foto =G .getString("foto");
                    
                    if (G.getString("privacidad").equals("1")){
                    %>
                   

                  <div class="w3-quarter">
                    <img src="04muestraImg.jsp?imagen=<%=Foto%>" alt="Boss" style="width:45%" class="w3-circle w3-hover-opacity">
                      <h4 class="w3-text-grey w3-padding-16"><input class="w3-opacity w3-medium" id="wtf" name = "GrupoD" type ="submit" value="<%=Nombre%>" /></h4>
                    
                  </div>
                  
                    
                    
               <%
                }
            }
            cursor.close();
            %>

                  </div>
                </form>
             </div>
                                
             
    </body>
</html>