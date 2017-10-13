    _ = require 'lodash'

set updatedBy value to req.user

    module.exports = (req, res, next) ->
      req.options.values ?= {}
      _.extend req.options.values, updatedBy: req.user
      next()
