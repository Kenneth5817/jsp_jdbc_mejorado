<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 12/12/2024
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Grabar Entrenamiento</title>
</head>
<body>
<%
    // Obtener los parámetros del formulario
    String tipo = request.getParameter("tipo");
    String ubicacion = request.getParameter("ubicacion");
    String fecha = request.getParameter("fecha");

    // Validación de los datos
    if (tipo == null || ubicacion == null || fecha == null || tipo.trim().isEmpty()) {
        session.setAttribute("error", "Todos los campos son obligatorios.");
        response.sendRedirect("formularioEntrenamiento.jsp");
    } else {
        // Insertar en la base de datos
        String query = "INSERT INTO entrenamiento (tipo, ubicacion, fecha) VALUES (?, ?, ?)";
        Connection conexion = null;
        PreparedStatement stmt = conexion.prepareStatement(query);
        stmt.setString(1, tipo);
        stmt.setString(2, ubicacion);
        stmt.setDate(3, Date.valueOf(fecha));
        stmt.executeUpdate();
        conexion.close();

        // Redirigir a la página de listado de entrenamientos
        response.sendRedirect("listadoEntrenamientos.jsp");
    }
%>
</body>
</html>

