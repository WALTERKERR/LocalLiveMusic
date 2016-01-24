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
  // makePurple();
  L.mapbox.accessToken = 'pk.eyJ1Ijoia2FybGFraW5nMiIsImEiOiJjaWV1d29pZ2QwczhwczltMm1lbWMxZnJmIn0._CLLgaefzXvhtCeSs61tzQ';
  map = L.mapbox.map('map', 'mapbox.streets')
    .setView([37.783, -122.4167], 13);
  // L.mapbox.accessToken = 'pk.eyJ1Ijoia2FybGFraW5nMiIsImEiOiJjaWV1d29pZ2QwczhwczltMm1lbWMxZnJmIn0._CLLgaefzXvhtCeSs61tzQ';
  // var map = L.mapbox.map('map', 'Your map layer', { zoomControl: false })
  // .setView([39.739, -104.990], 12);
  // map.featureLayer.on("ready", function(e) {
  //   getEvents(map);
  // });
  showMap();
  map.invalidateSize()
});

function makePurple(){
  $(document).on("click", "h1", function(event){
    event.preventDefault();
    $(this).css("background-color", "purple")
  })
}

function showMap(){
  $(document).on("click", "#show-map", function(event){
    event.preventDefault();
    $(".intro").fadeOut();
    map.invalidateSize()
    $("#map").fadeIn();
    map.invalidateSize()
    // $("#map").invalidateSize();
  })
}
