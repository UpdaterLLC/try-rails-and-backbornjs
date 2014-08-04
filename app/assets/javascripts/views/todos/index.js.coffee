#= require_tree ../../templates

t = @Todos

t.Views.Todos.Index = Backbone.View.extend
  template: Templates.todos_index

  initialize: (@options) ->
#    @listenTo @collection, "reset", =>
#      @render()
#    @listenTo @collection, "add", =>
#      @render()
#    @listenTo @collection, "remove", =>
#      @render()

  render: ->
    @$el.html(@template.render({}))
#    @collection.each (note) =>
#      view = new t.Views.Todos.IndexItemView(model: note)
#      @$(".todos").append(view.render().el)
#    @$("#todo-menu")
    this
