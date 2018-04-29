<%-- 
    Document   : controller
    Created on : 20-abr-2018, 20:19:38
    Author     : spiro
--%>

<%@page import="pojos.Nuevacuenta"%>
<%@page import="pojos.Usuario"%>
<%@page import="javax.persistence.Query"%>
<%@page import="pojos.Peticiones"%>
<%@page import="pojos.Rol"%>
<%@page import="util.JPAUtil"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            EntityManager em = null;
            List lista;
            EntityTransaction transaction;
            em = (EntityManager) session.getAttribute("em");

            if (em == null) {
                session.setAttribute("codigosopeticiones", true);
                em = JPAUtil.getEntityManagerFactory().createEntityManager();
                session.setAttribute("em", em);
            }

            String op;
            op = request.getParameter("op");
            if (op.equals("inicio")) {
        %>
        <jsp:forward page="principal.jsp"/>
        <%
        } else if (op.equals("registrarse")) {
        %>
        <jsp:forward page="registrar.jsp"/>
        <%
        } else if (op.equals("peticion")) {
            String nombre = request.getParameter("name");
            String apellido1 = request.getParameter("surname1");
            String apellido2 = request.getParameter("surname2");
            String correo = request.getParameter("email");
            String razon = request.getParameter("reason");
            boolean hayarroba = false;
            int arroba = 0;
            boolean estructurabien = false;
            boolean existeesecorreo = false;
            for (int i = 0; i < correo.length(); i++) {
                if (correo.charAt(i) == '@') {
                    hayarroba = true;
                    arroba = i;
                }
                if (correo.charAt(i) == '.' && hayarroba && i != (correo.length() - 1)) {
                    estructurabien = true;
                    break;
                }

            }
            String sql = "Select c.correo from Peticiones c";
            Query query = em.createQuery(sql);
            List correos = query.getResultList();
            for (int j = 0; j < correos.size(); j++) {
                if (correos.get(j) != null) {
                    if (((String) correos.get(j)).equals(correo)) {
                        existeesecorreo = true;
                        break;
                    }
                }
            }
            if (estructurabien && !existeesecorreo) {
                Peticiones peticion = new Peticiones();
                peticion.setApellido1(apellido1);
                peticion.setApellido2(apellido2);
                peticion.setCorreo(correo);
                peticion.setDescripcion(razon);
                peticion.setIdpeticion(12);
                peticion.setNombre(nombre);
                transaction = em.getTransaction();
                transaction.begin();
                em.persist(peticion);
                transaction.commit();
                session.setAttribute("estado", "ok");
            }
            if (!estructurabien) {
                session.setAttribute("estado", "estructuramal");
            }
            if (estructurabien && existeesecorreo) {
                session.setAttribute("estado", "existe");
            }
        %>
        <jsp:forward page="correcto.jsp"/>
        <%
        } else if (op.equals("loguearse")) {
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            String sql = "Select c from Usuario c";
            Query query = em.createQuery(sql);
            boolean existecuenta = false;
            boolean esadministrador = false;
            List usuarios = query.getResultList();
            for (int i = 0; i < usuarios.size(); i++) {
                Usuario usuario = (Usuario) usuarios.get(i);
                if (user.equals(usuario.getNombreuser()) && pass.equals(usuario.getPassword())) {
                    existecuenta = true;
                    Rol rol = (Rol) usuario.getRolList().toArray()[0];
                    if (rol.getIdrol() == 1) {
                        esadministrador = true;
                        break;
                    }
                }
            }
            if (esadministrador) {
                sql = "Select c from Rol c";
                query = em.createQuery(sql);
                List roles = query.getResultList();
                session.setAttribute("roles", roles);

                if ((boolean) session.getAttribute("codigosopeticiones")) {
                    sql = "Select c from Peticiones c";
                    query = em.createQuery(sql);
                    roles = query.getResultList();
                    session.setAttribute("peticiones", roles);
                } else {
                    sql = "Select c from Nuevacuenta c";
                    query = em.createQuery(sql);
                    roles = query.getResultList();
                    session.setAttribute("codigos", roles);
                }
        %>
        <jsp:forward page="codigos.jsp"/>
        <%            }
            if (!existecuenta) {
                session.setAttribute("estado", "noexiste");
        %>
        <jsp:forward page="correcto.jsp"/>
        <%
            }
            if (existecuenta && !esadministrador) {
                session.setAttribute("estado", "noadministrador");
        %>
        <jsp:forward page="correcto.jsp"/>
        <%
            }
        } else if (op.equals("cambiar")) {
            boolean l = ((boolean) session.getAttribute("codigosopeticiones"));
            if (l) {
                session.setAttribute("codigosopeticiones", false);
            } else {
                session.setAttribute("codigosopeticiones", true);
            }
            String sql = "";
            List roles;
            Query query;
            if ((boolean) session.getAttribute("codigosopeticiones")) {
                sql = "Select c from Peticiones c";
                query = em.createQuery(sql);
                roles = query.getResultList();
                session.setAttribute("peticiones", roles);
            } else {
                sql = "Select c from Nuevacuenta c";
                query = em.createQuery(sql);
                roles = query.getResultList();
                session.setAttribute("codigos", roles);
            }
        %>
        <jsp:forward page="codigos.jsp"/>
        <%
        } else if (op.equals("eliminar")) {
            String correo = request.getParameter("correo");
            String sql = "Select c from Peticiones c where c.correo='" + correo + "'";
            Query query = em.createQuery(sql);
            Peticiones peticion = (Peticiones) query.getResultList().get(0);
            transaction = em.getTransaction();
            transaction.begin();
            em.remove(peticion);
            transaction.commit();
            sql = "Select c from Peticiones c";
            query = em.createQuery(sql);
            List roles = query.getResultList();
            session.setAttribute("peticiones", roles);
            session.setAttribute("codigosopeticiones", true);
        %>
        <jsp:forward page="codigos.jsp"/>
        <%
        } else if (op.equals("eliminarcodigo")) {
            String codigo = request.getParameter("codigo");
            String sql = "Select c from Nuevacuenta c where c.codigo='" + codigo + "'";
            Query query = em.createQuery(sql);
            Nuevacuenta codigoelegido = (Nuevacuenta) query.getResultList().get(0);
            transaction = em.getTransaction();
            transaction.begin();
            em.remove(codigoelegido);
            transaction.commit();
            sql = "Select c from Nuevacuenta c";
            query = em.createQuery(sql);
            List roles = query.getResultList();
            session.setAttribute("codigos", roles);
            session.setAttribute("codigosopeticiones", false);

        %>
        <jsp:forward page="codigos.jsp"/>
        <%        } else if (op.equals("generarcodigo")) {
            String correo = request.getParameter("correo");
            String sql = "Select c from Rol c";
            Query query = em.createQuery(sql);
            List list = query.getResultList();
            session.setAttribute("roles", list);
            session.setAttribute("correo", correo);
            session.setAttribute("mandacorreo", false);
        %>
        <jsp:forward page="code.jsp"/>
        <%
        } else if (op.equals("generacode")) {
            String rol = request.getParameter("rolelegido");
            String rol2 = request.getParameter("nuevorol");
            String roldef = "";
            boolean crearcodigo = false;
            boolean nuevorol = false;
            if (rol != null) {
                crearcodigo = true;
                roldef = rol;
            } else {
                if (rol2.equals("")) {
                    crearcodigo = false;
                } else {
                    crearcodigo = true;
                    roldef = rol2;
                    nuevorol = true;
                }
            }
            if (crearcodigo) {
                Rol newrol = new Rol();
                if (nuevorol) {

                    newrol.setRol(roldef);
                    transaction = em.getTransaction();
                    transaction.begin();
                    em.persist(newrol);
                    transaction.commit();

                }
                String sql = "SELECT c from Rol c where c.rol='" + roldef+"'";
                Query query = em.createQuery(sql);
                newrol = (Rol) query.getResultList().get(0);
                String clave = "";
                int numero = 0;
                char[] letras = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
                    'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F',
                    'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
                for (int i = 0; i < 10; i++) {
                    numero = (int) ((Math.random() * letras.length));

                    clave += letras[numero];
                }
                Nuevacuenta nuevacuenta = new Nuevacuenta();
                nuevacuenta.setCodigo(clave);
                nuevacuenta.setIdrol(newrol.getIdrol());
            
                transaction = em.getTransaction();
                transaction.begin();
                em.persist(nuevacuenta);
                transaction.commit();
                request.setAttribute("codigo", clave);
                String correo = (String) session.getAttribute("correo");
                session.removeAttribute("correo");
                sql = "SELECT c from Peticiones c where c.correo='" + correo+"'";
                query = em.createQuery(sql);
               Peticiones peti= (Peticiones) query.getResultList().get(0);
               transaction = em.getTransaction();
                transaction.begin();
                em.remove(peti);
                transaction.commit();
                request.setAttribute("correo", correo);
                session.setAttribute("mandacorreo", true);
            } else {
                session.setAttribute("estado", "rellena");
        %>
        <jsp:forward page="correcto.jsp"/>
        <%
            }
        %>
        <jsp:forward page="code.jsp"/>
        <%
        } else if (op.equals("volver")) {
        %>
        <jsp:forward page="codigos.jsp"/>
        <%
        } else if (op.equals("volveragenerar")) {
        %>
        <jsp:forward page="codigos.jsp"/>
        <%
            }

        %>
    </body>
</html>
