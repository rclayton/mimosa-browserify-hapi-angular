angular = require 'angular'

console.debug 'Registering Services...'

module = angular.module 'myapp.services', []

class MessageService

  constructor: ->
    console.debug "Intialized MessageService"

  getMessage: -> "Hello from MessageService!"

module.service 'messageService', MessageService
