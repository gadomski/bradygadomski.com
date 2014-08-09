map = d3.select "#overview-map"

width = 200
height = 200

projection = d3.geo.albersUsa()
  .scale(1000)
  .translate([width / 2, height / 2])

path = d3.geo.path()
  .projection(projection)

svg = map.append("svg")
  .attr("width", width)
  .attr("height", height)

buildMap = (error, us) ->
  svg.insert("Path", ".graticule")
    .datum(topojson.feature(us, us.objects.land))
    .attr("class", "land")
    .attr("d", path)

  svg.insert("path", ".graticule")
    .datum(topojson.mesh(us, us.objects.states, (a, b) -> a != b))
    .attr("class", "state-boundary")
    .attr("d", path)


d3.json "data/us-10m.json", buildMap
