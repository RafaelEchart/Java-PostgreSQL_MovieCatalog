<%@page import="java.sql.Array"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>



<%
    Connection cn;
    int rpta = 0;
    String sql;
    ResultSet rs = null;
    Statement st = null;

    String peliculas = (String) request.getParameter("param1");
    String usuario = (String) request.getParameter("param2");

    String[] peliculasAGuardarTemp = peliculas.split(",");

    try {
        cn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/login", "postgres", "123");
        sql = "UPDATE usrcon set favoritos= '" + peliculas + "' WHERE usuario= '" + usuario + "'";
        st = cn.createStatement();

        st.executeUpdate(sql);

    } catch (SQLException e) {
        System.out.println(e);
    }

    request.getSession().setAttribute("favoritos", peliculas);

    out.println("PELICULAS: " + peliculas + "USUARIO: " + peliculas);


%>
