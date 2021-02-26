require "../models/todo.cr"
require "action-controller"
require "json"

class TodosController < Application
  # before_action :set_todo, only [:show, :update, :delete]

  base "/todos"

  getter todo : Todo { set_todo }

  # GET /todos
  def index
    # ruby
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
      # todo.url = "http://#{request.headers["host"]}/todos/#{todo.id}"
      todo.url = "http://localhost:3000/todos/#{todo.id}"
      todo.save!
      render text: todo.to_json
    rescue exception
      puts "There was an error: #{exception}"
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

    # todo.title = update_params["title"].to_s if update_params.has_key?("title")
    # todo.order = update_params["order"].as_i if update_params.has_key?("order")

    update_params.each do |key, value|
      todo.title = value.to_s if key == "title"
      todo.completed = value.as_bool if key == "completed"
      todo.order = value.as_i if key == "order"
    end

    begin
      todo.save!
      render text: todo.to_json
    rescue exception
      puts "There was an error: #{exception}"
    end
  end

  # DELETE /todos/:id
  def destroy
    todo.delete
    render text: todo.to_json
  end

  # DELETE ALL /todos
  # def destroy_all
  #   todos = Todo.query.select.to_a
  #   todos.delete
  # end

  delete "/" do
    Todo.query.select.each { |todo| todo.delete }
  end

  # set up CORS
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
