<!DOCTYPE html>
<html>
    <head>
    </head>

    <body>
            
           <form class="form-horizontal" method="post"  role="form" action = "GrupoDB.jsp">
                  <fieldset>

                  <!-- Form Name -->
                  <legend class="w3-text-grey w3-padding-16">   Crear Grupo</legend>

                  <!-- Text input-->
                  <div class="form-group">
                    <label class="col-md-4 control-label" for="Nombre del Grupo">Nombre del Grupo</label>  
                    <div class="col-md-4">
                    <input id="Nombre del Grupo" name="Name" type="text" placeholder="Nombre del Grupo" class="form-control input-md">
                      
                    </div>
                  </div>

       

                  <!-- Multiple Checkboxes -->
                  <div class="form-group">
                    <label class="col-md-4 control-label" for="checkboxes">Privacidad</label>
                    <div class="col-md-4">
                      <div class="radio">
                        <label><input type="radio" name="optradio" value="1">Publico</label>
                      </div>
                      <div class="radio">
                          <label><input type="radio" name="optradio" value="0">Privado</label>
                      </div>
                    
                    </div>
                  </div>

                  <div class="form-horizontal">
                      <div class="w3-half">
                          <button type="submit" value="enviar" href="#" class="w3-button w3-block">Crear</button></div>
                      <div class="w3-half">  
                          <a href="pagina_principale.jsp">
                              <input class="w3-button w3-block" value='Salir'></a></div>
                            
                </div>

                  </fieldset>
                  <br>
              </form>
    </body>
</html>


