const busquedaDePeliculas = async (nombrePelicula) => {
    var notyf = new Notyf();
    let informacionFinalPeliculas = [];

    console.log(document.getElementById("busquedaTexto").value);

    if (document.getElementById("busquedaTexto").value.length > 0) {
        document.getElementById("spinnerBusqueda").style.display = "block";

        document.getElementById("resultados_de_busqueda").innerHTML = ""
        console.log(document.getElementById("busquedaTexto").value)
        try {
            let idDePeliculas = await fetch(
                    `https://data-imdb1.p.rapidapi.com/movie/imdb_id/byTitle/${
                    document.getElementById("busquedaTexto").value
                    }/`,
                    {
                        method: "GET",
                        headers: {
                            'x-rapidapi-host': 'data-imdb1.p.rapidapi.com',
                            'x-rapidapi-key': '7e22656edfmshe311b869074acb7p1f8e34jsn1e55f2d010bd'
                        },
                    }
            );

            idDePeliculas = await idDePeliculas.json();
            console.log(idDePeliculas);

            idDePeliculas = idDePeliculas.results;


            if (idDePeliculas.length) {
                for (let x in idDePeliculas) {
                    let informacionDePelicula = await fetch(
                            `https://data-imdb1.p.rapidapi.com/movie/id/${idDePeliculas[x].imdb_id}/`,
                            {
                                method: "GET",
                                headers: {
                                    "x-rapidapi-host": "data-imdb1.p.rapidapi.com",
                                    "x-rapidapi-key":
                                            "cf31a2ea3fmsh156f72494199eeap11ab8djsn0390c75950ec",
                                },
                            }
                    );

                    informacionDePelicula = await informacionDePelicula.json();


                    // informacionFinalPeliculas.push(informacionDePelicula[idDePeliculas[x].title])
                    informacionFinalPeliculas.push(informacionDePelicula.results);
                }

                // resultadoBusqueda

                let innerHTML = "";

                for (let contador in informacionFinalPeliculas) {
                    console.log("estyoy aqui", informacionFinalPeliculas);

                    let verificador = false;
                    let arrayTemp = window.peliculasFavoritas.filter(id => id === informacionFinalPeliculas[contador].imdb_id)
                    if (arrayTemp.length) {
                        verificador = true;
                    }

                    innerHTML += `<div style="margin: 0 12px"><div onclick="irPagina('${informacionFinalPeliculas[contador].imdb_id}')" class="carousel__box image" style="background: url(${informacionFinalPeliculas[contador].image_url}); background-size: cover; cursor: pointer">
            
          </div>
          
          <div class='like'  onclick="botonMeGusta('${informacionFinalPeliculas[contador].imdb_id}')">
					<button ${verificador ? "class='like-toggle basic like-active'" : ""} ${verificador ? "" : "class='like-toggle basic'"} id=${informacionFinalPeliculas[contador].imdb_id}>❤</button>
				  </div>

          </div>
          
          `;
                }

                document.getElementById("resultados_de_busqueda").innerHTML = innerHTML;
                document.getElementById("spinnerBusqueda").style.display = "none";
            }

            if (!idDePeliculas.length) {
                notyf.error("No se encontro ninguna pelicula, intente de nuevo.");
                document.getElementById("spinnerBusqueda").style.display = "none";
                document.getElementById("busquedaTexto").value = "";
            }
        } catch (err) {
            console.log(err)
            notyf.error("Error buscando peliculas");

        }
    }
};
