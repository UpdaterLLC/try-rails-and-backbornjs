class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  def index  ; end
  def show   ; end
  def update ; @todo.update! todo_params; end
  def destroy; @todo.destroy!; end

  private
  def set_todo
    @todo = Todo.find(params[:id])
  end
  def todo_params
    params.require(:todo).permit(:what, :urgency, :priority)
  end
end
