## -- Dependencies -------------------------------------------------------------

unirest = require 'unirest'
config  = sails.config.api.imgur

## -- Exports ------------------------------------------------------------------

module.exports =

  uploadAnonymous: (options) ->

    request = unirest
    .post("#{config.endpoint}/image")
    .header("X-Mashape-Key", config.mashape)
    .header("Authorization", "CLIENT-ID #{config.key}")
    .header("Content-Type", "application/x-www-form-urlencoded")

    request.field(option, options[option]) for option in options

    request.end (result) ->
      console.log result.status, result.headers, result.body
