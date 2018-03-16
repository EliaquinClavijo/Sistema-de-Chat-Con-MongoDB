<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
    </head>

    <body class="w3-light-grey">
            <div  id="replace3" class="w3-container w3-card w3-white w3-margin-bottom">

                 <form  id="Chat_Grupo" name="Yuli1" method="POST">
                                <ul class="nav navbar-nav navbar-right">
                                    <li><a id="Explore" href="#">Explorar Grupos</a></li>
                                     <li><a id="Create" href="#">Crear Grupo</a></li>
                                    
                                  </ul>
               </form> 
                
                        <h2 class="w3-text-grey w3-padding-16">...</h2>

                    <div>
                          
                        <img id="yulip" src="immagini/group.jpg" style="width:100%" alt="Avatar">
                             

                      
                    </div>
                        <br>
                
            </div>

             <script>                    
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
                        data: $("#Chat_Grupo").serialize(),
                        url: "Usuarios_Mod.jsp",
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

