<%-- 
    Document   : index
    Created on : 19-sep-2021, 18:29:48
    Author     : RafaelEchart
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MOVIE TES</title>
        <!--Google Font-->
        <link rel="stylesheet" href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">

        <!-- Mobile specific meta -->
        <meta name=viewport content="width=device-width, initial-scale=1">
        <meta name="format-detection" content="telephone-no">

        <!-- CSS files -->
        <link rel="stylesheet" href="css/plugins.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <%
        session.setMaxInactiveInterval(3600);
        Object nombre = session.getAttribute("nombre");
        //out.println(nombre);
        Object apellido = session.getAttribute("apellido");
        //out.println(apellido);
        Object favorit = session.getAttribute("favoritos");
        //out.println(favorit);
        Object usuario = session.getAttribute("usuario");
///         out.println(usuario);
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
                            <!-- NADA DEL LADO IZQUIERDO DEL NAVBAR -->
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
                <div class="top-search">
                    <select>
                        <option value="united">PELICULAS</option>
                        <option value="saab">SERIES</option>
                    </select>
                    <input type="text" id="busquedaTexto" placeholder="Busca una pelicula o serie de tu preferencia..."   >
                    <button class="buttones" type="submit" onclick="busquedaDePeliculas()"><i class="fa fa-search"></i></button>
                    </input>
                </div>




            </div>
        </header>
        <!-- END | Header -->

        <div class="slider movie-items">
            <div class="container">
                <div class="row">
                    <div class="alineacion">

                        <div class="spinner" id="spinnerBusqueda" style="display: none;"></div>


                    </div>



                    <main>
                        <div class="container">

                            <div class="carousel my-carousel-1">
                                <div class="carousel__container" id="resultados_de_busqueda">


                                </div>
                            </div>

                        </div>
                    </main>




                </div>
            </div>
        </div>
        <div class="movie-items  full-width">
            <div class="row">
                <div class="col-md-12">
                    <div class="title-hd">
                        <h2>Populares</h2>
                        <a href="#" class="viewall">Ver todas <i class="ion-ios-arrow-right"></i></a>
                    </div>
                    <div class="tabs">
                        <ul class="tab-links">
                            <li class="active" style="color:transparent; cursor: default;">Las peliculas mas populares del momento</li>

                        </ul>
                        <div class="tab-content">
                            <div id="tab1-h2" class="tab active">
                                <div class="carousel my-carousel-1">
                                    <div class="carousel__container" id="peliculasPopulares">
                                        <div class="spinner" id="spinnerpeliculasPopulares" style="margin: auto;" ></div>



                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="title-hd">
                            <h2>Peliculas por estrenarse</h2>
                            <a href="#" class="viewall">Ver todas <i class="ion-ios-arrow-right"></i></a>
                        </div>
                        <div class="tabs">
                            <ul class="tab-links-2">
                                <li class="active" style="color:transparent; cursor: default;">Las peliculas mas populares del momento</li>

                            </ul>
                            <div class="tab-content">
                                <div id="tab21-h2" class="tab active">
                                    <div class="carousel my-carousel-1">
                                        <div class="carousel__container" id="peliculasEstreno">
                                            <div class="spinner" id="spinnerpeliculasEstreno" style="margin: auto;" ></div>



                                        </div>
                                    </div>
                                </div>



                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <!-- footer section-->
            <footer class="ht-footer">
                <div class="container">
                    <div class="flex-parent-ft">
                        <div class="flex-child-ft item1">
                            <a href="#"><img class="logo" src="images/logo1.png" alt=""></a>
                            <p>Guayaquil, Ecuador<br>
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
                        <%  if (session.getAttribute("nombre") != null) {%>
                        <div class="flex-child-ft item4">
                            <h4>Mi cuenta</h4>
                            <ul>
                                <li><a href="./perfil.jsp">Mi cuenta</a></li> 
                                <li><a href="#">Mis favoritos</a></li>	
                                <li><a href="./cerrSes.jsp">Cerrar sesion</a></li>
                            </ul>
                        </div>
                        <%  } else {  %> 
                        <div class="flex-child-ft item4">
                            <h4>Mi cuenta</h4>
                            <ul>
                                <li><a href="./login.jsp">Iniciar Sesion</a></li> 
                                <li><a href="./Registro.jsp">Crear Cuenta</a></li>	
                            </ul>
                        </div>

                        <%  }%> 
                        

                    </div>
                </div>
                <div class="ft-copyright">
                    <p>© 2021 MovieTES. Estudiantes de programacion Web</p>
                </div>
                <!-- <div class="backtotop">
                        <p><a href="#" id="back-to-top">Arriba  <i class="ion-ios-arrow-thin-up"></i></a></p>
                </div> -->
        </div>
    </footer>
    <!-- end of footer section-->
    <script>

        var nombre = `<%=nombre%>`;
        var apellido = `<%=apellido%>`;
        var fav = `<%=favorit%>`;
        var usuario = `<%=usuario%>`
        console.log("aqui llega fav:" + fav)
        var peliculasFavoritas = fav.split(",");

    </script>
    <script src="js/jquery.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/plugins2.js"></script>
    <script src="js/custom.js"></script>
    <script src="js/slider.js"></script>
    <script src="js/searchMoviesSeries.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script> 
    <script>
            const irPagina = (id)=> {
                window.open(`./moviesingle.jsp?id=`+id,"_self")
            }
    </script>
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

</body>
</html>
