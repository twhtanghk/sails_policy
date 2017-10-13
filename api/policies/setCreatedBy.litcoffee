    _ = require 'lodash'

set createdBy value to req.user

    module.exports = (req, res, next) ->
      req.options.values ?= {}
      _.extend req.options.values, createdBy: req.user
      next()
