class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  def index
    respond_to do |format|
      format.json { render json: {todos: Todo.all} }
    end
  end

  def show
    responds_todo
  end

  def update
    @todo.update! todo_params
    responds_todo
  end

  def destroy
    @todo.destroy!
    responds_todo
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def responds_todo
    respond_to do |format|
      format.json { render json: {todo: @todo} }
    end
  end

  def todo_params
    params.require(:todo).permit(:what, :urgency, :priority)
  end
end
