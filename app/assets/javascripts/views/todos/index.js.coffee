#= require_tree ../../templates

t = @Todos

t.Views.Todos.Todo = Backbone.View.extend
  tagName: "tr"
  template: JST['todos/todo']

  initialize: (@options) ->
    return

  render: ->
    data = $.extend(@model.toJSON(), {});
    $(@el).html(@template.render(data))
    this


t.Views.Todos.Index = Backbone.View.extend
  tagName: "div",
  template: JST['todos/index']

  initialize: (@options) ->
    @collection.on("reset", @render, @)
    return

  render: ->
    @$el.html(@template.render({}))
    if @collection.length != 0
      @collection.each (todo) =>
        v = new t.Views.Todos.Todo({ model: todo })
        @$("#data-list").append(v.render().el)
    $('#data-list').dataTable();
    this
