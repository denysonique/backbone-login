define (require)->

  Backbone = require('backbone')
  $        = require('jquery')

  class Router extends Backbone.Router
    initialize: ->
      LayoutView = require 'views/layout'
      layout_view = new LayoutView
      layout_view.render()

    routes:
      '': 'index'
      'login': 'login'

    index: ->
      View = require 'views/hello'
      view = new View
      $('#yield').html view.render().el

    login: ->
      LoginView = require 'views/login'
      view = new LoginView
      $('#yield').html view.render().el
      
