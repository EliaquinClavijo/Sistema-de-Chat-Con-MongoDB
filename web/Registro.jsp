<%-- 
    Document   : Registro
    Created on : 14-gen-2018, 22.19.21
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    
    </head>
    <body>
        <br>
        <br>
        <div class="col-sm-8 col-sm-offset-2">

            <div class="w3-row-padding">

                <div class="card wizard-card" data-color="azzure" id="wizardProfile">
                    <form action="AgregarUsuario.jsp"  method="post" role="form" >

                       <div class="wizard-header">
                            <h3 class="w3-opacity" align="CENTER">
                               CREAR NUEVA CUENTA <br>
                               <br>
                            </h3>
                        </div>

                        <div class="wizard-navigation">
                            <ul>
                                <li><a href="#about" data-toggle="tab">Registrarse</a></li>
                                <li><a href="#address" data-toggle="tab">Datos de la Cuenta</a></li>
                            </ul>

                        </div>

                        <div class="tab-content">
                            <div class="tab-pane" id="about">
                              <div class="row">
                                  <h4 class="info-text"> Ingrese su información basica</h4>
                                  
                                  <div class="col-sm-10 col-sm-offset-1">
                                      <div class="form-group">
                                        <label> Nombre <small>*</small></label>
                                        <input name="firstname" type="text" class="form-control" placeholder="Nombre">
                                      </div>
                                      <div class="form-group">
                                        <label> Apellido <small>*</small></label>
                                        <input name="lastname" type="text" class="form-control" placeholder="Apellido">
                                      </div>
                                  </div>
                                  <br>
                                  
                                  <div class="col-sm-10 col-sm-offset-1">
                                      <br>
                                      <div class="form-group">
                                          <label>Email <small>*</small></label>
                                          <input name="email" type="email" class="form-control" placeholder="Email">
                                      </div>
                                  </div>
                              </div>
                            </div>
                            
                            <div class="tab-pane" id="address">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h4 class="info-text">Ingrese informacion de su cuenta </h4>
                                    </div>
                                    <div class="col-sm-7 col-sm-offset-1">
                                         <div class="form-group">
                                            <label>Contraseña<small>*</small></label>
                                            <input  type="password" name = "clave" class="form-control" placeholder="Contraseña" required="">
                                          </div>
                                    </div>
                                    <div class="col-sm-3 ">
                                         <div class="form-group">
                                            <label>Codigo<small>*</small></label>
                                            <input  type="password" name = "CodigoInit" class="form-control" placeholder="Pedir al Root" required="">
                                          </div>
                                    </div>
                                    <div class="col-sm-5 col-sm-offset-1">
                                         <div class="form-group">
                                            <label>Telefono</label>
                                            <input name="telefono" type="text" class="form-control" placeholder="Telefono">
                                          </div>
                                    </div>
                                    <div class="col-sm-5">
                                         <div class="form-group">
                                            <label>Ocupacion</label>
                                            <input name="ocupacion" type="text" class="form-control" placeholder="Ocupacion">
                                          </div>
                                    </div>
                                    <div class="col-sm-5 col-sm-offset-1">
                                         <div class="form-group">
                                            <label>Ciudad</label>
                                            <input name="ciudad" type="text" class="form-control" placeholder="Cusco">
                                          </div>
                                    </div>
                                    <div class="col-sm-5">
                                         <div class="form-group">
                                            <label>Pais</label><br>
                                             <select name="country" class="form-control">
                                                <option value="Peru"> Perú </option>
                                                <option value="Chile"> Chile </option>
                                                
                                            </select>
                                          </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="wizard-footer height-wizard">
                            <div class="pull-right">
                                <input type='button' class='btn btn-next btn-fill btn-default btn-wd btn-sm' name='next' value='Next' />
                                <input type="submit"  value = "enviar" class='btn btn-finish btn-fill btn-default btn-wd btn-sm' name='finish' />

                            </div>

                            <div class="pull-left">
                                    <input type='button' class='btn btn-previous btn-fill btn-default btn-wd btn-sm' name='previous' value='Previous' />
                            </div>
                            <div class="clearfix"></div>
                            
                        </div>
                        <br>
                        <div class="row" align="center">
                            <a href="index.jsp">
                                <input type="button"  class='btn btn-exit btn-fill-rtl btn-default  btn-wd btn-sm' name='Submit' value='Exit' />
                                </a> 
                        </div>
                        
                        
                       

                    </form>
                </div>
            </div> <!-- wizard container -->

    </div> <!--  big container -->
    <br>
    <br>   
     </body>
     <script src="js/jquery-2.2.4.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
    <script src="js/gsdk-bootstrap-wizard.js"></script>
    <script src="js/jquery.validate.min.js"></script>
</html>
