require "../spec_helper"

describe Todo do

    it "should create and a delete todo" do
        todo_test = Todo.new
        todo_test.title = "Learn Crystal"
        todo_test.completed = false
        todo_test.order = 1
        todo_test.save!

        test_todo.includes?(todo.id).should eq(true)
        
        test_todo.delete
    end
    
end
