define (require)->
  Backbone = require 'backbone'
  User     = require 'models/user'

  class LoginView extends Backbone.View
    template: require '../templates/login.js'

    initialize: ->
      @users = new User.Collection
      window.users = @users

    events:
      'submit form': 'submit'

    submit: (e)->
      e.preventDefault()
      $form = $(e.target)

      @users.create {
          user: $form.find('#user').val()
          password: $form.find('#password').val()
        },
        {
          success: (model, response)=>
            router.navigate '/', trigger: true
          error: (model, response)=>
            console.log  'resp', response
            alert 'bad username or password'
        }

      

    render: =>
      @$el.hide()
      @$el.html @template()
      @$el.fadeIn 1000
      @

