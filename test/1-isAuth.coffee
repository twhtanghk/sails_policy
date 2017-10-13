co = require 'co'
policy = require '../index'
Promise = require 'bluebird'
{Duplex} = require 'stream'
{IncomingMessage, ServerResponse} = require 'http'

describe 'policy', ->
  token = null

  before -> co ->
    token = yield sails.config.oauth2.validToken sails.config.oauth2 

  it 'isAuth', ->
    socket = new Duplex()
    req = new IncomingMessage socket
    req.headers = Authorization: "Bearer #{token}"
    res = new ServerResponse req
    
    new Promise (resolve, reject) ->
      policy.isAuth req, res, (err) ->
        console.log "policy #{err}"
        if err?
          return Promise.reject err
