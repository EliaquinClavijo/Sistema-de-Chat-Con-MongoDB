<!DOCTYPE html>
<html>
    <head>
    </head>

    <body class="w3-light-grey">
        
        <form action="Modificar.jsp"  method="post" role="form" class="form-horizontal">
        
        <div  class="w3-container w3-card w3-white w3-margin-bottom">

                  <!-- Form Name -->
                  <legend class="w3-text-grey w3-padding-16"> Editar Perfil</legend>

                  <!-- Text input-->
                  
                  <div class="form-group">
                      
                        <label for="inputPassword3" class="col-md-4 control-label">
                            Contraseña</label>
                        <div class="col-md-4">
                            <input type="password" name = "clave" class="form-control" id="inputPassword3" placeholder="Contraseña" required="">
                        </div>
                    </div>
                  
                  <div class="form-group">
                    <label class="col-md-4 control-label" for="firstname">Nombre</label>  
                    <div class="col-md-4">
                    <input id="firstname" name="firstname" type="text" placeholder="Nombre" class="form-control input-md">
                      
                    </div>
                  </div>
                  
                   <div class="form-group">
                    <label class="col-md-4 control-label" for="lastname">Apellidos</label>  
                    <div class="col-md-4">
                    <input id="lastname" name="lastname" type="text" placeholder="Apellidos" class="form-control input-md">
                      
                    </div>
                  </div>
                  
                   
                    
                   
                    <div class="form-group">
                        <label for="inputPassword3" class="col-md-4 control-label">
                            Nueva Contraseña</label>
                        <div class="col-md-4">
                            <input type="password" name = "clavenueva" class="form-control" id="inputPassword3" placeholder="Nueva contraseña">
                        </div>
                    </div>
                    
                    <!-- Text input-->
                  <div class="form-group">
                    <label class="col-md-4 control-label" for="telefono">Telefono</label>  
                    <div class="col-md-4">
                    <input id="telefono" name="telefono" type="text" placeholder="Telefono" class="form-control input-md">
                      
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-4 control-label" for="email">Email</label>  
                    <div class="col-md-4">
                    <input id="email" name="email" type="text" placeholder="Email" class="form-control input-md">
                      
                    </div>
                  </div>
                <div class="form-group">
                    <label class="col-md-4 control-label" for="ocupacion">Ocupacion</label>  
                    <div class="col-md-4">
                    <input id="ocupacion" name="ocupacion" type="text" placeholder="Ocupacion" class="form-control input-md">
                      
                    </div>
                  </div>
              <div class="row" align="center">

                <button type="submit" href="#" class="btn ">Modificar</button>
               
              
              </div>
            
                  <br>
        </div>
        </form>

        
    </body>
</html>


