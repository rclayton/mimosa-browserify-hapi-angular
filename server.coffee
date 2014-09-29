Hapi = require 'hapi'

exports.startServer = (config, callback) ->

  port = process.env.PORT or config.server.port

  server = new Hapi.Server 'localhost', port

  # Default Route (serve index.html)
  server.route {
      method: 'GET'
      path: '/'
      handler: (req, reply) ->
        reply.file 'public/index.html'
  }

  # Statically load public assets.
  server.route {
      method: 'GET'
      path: '/public/{param*}'
      handler:
        directory:
          path: 'public'
          listing: true
  }

  server.route {
      method: 'GET'
      path: '/message'
      handler: (req, reply) ->
        reply {
          "message": "Hello from Server!"
        }
  }

  server.start ->
    console.log 'Server running at:', server.info.uri

  callback server.listener
