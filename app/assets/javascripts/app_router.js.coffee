t = @Todos

t.Routers.AppRouter = Backbone.Router.extend
  routes:
    "todos/:id" : "todos_show"
    "todos" : "todos_index"
    ".*" : "todos_index"

  initialize: (options) ->
    @layout = new t.Views.LayoutView(el: $("body"))
    @todos = new t.Collections.Todos()
    return

  todos_index: ->
    @layout.setView(new t.Views.Todos.Index(collection: @todos))
    @todos.fetch(reset: true)
    return
