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
                    <% 
                    String estado=(String) session.getAttribute("estado");
                        if(estado.equals("ok")){
                        
                        %>
                    <div class="col s12 " style="margin-bottom: 0px">
                        <h4 class="center-align white-text" style="font-family: Cooper Black">Gracias por confiar en Down Toledo, si en 3 dias no ha recibido un correo su petición no ha sido aceptada.</h4>
                    </div>
                     <div class="col s6 offset-s3">
                        <a href="controller.jsp?op=inicio" class="btn waves-effect waves-light black-text center"  style="margin-left: 100px; background-color:#FFCB00; font-weight: bold;
                                 margin-top: 20px">Volver a pagina principal
                            <i class="material-icons right">assignment_return</i>
                        </a>
                    </div>
                    <%}
                    if(estado.equals("estructuramal")){
%>
<div class="col s12 " style="margin-bottom: 0px">
    <h4 class="center-align white-text" style="font-family: Cooper Black">Por favor, Introduzca un correo válido</h4>
</div>
 <div class="col s6 offset-s3">
                        <a href="controller.jsp?op=registrarse" class="btn waves-effect waves-light black-text center"  style="margin-left: 100px; background-color:#FFCB00; font-weight: bold;
                                 margin-top: 20px">Volver atras
                            <i class="material-icons right">assignment_return</i>
                        </a>
                    </div>
<%
                        }
                        if(estado.equals("existe")){
%>
<div class="col s12 " style="margin-bottom: 0px">
    <h4 class="center-align white-text" style="font-family: Cooper Black">Este correo ya existe, pruebe otra vez</h4>
</div>
 <div class="col s6 offset-s3">
                        <a href="controller.jsp?op=registrarse" class="btn waves-effect waves-light black-text center"  style="margin-left: 100px; background-color:#FFCB00; font-weight: bold;
                                 margin-top: 20px">Volver atras
                            <i class="material-icons right">assignment_return</i>
                        </a>
                    </div>
                    <%
}
if(estado.equals("noexiste")){
%>
  <div class="col s12 " style="margin-bottom: 0px">
                        <h4 class="center-align white-text" style="font-family: Cooper Black">Lo siento esa cuenta no existe. Asegurese de haber introducido bien el usuario o la contraseña</h4>
                    </div>
                     <div class="col s6 offset-s3">
                        <a href="controller.jsp?op=inicio" class="btn waves-effect waves-light black-text center"  style="margin-left: 100px; background-color:#FFCB00; font-weight: bold;
                                 margin-top: 20px">Volver a pagina principal
                            <i class="material-icons right">assignment_return</i>
                        </a>
                    </div>
                    <%
}
if(estado.equals("noadministrador")){
%>
  <div class="col s12 " style="margin-bottom: 0px">
                        <h4 class="center-align white-text" style="font-family: Cooper Black">Lo siento pero no tienes permiso para acceder aqui.</h4>
                    </div>
                     <div class="col s6 offset-s3">
                        <a href="controller.jsp?op=inicio" class="btn waves-effect waves-light black-text center"  style="margin-left: 100px; background-color:#FFCB00; font-weight: bold;
                                 margin-top: 20px">Volver a pagina principal
                            <i class="material-icons right">assignment_return</i>
                        </a>
                    </div>
                    <%
}
if(estado.equals("rellena")){
%>
<div class="col s12 " style="margin-bottom: 0px">
                        <h4 class="center-align white-text" style="font-family: Cooper Black">Rellene alguno de los campos.</h4>
                    </div>
                     <div class="col s6 offset-s3">
                        <a href="controller.jsp?op=inicio" class="btn waves-effect waves-light black-text center"  style="margin-left: 100px; background-color:#FFCB00; font-weight: bold;
                                 margin-top: 20px">Volver al formulario
                            <i class="material-icons right">assignment_return</i>
                        </a>
                    </div>
                    <%
}
%>
                   
                </div>
            </div>

        </div> 

       <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min_1.js"></script>
        <script type="text/javascript" src="js/materialize_1.js"></script>
        <script type="text/javascript" src="js/myjs_1.js"></script>
    </body>
</html>
