define (require)->
  Backbone = require 'backbone'

  class LayoutView extends Backbone.View
    template: require '../templates/layout.js'

    render: =>
      $('body').html @template()



