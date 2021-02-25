require "../spec_helper"

describe TodosController do
  describe "index, get all todos" do
    
    it "should return status ok" do
        response = subject.get "/todos"
        response.status_code.should eq(200)
    end
        
    it "should show all todos" do
      
    end
  end

  describe "show, get single todo" do
    it "shows a single todo" do
      
    end
  end

  describe "create, creates a new todo" do
    it "creates a todo and adds to the database" do
      
    end
  end

  describe "update, updates a todo" do
    it "updates a todo" do
      
    end
  end

  describe "delete, deletes a todo" do
    it "deletes a todo from the database" do
      
    end
  end

end
