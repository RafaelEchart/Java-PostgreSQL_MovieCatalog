<%-- 
    Document   : Registro
    Created on : 20/09/2021, 22:25:29
    Author     : HAISAR
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Tes</title>
    <link rel="stylesheet" href="est_registro.css">
    </head>
<%  String rpta="";
        if(request.getParameter("rpta")!=null){
            int r=Integer.parseInt(request.getParameter("rpta"));
            if(r==1){
                rpta="Error: Las contraseñas no coinciden";
            }
            else if(r==2){
                rpta="Ese nombre de usuario ya existe";
            }
        }
%>
    <body>
      <div class="c">
<form class="box" action="/MovieTes_ProyectoFinal/reg">
    <a href="index.jsp"><img src="images/logo1.png" class="avatar" alt="Avatar Image"></a>
  <h1>New account</h1>
  <input type="text" name="txtUsr" placeholder="Username" required>
  <input type="text" name="txtNam" placeholder="Name" required>
  <input type="text" name="txtApellidos" placeholder="Last Name" required>
    <input type="email" name="txtCorreo" placeholder="Email" required>
  <input  type="password" name="txtPass" placeholder="Password" required>
  <input  type="password" name="txtPass2" placeholder="Repeat Password" required>
  <input type="submit" name="txtValue" value="Sign In">
  <p style="color:red"><%=rpta%></p>
  <a href="/MovieTes_ProyectoFinal/login.jsp" class="Pg">¿Alredy an user?</a>     
</form>
      </div>
    </body>
</html>
