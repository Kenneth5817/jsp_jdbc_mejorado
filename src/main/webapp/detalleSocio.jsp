<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Detalle Socio</title>
</head>
<body>
<h2>Detalle del Socio</h2>

<%
    // Variables para la conexión a la base de datos
    String dbURL = "jdbc:mysql://localhost:3306/baloncesto";
    String dbUser = "root";
    String dbPassword = "secret";
    Connection conexion = null;

    try {
        // Cargamos el driver JDBC de MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");
        conexion = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // Comprobamos si la conexión se establece bien
        if (conexion == null) {
            out.println("Error al conectar a la base de datos");
        } else {
            // Obtenemos el parámetro socioID de la URL
            int socioID = Integer.parseInt(request.getParameter("socioID"));
            String query = "SELECT * FROM socio WHERE socioID = ?";

            // Preparamos la consulta
            PreparedStatement stmt = conexion.prepareStatement(query);
            stmt.setInt(1, socioID);

            // Ejecutamos la consulta
            ResultSet rs = stmt.executeQuery();

            // Mostramos los resultados si existen
            if (rs.next()) {
%>
<table>
    <tr><th>Código</th><td><%= rs.getInt("socioID") %></td></tr>
    <tr><th>Nombre</th><td><%= rs.getString("nombre") %></td></tr>
    <tr><th>Estatura</th><td><%= rs.getInt("estatura") %></td></tr>
    <tr><th>Edad</th><td><%= rs.getInt("edad") %></td></tr>
    <tr><th>Localidad</th><td><%= rs.getString("localidad") %></td></tr>
</table>
<%
} else {
%>
<p>No se encontró el socio con el ID especificado.</p>
<%
            }
            rs.close();
            stmt.close();
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        //Si vemos que la conexion va bien cerramos la conexion
        if (conexion != null) {
            try {
                conexion.close();
            } catch (SQLException e) {
                out.println("Error!!  cerrando la conexión: " + e.getMessage());
            }
        }
    }
%>

<a href="index.jsp">Volver al inicio</a>
</body>
</html>
