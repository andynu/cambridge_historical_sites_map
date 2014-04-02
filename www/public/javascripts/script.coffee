init_map = ->
  mapStyles = [
    {
      stylers: [
        { hue: "#00ffe6" },
        { saturation: -20 }
      ]
    },{
      featureType: "road",
      elementType: "geometry",
      stylers: [
        { lightness: 100 },
        { visibility: "simplified" }
      ]
    },{
      featureType: "road",
      elementType: "labels",
      stylers: [
        { visibility: "off" }
      ]
    }
  ]
  styledMap = new google.maps.StyledMapType(mapStyles, {name: 'Cambridge Historical'})
  mapOptions = {
    zoom: 25,
    #mapTypeId: google.maps.MapTypeId.TERRAIN,
    center: new google.maps.LatLng(42.3945028821,-71.1199435396),
    mapTypeControlOptions: {
      mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
    }
  }
  map = new google.maps.Map($('#map')[0], mapOptions)

  map.mapTypes.set('map_style', styledMap)
  map.setMapTypeId('map_style')

  bounds = new google.maps.LatLngBounds()

  infowindow = new google.maps.InfoWindow({
    content: """
    <div id='locationNotice'>
      <h1>Location!</h1>
    </div>
    """
  })

  for loc in window.map_locations
    do (loc) ->
      latlng = new google.maps.LatLng(loc.lat, loc.lng)

      #bounds.extend(latlng)
      
      loc_options = {
        strokeColor: 'darkslategray',
        strokeOpacity: 0.8,
        strokeWeight: 1,
        fillColor: 'darkslategray',
        fillOpacity: 0.8,
        center: latlng,
        position: latlng,
        radius: 30,
        map: map,
        title: loc.title
      }
      dot = new google.maps.Circle(loc_options)

      #marker = new google.maps.Marker({
      #  position: latlng,
      #  map: map,
      #  title: loc.title,
      #})

      google.maps.event.addListener dot, 'click', ->
        infowindow.setContent """
        <div>
        #{dot.title}
        </div>
        """
        infowindow.open(map,dot)
      null
    null

    #bounds = new google.maps.LatLngBounds(
    #  new google.maps.LatLng(42.158502,-71.1706004),
    #  new google.maps.LatLng(42.3988166,-71.063234)
    #)
    bounds = new google.maps.LatLngBounds(
      new google.maps.LatLng(42.3988166,-71.1706004),
      new google.maps.LatLng(42.35234,-71.063234)
    )
    
    

  map.fitBounds(bounds)
  map.panToBounds(bounds)

$ init_map
