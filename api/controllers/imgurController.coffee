## -- Dependencies -------------------------------------------------------------

sailor     = require 'sailorjs'
validator  = sailor.validator
translate  = sailor.translate
errorify   = sailor.errorify

_determinate = (data, res) ->

  console.log data.status
  isOK = 200 <= data.status < 399
  isClientError = 400 <= data.status < 499

  return res.ok(data) if isOK
  return res.badRequest(data) if isClientError
  res.serverError(data)

## -- Exports ------------------------------------------------------------------

module.exports =

  imageUpload: (req, res)->
    validator
    .begin(req, res)
    .add 'image', translate.get('Imgur.Image.NotFound'), 'notEmpty'
    .end (params) ->

      ImgurService.image.upload req.allParams(), (err, response) ->
        return res.serverError(err)  if err
        _determinate(response, res)
