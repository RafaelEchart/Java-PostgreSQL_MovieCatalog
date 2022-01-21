<%-- 
    Document   : index
    Created on : 16-sep-2021, 20:20:28
    Author     : jose_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <title>Movie Tes</title>
    <link rel="stylesheet" href="Es_login.css">
    </head>
            <%  String rpta="";
        if(request.getParameter("rpta")!=null){
            int r=Integer.parseInt(request.getParameter("rpta"));
            if(r==0){
                rpta="Error: datos incorrectos";
            }
        }
    %>
    <body>
<div class="c">


<form class="box" action="/MovieTes_ProyectoFinal/LoginController" method="post">
    <a href="index.jsp" ><img src="./images/logo1.png" class="avatar" alt="Avatar Image"></a>
  <h1>Log in</h1>
  <input type="text" name="txtusuario" placeholder="Username" required>
  <input type="password" name="txtcontrasena" placeholder="Password" required>
  <input type="submit" name="btn-login" value="Log in">
  <p style="color: red;"><%=rpta %></p>
    <a href="Registro.jsp">¿No account?</a>
</form>



</div>
    </body>
</html>
