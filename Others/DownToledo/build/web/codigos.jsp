<%-- 
    Document   : principal
    Created on : 20-abr-2018, 20:40:13
    Author     : spiro
--%>

<%@page import="pojos.Rol"%>
<%@page import="pojos.Nuevacuenta"%>
<%@page import="pojos.Peticiones"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
  <script>
        $(function(){
            $('#modal1').modal();
        })
            
        </script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <body style="background-color: #70B7FF">
        <%
            boolean codigosopeticiones = (boolean) session.getAttribute("codigosopeticiones");
            List roles = (List) session.getAttribute("roles");
            List peticiones = (List) session.getAttribute("peticiones");
            List codigos = (List) session.getAttribute("codigos");

        %>
        <div class="container">
            <div class="col s3 offset-s6 z-depth-5" style="background-color: #3A6DC8; margin-top:90px; padding-bottom:10px ">
                <div class="col s3 offset-s6 center">
                    <img src="img/logo.png" alt=""/>
                </div>
                <div class="row">
                    <div class="col s12 center" style="margin-bottom: 0px">
                        <a  style="margin-right: 20px;background-color:#FFCB00; font-weight: bold;"  href="controller.jsp?op=inicio" class="waves-effect waves-light btn"><i class="material-icons left">exit_to_app</i>Cerrar sesión</a>
                        <%
                            if(codigosopeticiones){
                        %>
                        <a style="background-color:#FFCB00; font-weight: bold;"  href="controller.jsp?op=cambiar" class="waves-effect waves-light btn"><i class="material-icons left">fiber_new</i>Ver códigos</a>
                        <%
                                }else{%>
                        <a  style="background-color:#FFCB00; font-weight: bold;" href="controller.jsp?op=cambiar" class="waves-effect waves-light btn"><i class="material-icons left">question_answer</i>Ver peticiones</a>
                        <%}%>

                    </div>


                    <div class=" col s12">
                        <table class="striped">
                            <thead>
                                <%                                    if (codigosopeticiones) {
                                %>
                                <tr>
                                    <th>Borrar</th>
                                    <th>Generar código</th>
                                    <th>Nombre</th>
                                    <th>Apellido 1</th>
                                    <th> Apellido 2 </th>
                                    <th>Correo</th>
                                    <th>Descripcion</th>

                                </tr>
                                <%
                                } else {
                                %>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Rol</th>
                                    <th> Borrar </th>
                                </tr>
                                <%
                                    }
                                %>
                            </thead>
                            <%
                                if (codigosopeticiones) {

                                    for (int i = 0; i < peticiones.size(); i++) {

                                        Peticiones peti = (Peticiones) peticiones.get(i);
                            %>
                            <tbody>
                                <tr>
                                    <td><a href="controller.jsp?op=eliminar&correo=<%=peti.getCorreo()%>" class="waves-effect waves-light btn red"><i class="material-icons">cancel</i></a></td>
                                    <td><a href="controller.jsp?op=generarcodigo&correo=<%=peti.getCorreo()%>" class="modal-trigger btn green"><i class="material-icons ">check</i></a>
                                    <td><%=peti.getNombre()%></td>
                                    <td><%=peti.getApellido1()%></td>
                                    <td><%=peti.getApellido2()%></td>
                                    <td><%=peti.getCorreo()%></td>
                                    <td><%=peti.getDescripcion()%></td>

                                </tr>
                            </tbody>
                            <%
                                }
                            } else {

                                for (int i = 0; i < codigos.size(); i++) {
                                    Nuevacuenta nueva = (Nuevacuenta) codigos.get(i);
                                    String rol="";
                                    for (int j = 0; j < roles.size(); j++) {
                                        Rol urol = (Rol) roles.get(j);
                                        if (nueva.getIdrol() == urol.getIdrol()) {
                                        rol=urol.getRol();
                                        }
                                    }
                                
                            %>
                            <tbody>
                                <tr>
                                    <td><%=nueva.getCodigo()%></td>
                                    <td><%=rol%></td>
                                    <td><a href="controller.jsp?op=eliminarcodigo&codigo=<%=nueva.getCodigo()%>" class="waves-effect waves-light btn red"><i class="material-icons">cancel</i></a></td>
                                </tr>
                            </tbody>
                            <%
                                    }
                                }%>
                        </table>
                    </div>
                </div>
            </div>
            <div id="modal1" class="modal">
                <div class="modal-content">
                    <h1>hola</h1>
                </div>
            </div>
        </div> 

    </body>
</html>
