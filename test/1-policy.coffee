co = require 'co'
policy = require '../index'
Promise = require 'bluebird'
{Duplex} = require 'stream'
{IncomingMessage, ServerResponse} = require 'http'

describe 'policy', ->
  token = null
  socket = new Duplex()
  req = new IncomingMessage socket
  res = new ServerResponse req

  before -> co ->
    token = yield sails.config.oauth2.validToken sails.config.oauth2 
    req.headers = authorization: "Bearer #{token}"

  it 'isAuth', ->
    new Promise (resolve, reject) ->
      res.serverError = (data) ->
        sails.log.error data
        reject data
      policy.isAuth req, res, resolve

  it 'isAdmin', ->
    new Promise (resolve, reject) ->
      res.forbidden = (data) ->
        sails.log.error data
        reject data
      policy.isAdmin req, res, resolve
