<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Formulario de Entrenamiento</title>
</head>
<body>
<h2>Crear Entrenamiento</h2>
<form action="grabaEntrenamiento.jsp" method="post">
    Tipo de Entrenamiento: <input type="text" name="tipo" /><br>
    Ubicación: <input type="text" name="ubicacion" /><br>
    Fecha: <input type="date" name="fecha" /><br>
    <input type="submit" value="Crear Entrenamiento" />
</form>
</body>
</html>


