<%@ page session="true" %>

<%
    String usuario = "";
    String haySesion = "";
    HttpSession sesionOk = request.getSession();
    if ((sesionOk.getAttribute("usuario") == null) || (((String) sesionOk.getAttribute("usuario")).equals("Eliaquin")==false)){
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
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta http-equiv="Content-Type" content="text/html;
         charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="stylesheet" type="text/css" href="estilos.css">
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
        <script type="text/javascript">
        function alertName(){
        alert("Ya existe el usuario");
        } 
        </script>
        
    </head>
    <style>
            html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
        </style>
    <body class="w3-light-grey">

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

            
            <%
                String Nombre = usuario;
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

               



            <header class="w3-container w3-light-grey w3-center w3-margin-top">                
                  <h2 class="w3-opacity" align="CENTER" >  BENVENUTO NELLA CHAT (root) </h2>
                  
                    
                    <ul class="nav navbar-nav navbar-right">
                      <li><a href="Root.jsp"><span class="glyphicon glyphicon-user"></span><%=" "+ Nombre + " "+ Apellido%></a></li>
                      <li><a href="cerrar.jsp"><span class="glyphicon glyphicon-log-in"></span> Get out</a></li>
                    </ul>
                  
                    
                                

            </header>

            <div class="w3-content w3-margin-top" style="max-width:1400px;">

                  <!-- The Grid -->
                  <div class="w3-row-padding">
                  
                    <!-- Left Column -->
                    <div  class="w3-third" >
                
                    <form  id="Menu_1" name="Yuli" method="POST">

                      <div class="w3-white w3-text-grey w3-card-4">
                            <div id="replace4" class="w3-display-container">
                              <br>  
                             <div  class="w3-container">   
                                <p class="w3-large w3-text-theme"><b><i class="fa fa-globe fa-fw w3-margin-right w3-text-blue-grey"></i>Chats</b></p>
                                <ul class="nav nav-tabs">
                                    <li><a id="Amigos2" href="#">Activos</a></li>
                                  <li><a id="Amigos1" href="#">Amigos</a></li>
                                  <li><a id="Chat_Grupo" href="#">Grupos</a></li>
                                  <li><a id="Perfil" href="#">Subir Imagen</a></li>
                                  </ul>
                            </div>
                            
                            <div id="Replace2">
                            <hr>
                             <div class="w3-container">
                                
                              <img id="yulip" src="04muestraImg.jsp?imagen=<%=Imagen%>" style="width:100%" alt="Avatar">
                             
                               <ul id ="yuli123" class="nav nav-tabs">
                                <li><h2 id="yuli1_2" class="w3-opacity"><%=" "+ Nombre + " "+ Apellido     %></h2></li>
                                <li><a id="Mod_All" class="fa fa-pencil fa-fw"  href="#"></a></li>
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
                          
                          </div>
                      </div>
                      <br>
                    </form>
                    </div>

                    <!-- final de la columna de derecha -->

                    <!-- Inicio de la columna de izquierda -->
                    <div class="w3-twothird" id="Replace1">
                      <div class="w3-container w3-card w3-white w3-margin-bottom">
                        <h3 class="w3-text-grey w3-padding-16"> Configuracion del Chat </h3>
                        <div class="w3-container">
                            <form  id="Menu_1234" name="Yuli" method="POST" >    
                            <ul class="nav nav-tabs">
                                  <li><a id="Enviar1" href="#"> Generar Usuario</a></li>
                                  <li><a id="Enviar2" href="#"> Eliminar Participantes</a></li>
                                  <li><a id="Enviar3" href="#"> Ver Usuarios</a></li>
                                  <li><a id="" href="#"> Otros </a></li>
                            </ul>
                             </form>
                                <div id ="CargarTodo" clas="w3-container">
                                    <img id="yulip" src="immagini/welcome.jpg" style="width:100%" alt="Avatar">
                                </div>
                            
                
                        </div>
                        <br>
                        <br>
                        
                      </div>
                    <!-- Final columna derecha -->
                    </div>
                    
                  <!-- Final de tabla -->
                  </div>
                  
                  <!-- final del contenedor -->
                </div>
                              
                <div id="reload" >
                          
                        </div>
                        <script>
                        $(document).ready(function() {
                              var refreshId =  setInterval( function(){
                            $('#reload').load('Notify.jsp');//actualizas el div
                           }, 5000 );
                        });
                        
                        $(document).ready(function() {
                              var refreshId =  setInterval( function(){
                            $('#reload').load('NotifyGroup.jsp');//actualizas el div
                           }, 5000 );
                        });

                        </script>

                <footer class="w3-container w3-light-grey w3-center w3-margin-top">
                  <p>Find us on social media.</p>
                  <i class="fa fa-facebook-official w3-hover-opacity"></i>
                  <i class="fa fa-instagram w3-hover-opacity"></i>
                  <i class="fa fa-snapchat w3-hover-opacity"></i>
                  <i class="fa fa-pinterest-p w3-hover-opacity"></i>
                  <i class="fa fa-twitter w3-hover-opacity"></i>
                  <i class="fa fa-linkedin w3-hover-opacity"></i>
                  <p>Powered by <a href="https://www.youtube.com/watch?v=w-yKG6Auhlw" target="_blank">EliaquinMusic</a></p>
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
                $("#Enviar1").click(function (event) {
                    $.ajax({
                        data: $("#Menu_1234").serialize(),
                        url: "GenerarUser.jsp",
                        type:"POST",
                        success:
                                function (result) {
                                    $("#CargarTodo").html(result);
                                }});
                });
            });
            $(document).ready(function () {
                $("#Enviar3").click(function (event) {
                    $.ajax({
                        data: $("#Menu_1234").serialize(),
                        url: "Estadisticas.jsp",
                        type:"POST",
                        success:
                                function (result) {
                                    $("#CargarTodo").html(result);
                                }});
                });
            }); 
            $(document).ready(function () {
                $("#Enviar2").click(function (event) {
                    $.ajax({
                        data: $("#Menu_1234").serialize(),
                        url: "EliminarRoot.jsp",
                        type:"POST",
                        success:
                                function (result) {
                                    $("#CargarTodo").html(result);
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
                $("#Perfil").click(function (event) {
                    $.ajax({
                        data: $("#Menu_1").serialize(),
                        url: "FotoPerfil.jsp",
                        type:"POST",
                        success:
                                function (result) {
                                    $("#Replace2").html(result);
                                }});
                });
            });   
        </script>
    </body>
</html>
