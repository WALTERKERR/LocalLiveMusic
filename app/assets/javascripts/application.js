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
  L.mapbox.accessToken = 'pk.eyJ1IjoibWphbnplciIsImEiOiJjaWwxanU1ejQwbW5hdTdseGp5ZnJ5b3ZmIn0.WKjnH0Y82-pkomYaPS2i8w';
  map = L.mapbox.map('map', 'mapbox.streets', {zoomControl: false })
    .setView([37.783, -122.4167], 13);

  new L.Control.Zoom({ position: 'bottomright' }).addTo(map);

  gon.events.forEach ( function (event) {
    L.marker([event.latitude, event.longitude], {
      icon: L.mapbox.marker.icon({
        'marker-size': 'large',
        'marker-symbol': 'music',
        'marker-color': '#f00'
      }),
    }).bindPopup('<p>'+ event.event_name + '<br>' + '<b>' + event.venue_name + '</b>' + '<br>' + event.address + '<br>'+ 'Time: ' + event.event_time + '<br>' + '<i>' + '<span style="font-size: .8em;">' + ifNull(event.venue_desc) + '</span>' + '</i>' + '</p>',
    {autoPanPadding: new L.Point(0, 50)}).addTo(map);
  });
  map.locate();
  map.on('locationfound', function(e) {
  // Commented so we don't zoom in on current location
  // map.fitBounds(e.bounds);

  L.mapbox.featureLayer().addTo(map).setGeoJSON({
      type: 'Feature',
      geometry: {
          type: 'Point',
          coordinates: [e.latlng.lng, e.latlng.lat]
      },
      properties: {
          'title': 'You are here!',
          'marker-color': '#ffff00',
          'marker-symbol': 'star',
          'marker-size': 'large'
      }
  });

});

  showMap();
  map.invalidateSize()
});

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

function ifNull(val){
  if (!val) {
    return ""
  } else {
    return val
  }
}
