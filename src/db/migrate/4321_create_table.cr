# require "clear"

# class CreateTable
#   include Clear::Migration

#   def change(direction)
#     direction.up do
#       execute("CREATE TABLE todos_test (id bigserial NOT NULL PRIMARY KEY, title text, completed boolean DEFAULT false, \"order\" integer, url text)")

#     end

#     direction.down do
#       execute("DROP TABLE todos_test")
#     end
#   end
# end