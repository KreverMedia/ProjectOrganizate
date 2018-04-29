<%-- 
    Document   : principal
    Created on : 20-abr-2018, 20:40:13
    Author     : spiro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <body style="background-color: #70B7FF">
        <div class="container">
            <div class="col s3 offset-s6 z-depth-5" style="background-color: #3A6DC8; margin-top:90px; padding-bottom:10px;margin-bottom: 90px ">
                <div class="col s3 offset-s6 center">
                    <img src="img/logo.png" alt=""/>
                </div>
                <div class="row">
                    <div class="col s12 " style="margin-bottom: 0px">
                        <h3 class="center-align white-text" style="font-family: Cooper Black">Bienvenido a Down Toledo</h3>
                    </div>

                    <form class="col s6 offset-s3 center" style="margin-top: 0px" action="controller.jsp?op=peticion" method="POST" name="formloguin">

                        <div class="input-field col s6 offset-s3 center" style="margin-top: 0px; margin-bottom: 5px"> 
                            <input id="name" name="name" type="text" class="validate white-text">
                            <label class="white-text" for="name">Nombre</label>
                        </div>
                        <div class="input-field col s6 offset-s3 center" style="margin-top: 0px;margin-bottom: 5px"> 
                            <input  id="surname1" name="surname1" type="text" class="validate white-text">
                            <label class="white-text" for="surname1">Primer Apellido</label>
                        </div>
                        <div class="input-field col s6 offset-s3 center" style="margin-top: 0px; margin-bottom: 5px"> 
                            <input  id="surname2" name="surname2" type="text" class="validate white-text">
                            <label class="white-text" for="surname2">Segundo Apellido</label>
                        </div>
                          <div class="input-field col s6 offset-s3 center" style="margin-top: 0px; margin-bottom: 5px"> 
                              <input  id="email" name="email" type="text" class="validate white-text">
                            <label class="white-text" for="email">Correo Electrónico</label>
                        </div>
                        <div class="input-field col s12  center" style="margin-top: 0px; margin-bottom: 5px"> 
                            <textarea id="reason" name="reason" class="materialize-textarea white-text"></textarea>
                            <label class="white-text" for="reason">Explica brevemente por qué quieres una cuenta</label>
                        </div>
                        <button class="btn waves-effect waves-light black-text" type="submit" name="action" style="margin-left: 50px; background-color:#FFCB00; font-weight: bold;
                                 margin-top: 20px">Enviar petición
                            <i class="material-icons right">send</i>
                        </button>
                    </form>

                </div>
            </div>

        </div> 

      <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min_1.js"></script>
        <script type="text/javascript" src="js/materialize_1.js"></script>
        <script type="text/javascript" src="js/myjs_1.js"></script>
    </body>
</html>
