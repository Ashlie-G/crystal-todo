# require "clear"
# require "action-controller"
# require "action-controller/server"
# require "active-model"



require "../../src/db/migrate/1234_create_table.cr"
require "../../src/constants.cr"

# initialize a pool of database connection:
Clear::SQL.init("postgres://postgres@localhost:5430/crystal_todo_test")

# Clear Migration
Clear::Migration::Manager.instance.apply_all