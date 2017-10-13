    _ = require 'lodash'
    co = require 'co'
    passport = require 'passport'
    bearer = require 'passport-http-bearer'

define bearer strategy to verify input token

    passport.use 'bearer', new bearer.Strategy (token, done) -> co ->
      try 
        res = yield sails.config.oauth2.verify _.defaults(token: token, sails.config.oauth2)
        done null, res.user
      catch err
        done err, false

authenticate with oauth2 token defined in rfc6750

    module.exports = (req, res, next) ->
      mw = passport.authenticate 'bearer', session: false
      mw req, res, (err) ->
        if err?
          return res.serverError err
        next()
