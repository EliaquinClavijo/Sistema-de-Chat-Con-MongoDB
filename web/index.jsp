<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta http-equiv="Content-Type" content="text/html;
         charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="estilos.css">
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">
        <link href="css/gsdk-bootstrap-wizard.css" rel="stylesheet" />
        <link href="css/demo.css" rel="stylesheet" />

    </head>
    <body>
        
    <div  class="container">
        
    <div id="Change" class="row">
        <div class="col-md-4 col-md-offset-4">
           
            <div class="panel panel-default">
                
                
                <div class="panel-heading">
                  <strong>Login</strong>
                </div>
             
                
                <div class="panel-body">
                    <form action="check.jsp" class="form-horizontal" method="post" role="form">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-3 control-label">
                            Usuario</label>
                        <div class="col-sm-9">
                            <input type="text" name="usuario" class="form-control" id="inputEmail3" placeholder="Usuario" required="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-3 control-label">
                            Password</label>
                        <div class="col-sm-9">
                            <input type="password" name = "clave" class="form-control" id="inputPassword3" placeholder="Password" required="">
                        </div>
                    </div>
                    
                    <div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="submit"  value = "enviar" class="btn btn-success btn-sm">
                                Sign in</button>
                                 <button type="reset" class="btn btn-default btn-sm">
                                Reset</button>
                        </div>
                    </div>
                    </form>
                   
                </div>
                    
                
               <form id="NewAcount" name="Yuli5" method="POST">

                <div class="panel-footer">
                    Nuevo ? <a id="CreatePerfil" href="#">Registrese Aqui</a></div>

                </form>
                    
             
            </div>
          
                       
        </div>
    </div>
    
    </div>
    <br>
    <br>
    </body>

    <script>                    
            $(document).ready(function () {
                $("#CreatePerfil").click(function (event) {
                    $.ajax({
                        data: $("#NewAcount").serialize(),
                        url: "Registro.jsp",
                        type:"POST",
                        success:
                                function (result) {
                                    $("#Change").html(result);
                                }});
                });
            }); 
    </script> 
    
    
    <script src="js/jquery-2.2.4.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/jquery.bootstrap.wizard.js" type="text/javascript"></script>

	<!--  Plugin for the Wizard -->
	<script src="js/gsdk-bootstrap-wizard.js"></script>

	<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
	<script src="js/jquery.validate.min.js"></script>
</html>
