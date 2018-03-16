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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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

            <jsp:useBean id="Encriptar" class="cSeguridad.cMD" scope="page"/>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta http-equiv="Content-Type" content="text/html;
         charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="wstylesheet" type="text/css" href="estilos.css">
        <script src="js/jquery-3.1.1.min.js"></script>idth=device-width, initial-scale=1.0">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="estilos.css">
        <script src="js/jquery-3.1.1.min.js"></script>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet"> 
        <script src="refresh.js" language="JavaScript" type="text/javascript"></script>
        <script src="push.js/push.min.js"></script>
        <script>
	    function Notificate(from, text){
		sub = from + ': '+text;
		Push.create('Nuevo mensaje de '+from, {
		    body: sub,
		    timeout: 5000
		});
	    }
	</script>
        
    </head>
    <style>
            html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
            
             .custom-input-file input[type="file"] {
    border: 0;
    clip: rect(0 0 0 0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
        </style>
        
      <%
                String Name =request.getParameter("NameGrupo");
                String Nombre = usuario;
                MongoClient clienteMongo = new MongoClient("127.0.0.1", 27017);
                MongoDatabase baseDatos = clienteMongo.getDatabase("yptBD");
                MongoCollection<Document> miColeccion = baseDatos.getCollection("Usuarios");
                MongoCursor<Document> cursor;
                cursor = miColeccion.find().iterator();
                String Apellido = "";
                while (cursor.hasNext()) {
                            BasicDBObject G = BasicDBObject.parse( cursor.next().toJson());
                            if (G.getString("nombre").equals(Nombre.toString())){
                                Apellido = G.getString("apellido");
                                break;
                              }
                            }
             cursor.close();
             

            %> 
    <body class="w3-light-grey">

            <header class="w3-container w3-light-grey w3-center w3-margin-top">                
                  <h2 class="w3-opacity" align="CENTER" > BENVENUTO NELLA CHAT</h2>

                    <ul class="nav navbar-nav navbar-right">
                      <li><a href="pagina_principale.jsp"><span class="glyphicon glyphicon-user"></span><%=" "+ Nombre + " "+ Apellido%></a></li>
                      <li><a href="cerrar.jsp"><span class="glyphicon glyphicon-log-in"></span> Get out</a></li>
                    </ul>
            </header>

            <div class="w3-content w3-margin-top" style="max-width:1400px;">

                  <!-- The Grid -->
                  <div class="w3-row-padding">
                  
                    <!-- Left Column -->
                    <div  class="w3-third" >
  
                    

                      <div class="w3-white w3-text-grey w3-card-4">
                            <div id="replace4" class="w3-display-container">
                              <br> 
                              <form  id="Menu_1" name="Yuli" method="POST">
                             <div  class="w3-container">   
                                <p class="w3-large w3-text-theme"><b><i class="fa fa-globe fa-fw w3-margin-right w3-text-blue-grey"></i>Chats</b></p>
                                <ul class="nav nav-tabs">
                                  <li><a  id="Amigos2" href="#">Activos</a></li>
                                  <li><a id="Amigos1" href="#">Amigos</a></li>
                                  <li><a id="Chat_Grupo" href="#">Grupos</a></li>
                                  <input type="hidden" name="grupo" value="<%=Name%>">
                                  <li><a id="PerfilGrupo" href="#">Imagen Grupo </a></li>
                                  </ul>
                            </div>
                              </form>

                            <div id="Replace2">
                            <hr>
                            <%
                            MongoCollection<Document> miColeccion2 = baseDatos.getCollection("Grupos");
                            MongoCursor<Document> cursor2;
                            cursor2 = miColeccion2.find().iterator();
                            String NombreGrupo = Name;
                            String ImagenGrupo = "" ;
                            while (cursor2.hasNext()) {
                                BasicDBObject G = BasicDBObject.parse( cursor2.next().toJson());
                                if (G.getString("nombre").equals(Name))
                                {
                                    ImagenGrupo = G.getString("foto");
                                }
                                }
                            cursor2.close();
                            %>
                             <div class="w3-container">
                                
                              <img id="yulip" src="04muestraImg.jsp?imagen=<%=ImagenGrupo%>" style="width:100%" alt="Avatar">
                             
                               <ul id ="yuli123" class="nav nav-tabs">
                                <li><h2 id="yuli1_2" class="w3-opacity"><%=NombreGrupo%></h2></li>
                                
                               </ul> 
                             
                            </div>
                            
                            <hr>

                            <div class="w3-container">
                              <form id="users" name="Yuli11" method="get" action="Mensajes.jsp" >
                                <h3> Participantes </h3>
                                <%
                                    String A  = "";
                                    String B = "" ;
                                    boolean c;
                                    boolean Admi = false; 
                                    boolean esta;
                                    
                                MongoCollection<Document> miColeccion1 = baseDatos.getCollection("Usuarios");
                                MongoCursor<Document> cursor1;
                                cursor1 = miColeccion1.find().iterator();
                                while (cursor1.hasNext()) {
                                    BasicDBObject G = BasicDBObject.parse( cursor1.next().toJson());
                                    esta = false;
                                    boolean Gfe = false;
                                    MongoCollection<Document> miColeccion4 = baseDatos.getCollection(Name);
                                    MongoCursor<Document> cursor4;
                                    cursor4 = miColeccion4.find().iterator();
                                    while (cursor4.hasNext()) {
                                        BasicDBObject GGf = BasicDBObject.parse( cursor4.next().toJson());
                                        if(GGf.getString("nombre").equals(G.getString("nombre")))
                                        {
                                            if (GGf.getString("administrador").equals("1"))
                                            {
                                                Gfe = true;
                                                if (G.getString("nombre").equals(usuario.toString()))
                                                {
                                                    Admi = true;
                                                }
                                            }
                                            esta = true;
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

                                            <input class="w3-opacity w3-medium" id="wtf" name = "UsuarioD" type ="submit" value="<%=B%>" />

                                             <%                  
                                             if(c){ %>
                                                - <span  class="w3-tag w3-blue-grey w3-round" align="right">  Activo </span>
                                             <% }   %>
                                             
                                             <%                  
                                             if(Gfe){ %>
                                                - <span  class="w3-tag w3-light-grey w3-round" align="right">  Administrador </span>
                                             <% }   %>
                                            
                                            <br>
                                            </li> 

                                            <%
                                        }
                                                        }
                                cursor1.close();
                                %>
                              <br>
                              </form>
                            </div>
                            </div>
                          
                          </div>
                      </div>
                      <br>
                    </div>
                    <!-- End Left Column -->
                    <!-- Right Column -->
                    <div class="w3-twothird" id="Replace1">
                      <div id="replace3" class="w3-container w3-card w3-white w3-margin-bottom">
                          <form  id="Chat_Grupo" name="Yuli1" method="POST">
                              
                                <ul class="nav navbar-nav navbar-right">
                                   
                                    <li><a id="Explore" href="#">Explorar Grupos</a></li>
                                     <li><a id="Create" href="#">Crear Grupo</a></li>
                                </ul>
                          </form>
                          
                                    <form id="Menu_10" name="Yuli" method="POST">
                                        <ul class="nav navbar-nav navbar-right">
                                    <li class="dropdown">
                                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
                                            aria-expanded="false">Opciones <span class="caret"></span>
                                      </a>
                                      <ul class="dropdown-menu" role="menu">
                                         <input type="hidden" name="NameGrupo" value="<%=Name%>">
                                    <% if (Admi){%>     
                                         <li><a id="Agregar_User" href="#">Agregar Participante</a></li>
                                        <li><a id="Eliminar_User" href="#">Eliminar Participante</a></li>
                                       <li><a href="#">Hacer Administrador</a></li>
                                       <li class="divider"></li>
                                    <%}%>   
                                        
                                       <li><a href="SalirGrupo.jsp?NameGrupo=<%=Name%>">Abandonar Grupo</a></li>
                                      </ul>
                                    </li>
                                        </ul>
                                    </form>
                                  
                        <h2 class="w3-text-grey w3-padding-16">Conversaciones</h2>
                         
                      
                        
                        <div id="Refresh" class="w3-container">
                          
                        </div>
                        <script>
                        $(document).ready(function() {
                              var refreshId =  setInterval( function(){
                            $('#Refresh').load('Chat_Multi.jsp?UsuarioD=<%=Name%>');//actualizas el div
                           }, 2000 );
                        });

                        </script>
                        

                        <div class="w3-container">
                            <form  class="message-box" method="post" enctype="multipart/form-data" action = "enviarmensajegrupo.jsp">
                            <input type="hidden" name = "UsuarioD" value= <%=Name%>>
                            <div class="col-sm-10 col-xs-10 reply-main">
                                <input  type="text" name="Mensaje" class="form-control" rows="1" id="comment">
                            </div>
                            <div class="col-sm-1 col-xs-1">
                                <div class="custom-input-file"> 
                                <label class="a-Button" for="send1"> 
                                   <i class="fa fa-paperclip fa-2x"></i> 
                                </label>  
                                <input  type="file" id ="send1" name="fichero1">
                                </div>    
                            </div>
                            <div class="col-sm-1 col-xs-1 reply-send">
                                <button type="submit" value="enviar" class="fa fa-send fa-2x" aria-hidden="true"></button>
                            </div>
                            </form>
                        </div>
                        <br>
                      </div>
                    <!-- End Right Column -->
                    </div>
                    
                  <!-- End Grid -->
                  </div>
                            
                        <div id="reload" >
                          
                        </div>
                        <script>
                        $(document).ready(function() {
                              var refreshId =  setInterval( function(){
                            $('#reload').load('Notify.jsp');//actualizas el div
                           }, 1000 );
                        });
                        
                        $(document).ready(function() {
                              var refreshId =  setInterval( function(){
                            $('#reload').load('NotifyGroup.jsp');//actualizas el div
                           }, 1000 );
                        });

                        </script>
                  
                  <!-- End Page Container -->
                </div>

                <footer class="w3-container w3-light-grey w3-center w3-margin-top">
                  <p>Find us on social media.</p>
                  <i class="fa fa-facebook-official w3-hover-opacity"></i>
                  <i class="fa fa-instagram w3-hover-opacity"></i>
                  <i class="fa fa-snapchat w3-hover-opacity"></i>
                  <i class="fa fa-pinterest-p w3-hover-opacity"></i>
                  <i class="fa fa-twitter w3-hover-opacity"></i>
                  <i class="fa fa-linkedin w3-hover-opacity"></i>
                  <p>Powered by <a href="https://www.youtube.com/watch?v=w-yKG6Auhlw" target="_blank">eliaquinmusic</a></p>
                </footer>

                <script>                    
            $(document).ready(function () {
                $("#Chat_Grupo").click(function (event) {
                    $.ajax({
                        data: $("#Menu_1").serialize(),
                        url: "Grupo_Chat.jsp",
                        type:"POST",
                        success:
                                function (result) {
                                    $("#Replace1").html(result);
                                }});
                });
            });        

            $(document).ready(function () {
                $("#Chat_Grupo").click(function (event) {
                    $.ajax({
                        data: $("#Menu_1").serialize(),
                        url: "Lista_Grupos.jsp",
                        type:"POST",
                        success:
                                function (result) {
                                    $("#Replace2").html(result);
                                }});
                });
            }); 
            
            $(document).ready(function () {
                $("#Amigos1").click(function (event) {
                    $.ajax({
                        data: $("#Menu_1").serialize(),
                        url: "Amigos.jsp",
                        type:"POST",
                        success:
                                function (result) {
                                    $("#Replace2").html(result);
                                }});
                });
            }); 
            $(document).ready(function () {
                $("#Amigos2").click(function (event) {
                    $.ajax({
                        data: $("#Menu_1").serialize(),
                        url: "Amigos2.jsp",
                        type:"POST",
                        success:
                                function (result) {
                                    $("#Replace2").html(result);
                                }});
                });
            }); 
            
            $(document).ready(function () {
                $("#Mod_All").click(function (event) {
                    $.ajax({
                        data: $("#Menu_1").serialize(),
                        url: "Mod_Perfil.jsp",
                        type:"POST",
                        success:
                                function (result) {
                                    $("#Replace1").html(result);
                                }});
                });
            });   
            
            $(document).ready(function () {
                $("#PerfilGrupo").click(function (event) {
                    $.ajax({
                        data: $("#Menu_1").serialize(),
                        url: "FotoPerfilGrupo.jsp",
                        type:"POST",
                        success:
                                function (result) {
                                    $("#Replace2").html(result);
                                }});
                });
            }); 
            
                                 
            $(document).ready(function () {
                $("#Explore").click(function (event) {
                    $.ajax({
                        data: $("#Chat_Grupo").serialize(),
                        url: "IngresarGrupo.jsp",
                        type:"POST",
                        success:
                                function (result) {
                                    $("#replace3").html(result);
                                }});
                });
            });

            $(document).ready(function () {
                $("#Create").click(function (event) {
                    $.ajax({
                        data: $("#Chat_Grupo").serialize(),
                        url: "CrearGrupo.jsp",
                        type:"POST",
                        success:
                                function (result) {
                                    $("#replace3").html(result);
                                }});
                });
            });


             $(document).ready(function () {
                $("#Eliminar_User").click(function (event) {
                    $.ajax({
                        data: $("#Menu_10").serialize(),
                        url: "Usuarios_Mod.jsp",
                        type:"POST",
                        success:
                                function (result) {
                                    $("#Replace2").html(result);
                                }});
                });
            });  
                
                $(document).ready(function () {
                $("#Agregar_User").click(function (event) {
                    $.ajax({
                        data: $("#Menu_10").serialize(),
                        url: "AgregarGrupo.jsp",
                        type:"POST",
                        success:
                                function (result) {
                                    $("#Replace2").html(result);
                                }});
                });
            });  
        </script>
        
        <script src="js/jquery-2.2.4.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>