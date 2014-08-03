#= require_self
#= require_tree ./routers
#= require_tree ./models
#= require_tree ./views

'use strict'

@Todos =
  Models: {}
  Collections: {}
  Views: { Todos:{} }
  Routers: {}
  init: ->
    @router = new Todos.Routers.AppRouter()
    Backbone.history.start(pushState: true)

window['todos#index'] = (data) ->
  # your code goes here

window['todos#show'] = (data) ->
  # and here