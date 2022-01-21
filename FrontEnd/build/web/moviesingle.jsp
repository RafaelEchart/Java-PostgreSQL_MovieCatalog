<%-- 
   Document   : moviesingle
   Created on : 29-sep-2021, 17:30:56
   Author     : 
--%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*"%>
<%@page import="java.lang.Math.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Basic need -->
        <title>Pelicula individual</title>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <link rel="profile" href="#">

        <!--Google Font-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <link rel="stylesheet" href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
        <!-- Mobile specific meta -->
        <meta name=viewport content="width=device-width, initial-scale=1">
        <meta name="format-detection" content="telephone-no">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />


        <!-- CSS files -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <link rel="stylesheet" href="fontawesome-stars.css">

        <link rel="stylesheet" href="css/plugins.css">
        <link rel="stylesheet" href="css/style.css">
        <%
            String idpelicula = request.getParameter("id");

            session.setMaxInactiveInterval(3600);
            Object nombre = session.getAttribute("nombre");
            int cont = 0;
            Object apellido = session.getAttribute("apellido");
            //out.println(apellido);
            Object favorit = session.getAttribute("favoritos");
            // out.println(favorit);
            Object usuario = session.getAttribute("usuario");
            ///         out.println(usuario);

            Boolean estaAgregado = false;

            if (favorit != null) {
                String[] split = favorit.toString().split(",");
                for (int i = 0; i < split.length; i++) {

                    if (idpelicula.toString().equals(split[i].toString())) {
                        estaAgregado = true;

                    }
                }
            }
        %>
    </head>
    <%
        Connection cn;
        int calificacionTES = 0;
        //conexion para sacar los comentarios
        String sql = "select * from comentario where idpelicula='" + idpelicula + "'";
        cn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/login", "postgres", "123");
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery(sql);

        //conexion para sacar los ratings
        sql = "select rate from comentario where idpelicula='" + idpelicula + "'";
        Statement st3 = cn.createStatement();
        ResultSet rs3 = st3.executeQuery(sql);
        int suma = 0;
        while (rs3.next()) {
            suma += Integer.parseInt(rs3.getString("rate"));
        }
        //conexion para sacar el numero de comentarios
        sql = "SELECT COUNT(comentario) FROM comentario WHERE idpelicula='" + idpelicula + "'";
        Statement st2 = cn.createStatement();
        ResultSet rs2 = st2.executeQuery(sql);
        while (rs2.next()) {
            cont = rs2.getInt("count");
        }
        if (cont != 0) {
            calificacionTES = Math.round(suma / cont);
            System.out.println(calificacionTES);
        } else {
            calificacionTES = 0;
        }
        String user, comentario, tiempo;
        int rate;
    %>
    <body>

        <!--preloading-->
        <div id="preloader">
            <img class="logo" src="images/logo1.png" alt="" width="119" height="58">
            <div id="status">
                <span></span>
                <span></span>
            </div>
        </div>
        <!--end of preloading-->


        <!-- BEGIN | Header -->
        <header class="ht-header">
            <div class="container">
                <nav class="navbar navbar-default navbar-custom">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header logo">
                        <div class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <div id="nav-icon1">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </div>
                        <a href="index.jsp"><img class="logo" src="images/logo1.png" alt="" width="119" height="58"></a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse flex-parent" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav flex-child-menu menu-left">






                        </ul>
                        <%  if (session.getAttribute("nombre") != null) {%>
                        <ul class="nav navbar-nav flex-child-menu menu-right"> 

                            <li><a href="./perfil.jsp"><%=nombre%> <%=apellido%> </a></li>
                            <li><a href="#">Mis favoritos</a></li>
                            <li><a href="./cerrSes.jsp">Cerrar sesión</a></li>

                        </ul>
                        <%  } else {  %> 
                        <ul class="nav navbar-nav flex-child-menu menu-right"> 

                            <li><a href="./login.jsp">Iniciar sesion</a></li>
                            <li class="btn"><a  href="./Registro.jsp">Crear cuenta</a></li>

                        </ul>

                        <%  }%> 
                    </div>
                    <!-- /.navbar-collapse -->
                </nav>

                <!-- top search form -->

            </div>
        </header>
        <!-- END | Header -->



        <div class="hero mv-single-hero">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <!-- <h1> movie listing - list</h1>
                        <ul class="breadcumb">
                                <li class="active"><a href="#">Home</a></li>
                                <li> <span class="ion-ios-arrow-right"></span> movie listing</li>
                        </ul> -->
                    </div>
                </div>
            </div>
        </div>
        <div class="page-single movie-single movie_single">
            <div class="container">
                <div class="row ipad-width2">
                    <div class="col-md-4 col-sm-12 col-xs-12">
                        <div class="movie-img sticky-sb">
                            <img id="imagen_movie_single" src="" alt="">
                            <div class="movie-btn">	
                                <div class="btn-transform transform-vertical red">
                                    <div><a href="#" class="item item-1 redbtn"> <i class="ion-play"></i>Ver Trailer</a></div>
                                    <div><a id="link_pelicula" href="https://www.youtube.com/embed/o-0hcF97wy0" class="item item-2 redbtn fancybox-media hvr-grow"><i class="ion-play"></i></a></div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 col-sm-12 col-xs-12">
                        <div class="movie-single-ct main-content">
                            <h1 id="titulo_pelicula" class="bd-hd">Titulo de pelicula <span></span></h1>
                            <div class='like' style="text-align: left; margin-bottom: 12px; display: flex; align-items: center; cursor: pointer" onclick="botonMeGusta('<%=idpelicula%>')">
                                <%
                                    if (estaAgregado) {
                                %>

                                <button class='like-toggle basic like-active'  id=<%=idpelicula%>>❤</button>



                                <%
                                } else {

                                %>

                                <button class='like-toggle basic'  id=<%=idpelicula%>>❤</button>


                                <%
                                    }

                                %>
                                <p style="margin-left: 5px">Agregar a favoritos</p>

                            </div>
                            <div class="movie-rate">
                                <div class="rate">
                                    <i class="ion-android-star"></i>
                                    <p id="calificacion"><br>

                                    </p>
                                </div>
                                <div class="rate-star" id="calificacionTES">
                                    <p>Calificacion MovieTES:  </p>

                                </div>
                            </div>
                            <div class="movie-tabs">
                                <div class="tabs">
                                    <ul class="tab-links tabs-mv">
                                        <li class="active"><a href="#overview">Resumen</a></li>
                                        <li><a href="#reviews">Comentarios y rating</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div id="overview" class="tab active">
                                            <div class="row">
                                                <div class="col-md-8 col-sm-12 col-xs-12">
                                                    <div class="title-hd-sm">
                                                        <h3>Trama</h3>
                                                    </div>
                                                    <p id="trama_pelicula"></p>

                                                    <div class="title-hd-sm">
                                                        <h3>Resumen</h3>
                                                    </div>
                                                    <p id="resumen_pelicula"></p>
                                                </div>
                                                <div class="col-md-4 col-xs-12 col-sm-12">


                                                    <div class="sb-it">
                                                        <h6>Generos:</h6>
                                                        <p style="color: #4280bf" id="generos_pelicula"></p>
                                                    </div>
                                                    <div class="sb-it">
                                                        <h6>Fecha estreno: </h6>
                                                        <p id="ano_pelicula"></p>
                                                    </div>

                                                    <div class="sb-it">
                                                        <h6>Duracion:</h6>
                                                        <p id="duracion_pelicula"></p>
                                                    </div>
                                                    <div class="sb-it">
                                                        <h6>MMPA Rating:</h6>
                                                        <p id="rating_pelicula"></p>
                                                    </div>
                                                    <div class="sb-it">
                                                        <h6>Plot Keywords:</h6>
                                                        <p class="tags" id="terminos_busqueda">
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="reviews" class="tab review">
                                            <div class="row">
                                                <div class="rv-hd">
                                                    <a class="redbtn" href="#ex1" rel="modal:open"  style="margin-bottom: 12px">Escribe un comentario</a>
                                                </div>
                                                <div class="topbar-filter">
                                                    <p><span><%=cont%> comentarios</span> en total</p>
                                                </div>
                                                <%
                                                    if (cont != 0) {
                                                        while (rs.next()) {
                                                            user = rs.getString("usuario");
                                                            comentario = rs.getString("comentario");
                                                            rate = Integer.parseInt(rs.getString("rate"));
                                                            tiempo = rs.getString("tiempo");
                                                %>
                                                <div class="mv-user-review-item last">
                                                    <div class="user-infor">
                                                        <div>
                                                            <h3><%=rate%> Estrella(s)</h3>
                                                            <div class="no-star">
                                                                <% for (int i = 0; i < rate; i++) { %>
                                                                <i class="ion-android-star"></i>  
                                                                <% }
                                                                    for (int i = 0; i < 10 - rate; i++) {
                                                                %>
                                                                <i class="ion-android-star last"></i>
                                                                <% }%>
                                                            </div>
                                                            <p class="time">
                                                                <%=tiempo%> <a href="#"><%=user%></a>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <p><%=comentario%></p>
                                                </div>
                                                <% }
                                                } else { %>
                                                No hay comentarios
                                                <% }%>  
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <script>
            var idDePelicula = `<%=idpelicula%>`;
            var usuario = `<%=nombre%>`;
            var nombre = `<%=nombre%>`;
            var calificacionTESJS = `<%=calificacionTES%>`;
            var fav = `<%=favorit%>`;
            var peliculasFavoritas = fav.split(",");

        </script>                     

        <script src="js/jquery.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/plugins2.js"></script>
        <script src="js/singlePage.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
        <script src="jquery.barrating.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script> 


        <script>

            const botonMeGusta = (id) => {
                var notyf = new Notyf();

                console.log(nombre);
                //  console.log(peliculasFavoritas)
                if (nombre === "null") {
                    notyf.error("Porfavor inicie sesion!");

                } else {
                    let boton = document.getElementById(id);

                    // console.log("classButton" + boton.className)

                    if (boton.className === "like-toggle basic") {
                        peliculasFavoritas.push(id)
                        console.log(peliculasFavoritas)


                        var http = new XMLHttpRequest();
                        http.open("POST", "Agregar_BorrarPelicula.jsp", true);
                        http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                        var params = "param1=" + peliculasFavoritas + "&param2=" + usuario // probably use document.getElementById(...).value
                        http.send(params);
                        http.onload = function () {
                            console.log(http.responseText);
                        }

                        boton.classList.add("like-active");
                        notyf.success("Pelicula agregada!");



                        return;
                    }
                    if (boton.className === "like-toggle basic like-active") {
                        peliculasFavoritas = peliculasFavoritas.filter(pelicula => pelicula.toString() !== id.toString())
                        console.log(peliculasFavoritas)

                        var http = new XMLHttpRequest();
                        http.open("POST", "Agregar_BorrarPelicula.jsp", true);
                        http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                        var params = "param1=" + peliculasFavoritas + "&param2=" + usuario // probably use document.getElementById(...).value
                        http.send(params);
                        http.onload = function () {
                            console.log(http.responseText);
                        }


                        boton.classList.remove("like-active");
                        notyf.error("Pelicula borrada!");


                        return;
                    }
                }



            };
        </script> 


        <div id="ex1" class="modal">
            <h3 class="heading">Escribe tu comentario</h3>

            <div class="container2">
                <form>
                    <div class="form-group">
                        <textarea class="form-control status-box" id="comentario" rows="3" placeholder="Ingresa tu comentario aqui"></textarea>
                        <select id="example">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                        </select>
                    </div>
                </form>
                <div class="button-group pull-right">
                    <a class="redbtn" href="#ex1" rel="modal:open" onclick="agregarComentario()"  style="margin-bottom: 12px">Agregar comentario</a>

                </div>
                <ul class="posts">
                </ul>
            </div>
        </div>



    </body>
</html>
