#= require_tree ../../templates

t = @Todos

t.Views.Todos.Index = Backbone.View.extend
  tagName: "div",
  template: JST['todos/index']

  initialize: (@options) ->
    @collection.on("reset", @render, @)
    @collection.on("add", @_onAddModel, @)
    return

  render: ->
    @$el.html(@template.render())
    t = $('#data-list',@$el).DataTable()
    if @collection.length != 0
      @collection.each (todo) =>
        t.row.add( [
          todo.id,
          todo.get('urgency'),
          todo.get('priority'),
          todo.get('what'),
        ] ).draw();
    this

  events: {
    "click #new-command": "_onNew"
    "click #delete-command": "_onDelete"
  }

  _onNew: ->
    unless @collection.create(@collection.model.defaults, { wait: true }) # fires add-event
      alert('failed to create a todo record.')
    return

  _onAddModel: (model, collection, options) ->
    t = $('#data-list',@$el).DataTable()
    t.row.add( [
      model.id,
      model.get('urgency'),
      model.get('priority'),
      model.get('what'),
    ] ).draw();
    return

  _onDelete: ->
    alert('on delete')
    return
