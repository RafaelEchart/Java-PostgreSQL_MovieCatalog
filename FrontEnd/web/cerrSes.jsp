<%-- 
    Document   : cerrSes
    Created on : 28-sep-2021, 15:32:43
    Author     : jose_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cierra Sesion</title>
    </head>
    <body>
        <% session.setMaxInactiveInterval(0); 
        response.sendRedirect("./index.jsp");
        %>
        
    </body>
</html>
