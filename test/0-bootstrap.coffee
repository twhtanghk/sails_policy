_ = require 'lodash'
_.defaults = require 'merge-defaults'

before ->
  global.sails = log: console
  sails.config = require '../config/env/production.coffee'
  _.defaults sails.config, require 'activerecord-model'
