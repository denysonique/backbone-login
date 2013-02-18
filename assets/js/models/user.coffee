define (require)->
  Backbone = require 'backbone'
  Model:
    class UserModel extends Backbone.Model
      url: '/users'
      

  Collection:
    class UserCollection extends Backbone.Collection
      model: UserModel
      

