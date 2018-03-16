

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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="w3-container">
                              <form class="form-horizontal" method="post"  role="form" action="UsuariosModMain.jsp" >
                                <h3> Participantes </h3>
                                <%
                                    String Name = "";
                                    Name = request.getParameter("NameGrupo");
                                    
                                    MongoClient clienteMongo = new MongoClient("127.0.0.1", 27017);
                                    MongoDatabase baseDatos = clienteMongo.getDatabase("yptBD");
                                    String A  = "";
                                    String B = "" ;
                                    boolean c;
                                    boolean esta;
                                    
                                MongoCollection<Document> miColeccion1 = baseDatos.getCollection("Usuarios");
                                MongoCursor<Document> cursor1;
                                cursor1 = miColeccion1.find().iterator();
                                while (cursor1.hasNext()) {
                                    BasicDBObject G = BasicDBObject.parse( cursor1.next().toJson());
                                    esta = false;
                                    MongoCollection<Document> miColeccion4 = baseDatos.getCollection(Name);
                                    MongoCursor<Document> cursor4;
                                    cursor4 = miColeccion4.find().iterator();
                                    while (cursor4.hasNext()) {
                                        BasicDBObject GGf = BasicDBObject.parse( cursor4.next().toJson());
                                        if(GGf.getString("nombre").equals(G.getString("nombre")))
                                        {
                                            esta = true;
                                            if (GGf.getString("administrador").equals("1"))
                                            {
                                                esta = false;
                                            }
                                            break;
                                        }
                                    }
                                    cursor4.close();
                                    
                                    if (esta==true)
                                        {
                                            A =G.getString("foto");
                                            B =G .getString("nombre");
                                            c=G.getBoolean("Conectado");

                                            %>
                    
                                            <li class="w3-padding-16">
                                            <img src="04muestraImg.jsp?imagen=<%=A%>" class="w3-left w3-circle w3-margin-right" style="width:25px">

                                            
                                                <label><input type="checkbox" name ="Agregar" value="<%=B%>"><%=" "+B%></label>
                                            

                                     
                                            </a><br>
                                            </li> 

                                            <%
                                        }
                                                        }
                                cursor1.close();
                                %>
                                <input type="hidden" name="NameGrupo" value="<%=Name%>">
                                <button type="submit" value="enviar" href="#" class="w3-button w3-block">Eliminar</button>
                              <br>
                              </form>
                            </div>
    </body>
</html>
