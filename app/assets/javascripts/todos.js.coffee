#= require_self
#= require_tree ./models
#= require_tree ./views
#= require app_router

'use strict'

window.Todos =
  Models: {}
  Collections: {}
  Views: { Todos:{} }
  Routers: {}
  init: ->
    @router = new Todos.Routers.AppRouter()
    return

#window['todos#index'] = (data) ->
#  return

#window['todos#show'] = (data) ->
#  return

$ ->
  moment.locale('ja')
  window.Todos.init()
  Backbone.history.start(pushState: true)
  return
