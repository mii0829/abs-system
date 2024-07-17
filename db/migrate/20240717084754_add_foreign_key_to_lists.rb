class AddForeignKeyToLists < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :lists, :tags, column: :tag_id
  end
end
