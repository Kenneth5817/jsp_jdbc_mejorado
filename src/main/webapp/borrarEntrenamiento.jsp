<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 12/12/2024
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Borrar Entrenamiento</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String query = "DELETE FROM entrenamiento WHERE id = ?";
    Connection conexion = null;
    PreparedStatement stmt = conexion.prepareStatement(query);
    stmt.setInt(1, id);
    stmt.executeUpdate();
    conexion.close();
    response.sendRedirect("listadoEntrenamientos.jsp");
%>
</body>
</html>
