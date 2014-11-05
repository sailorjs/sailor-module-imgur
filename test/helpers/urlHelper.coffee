## -- Dependencies --------------------------------------------------------

path = "http://localhost:1337"

query_generator = (collection, query) ->
  if query? then "#{path}/#{collection}/#{query}" else "#{path}/#{collection}"

## -- Private -------------------------------------------------------------

url =
  imgur:
    anonymous : (query=undefined) ->  query_generator('imgur/image', query)

## -- Exports -------------------------------------------------------------

module.exports = url
