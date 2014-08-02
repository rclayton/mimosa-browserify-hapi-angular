require 'jquery'
require 'bootstrap'
angular = require 'angular'
require 'uirouter'
require 'uibootstrap'
require './app/services'
require './app/directives'

app = angular.module 'myapp', ['ui.router', 'ui.bootstrap', 'myapp.services', 'myapp.directives']

# Mimosa compile templates will be pulled from the 'templates'
# file and registered with Angular's template cache.
# This will circumvent Angular from making GET calls to the
# server.
app.run [ '$templateCache', ($templateCache) ->
  templates = require 'templates'
  for name, template of templates
    console.debug "Registering '#{name}' with $templateCache."
    $templateCache.put "#{name}.html", template
]

app.config [ '$stateProvider', '$urlRouterProvider',
  ($stateProvider, $urlRouterProvider) ->

    $urlRouterProvider.otherwise "/"

    $stateProvider
      .state 'home', {
        url: '/'
        templateUrl: 'home.html'
        controller: 'HomeCtrl'
      }
      .state 'view1', {
        url: '/view1'
        templateUrl: 'view1.html'
        controller: 'View1Ctrl'
        resolve:
          message: (messageService) ->
            return messageService.getMessage()
      }
      .state 'view2', {
        url: '/view2'
        templateUrl: 'view2.html'
        controller: 'View2Ctrl'
        resolve:
          message: ($http) ->
            $http.get('/message').then (response) ->
              response.data.message
      }
]

app.controller "HomeCtrl", [ '$scope', ($scope) ->
  $scope.message = "Hello from Home Controller!"
]

app.controller "View1Ctrl", [ '$scope', 'message', ($scope, message) ->
  $scope.message = message
]

app.controller "View2Ctrl", [ '$scope', 'message', ($scope, message) ->
  $scope.message = message
]
