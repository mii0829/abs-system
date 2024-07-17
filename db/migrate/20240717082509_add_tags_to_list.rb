class AddTagsToList < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :tag_id, :integer
  end
end
