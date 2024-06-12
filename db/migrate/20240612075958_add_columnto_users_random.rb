class AddColumntoUsersRandom < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :random, :text
  end
end
