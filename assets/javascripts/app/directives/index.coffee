angular = require 'angular'

console.debug 'Registering Directives...'

module = angular.module 'myapp.directives', []

module.directive 'fa', [ ->
  restrict: 'E'
  transclude: true
  scope: true
  template: '<i class="fa" ng-class="clazz"></i>'
  link: (scope, element, attrs) ->
    scope.clazz = attrs.ico ? 'fa-question'
]
