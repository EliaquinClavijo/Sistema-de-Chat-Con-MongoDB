<%-- 
    Document   : FotoPerfil
    Created on : 24-gen-2018, 3.40.10
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">
	<!-- CSS Files -->
    
	<link href="css/gsdk-bootstrap-wizard_1.css" rel="stylesheet" />
    </head>
    <body  class="w3-light-grey">
        <br>
       <div class="w3-container w3-card w3-white w3-margin-bottom">
            
                <div class="card wizard-card" data-color="green" id="wizardProfile">
                    
                 <form name="frmSubirFoto" method ="post" action="SubirImagen.jsp" enctype="multipart/form-data">		
                            <div class="tab-pane" id="about">
                                <br>
                                <br>
                                <br>
                                <br>
                              <div class="row">
                                  <div class="col-sm-10 col-sm-offset-1">
                                     <div class="picture-container">
                                          <div class="picture">
                                              <img src="immagini/default-avatar.png" class="picture-src" id="wizardPicturePreview" title=""/>
                                              <input type="file" name="archivo" multiple="" id="wizard-picture">
                                          </div>
                                          <h6> Elige Imagen</h6>
                                      </div>
                                  </div>
                              </div>
                                <br>
                               <div  class="row" align="center">
                                   <br>
                                <input type="submit" value="Subir Foto" class='btn btn-exit btn-fill-rtl btn-default  btn-wd btn-sm' name='finish' value='Guardar' />
                               </div>
                            </div>
                        </form>
                </div>
            
        </div>
        <br>
    </body>
    
    <script src="js/jquery-2.2.4.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
<script src="js/gsdk-bootstrap-wizard.js"></script>
<script src="js/jquery.validate.min.js"></script>
</html>
