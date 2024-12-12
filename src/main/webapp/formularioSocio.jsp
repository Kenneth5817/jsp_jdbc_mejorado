<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Objects" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
  //CÓDIGO DE VALIDACIÓN
  boolean valida = true;
  int numero = -1;
  String nombre = null;
  int estatura = -1;
  int edad = -1;
  String localidad = null;

  boolean flagValidaNumero = false;
  boolean flagValidaNombreNull = false;
  boolean flagValidaNombreBlank = false;
  boolean flagValidaEstatura = false;
  boolean flagValidaEdad = false;
  boolean flagValidaLocalidad = false;

  try {
    numero = Integer.parseInt(request.getParameter("numero"));
    flagValidaNumero = true;

    Objects.requireNonNull(request.getParameter("nombre"));
    flagValidaNombreNull = true;
    if (request.getParameter("nombre").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
    flagValidaNombreBlank = true;
    nombre = request.getParameter("nombre");

    estatura = Integer.parseInt(request.getParameter("estatura"));
    flagValidaEstatura = true;

    edad = Integer.parseInt(request.getParameter("edad"));
    flagValidaEdad = true;

    Objects.requireNonNull(request.getParameter("localidad"));
    if (request.getParameter("localidad").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
    flagValidaLocalidad = true;
    localidad = request.getParameter("localidad");

  } catch (Exception ex) {
    ex.printStackTrace();

    // Establecer mensajes de error en sesión
    if (!flagValidaNumero) {
      session.setAttribute("error", "Error en número.");
    } else if (!flagValidaNombreNull || !flagValidaNombreBlank) {
      session.setAttribute("error", "Error en nombre.");
    } else if (!flagValidaEdad) {
      session.setAttribute("error", "Error en edad.");
    } else if (!flagValidaEstatura) {
      session.setAttribute("error", "Error en estatura.");
    } else if (!flagValidaLocalidad) {
      session.setAttribute("error", "Error en localidad.");
    }

    valida = false;
  }

  if (valida) {
    // Código para guardar el socio en la base de datos
    Connection conn = null;
    PreparedStatement ps = null;

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto", "root", "user");

      String sql = "INSERT INTO socio (numero, nombre, estatura, edad, localidad) VALUES (?, ?, ?, ?, ?)";
      ps = conn.prepareStatement(sql);
      ps.setInt(1, numero);
      ps.setString(2, nombre);
      ps.setInt(3, estatura);
      ps.setInt(4, edad);
      ps.setString(5, localidad);

      ps.executeUpdate();
      session.setAttribute("socioID", numero);
      response.sendRedirect("detalleSocio.jsp?socioID=" + numero);

    } catch (Exception ex) {
      ex.printStackTrace();
    } finally {
      try {
        if (ps != null) ps.close();
        if (conn != null) conn.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  } else {
    response.sendRedirect("formularioSocio.jsp");
  }
%>
</body>
</html>
l>