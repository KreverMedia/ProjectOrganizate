<%-- 
    Document   : code
    Created on : 28-abr-2018, 14:47:10
    Author     : spiro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="pojos.Rol"%>
<%@page import="java.util.List"%>
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
        <%
            List roles = (List) session.getAttribute("roles");
            boolean bol = (boolean) session.getAttribute("mandacorreo");

        %>
        <div class="container">
            <div class="col s3 offset-s6 z-depth-5" style="background-color: #3A6DC8; margin-top:90px; padding-bottom:10px ">
                <div class="col s3 offset-s6 center">
                    <img src="img/logo.png" alt=""/>
                </div>
                <div class="row">
                    <div class="col s12 center" style="margin-bottom: 0px">
                        <% if (!bol) {%>
                        <h4 class="center-align white-text" style="font-family: Cooper Black">¿Cual es el rol que quieres asignarle?</h4>
                        <form class="col s6 offset-s3 center white-text" action="controller.jsp?op=generacode" method="POST" name="formcode">
                            <div class="row white-text">


                                <select name="rolelegido" class="white-text">
                                    <option  class="white-text" value="" disabled selected>Roles registrados</option>
                                    <% for (int i = 0; i < roles.size(); i++) {
                                            Rol rol = (Rol) roles.get(i);

                                    %>
                                    <option class="white-text" value="<%=rol.getRol()%>"><%=rol.getRol()%></option>
                                    <%

                                        }

                                    %>
                                </select>


                                <div class="col s12 center" style="margin-bottom: 0px">
                                    <h4 class="center-align white-text" style="font-family: Cooper Black">O</h4>
                                </div>
                                <div class="input-field col s12 white-text">
                                    <input id="nuevorol" name="nuevorol" type="text" class="validate white-text">
                                    <label class="white-text" for="nuevorol">Nuevo rol</label>
                                </div>
                                <div class="col s12 white-text center">
                                    <button type="submit" class="btn green">Crear codigo</button>
                                </div>
                            </div>


                        </form>
                        <% } else {
                            String clave = (String) request.getAttribute("codigo");
                            String correo = (String) request.getAttribute("correo");
                        %>
                        <h4 class="center-align white-text" style="font-family: Cooper Black">Codigo: <%=clave%> </h4>
                        <h4 class="center-align white-text" style="font-family: Cooper Black">Recuerda enviar el código a <%=correo%> </h4>
                        <a href="controller.jsp?op=volveragenerar" class="btn waves-effect waves-light black-text" type="submit" name="action" style="margin-top: 20px; background-color:#FFCB00; font-weight: bold;">Volver a las peticiones
                            <i class="material-icons right">send</i>
                        </a>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <script>$(document).ready(function () {
                $('select').formSelect();
            });</script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min_1.js"></script>
        <script type="text/javascript" src="js/materialize_1.js"></script>
        <script type="text/javascript" src="js/myjs_1.js"></script>
    </body>
</html>
F