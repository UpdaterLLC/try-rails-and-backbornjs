t = @Todos
t.Models ?= {}

t.Models.Todo = Backbone.Model.extend

  idAttribute: 'id'

  defaults: {
    'what'    : undefined
    'urgency' : 3
    'priority': 3
  }

  validate: (attrs, options) ->
    if !attrs.what
      return 'what to do?'
    if !attrs.urgency || 5 < attrs.urgency
      return 'urgency(1-5) not specified'
    if !attrs.priority || 5 < attrs.priority
      return 'priority(1-5) not specified'

#  initialize: ->


t.Collections.Todos = Backbone.Collection.extend
  model: t.Models.Todo
  url: '/todos.json'
