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
<html>
    <head>

        <%
        MongoClient clienteMongo = new MongoClient("127.0.0.1", 27017);
        MongoDatabase baseDatos = clienteMongo.getDatabase("yptBD");
        MongoCollection<Document> miColeccion = baseDatos.getCollection("Usuarios");
        MongoCursor<Document> cursor;
        cursor = miColeccion.find().iterator();
        String A  = "";
        String B = "" ;
        boolean c;
   
   
    
           %>

    </head>
    
    <body class="w3-light-grey">
       
          <div id="Replace7" class="w3-display-container">
              <br>               
               
              <div class="w3-container">
                 
                <ul class="w3-ul w3-card-4 w3-white">
                
                    <form id="users" name="Yuli11" method="post" action="Mensajes.jsp" >
                      <%
                      while (cursor.hasNext()) {
                BasicDBObject G = BasicDBObject.parse( cursor.next().toJson());
                if (!G.getString("nombre").equals(usuario.toString()))
                {
                    A =G.getString("foto");
                    B =G .getString("nombre");
                    c=G.getBoolean("Conectado");
                    
                    %>
                    
                    <li class="w3-padding-16">
                    <img src="04muestraImg.jsp?imagen=<%=A%>" class="w3-left w3-circle w3-margin-right" style="width:25px">

                    <input class="w3-opacity w3-medium" id="wtf" name = "UsuarioD" type ="submit" value="<%=B%>" />
                    
                     <%                  
                     if(c){ %>
                        - <span  class="w3-tag w3-blue-grey w3-round" align="right">  Activo </span>
                     <% }   %>
                    <br>
                    </li> 
                    
                    <%
                }
               // break;
            }
            cursor.close();
            %>
                   </form> 
    
                </ul>
             

            </div>
           <br> 

          </div>

         
        <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
 
    </body>
    
    
</html>

