## -- Dependencies -------------------------------------------------------------

request = require 'superagent'
config  = sails.config.imgur

## -- Exports ------------------------------------------------------------------

module.exports =

  image:
    ###*
     * Upload Photo as anonymous. Options can be:
      - [album]: ID of the album to upload to.
      - [description]: A description of the image.
      - <image>: The binary data, a url string, or base64 data.
      - [title]: A title for the image.
      - [type]: The type of image being uploaded : binary, url, base64.
    ###
    upload: (options, cb) ->
      request
        .post("#{config.endpoint}/image")
        .set("X-Mashape-Key", config.mashape)
        .set("Authorization", "CLIENT-ID #{config.key}")
        .set("Content-Type", "application/x-www-form-urlencoded")
        .send options
        .end (err, res) -> cb(err, res)
