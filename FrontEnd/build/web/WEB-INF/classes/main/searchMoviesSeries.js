const busquedaDePeliculas = async (nombrePelicula) => {
  var notyf = new Notyf();
  let informacionFinalPeliculas = []
  
  console.log(document.getElementById("busquedaTexto").value);

  if (document.getElementById("busquedaTexto").value.length > 0) {
    document.getElementById("spinnerBusqueda").style.display = "block";

    try {
      let idDePeliculas = await fetch(
        `https://data-imdb1.p.rapidapi.com/movie/imdb_id/byTitle/${
          document.getElementById("busquedaTexto").value
        }/`,
        {
          method: "GET",
          headers: {
            "x-rapidapi-host": "data-imdb1.p.rapidapi.com",
            "x-rapidapi-key":
              "cf31a2ea3fmsh156f72494199eeap11ab8djsn0390c75950ec",
          },
        }
      );

      idDePeliculas = await idDePeliculas.json();

      idDePeliculas = idDePeliculas.Result;


      if (idDePeliculas.length) {

        
        
        for(let x in idDePeliculas){
            let informacionDePelicula = await fetch(`https://data-imdb1.p.rapidapi.com/movie/id/${idDePeliculas[x].imdb_id}/`, {
                "method": "GET",
                "headers": {
                    "x-rapidapi-host": "data-imdb1.p.rapidapi.com",
                    "x-rapidapi-key": "cf31a2ea3fmsh156f72494199eeap11ab8djsn0390c75950ec"
                }
            })

            informacionDePelicula = await informacionDePelicula.json()

            informacionFinalPeliculas.push(informacionDePelicula[idDePeliculas[x].title])
        }

        resultadoBusqueda

        let innerHTML = ""

        for(let contador in informacionFinalPeliculas){
            

            innerHTML += `<div class="movie-item" style="width: 205px;">
            <div class="mv-img">
                <a href="#"><img src="${informacionFinalPeliculas[contador].image_url}" alt="${informacionFinalPeliculas[contador].title}" width="285" height="437"></a>
            </div>
            <div class="title-in">
                <div class="cate">
                    <span class="yell"><a href="#">${informacionFinalPeliculas[contador].gen[0].genre}</a></span>
                </div>
                <h6><a href="#">${informacionFinalPeliculas[contador].title}</a></h6>
                <p><i class="ion-android-star"></i><span>${informacionFinalPeliculas[contador].rating}</span> /10</p>
            </div>
        </div>`
        }

        document.getElementById("resultadoBusqueda").innerHTML = innerHTML
        document.getElementById("spinnerBusqueda").style.display = "none";

        

      }

      if (!idDePeliculas.length) {
        notyf.error("No se encontro ninguna pelicula, intente de nuevo.");
        document.getElementById("spinnerBusqueda").style.display = "none";
        document.getElementById("busquedaTexto").value = ""

      }
    } catch (err) {}
  }
};
