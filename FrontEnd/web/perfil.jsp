<%-- 
    Document   : Perfil
    Created on : 27/09/2021, 21:59:47
    Author     : HAISAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="css.css" type="text/css" media="screen"/>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <title>JSP Page</title>
    </head>
    <%
        Object nombre = session.getAttribute("nombre");
        Object apellido = session.getAttribute("apellido");
        Object favorit = session.getAttribute("favoritos");
        Object usuario = session.getAttribute("usuario");
        Object correo = session.getAttribute("correo");
%>
    <body style="background-image: url(./images/uploads/hero-bg22.jpg)">
        ->
        <div style="height: 500px">
            
        <div class="container emp-profile">
            <form method="post">
                <div class="row">

                    <div class="col-md-8">
                        <div class="profile-head">
                            <h5>
                                <%=nombre%> <%=apellido%>
                            </h5>


                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Información</a>
                                </li>

                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <input type="button"  class="profile-edit-btn" style="margin-bottom: 15px" name="btnAddMore" value="Inicio" onclick = "location = 'index.jsp'"/>
                        <input type="button"  class="profile-edit-btn" style="margin-bottom: 15px" name="btnAddMore" value="Mis Favoritos" onclick = "location = 'index.jsp'"/>
                        <input type="button"  class="profile-edit-btn" name="btnAddMore" value="Cerrar sesion" onclick = "location = './cerrSes.jsp'"/>
                    </div>
                </div>
                <div class="row">   

                    <div class="col-md-12">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Usuario:</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p><%=usuario%></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Nombres:</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p><%=nombre%> </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Apellidos:</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p><%=apellido%></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Correo:</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p> <%=correo%></p>
                                    </div>
                                </div>


                            </div>

                        </div>
                    </div>
                </div>
            </form>           
        </div>
        </div>

        <footer class="ht-footer" style="background-color: black">
            <div class="container">
                <div class="flex-parent-ft">
                    <div class="flex-child-ft item1">
                        <a href="./index.jsp"><img class="logo" src="images/logo1.png" alt=""></a>
                        <p style="color: white">Guayaquil, Ecuador<br>
                            Tecnologico Espiritu Santo</p>
                    </div>
                    <div class="flex-child-ft item2">
                        <h4>Recursos</h4>
                        <ul>
                            <li><a href="https://rapidapi.com/SAdrian/api/data-imdb1/" target="_blank">API usada</a></li> 
                            <li><a href="https://www.imdb.com/" target="_blank">Inspiracion</a></li>
                            <li><a href="https://www.postgresql.org/" target="_blank">Base de datos</a></li>

                        </ul>
                    </div>
                    <div class="flex-child-ft item3">
                        <h4>Lenguajes</h4>
                        <ul>
                            <li><a href="https://developer.mozilla.org/es/docs/Web/HTML" target="_blank">HTML</a></li> 
                            <li><a href="https://developer.mozilla.org/es/docs/Web/CSS" target="_blank">CSS</a></li>	
                            <li><a href="https://developer.mozilla.org/es/docs/Web/JavaScript" target="_blank">Javascript</a></li>
                            <li><a href="https://www.java.com/es/download/help/whatis_java.html" target="_blank">Java</a></li>
                        </ul>
                    </div>
                    <div class="flex-child-ft item4">
                      
                    </div>

                </div>
            </div>
            <div class="ft-copyright" style="color: white; margin-left: 12px">
                <p>© 2021 MovieTES. Estudiantes de programacion Web</p>
            </div>
           

        </footer>
    </body>
</html>
