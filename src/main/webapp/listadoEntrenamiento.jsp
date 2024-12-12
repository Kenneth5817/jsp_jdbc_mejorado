<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 12/12/2024
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Listado de Entrenamientos</title>
</head>
<body>
<h2>Listado de Entrenamientos</h2>
<table>
    <tr><th>ID</th><th>Tipo</th><th>Ubicación</th><th>Fecha</th><th>Acciones</th></tr>
    <%
        String query = "SELECT * FROM entrenamiento";
        Connection conexion = null;
        PreparedStatement stmt = conexion.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("tipo") %></td>
        <td><%= rs.getString("ubicacion") %></td>
        <td><%= rs.getDate("fecha") %></td>
        <td>
            <form action="borrarEntrenamiento.jsp" method="post">
                <input type="hidden" name="id" value="<%= rs.getInt("id") %>" />
                <input type="submit" value="Borrar" />
            </form>
        </td>
    </tr>
    <%
        }
        conexion.close();
    %>
</table>
</body>
</html>

