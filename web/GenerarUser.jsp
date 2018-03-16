<%-- 
    Document   : GenerarUser
    Created on : 8-feb-2018, 10.35.24
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="GenerarUserMain.jsp"  method="post" role="form" class="form-horizontal">
        
        <div  class="w3-container w3-card w3-white w3-margin-bottom">

                  <!-- Form Name -->
                  <legend class="w3-text-grey w3-padding-16"> Generar Codigo </legend>

                  <!-- Text input-->
                  
                  <div class="form-group">
                      
                        <label for="Nombre" class="col-md-4 control-label">
                            Nombre Empleado</label>
                        <div class="col-md-4">
                            <input type="text" name = "Nombre" class="form-control" id="inputPassword3" placeholder="Nombre" required="">
                        </div>
                    </div>
                  
                  <div class="form-group">
                    <label class="col-md-4 control-label" for="Codigo"> Codigo</label>  
                    <div class="col-md-4">
                    <input id="firstname" name="Codigo" type="text" placeholder="Codigo" class="form-control input-md">
                      
                    </div>
                  </div>
                  
                
              <div class="row" align="center">

                <button type="submit" href="#" class="btn ">Generar</button>
               
              
              </div>
            
                  <br>
        </div>
        </form>
    </body>
</html>
