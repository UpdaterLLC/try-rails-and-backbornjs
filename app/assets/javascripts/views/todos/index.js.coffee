#= require_tree ../../templates

t = @Todos

t.Views.Todos.Index = Backbone.View.extend
  tagName: "div",
  template: JST['todos/index']
  datatable: undefined

  col_no_id: 0

  initialize: (@options) ->
    @collection.on("reset", @render, @)
    @collection.on("add", @_onAddModel, @)
    @collection.on("remove", @_onRemoveModel, @)
    return

  render: ->
    @$el.html(@template.render())
    @datatable = $('#data-list',@$el).DataTable()
    $('#data-list tbody',@$el).on 'click', 'tr', () ->
      $(this).toggleClass('selected')
#    $('#data-list thead th',@$el).each () ->
#      title = $(this).text();
#      $(this).html( title+'<br /><input type="text" placeholder="Search '+title+'" style="width:60%" />' )
#      $('input',this).click (e)-> e.preventDefault()
#    table = @datatable
#    table.columns().eq(0).each (colIdx) ->
#      $('input', table.column(colIdx).header()).on 'keyup change', _.debounce =>
#        table
#          .column(colIdx)
#          .search(@value)
#          .draw()
#        return
#      , 300
#      return

    if @collection.length != 0
      @collection.each (todo) =>
        @datatable.row.add( [
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
    @datatable.page('last').draw(false)
    @datatable.row.add( [
      model.id,
      model.get('urgency'),
      model.get('priority'),
      model.get('what'),
    ] ).draw();
    return

  _onDelete: ->
    rows = @datatable.rows('.selected')
    for item in rows.data()
      @collection.remove({id: item[@col_no_id]})
    rows
      .remove()
      .draw(false)
    return

  _onRemoveModel: (model, collection, options) ->
    model.destroy({url: '/todos/'+model.id+'.json'})
    return
