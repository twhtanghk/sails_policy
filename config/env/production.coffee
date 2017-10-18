module.exports =
  admin: [
    'admin@abc.com'
  ]
  authClient: [
    'client_credentials'
  ]
  oauth2:
    url:
      verify: 'https://abc.com/auth/oauth2/verify/'
      token: 'https://abc.com/auth/oauth2/token/'
    client:
      id: 'client_id'
      secret: 'client_secret'
    user:
      id: 'user_id'
      secret: 'user_secret'
    scope: [
      'User'
    ]
