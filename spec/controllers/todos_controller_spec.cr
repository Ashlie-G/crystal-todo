require "../spec_helper"
require "spec"

describe TodosController do

  #example from welcome.cr
  #   with_server do
  #   it "should welcome you" do
  #     result = curl("GET", "/")
  #     result.body.includes?("You're being trampled by Spider-Gazelle!").should eq(true)
  #     result.headers["Date"]?.nil?.should eq(false)
  #   end
  # end

    #create todo
    todo_test = Todo.new

    Spec.before_each do 
      todo_test.title = "Learn Crystal"
      todo_completed = false
      todo_test.save!
    end

    Spec.after_each do
      todo_test.delete
    end

    with_server do
      it "should show all todos" do
        result = curl("GET", "/todos")
        result.status_code.should eq(200)
        JSON.parse(result.body).as_a.size.should eq(1)
      end
    end
  
    it "shows a single todo" do
      result = curl("GET", "/todos/#{todo_test.id}")
      result.status_code.should eq(200)
      JSON.parse(result.body).as_h["id"].should eq(todo_test.id)
    end
  

    # it "creates a todo and adds to the database" do
      
    # end
 
    # it "updates a todo" do
      
    # end
  
    it "deletes a todo from the database" do
      result = curl("DELETE", "/todos/#{todo_test.id}")
      result.status_code.should eq(200)
      JSON.parse(result.body).as_h["id"].should eq(todo_test.id)
    end

    it "deletes all todos from the database" do
      result = curl("DELETE", "/todos")
      result.status_code.should eq(200)
    end

end
