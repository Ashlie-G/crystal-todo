# require "clear"
# require "action-controller"


# require "../src/db/migrate"
# require "../src/constants.cr"

# # initialize a pool of database connection:
# Clear::SQL.init("postgres://postgres@localhost:5432/crystal_todo_test")

# # Clear Migration
# Clear::Migration::Manager.instance.apply_all