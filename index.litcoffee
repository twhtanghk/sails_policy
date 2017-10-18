    _ = require 'lodash'
    _.defaults = require 'merge-defaults'
    glob = require 'glob'
    path = require 'path'

- [isAuth](isAuth.html)
- [isAdmin](isAdmin.html)
- [isAdmin](isClient.html)
- [setCreatedBy](setCreatedBy.html)
- [setUpdatedBy](setUpdatedBy.html)

    list = ["#{__dirname}/api/policies/*.litcoffee"]

    addFile = (cfg, file) ->
      ret = {}
      ret[path.parse(file).name] = require file
      _.defaults cfg, ret

    addPattern = (cfg, pattern) ->
      glob
        .sync pattern
        .reduce addFile, cfg

    module.exports =
      _.reduce list, addPattern, {}
