// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  L.mapbox.accessToken = 'pk.eyJ1Ijoia2FybGFraW5nMiIsImEiOiJjaWV1d29pZ2QwczhwczltMm1lbWMxZnJmIn0._CLLgaefzXvhtCeSs61tzQ';
  var map = L.mapbox.map('map', 'mapbox.streets')
    .setView([37.783, -122.4167], 13);
  console.log(gon.events);
  L.marker([37.783, -122.4167], {
    icon: L.mapbox.marker.icon({
        'marker-size': 'large',
        'marker-symbol': 'post',
        'marker-color': '#fa0'
    }),
}).bindPopup('<p>hello</p>').addTo(map);
});



function makePurple(){
  $(document).on("click", "h1", function(event){
    event.preventDefault();
    $(this).css("background-color", "purple")
  })
}



