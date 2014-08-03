#= require todos
t = @Todos
describe 'Todos', () ->
  it 'has members', () ->
    expect(t).not.toBeNull()
    expect(t.Models).not.toBeNull()
    expect(t.Collections).not.toBeNull()
    expect(t.Views).not.toBeNull()
    expect(t.Views.Todos).not.toBeNull()
    expect(t.Routers).not.toBeNull()
