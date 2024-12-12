<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Grabar Socio</title>
</head>
<body>
<%
    //Obtenemos los parametros del formulario
    String nombre = request.getParameter("nombre");
    String estatura = request.getParameter("estatura");
    String edad = request.getParameter("edad");

    //Vemos que nada sea null
    if (nombre == null || estatura == null || edad == null || nombre.trim().isEmpty()) {
        session.setAttribute("error", "Todos los campos son obligatorios.");
        response.sendRedirect("formularioSocio.jsp");
    } else {
        //Añadimos a la base de datos
        String query = "INSERT INTO socio (nombre, estatura, edad, localidad) VALUES (?, ?, ?, ?)";
        Connection conexion = null;
        PreparedStatement stmt = conexion.prepareStatement(query);
        stmt.setString(1, nombre);
        stmt.setInt(2, Integer.parseInt(estatura));
        stmt.setInt(3, Integer.parseInt(edad));
        stmt.setString(4, request.getParameter("localidad"));
        stmt.executeUpdate();
        conexion.close();

        //Redirigimos a la página principal
        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>

