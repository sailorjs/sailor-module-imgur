## -- Dependencies -----------------------------------------------------------------------

should    = require 'should'
request   = require 'superagent'
url       = require './helpers/urlHelper'

## -- Test ------------------------------------------------------------------------------

describe "Imgur :: ", ->

  describe 'Anonymous ::', ->

    describe '400 badRequest', ->
      it 'doesnt specify file data', (done) ->
        request
          .post url.imgur.anonymous()
          .send()
          .end (res) ->
            res.status.should.equal 400
            done()

    describe '200 Ok', ->
      it 'upload an image using base64', (done) ->
        request
          .post url.imgur.anonymous()
          .send
            image: 'iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg=='
          .end (res) ->
            done()

