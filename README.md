mimosa-browserify-hapi-angular
=========================

My preferred Node.js application setup:

- Mimosa: munges the javascripts together, runs Hapi.
- Hapi: clean Node.js Web application framework.
- AngularJS: Client-side Model-View-Whatever (MVW) framework.
  - Angular UI Router
  - Angular UI Bootstrap
- Browserify: CommonJS-style imports for the client.
- Bootstrap: CSS for developers who don't do CSS.
  - Font Awesome

### Live Reload

Live reload works, but you will need to use the [Chrome extension](https://github.com/ifraixedes/chrome-extension-mimosa-livereload).

### Testing

Unfortunately, testing is a real mess right now largely due to incompatibilities between Karma and Browserify.  The current version of the [karma-browserify](https://github.com/xdissent/karma-browserify) project uses an older version of the Browserify library.  There's a known issue regarding the way karam-browserify [uses an old feature of Browserify that breaks the test harness](https://github.com/xdissent/karma-browserify/issues/45).  I also suspect the use of *aliases* is also not supported (discovered during my initial experimentation).  When I get some time, I'm going to try to dig into both frameworks to see if I can find a work around.
