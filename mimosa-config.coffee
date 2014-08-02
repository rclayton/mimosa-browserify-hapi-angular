exports.config =
  modules: [
    "server"
    "browserify"
    "jshint"
    "csslint"
    "live-reload"
    "bower"
    "coffeescript"
    "stylus"
    "html-templates"
    "copy"]
  template:
    wrapType: 'common'
  browserify:
    bundles:
      [
        entries: ['javascripts/main.js']
        outputFile: 'bundle.js'
      ]
    shims:
      jquery:
        path: 'javascripts/vendor/jquery-2.1.1.min.js'
        exports: '$'
      angular:
        path: 'javascripts/vendor/angular.min.js'
        exports: 'angular'
      uirouter:
        path: 'javascripts/vendor/angular-ui-router.min.js'
        exports: 'uirouter'
      bootstrap:
        path: 'javascripts/vendor/bootstrap.min.js'
        exports: 'bootstrap'
      uibootstrap:
        path: 'javascripts/vendor/ui-bootstrap-tpls-0.11.0.min.js'
        exports: 'uibootstrap'
    aliases:
      templates: 'javascripts/templates'
  htmlTemplates:
    extensions: [ "template" ]
  server:
    path: 'server.coffee'
    # views:
    #   compileWith: 'html'
    #   extension:   'html'
    defaultServer:
      enabled: false
