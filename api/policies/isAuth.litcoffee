    co = require 'co'
    passport = require 'passport'
    bearer = require 'passport-http-bearer'

define bearer strategy to verify input token

    passport.use 'bearer', new bearer.Strategy (token, done) -> co ->
      console.log "token = #{token}"
      try
        res = yield sails.config.oauth2.verify _.extend token: token, sails.config.oauth2
        console.log res.user
        done null, res.user
      catch err
        done null, false, message: err

authenticate with oauth2 token defined in rfc6750

    module.exports = (req, res, next) ->
      middleware = passport.authenticate 'bearer', session: false
      middleware req, res, ->
        console.log arguments
        next()
