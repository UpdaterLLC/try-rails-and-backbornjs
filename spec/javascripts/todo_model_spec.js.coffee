#= require todos
t = @Todos

describe 'Todo Model', () ->
  it 'can instantiate', () ->
    m = new Todos.Models.Todo
    expect(m).not.toBeNull()

describe 'Todos Collection', () ->
  it 'can instantiate', () ->
    c = new t.Collections.TodoCollection()
    expect(c).not.toBeNull()
