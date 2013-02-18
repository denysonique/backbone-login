
unless typeof window.console == 'object'
  window.console = {log: ->}

window.log = console.log


window.delay = (ms, fn)-> setTimeout(fn, ms)

require.config
  paths:
    underscore     : 'vendor/underscore'
    backbone       : 'vendor/backbone'
    jquery         : 'vendor/jquery'
    jade           : 'vendor/jade-runtime'

  shim:
    underscore:
      deps: []
      exports: '_'
    backbone:
      deps: ['underscore', 'jquery']
      exports: 'Backbone'
    jade:
      deps: []
      exports: 'jade'

define (require)->
  $        = require 'jquery'
  Backbone = require 'backbone'
  Router   = require 'router'

  $ ->
    window.router = new Router pushState: false

    Backbone.history.start()



