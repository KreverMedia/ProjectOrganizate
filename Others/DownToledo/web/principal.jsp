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
            <div class="col s3 offset-s6 z-depth-5" style="background-color: #3A6DC8; margin-top:90px; padding-bottom:10px ">
                <div class="col s3 offset-s6 center">
                    <img src="img/logo.png" alt=""/>
                </div>
                <div class="row">
                    <div class="col s12 " style="margin-bottom: 0px">
                        <h3 class="center-align white-text" style="font-family: Cooper Black">Bienvenido a Down Toledo</h3>
                    </div>

                    <form class="col s6 offset-s3 center" style="margin-top: 0px" action="controller.jsp?op=loguearse" method="POST" name="formloguin">

                        <div class="input-field col s6 offset-s3 center" style="margin-top: 0px; margin-bottom: 5px"> 
                            <input id="user" name="user" type="text" class="validate white-text">
                            <label class="white-text" for="user">Usuario</label>
                        </div>
                        <div class="input-field col s6 offset-s3 center" style="margin-top: 0px"> 
                            <input  id="pass" name="pass" type="password" class="validate white-text">
                            <label class="white-text" for="pass">Contraseña</label>
                        </div>
                        <a href="controller.jsp?op=registrarse" class="btn waves-effect waves-light black-text" type="submit" name="action" style="margin-top: 20px; background-color:#FFCB00; font-weight: bold;">Registrarse
                            <i class="material-icons right">send</i>
                        </a>
                        <button class="btn waves-effect waves-light black-text" type="submit" name="action" style="margin-left: 50px; background-color:#FFCB00; font-weight: bold;
                                 margin-top: 20px">Loguearse
                            <i class="material-icons right">send</i>
                        </button>
                    </form>

                </div>
            </div>

        </div> 

        <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
</html>
