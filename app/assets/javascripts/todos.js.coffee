#= require_self
#= require_tree ./models
#= require_tree ./views
#= require app_router

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