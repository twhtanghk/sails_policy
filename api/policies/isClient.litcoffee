check if current token is issued to authorized oauth2 clients (authClient)

    module.exports = (req, res, next) ->
      if req.user.client in sails.config.authClient
        return next()
      res.forbidden "#{req.user.client} not in #{JSON.stringify sails.config.authClient}"
