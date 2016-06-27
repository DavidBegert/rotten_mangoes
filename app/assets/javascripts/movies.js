$(document).ready( function() {

  function formatMovieObject(movie) {
    // movie has 
    //var formattedObject = " <div id=" + movie.id + "class='container-fluid'><div class='row'><div class='col-md-4'><%= link_to image_tag(" + movie.poster_image_url + "_url(:thumb)), movie_path(" + movie + ") %></div><div class='col-mid-8'><h2><%= link_to " + movie.title + ", movie_path(" + movie + ") %></h2><h3><%= formatted_date(" + movie.release_date + ") %></h3><h4>Dir. <%= " + movie.director + " %> | <%= " + movie.runtime_in_minutes + " %> minutes</h4><p><%= " + movie.description + "%></p><p class='average-rating'>Average rating: <%= " + movie + ".review_average %>/10</p></div></div><hr></div>";
    //var formattedObject = "<div id=#{movie.id} class='container-fluid'><div class='row'><div class='col-md-4'>  </div>"

    // var formattedObject = "\
    //   <div id=#{movie.id} class='container-fluid'>\
    //     <div class='row'>\
    //       <div class='col-md-4'>\
    //       <%= link_to image_tag(movie.poster_image_url_url(:thumb)), movie_path(movie) %>\
    //       </div>\
    //       <div class='col-mid-8'>\
    //         " + /*<h2><%= link_to movie.title, movie_path(movie) %></h2> */ "\
    //         <h3><%= formatted_date(movie.release_date) %></h3>\
    //         <h4>Dir. #{movie.director} | <%= movie.runtime_in_minutes %> minutes</h4>\
    //         <p><%= movie.description %></p>\
    //         <p class="average-rating">Average rating: <%= movie.review_average %>/10</p>\
    //       </div>\
    //     </div>\
    //     <hr>\
    //   </div>\
    //   "
    var formattedObject = `\
      <div id=${movie.id} class='container-fluid'>\
        <div class='row'>\
          <div class='col-md-4'>\
            <a href='/movies/${movie.id}'>\
              <img src='${movie.image_src}'>\
            </a>\
          </div>\
          <div class='col-mid-8'>\
            <a href='/movies/${movie.id}'>\
              <h2> ${movie.title} </h2>\
            </a>\
            <h3> ${movie.formatted_date} </h3>\
            <h4>Dir. ${movie.director} | ${movie.runtime_in_minutes} minutes </h4>\
            <p> ${movie.description}</p>\
            <p class='average-rating'>Average rating: /10</p>\
          </div>\
        </div>\
        <hr>\
      </div>\
      `;

    return formattedObject;
  };
  
  $("#show-form").click( function() {
    var class_name = document.getElementById("new-movie-form");
    if (class_name.className == "hidden") {
      $("#new-movie-form").removeClass("hidden");
    } else {
      $("#new-movie-form").addClass("hidden");
    }

  });

  $('input[type=submit]').on('click', function() {
    var form = $(this).parents('form')
    event.preventDefault();

    $.ajax({
      type: "POST",
      url: '/movies',
      data: form.serialize(),

      success: function(data){
        console.log(data)
        console.log(formatMovieObject(data))
        $("#movies").prepend(formatMovieObject(data));
        console.log("success")
      },
      error: function(data){
        console.log("THERE IS AN ERROR");
      },
      dataType: 'json'

    });

  });

});