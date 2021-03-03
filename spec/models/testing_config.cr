# require "clear"
# require "action-controller"
# require "action-controller/server"
# require "active-model"



# require "../src/db/migrate"
# require "../src/constants.cr"

# # initialize a pool of database connection:
# Clear::SQL.init("POSTGRES_USER://POSTGRES_PASSWORD@localhost:5432/POSTGRES_DB")

# # Clear Migration
# Clear::Migration::Manager.instance.apply_all