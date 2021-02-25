require "../models/todo.cr"
require "action-controller"
require "clear"
require "json"


class TodosController < Application
# before_action :set_todo, only [:show]

    base "/todos"

    getter todo : Todo {set_todo}

# GET /todos
  def index
    #ruby
    # @todos = Todo.all
    # render json: @todos
    todos = Todo.query.select.to_a
    render text: todos.to_json
  end

# POST /todos/
  def create
    todo = Todo.new(JSON.parse(request.body.as(IO)))
    begin
      todo.save!
      render text: todo.to_json
    rescue exception
      puts exception
    end
    
  end

# GET /todos/:id
  def show
    render text: todo.to_json
  end

# PATCH/PUT /todos/:id
  def update
    todo

    update_params = JSON.parse(request.body.as(IO)).as_h

    update_params.each do |key, value|
      todo.title = value.to_s if key == "title"
      todo.completed = value.as_bool if key == "completed"
      todo.order = value.as_i if key == "order"
    end
     begin
       todo.save
       render text: todo.to_json
     rescue exception
       puts exception
     end

  end

# DELETE /todos/:id
  def destroy
    todo.delete
    render text: todo.to_json
  end

  #DELETE ALL /todos
  # def destroy_all
  #   todos = Todo.query.select.to_a
  #   todos.delete
  # end

  delete "/" do
    Todo.query.select.each {|todo| todo.delete}
  end


  options "/" do 
    response.headers["Access-Control-Allow-Methods"] = "GET, HEAD, POST, PUT, PATCH, DELETE, OPTIONS"
  end
  options "/:id" do 
    response.headers["Access-Control-Allow-Methods"] = "GET, HEAD, POST, PUT, PATCH, DELETE, OPTIONS"
  end

  private def set_todo
    Todo.find!(params["id"])
  end

    # private def todo_params
    #   params.require("todo").permit("name")
    # end

end