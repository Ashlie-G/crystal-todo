require "clear"

class CreateTable
  include Clear::Migration

  def change(direction)
    direction.up do
      execute("CREATE TABLE todos (id bigserial NOT NULL PRIMARY KEY, title text, completed boolean DEFAULT false, \"order\" integer, url text)")

      # create_table(:todos) do |t|
      #       t.column :title, :string, index: true
      #       t.column :completed, :boolean, default: false
      #       t.column :order, :int32 - get sql error on order as reserved word
      #       t.column :url, :string
      # end

    end

    direction.down do
      execute("DROP TABLE todos")
    end
  end
end
